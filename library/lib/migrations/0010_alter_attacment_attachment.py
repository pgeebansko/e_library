# Generated by Django 4.1.7 on 2023-04-09 08:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('lib', '0009_alter_link_link'),
    ]

    operations = [
        migrations.AlterField(
            model_name='attacment',
            name='attachment',
            field=models.FileField(upload_to='attachments/', verbose_name='Файл'),
        ),
    ]
