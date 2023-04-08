from django.urls import path
from . import views

from django.conf import settings
from django.contrib import admin
from django.conf.urls.static import static

urlpatterns = [
    path('', views.index, name='home'),
    path('books_by_class/<int:pk>/', views.BooksByClass.as_view()),
    path('book_themes/<int:pk>/', views.BookThemes.as_view()),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)