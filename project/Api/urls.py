
from django.urls import path
from . views import *
from django.views.generic import RedirectView
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('accounts/profile/', RedirectView.as_view(url='http://127.0.0.1:8000/', permanent=True)),
    # path('', RedirectView.as_view(url='http://127.0.0.1:8000/home', permanent=True)),
    path('upload',home),
    path('chart/',chart),
    path('', index, name='index'),
    path('chat_with_doctor/', chat_with_doctor, name='chat_with_doctor'),
    path('profile/',profile, name='profile'),
    path('ocr',AspireResponseView.as_view()),
    path('dataset',DatasetAPIView.as_view()),
    path('gemini_prompt1',GeminiStep1APIView.as_view()),
    path('gemini_prompt2',GeminiStep2APIView.as_view()),

    path('profiles/', ProfileListCreateView.as_view(), name='profile-list-create'),
    path('profiles/<int:pk>/', ProfileRetrieveUpdateDestroyView.as_view(), name='profile-detail'),
    #path('appointments/', AppointmentListCreateView.as_view(), name='appointment-list-create'),
    #path('appointments/<int:pk>/', AppointmentRetrieveUpdateDestroyView.as_view(), name='appointment-detail'),
    path('appointments',appointment),
    path('appoint_temp',appointment_render),
    # path('zoom/authorize/',zoom_authorize, name='zoom_authorize'),
    # path('zoom/callback/',zoom_callback, name='zoom_callback'),
    path('accept-appointment/<int:id>/', accept_appointment, name='accept_appointment'),
    path('join-call/', join_call, name='join_call'),
    path('test_names',report_names_get),
    path('ch/<int:id>/<str:test_name>',data_representation),
    path('image/<int:id>/<str:name>',report_images),
    path('img',image),
  

    path('doct/<int:id>',doct),
    #impersonate 
    path('doc/test_names/<int:user_id>/',impersonate_report_names_get)

     #zoom part
    
    

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

