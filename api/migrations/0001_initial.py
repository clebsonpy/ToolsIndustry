# Generated by Django 3.1.7 on 2021-03-18 13:57

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Client',
            fields=[
                ('id_cli', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=50, verbose_name='Nome')),
            ],
            options={
                'verbose_name': 'Client',
                'verbose_name_plural': 'Clients',
            },
        ),
        migrations.CreateModel(
            name='Industry',
            fields=[
                ('id_ind', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100, verbose_name='Nome')),
                ('latitude', models.FloatField(verbose_name='Latitude')),
                ('longitude', models.FloatField(verbose_name='Longitude')),
                ('client', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='client', to='api.client')),
            ],
            options={
                'verbose_name': 'Industry',
                'verbose_name_plural': 'Industries',
            },
        ),
        migrations.CreateModel(
            name='Instruments',
            fields=[
                ('id_ins', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100, verbose_name='Nome')),
                ('type_instruments', models.IntegerField(choices=[(1, 'Vávula'), (2, 'Piezômetro')], verbose_name='Tipo de instrumento')),
                ('install_height', models.FloatField(verbose_name='Cota instalação')),
                ('equation', models.FloatField(verbose_name='Equação')),
                ('attention_value', models.FloatField(verbose_name='Valor atenção')),
                ('id_ind', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='industry_instruments', to='api.industry', verbose_name='Indústria')),
            ],
            options={
                'verbose_name': 'Instrument',
                'verbose_name_plural': 'Instruments',
            },
        ),
    ]
