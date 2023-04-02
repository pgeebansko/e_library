from django.urls import path
from . import views
urlpatterns = [
    path('', views.index, name='home'),
    path('books_by_class/<int:pk>/', views.BooksByClass.as_view()),
]

