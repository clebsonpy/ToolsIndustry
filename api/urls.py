from django.urls import path, include
from rest_framework import routers

from .views import ClientViewSet, IndustryViewSet, InstrumentsViewSet

router = routers.SimpleRouter()
router.register('client', viewset=ClientViewSet)
router.register('industry', viewset=IndustryViewSet)
router.register('instruments', viewset=InstrumentsViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
