from django.db import models
from datetime import date


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

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Учебен предмет'
        verbose_name_plural = 'Учебни предмети'
