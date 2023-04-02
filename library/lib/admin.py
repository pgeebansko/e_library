from django.contrib import admin
from .models import Speciality, Klas, Subject
"""
added superuser
     name: admin
     password: pgee2023
"""

admin.site.register(Klas)
admin.site.register(Speciality)
admin.site.register(Subject)


