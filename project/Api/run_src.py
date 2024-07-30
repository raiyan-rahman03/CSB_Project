import json
from collections import defaultdict
from django.http import JsonResponse
from .models import LabReport

def data_representation(request):
    user_id = request.user.id
    reports = LabReport.objects.filter(user=user_id)
    
    # Initialize a dictionary to collect all report data
    combined_report_data = defaultdict(list)
    
    for report in reports:
        # Convert the JSON string to a list of dictionaries
        report_data_list = json.loads(report.report_data)
        
        for item in report_data_list:
            key = item["description"]
            combined_report_data[key].append(item)
    
    # Convert defaultdict to a regular dictionary and flatten the lists
    result_data = []
    for key, values in combined_report_data.items():
        if len(values) == 1:
            result_data.append(values[0])
        else:
            combined_dict = {
                "description": key,
                "result": [value["result"] for value in values],
                "ref_range": values[0]["ref_range"],
                "unit": values[0]["unit"]
            }
            result_data.append(combined_dict)

    return  print(result_data)

a = data_representation