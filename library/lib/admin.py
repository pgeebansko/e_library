from django.contrib import admin
from .models import Speciality, Klas, Subject, Article, Theme, Attacment, Link
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



