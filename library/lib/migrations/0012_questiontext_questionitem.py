# Generated by Django 4.1.7 on 2023-04-10 20:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('lib', '0011_article_order'),
    ]

    operations = [
        migrations.CreateModel(
            name='QuestionText',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('num', models.PositiveSmallIntegerField(default=0, help_text='генерира се автоматично')),
                ('text', models.TextField(blank=True, default='', help_text='Формулировка (текст) на въпроса', verbose_name='Въпрос')),
                ('type', models.PositiveSmallIntegerField(choices=[(1, 'затворен тип без картинка'), (2, 'затворен тип с картинка'), (3, 'съпоставяне ляво --> дясно'), (4, 'съпоставяне картинка --> опции'), (5, 'отворен отговор')], default=1, help_text='тип на въпроса')),
                ('level', models.PositiveSmallIntegerField(choices=[(1, 'знание'), (2, 'разбиране'), (3, 'приложение'), (4, 'анализ')], default=1, help_text='ниво по Блум на въпроса')),
                ('picture', models.ImageField(blank=True, upload_to='test_pics', verbose_name='Картинка')),
                ('item', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='question_text', to='lib.theme')),
            ],
            options={
                'verbose_name': 'Въпрос - текст',
                'verbose_name_plural': 'Въпроси - текст',
            },
        ),
        migrations.CreateModel(
            name='QuestionItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('leading_char', models.CharField(blank=True, default='', help_text='№ или буква', max_length=4, verbose_name='Водещ символ')),
                ('text', models.CharField(blank=True, default='', help_text='Формулировка (текст) на опцията(отговора)', max_length=200, verbose_name='Текст')),
                ('value', models.CharField(blank=True, default='', help_text='Отговор - стойност', max_length=20, verbose_name='Стойност')),
                ('value_name', models.CharField(blank=True, default='', help_text='Отговор - име', max_length=200, verbose_name='Стойност - име')),
                ('checked', models.BooleanField(help_text='Отговор за опции с маркиране', null=True, verbose_name='Отговор - маркирано')),
                ('checked_t', models.BooleanField(help_text='генерира се автоматично', null=True, verbose_name='Отговор - маркирано')),
                ('value_t', models.CharField(blank=True, default='', help_text='генерира се автоматично', max_length=20, verbose_name='Стойност')),
                ('task', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='options', to='lib.questiontext')),
            ],
            options={
                'verbose_name': 'Въпрос  - опция',
                'verbose_name_plural': 'Въпроси - опции',
            },
        ),
    ]
