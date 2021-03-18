from django.db import models


# Create your models here.
class Client(models.Model):
    id_cli = models.IntegerField(primary_key=True)
    name = models.CharField(verbose_name="Nome", max_length=50, blank=False, null=False)

    class Meta:
        app_label = 'api'
        verbose_name = 'Client'
        verbose_name_plural = "Clients"


class Industry(models.Model):
    id_ind = models.IntegerField(primary_key=True)
    name = models.CharField(verbose_name="Nome", max_length=100, blank=False, null=False)
    latitude = models.FloatField(verbose_name="Latitude", blank=False, null=False)
    longitude = models.FloatField(verbose_name="Longitude", blank=False, null=False)
    client = models.ForeignKey("Client", on_delete=models.CASCADE, related_name="client")

    class Meta:
        app_label = 'api'
        verbose_name = 'Industry'
        verbose_name_plural = "Industries"


class Instruments(models.Model):
    CHOICE_INSTRUMENTS = (
        (1, 'Vávula'),
        (2, 'Piezômetro')
    )
    id_ins = models.IntegerField(primary_key=True)
    name = models.CharField(verbose_name="Nome", max_length=100, blank=False, null=False)
    type_instruments = models.IntegerField(verbose_name="Tipo de instrumento", choices=CHOICE_INSTRUMENTS)
    install_height = models.FloatField(verbose_name="Cota instalação", blank=False, null=False)
    equation = models.FloatField(verbose_name="Equação", blank=False, null=False)
    attention_value = models.FloatField(verbose_name="Valor atenção", blank=False, null=False)
    id_ind = models.ForeignKey("Industry", verbose_name="Indústria", on_delete=models.CASCADE,
                               related_name="industry_instruments")

    class Meta:
        app_label = 'api'
        verbose_name = 'Instrument'
        verbose_name_plural = "Instruments"
