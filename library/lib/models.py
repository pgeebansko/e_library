from django.db import models
from datetime import date
from ckeditor.fields import RichTextField
from .utils import *


# списък класове
class Klas(models.Model):
    class_num = models.SmallIntegerField('Клас', default=12)

    def __str__(self):
        if self.class_num == 8:
            result = str(self.class_num)+'-ми'
        else:
            result = str(self.class_num) + '-ти'
        return result

    class Meta:
        verbose_name = 'Клас'
        verbose_name_plural = 'Класове'


# списък специалности
class Speciality(models.Model):
    name = models.CharField('Наименование', max_length=50)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Специалност'
        verbose_name_plural = 'Специалности'


# списък предмети
class Subject(models.Model):
    name = models.CharField('Име на предмета', max_length=200)
    class_for = models.ManyToManyField(Klas, verbose_name='Клас', blank=False,
                                       help_text='в кой клас се изучава предмета')
    subject_for = models.ManyToManyField(Speciality, verbose_name='Специалност', blank=False,
                                         help_text='за коя специалност се отнася предмета')
    picture = models.ImageField('Изображение', upload_to='subject_pics', blank=True,
                                help_text='Графична шапка на предмета')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Учебен предмет'
        verbose_name_plural = 'Учебни предмети'


# списък теми към предметите
class Theme(models.Model):
    name = models.CharField('Заглавие на темата', max_length=250)
    order = models.SmallIntegerField('Номер', default=1, blank=True, null=False)
    subject = models.ForeignKey(Subject, verbose_name='Предмет', null=True, on_delete=models.SET_NULL,
                                related_name='subject')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Тема'
        verbose_name_plural = 'Теми'


# списък статии към тема
class Article(models.Model):
    title = models.CharField('Заглавие', max_length=200)
    order = models.SmallIntegerField('Номер', default=1, blank=True, null=False)
    picture = models.ImageField('Снимка/графика:', upload_to='article_pics')
    annotation = models.CharField('Кратко описание:', max_length=200)
    content = RichTextField('Съдържание(текст)')
    theme_id = models.ForeignKey(Theme, verbose_name='Тема', on_delete=models.SET_NULL, null=True, blank=False)
    publish_date = models.DateField('Дата на публикуване', default=date.today)
    author = models.CharField('Автор', max_length=60)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Статия/публикация'
        verbose_name_plural = 'Статии/публикации'


# списък приложения
class Attacment(models.Model):
    title = models.CharField('Заглавие', max_length=200)
    attachment = models.FileField('Файл', upload_to='attachments/')
    subject_id = models.ForeignKey(Subject, verbose_name='Предмет', on_delete=models.SET_NULL, null=True, blank=False)
    theme_id = models.ForeignKey(Theme, verbose_name='Тема', on_delete=models.SET_NULL, null=True, blank=True)
    article_id = models.ForeignKey(Article, verbose_name='Статия', on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Прикачен файл'
        verbose_name_plural = 'Прикачени файлове'


# списък външни връзки
class Link(models.Model):
    title = models.CharField('Заглавие', max_length=200)
    link = models.URLField('URL', max_length=200)
    subject_id = models.ForeignKey(Subject, verbose_name='Предмет', on_delete=models.SET_NULL, null=True, blank=False)
    theme_id = models.ForeignKey(Theme, verbose_name='Тема', on_delete=models.SET_NULL, null=True, blank=True)
    article_id = models.ForeignKey(Article, verbose_name='Статия', on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Въшен ресурс(link)'
        verbose_name_plural = 'Въшни ресурси(links)'


""" 
        Т Е С Т О В А   С И С Т Е М А 
"""


# Въпроси - формулировка
class QuestionTextManager(models.Manager):
    def create_task(self, itm):
        item = self.create(item=itm)
        return item


class QuestionText(models.Model):
    subject_id = models.ForeignKey(Subject, verbose_name='Предмет', on_delete=models.CASCADE, null=True,
                                   related_name='question_subject', help_text='Предмет към който се отнася въпроса')
    theme_id = models.ForeignKey(Theme, verbose_name='Тема', on_delete=models.CASCADE, null=True,
                                 related_name='question_theme', help_text='Тема към която се отнася въпроса')
    num = models.PositiveSmallIntegerField(default=0, help_text='генерира се автоматично')
    text = models.TextField('Въпрос', default='', blank=True, help_text='Формулировка (текст) на въпроса')
    type = models.PositiveSmallIntegerField(verbose_name='Тип', choices=TASK_TYPE, default=TYPE1,
                                            help_text='тип на въпроса')
    level = models.PositiveSmallIntegerField(verbose_name='Ниво', choices=LEVEL_TYPE, default=LEVEL1,
                                             help_text='ниво по Блум на въпроса')
    picture = models.ImageField('Картинка', upload_to='test_pics', blank=True)

    objects = QuestionTextManager()

    def __str__(self):
        return self.text

    class Meta:
        verbose_name = 'Въпрос - текст'
        verbose_name_plural = 'Въпроси - текст'


# Въпроси  - опции
class QuestionItemManager(models.Manager):
    def create_task(self, task_id):
        item = self.create(task=task_id)
        return item


class QuestionItem(models.Model):
    task = models.ForeignKey(QuestionText, on_delete=models.CASCADE, null=True, related_name='options')
    leading_char = models.CharField('Водещ символ', max_length=4, default='', blank=True, help_text='№ или буква')
    text = models.CharField('Текст', max_length=200, default='', blank=True,
                            help_text='Формулировка (текст) на опцията(отговора)')
    value = models.CharField('Стойност', max_length=20, default='', blank=True, help_text='Отговор - стойност')
    value_name = models.CharField("Стойност - име", max_length=200, default='', blank=True, help_text='Отговор - име')
    checked = models.BooleanField('Отговор - маркирано', null=True, help_text='Отговор за опции с маркиране')
    checked_t = models.BooleanField('Отговор - маркирано', null=True, help_text='генерира се автоматично')
    value_t = models.CharField('Стойност', max_length=20, default='', blank=True, help_text='генерира се автоматично')

    objects = QuestionItemManager()

    def __str__(self):
        return f'{self.leading_char} {self.text}'

    class Meta:
        verbose_name = 'Въпрос  - опция'
        verbose_name_plural = 'Въпроси - опции'


class TestsSettings(models.Model):
    param_name = models.CharField('Параметър', max_length=50, default='*', blank=False, help_text='Име на параметър')
    param_value = models.CharField('Стойност', max_length=50, default='*', blank=False,
                                   help_text='Стойност на параметър')

    def __str__(self):
        return f'{self.param_name} = {self.param_value}'

    class Meta:
        verbose_name = 'Параметър'
        verbose_name_plural = 'Параметри'
