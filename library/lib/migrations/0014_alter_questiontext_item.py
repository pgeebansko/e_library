# Generated by Django 4.1.7 on 2023-04-10 20:46

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('lib', '0013_alter_questiontext_item'),
    ]

    operations = [
        migrations.AlterField(
            model_name='questiontext',
            name='item',
            field=models.ForeignKey(help_text='Тема към която се отнася въпроса', null=True, on_delete=django.db.models.deletion.CASCADE, related_name='question_text', to='lib.theme'),
        ),
    ]
