from .serializers import ProfileSerializer, AppointmentSerializer
from .models import Profile, Appointment
from rest_framework import generics
import requests
from django.http import JsonResponse
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from django.shortcuts import render
from .models import LabReport, LabReportImage
import json
from datetime import date


def home(request):
    return render(request, 'home.html')


class AspireResponseView(APIView):
    parser_classes = (MultiPartParser, FormParser)

    def post(self, request, *args, **kwargs):
        try:
            imageFile = request.FILES['file']
            receiptOcrEndpoint = 'https://ocr.asprise.com/api/v1/receipt'
            r = requests.post(receiptOcrEndpoint, data={
                'api_key': 'TEST',  # Use 'TEST' for testing purpose
                'recognizer': 'auto',  # can be 'US', 'CA', 'JP', 'SG' or 'auto'
                'ref_no': 'ocr_python_123',  # optional caller provided ref code
            }, files={"file": imageFile})

            data = r.json()
            extracted_data = []
            for receipt in data.get('receipts', []):
                date = receipt.get('date')
                time = receipt.get('time')
                ocr_text = receipt.get('ocr_text')
                ocr_confidence = receipt.get('ocr_confidence')
                merchant_address = receipt.get('merchant_address')
                success = data.get('success')

                extracted_data.append({
                    'date': date,
                    'time': str(time),
                    'ocr_text': ocr_text,
                    'ocr_confidence': ocr_confidence,
                    'merchant_address': merchant_address,
                    'success': str(success),
                })
                print(extracted_data)
            print(extracted_data)
            # safe=False allows non-dict objects to be serialized
            return JsonResponse(extracted_data, safe=False)
        except Exception as e:
            original_exception = e.__cause__
            if original_exception:
                error_message = f"Original error: {str(original_exception)}"
            else:
                error_message = str(e)

            return Response({"error": error_message}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


def gemini_response(prompt):
    API_KEY = 'AIzaSyBP2PuxTxEG07iLzj4hQuvftwbCb6r08hI'
    url = f'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key={API_KEY}'
    headers = {
        'Content-Type': 'application/json'
    }
    data = {
        "contents": [
            {
                "parts": [
                    {
                        "text": prompt
                    }
                ]
            }
        ]
    }

    response = requests.post(url, headers=headers, json=data)
    print(
        f"gemini_response status: {response.status_code}, response: {response.text}")

    response_text = response.json(
    )['candidates'][0]['content']['parts'][0]['text']
    return response_text


class DatasetAPIView(APIView):
    parser_classes = (MultiPartParser, FormParser)

    def post(self, request, *args, **kwargs):
        aspire_url = 'http://localhost:8000/ocr'  # Adjust URL as needed

        try:
            # Get the file from the request
            image_file = request.FILES['file']

            # Make a POST request to AspireResponseView to get OCR text
            response = requests.post(aspire_url, files={'file': image_file})
            response_data = response.json()

            # Extract OCR text from the response
            ocr_text = response_data[0]['ocr_text']
            print(f"line 110 {ocr_text}")

            # Assuming only one entry in response_data
            prompt1 = '''I have some text from a lab report obtained through OCR. It's a bit messy, and I'd like to clean it up and organize the data nicely in text.
            Present the information in plain text, don't use tables.

            Here is the OCR text: 

            ''' + str(ocr_text)

            # Use OCR text as prompt for gemini_response
            gemini_result = gemini_response(prompt1)
            print(f"line 112 {gemini_result}")

            prompt2 = (
                "I have an OCR-extracted text from a medical lab report. "
                "I need to transform this text into a well-structured JSON format that can be easily stored in a database and displayed on a frontend. "
                "The JSON should include detailed test results with appropriate keys for descriptions, results, reference ranges, and units. "
                "No need to give the information of the patient, only provide the test results.\n\n"
                f"Here's the OCR-extracted text: \n\n{gemini_result}\n\n"
                "Transform the text into the following JSON structure:\n\n"
                "[\n"
                '    {"description": "Haemoglobin", "result": "15", "ref_range": "13-17", "unit": "g/dL"},\n'
                '    {"description": "Total Leucocyte Count", "result": "5000", "ref_range": "4000-10000", "unit": "/cumm"},\n'
                '    {"description": "Neutrophils", "result": "50", "ref_range": "40-80", "unit": "%"},\n'
                '    {"description": "Lymphocytes", "result": "40", "ref_range": "20-40", "unit": "%"},\n'
                '    {"description": "Eosinophils", "result": "", "ref_range": "1-6", "unit": "%"},\n'
                '    {"description": "Monocytes", "result": "", "ref_range": "2-10", "unit": "%"},\n'
                '    {"description": "Basophils", "result": "0.00", "ref_range": "0-1", "unit": "%"},\n'
                '    {"description": "Absolute Neutrophils", "result": "2500.00", "ref_range": "2000-7000", "unit": "/cumm"},\n'
                '    {"description": "Absolute Lymphocytes", "result": "2000.00", "ref_range": "1000-3000", "unit": "/cumm"},\n'
                '    {"description": "Absolute Eosinophils", "result": "50.00", "ref_range": "20-500", "unit": "/cumm"},\n'
                '    {"description": "Absolute Monocytes", "result": "450.00", "ref_range": "200-1000", "unit": "/cumm"},\n'
                '    {"description": "RBC Count", "result": "5", "ref_range": "4.5-5.5", "unit": "million/cumm"},\n'
                "\n please provide json response only as the given structured no need to give extra explanatory text just give the json response as you are API "
                "]"
            )

            gemini_json_final = gemini_response(prompt2)
            print(f"line 134 {gemini_json_final}")

            user = request.user

            # Create LabReport instance
            lab_report = LabReport.objects.create(
                user=user, report_data=gemini_json_final, report_date=date.today())

            # Create LabReportImage instance
            LabReportImage.objects.create(
                lab_report=lab_report, image=image_file, size=image_file.size)

            # Return the result from gemini_response as JSON response
            return JsonResponse(gemini_json_final, safe=False)

        except Exception as e:
            original_exception = e.__cause__
            if original_exception:
                error_message = f"Original error: {str(original_exception)}"
            else:
                error_message = str(e)

            return Response({"error": error_message}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# crud sytem building blocks

class ProfileListCreateView(generics.ListCreateAPIView):
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer


class ProfileRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer


class AppointmentListCreateView(generics.ListCreateAPIView):
    queryset = Appointment.objects.all()
    serializer_class = AppointmentSerializer


class AppointmentRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Appointment.objects.all()
    serializer_class = AppointmentSerializer
# views.py
from django.shortcuts import render

def index(request):
    return render(request, 'index.html')

def chat_with_doctor(request):
    return render(request, 'chat_with_doctor.html')

def profile(request):
    return render(request, 'profile.html')
