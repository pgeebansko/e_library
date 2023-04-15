from django.urls import path
from . import views

from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.index, name='home'),
    path('books_by_class/<int:pk>/', views.BooksByClass.as_view()),
    path('books_by_profession/<int:pk>/', views.BooksByProfession.as_view()),
    path('book_themes/<int:pk>/', views.BookThemes.as_view()),
    path('theme_articles/<int:sb>/<int:th>/', views.ThemeArticles.as_view()),
    path('single_article/<int:sb>/<int:th>/<int:art>/', views.SingleArticle.as_view()),

    path('test/<int:sb>/<int:th>/', views.Test.as_view()),
    path('edit/<int:sb>/<int:th>/', views.Edit.as_view()),

    path('api/test/<int:sb>/<int:th>/', views.TestSerializerView.as_view()),
    path('api/themes/<int:sb>/<int:th>/', views.ThemesBySubjectSerializerView.as_view()),
    path('api/q_themes/<int:sb>/<int:th>/', views.QuestionsByThemesSerializerView.as_view()),
    path('api/save_option/<int:opt_id>/<int:qst_id>/', views.QuestionsByThemesSerializerView.as_view()),
    path('api/save_question/', views.TaskSaveQuestionBodyAPIView.as_view()),
    path('api/new_question/', views.TaskNewQuestionBodyAPIView.as_view()),
    path('api/delete_question/', views.TaskDelTaskAPIView.as_view()),
    path('api/delete_option/', views.TaskDelItemAPIView.as_view()),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
