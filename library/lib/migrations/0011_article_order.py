# Generated by Django 4.1.7 on 2023-04-09 09:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('lib', '0010_alter_attacment_attachment'),
    ]

    operations = [
        migrations.AddField(
            model_name='article',
            name='order',
            field=models.SmallIntegerField(blank=True, default=1, verbose_name='Номер'),
        ),
    ]
