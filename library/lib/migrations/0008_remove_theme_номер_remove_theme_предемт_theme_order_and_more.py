# Generated by Django 4.1.7 on 2023-04-08 23:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('lib', '0007_alter_theme_номер'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='theme',
            name='Номер',
        ),
        migrations.RemoveField(
            model_name='theme',
            name='Предемт',
        ),
        migrations.AddField(
            model_name='theme',
            name='order',
            field=models.SmallIntegerField(blank=True, default=1, verbose_name='Номер'),
        ),
        migrations.AddField(
            model_name='theme',
            name='subject',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='subject', to='lib.subject', verbose_name='Предмет'),
        ),
    ]
