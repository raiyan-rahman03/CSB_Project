
from django.urls import path
from . views import *
from django.views.generic import RedirectView

urlpatterns = [
    path('accounts/profile/', RedirectView.as_view(url='http://127.0.0.1:8000/home', permanent=True)),
    path('', RedirectView.as_view(url='http://127.0.0.1:8000/home', permanent=True)),
    path('home',home),
    path('ocr',AspireResponseView.as_view()),
    path('dataset',DatasetAPIView.as_view()),
]
