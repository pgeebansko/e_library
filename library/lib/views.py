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
        selected_class = Klas.objects.get(id=pk)
        if selected_class.class_num == 8:
            class_ttl = '-ми'
        else:
            class_ttl = '-ти'
        # this is a remark
        classes = Klas.objects.order_by('class_num')
        professions = Speciality.objects.order_by('id')
        subjects = Subject.objects.order_by('name').filter(class_for=pk)
        context = {'subjects': subjects,
                   'classes': classes,
                   'professions': professions,
                   'class_num': selected_class.class_num,
                   'class_sup': class_ttl,
                   }
        return render(request, 'lib/subjects-overview.html', context)
