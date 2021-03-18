from django.contrib import admin
from .models import Client, Industry, Instruments


class MultiDBModelAdmin(admin.ModelAdmin):

    using = 'api_db'

    def save_model(self, request, obj, form, change):

        obj.save(using=self.using)

    def delete_model(self, request, obj):

        obj.delete(using=self.using)

    def get_queryset(self, request):

        return super().get_queryset(request).using(self.using)

    def formfield_for_foreignkey(self, db_field, request, **kwargs):

        return super().formfield_for_foreignkey(db_field, request, using=self.using, **kwargs)

    def formfield_for_manytomany(self, db_field, request, **kwargs):

        return super().formfield_for_manytomany(db_field, request, using=self.using, **kwargs)


@admin.register(Client)
class ClientAdmin(MultiDBModelAdmin):
    list_display = ['id_cli', 'name']


@admin.register(Industry)
class IndustryAdmin(MultiDBModelAdmin):
    list_display = ['id_ind', 'name', 'latitude', 'longitude', 'client']
    list_filter = ['client']


@admin.register(Instruments)
class InstrumentsAdmin(MultiDBModelAdmin):
    list_display = ['id_ins', 'name', 'type_instruments', 'install_height', 'equation', 'attention_value', 'id_ind']
    list_filter = ['type_instruments', 'id_ind']
