import os
import google.generativeai as genai
from django.shortcuts import render

def home(request):
    return render(request, 'home.html')
import requests

# View complete code at: https://github.com/Asprise/receipt-ocr/tree/main/python-receipt-ocr
import requests
import requests
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.parsers import MultiPartParser, FormParser

class AspireResponseView(APIView):
    parser_classes = (MultiPartParser, FormParser)

    def post(self, request, *args, **kwargs):
        try:
            imageFile = request.FILES['file']
            receiptOcrEndpoint = 'https://ocr.asprise.com/api/v1/receipt'
            r = requests.post(receiptOcrEndpoint, data={
                'api_key': 'TEST',        # Use 'TEST' for testing purpose
                'recognizer': 'auto',     # can be 'US', 'CA', 'JP', 'SG' or 'auto'
                'ref_no': 'ocr_python_123',  # optional caller provided ref code
            }, files={"file": imageFile})
            return Response(r.json(), status=r.status_code)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



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

        print(response.status_code)
        response_text = response.json()


        print(response_text)
        return response_text
