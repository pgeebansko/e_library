from django.shortcuts import render
from django.views.generic.base import View
from .models import *


def index(request):
    classes = Klas.objects.order_by('class_num')
    professions = Speciality.objects.order_by('id')
    context = {'classes': classes,
               'professions': professions,
               }
    return render(request, 'lib/index.html', context)


class BooksByClass(View):
    def get(self, request, pk):
        classes = Klas.objects.order_by('class_num')
        professions = Speciality.objects.order_by('id')
        subjects = Subject.objects.order_by('name').filter(class_for=pk)
        context = {'subjects':subjects,
                   'classes': classes,
                   'professions': professions,
                   }
        return render(request, 'lib/subjects-overview.html', context)
