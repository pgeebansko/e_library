from django.shortcuts import render
from django.views.generic.base import View
from rest_framework.views import APIView
from rest_framework.response import Response

from .models import *
from .serializers import *


def index(request):
    classes = Klas.objects.order_by('class_num')
    professions = Speciality.objects.order_by('id')
    context = {'classes': classes,
               'professions': professions,
               }
    return render(request, 'lib/index.html', context)


class BooksByClass(View):
    @staticmethod
    def get(request, pk):
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


class BooksByProfession(View):
    @staticmethod
    def get(request, pk):
        selected_profession = Speciality.objects.get(id=pk)
        classes = Klas.objects.order_by('class_num')
        professions = Speciality.objects.order_by('id')
        subjects = Subject.objects.order_by('name').filter(class_for=pk)
        context = {'subjects': subjects,
                   'classes': classes,
                   'professions': professions,
                   'profession': selected_profession.name,
                   }
        return render(request, 'lib/professions-overview.html', context)


class BookThemes(View):
    @staticmethod
    def get(request, pk):
        classes = Klas.objects.order_by('class_num')
        professions = Speciality.objects.order_by('id')
        book = Subject.objects.get(id=pk)
        themes = Theme.objects.filter(subject=pk).order_by('order')
        attachments = Attacment.objects.filter(subject_id=pk).filter(theme_id=None).filter(article_id=None)
        links = Link.objects.filter(subject_id=pk).filter(theme_id=None).filter(article_id=None)
        for a in attachments:
            print(f'{a.title}: {a.subject_id}, {a.theme_id}, {a.article_id}')

        context = {'classes': classes,
                   'professions': professions,
                   'subject': book,
                   'themes': themes,
                   'attachments': attachments,
                   'links': links,
                   }
        return render(request, 'lib/subject-themes.html', context)


class ThemeArticles(View):
    @staticmethod
    def get(request, sb, th):
        classes = Klas.objects.order_by('class_num')
        professions = Speciality.objects.order_by('id')
        book = Subject.objects.get(id=sb)
        theme = Theme.objects.get(id=th)
        articles = Article.objects.filter(theme_id=th).order_by('order')
        attachments = Attacment.objects.filter(subject_id=sb).filter(theme_id=th).filter(article_id=None)
        links = Link.objects.filter(subject_id=sb).filter(theme_id=th).filter(article_id=None)

        context = {'classes': classes,
                   'professions': professions,
                   'subject': book,
                   'theme': theme,
                   'articles': articles,
                   'attachments': attachments,
                   'links': links,
                   }
        return render(request, 'lib/theme-articles.html', context)


class SingleArticle(View):
    @staticmethod
    def get(request, sb, th, art):
        classes = Klas.objects.order_by('class_num')
        professions = Speciality.objects.order_by('id')
        book = Subject.objects.get(id=sb)
        theme = Theme.objects.get(id=th)
        article = Article.objects.get(id=art)
        attachments = Attacment.objects.filter(subject_id=sb).filter(theme_id=th).filter(article_id=art)
        links = Link.objects.filter(subject_id=sb).filter(theme_id=th).filter(article_id=art)

        context = {'classes': classes,
                   'professions': professions,
                   'subject': book,
                   'theme': theme,
                   'article': article,
                   'attachments': attachments,
                   'links': links,
                   }
        return render(request, 'lib/article.html', context)


"""
            Т Е С Т О В Е 
"""


# С Т Р А Н И Ц И
#   Списък на всички въпроси от дадена тема
class Test(View):
    @staticmethod
    def get(request, sb, th):
        subject = Subject.objects.get(id=sb)
        if th == 0:
            theme = {'id': 0}
        else:
            theme = Theme.objects.get(id=th)
        tasks_total = 0
        test_params = TestsSettings.objects.order_by('id')
        for tp in test_params:
            if tp.param_name == 'брой въпроси по предмет':
                tasks_s = int(tp.param_value)
            elif tp.param_name == 'брой въпроси по тема':
                tasks_t = int(tp.param_value)
        if th == 0:
            tasks_total = tasks_s
        else:
            tasks_total = tasks_t
        context = {'subject': subject,
                   'theme': theme,
                   'tasks_total': tasks_total,
                   }
        return render(request, 'lib/test_test.html', context)


# R E S T   У С Л У Г И
# Връща списък на всички тестови въпроси по дадена тема или предмет
class TestSerializerView(APIView):
    def get(self, request, sb, th):
        if th == 0:
            queryset = QuestionText.objects.filter(subject_id=sb).order_by('id')
        else:
            queryset = QuestionText.objects.filter(theme_id=th).order_by('id')
        serializer = QuestionTextSerializer(queryset, many=True, context={"request": request})
        return Response(serializer.data)
