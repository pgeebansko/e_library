from django.db import models
from datetime import date
from ckeditor.fields import RichTextField


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
    attachment = models.FileField('Файл', upload_to='attachments')
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
    link = models.CharField('URL', max_length=200)
    subject_id = models.ForeignKey(Subject, verbose_name='Предмет', on_delete=models.SET_NULL, null=True, blank=False)
    theme_id = models.ForeignKey(Theme, verbose_name='Тема', on_delete=models.SET_NULL, null=True, blank=True)
    article_id = models.ForeignKey(Article, verbose_name='Статия', on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Въшен ресурс(link)'
        verbose_name_plural = 'Въшни ресурси(links)'
