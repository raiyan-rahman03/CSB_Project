import json

# JSON-like string (assuming it is stored as a string in Python)
data = '''
[
    {"test_name": "Complete Blood Count (CBC)", "sample": "Blood"},
    {"description": "Haemoglobin", "result": "15", "ref_range": "13-17", "unit": "g/dL"},
    {"description": "Total Leucocyte Count", "result": "5000", "ref_range": "4000-10000", "unit": "/cumm"},
    {"description": "Neutrophils", "result": "50", "ref_range": "40-80", "unit": "%"},
    {"description": "Lymphocytes", "result": "40", "ref_range": "20-40", "unit": "%"},
    {"description": "Eosinophils", "result": "", "ref_range": "1-6", "unit": "%"},
    {"description": "Basophils", "result": "0.00", "ref_range": "0-1", "unit": "%"},
    {"description": "Absolute Neutrophils", "result": "2500.00", "ref_range": "2000-7000", "unit": "/cumm"},
    {"description": "Absolute Lymphocytes", "result": "2000.00", "ref_range": "1000-3000", "unit": "/cumm"},
    {"description": "Absolute Eosinophils", "result": "50.00", "ref_range": "20-500", "unit": "/cumm"},
    {"description": "Absolute Monocytes", "result": "450.00", "ref_range": "200-1000", "unit": "/cumm"},
    {"description": "RBC Count", "result": "5", "ref_range": "4.5-5.5", "unit": "million/cumm"}
]
'''

# Convert the string into a Python list of dictionaries
data_list = json.loads(data)

# Extract test name and sample
test_info = data_list[0]
test_name = test_info.get("test_name")
sample = test_info.get("sample")

print(f"Test Name: {test_name}")
print(f"Sample: {sample}")
