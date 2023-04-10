from django.urls import path
from . import views

from django.conf import settings
from django.contrib import admin
from django.conf.urls.static import static

urlpatterns = [
    path('', views.index, name='home'),
    path('books_by_class/<int:pk>/', views.BooksByClass.as_view()),
    path('books_by_profession/<int:pk>/', views.BooksByProfession.as_view()),
    path('book_themes/<int:pk>/', views.BookThemes.as_view()),
    path('theme_articles/<int:sb>/<int:th>/', views.ThemeArticles.as_view()),
    path('single_article/<int:sb>/<int:th>/<int:art>/', views.SingleArticle.as_view()),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
