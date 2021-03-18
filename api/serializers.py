from .models import Client, Industry, Instruments
from rest_framework import serializers


class ClientSerializer(serializers.ModelSerializer):

    class Meta:
        model = Client
        fields = ['id_cli', 'name']


class InstrumentsSerializer(serializers.ModelSerializer):

    class Meta:
        model = Instruments
        fields = ['id_ins', 'name', 'type_instruments', 'install_height', 'equation', 'attention_value', 'id_ind']


class IndustryListSerializer(serializers.ModelSerializer):

    client = ClientSerializer(many=False, read_only=False)
    industry_instruments = InstrumentsSerializer(many=True, read_only=False)

    class Meta:
        model = Industry
        fields = ['id_ind', 'name', 'latitude', 'longitude', 'client', 'industry_instruments']


class IndustryCreateSerializer(serializers.ModelSerializer):

    class Meta:
        model = Industry
        fields = ['id_ind', 'name', 'latitude', 'longitude', 'client']

    def create(self, validated_data):

        client = Client.objects.get(pk=validated_data.pop('client'))
        industry = Industry.objects.create(client=client, **validated_data)

        return industry
