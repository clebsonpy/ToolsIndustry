from .models import Client, Industry, Instruments
from .serializers import ClientSerializer, IndustryListSerializer, IndustryCreateSerializer, InstrumentsSerializer

from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response
from rest_framework import status


# Create your views here.
class ClientViewSet(ModelViewSet):

    serializer_class = ClientSerializer
    queryset = Client.objects.all()

    def create(self, request, *args, **kwargs):

        try:
            data = request.data
            serializer = self.serializer_class(data=data)

            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)

            return Response(status=status.HTTP_412_PRECONDITION_FAILED)
        except Exception:
            return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    def update(self, request, *args, **kwargs):

        try:
            data = request.data
            client = Client.objects.get(pk=kwargs['pk'])
            serializer = self.serializer_class(instance=client, data=data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_202_ACCEPTED)

            return Response(status=status.HTTP_412_PRECONDITION_FAILED)

        except Exception:
            return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class IndustryViewSet(ModelViewSet):

    serializer_class = IndustryCreateSerializer
    queryset = Industry.objects.all()

    def get_serializer_class(self, *args, **kwargs):
        if self.request.method == "GET":
            return IndustryListSerializer
        else:
            return IndustryCreateSerializer

    def create(self, request, *args, **kwargs):
        try:
            data = request.data
            if self.serializer_class(data=data).is_valid():
                serializer = self.serializer_class().create(validated_data=data)
                data = self.serializer_class(serializer)
                return Response(data.data, status=status.HTTP_201_CREATED)
            else:
                return Response(status=status.HTTP_412_PRECONDITION_FAILED)
        except Exception:
            return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    def update(self, request, *args, **kwargs):
        try:
            data = request.data
            industry = Industry.objects.get(pk=kwargs['pk'])
            serializer = self.serializer_class(data=data, instance=industry)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_202_ACCEPTED)
            return Response(status=status.HTTP_412_PRECONDITION_FAILED)

        except Exception:
            return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class InstrumentsViewSet(ModelViewSet):

    serializer_class = InstrumentsSerializer
    queryset = Instruments.objects.all()

    def create(self, request, *args, **kwargs):

        try:
            serializer = self.serializer_class(data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(data=serializer.data, status=status.HTTP_201_CREATED)
            return Response(status=status.HTTP_412_PRECONDITION_FAILED)

        except Exception:
            return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    def update(self, request, *args, **kwargs):

        try:
            instrument = Instruments.objects.get(pk=kwargs['pk'])
            serializer = self.serializer_class(data=request.data, instance=instrument)
            if serializer.is_valid():
                serializer.save()
                return Response(data=serializer.data, status=status.HTTP_202_ACCEPTED)
            return Response(status=status.HTTP_412_PRECONDITION_FAILED)

        except Exception:

            return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR)
