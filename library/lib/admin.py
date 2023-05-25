from django.contrib import admin
from .models import Speciality, Klas, Subject, Article, Theme, Attacment, Link, QuestionText, QuestionItem, \
    TestsSettings, Team

"""
added superuser
     name: admin
     password: pgee2023
"""

admin.site.register(Klas)
admin.site.register(Speciality)
admin.site.register(Subject)
admin.site.register(Attacment)
admin.site.register(Article)
admin.site.register(Theme)
admin.site.register(Link)
admin.site.register(Team)


@admin.register(QuestionText)
class ImportantV(admin.ModelAdmin):
    list_display = ('id', 'subject_id', 'theme_id', 'text', 'type',  'level', )
    list_display_links = ('id', )
    list_filter = ('subject_id', 'theme_id', )


admin.site.register(QuestionItem)
admin.site.register(TestsSettings)
