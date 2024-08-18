import json

gemini_json_final = """```json
[
    {"test_name": "Complete Blood Count (CBC)"},
    {"sample": "Blood"},
    {"description": "Haemoglobin", "result": "15", "ref_range": "13-17", "unit": "g/dL"},
    {"description": "Total Leucocyte Count", "result": "5000", "ref_range": "4000-10000", "unit": "/cumm"},
    {"description": "Neutrophils", "result": "50", "ref_range": "40-80", "unit": "%"},
    {"description": "Lymphocytes", "result": "40", "ref_range": "20-40", "unit": "%"},
    {"description": "Eosinophils", "result": "", "ref_range": "1-6", "unit": "%"},
    {"description": "Monocytes", "result": "", "ref_range": "2-10", "unit": "%"},
    {"description": "Basophils", "result": "0.00", "ref_range": "0-1", "unit": "%"},
    {"description": "Absolute Neutrophils", "result": "2500.00", "ref_range": "2000-7000", "unit": "/cumm"},
    {"description": "Absolute Lymphocytes", "result": "2000.00", "ref_range": "1000-3000", "unit": "/cumm"},
    {"description": "Absolute Eosinophils", "result": "50.00", "ref_range": "20-500", "unit": "/cumm"},
    {"description": "Absolute Monocytes", "result": "450.00", "ref_range": "200-1000", "unit": "/cumm"},
    {"description": "RBC Count", "result": "5", "ref_range": "4.5-5.5", "unit": "Million/cumm"},
    {"description": "MCV", "result": "80.00", "ref_range": "81-101", "unit": "fL"},
    {"description": "MCH", "result": "30.00", "ref_range": "27-32", "unit": "pg"},
    {"description": "MCHC", "result": "37.50", "ref_range": "31.5-34.5", "unit": "g/dL"},
    {"description": "Hct", "result": "40", "ref_range": "40-50", "unit": ""},
    {"description": "RDW-CV", "result": "12", "ref_range": "11.6-14.0", "unit": "%"},
    {"description": "RDW-SD", "result": "40", "ref_range": "39-46", "unit": "fL"},
    {"description": "Platelet Count", "result": "300000", "ref_range": "150000-410000", "unit": "/cumm"},
    {"description": "PCT", "result": "35", "ref_range": "", "unit": ""},
    {"description": "MPV", "result": "8", "ref_range": "7.5-11.5", "unit": "fL"},
    {"description": "PDW", "result": "9", "ref_range": "", "unit": ""}
]
```"""

data_for_clean = gemini_json_final.strip()
cleaned_data = data_for_clean.replace('```json', '').replace('```', '').strip()

if cleaned_data:
    
        # Decode the JSON data
        report_data_list = json.loads(cleaned_data)

        # Initialize variables for test_name and sample
        test_name = None
        sample = None

        # Separate test_name and sample from the main data
        for item in report_data_list:
            if 'test_name' in item:
                test_name = item['test_name']
            elif 'sample' in item:
                sample = item['sample']

print(test_name)
print(sample)