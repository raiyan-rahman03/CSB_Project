
from django.urls import path
from . views import *
from django.views.generic import RedirectView

urlpatterns = [
    path('accounts/profile/', RedirectView.as_view(url='http://127.0.0.1:8000/home', permanent=True)),
    path('', RedirectView.as_view(url='http://127.0.0.1:8000/home', permanent=True)),
    path('home',home),
    path('chart',chart),
    path('index', index, name='index'),
    path('chat_with_doctor/', chat_with_doctor, name='chat_with_doctor'),
    path('profile/',profile, name='profile'),
    path('ocr',AspireResponseView.as_view()),
    path('dataset',DatasetAPIView.as_view()),
    path('gemini_prompt1',GeminiStep1APIView.as_view()),
    path('gemini_prompt2',GeminiStep2APIView.as_view()),

    path('profiles/', ProfileListCreateView.as_view(), name='profile-list-create'),
    path('profiles/<int:pk>/', ProfileRetrieveUpdateDestroyView.as_view(), name='profile-detail'),
    path('appointments/', AppointmentListCreateView.as_view(), name='appointment-list-create'),
    path('appointments/<int:pk>/', AppointmentRetrieveUpdateDestroyView.as_view(), name='appointment-detail'),
    path('ch',data_representation)
]

