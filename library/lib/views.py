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
#   Базова страница за гнериране на тест
class Test(View):
    @staticmethod
    def get(request, sb, th):
        subject = Subject.objects.get(id=sb)
        if th == 0:
            theme = {'id': 0}
        else:
            theme = Theme.objects.get(id=th)
        test_params = TestsSettings.objects.order_by('id')
        tasks_s = 0
        tasks_t = 0
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
                   'tasks_subject': tasks_s,
                   'tasks_theme': tasks_t,
                   'header_name': 'ТЕСТ'
                   }
        return render(request, 'lib/test_test.html', context)


#   Базова страница за редактиране на тест
class Edit(View):
    @staticmethod
    def get(request, sb, th):
        subject = Subject.objects.get(id=sb)
        if th == 0:
            theme = {'id': 0}
        else:
            theme = Theme.objects.get(id=th)
        test_params = TestsSettings.objects.order_by('id')
        tasks_s = 0
        tasks_t = 0
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
                   'tasks_subject': tasks_s,
                   'tasks_theme': tasks_t,
                   'header_name': 'Тестови въпроси'
                   }
        return render(request, 'lib/test_edit.html', context)


# R E S T   У С Л У Г И
# Връща списък на всички тестови въпроси по дадена тема или предмет
class TestSerializerView(APIView):
    @staticmethod
    def get(request, sb, th):
        print('Извикване от страна на сървъра')
        if th == 0:
            queryset = QuestionText.objects.filter(subject_id=sb).order_by('id')
        else:
            queryset = QuestionText.objects.filter(theme_id=th).order_by('id')
        serializer = QuestionTextSerializer(queryset, many=True, context={"request": request})
        return Response(serializer.data)


# Връща списък на всички теми по даден предмет
class ThemesBySubjectSerializerView(APIView):
    @staticmethod
    def get(request, sb, th):
        queryset = Theme.objects.filter(subject_id=sb).order_by('id')
        serializer = ThemesBySubjectSerializer(queryset, many=True, context={"request": request})
        return Response(serializer.data)


# Връща списък на всички въпроси по теми от предмет
class QuestionsByThemesSerializerView(APIView):
    @staticmethod
    def get(request, sb):
        queryset = Theme.objects.filter(subject_id=sb).order_by('order')
        print(queryset)
        serializer = QuestionsByThemesSerializer(queryset, many=True, context={"request": request})
        return Response(serializer.data)


# Въпрос - запазване на опциите на въпроса
class TaskSaveQuestionOptionsAPIView(APIView):
    def post(self, request, opt_id, qst_id):
        if opt_id == 0:  # вмъквам нова опция
            task_id = QuestionText.objects.filter(id=qst_id).get()
            option = QuestionItem.objects.create_task(task_id)
            option.leading_char = request.data['leading_char']
            option.text = request.data['text']
            option.value = request.data['value']
            option.value_name = request.data['value_name']
            option.checked = request.data['checked']
            option.save()
        else:
            option = QuestionSaveItemsSerializer(data=request.data)
            if option.is_valid():
                option.save()
            else:
                print('error validation: ', option.errors)

        return Response(status=201)


# Въпрос - запазване на тялото на въпроса
class TaskSaveQuestionBodyAPIView(APIView):
    def post(self, request):
        data = QuestionSaveTextSerializer(data=request.data)
        if data.is_valid():
            data.save()
        else:
            print('error validation: ', data.errors)
        return Response(status=201)


# Въпрос - създаване на нов въпрос
class TaskNewQuestionBodyAPIView(APIView):
    def post(self, request):
        subject_id = request.data['subject_id']
        theme_id = request.data['theme_id']
        th = Theme.objects.filter(id=theme_id).get()
        sb = Subject.objects.filter(id=subject_id).get()
        task = QuestionText.objects.create_task(sb, th)
        task.save()
        return Response(task.id)


# Въпрос - премахване на въпрос
class TaskDelTaskAPIView(APIView):
    def post(self, request):
        task_id = request.data['id']
        QuestionText.objects.filter(id=task_id).delete()
        return Response(status=201)


# Въпрос - премахване на опция към въпрос
class TaskDelItemAPIView(APIView):
    def post(self, request):
        for option in request.data['ids']:
            QuestionItem.objects.filter(id=option).delete()
        return Response(status=201)


# Въпрос - обновяване на картинка за въпрос от ниво знание
class TaskQuestionFileAPIView(APIView):
    def post(self, request):
        data = QuestionFileSerializer(data=request.data)
        if data.is_valid():
            data.save(id=request.data['id'])
        return Response(status=201)
