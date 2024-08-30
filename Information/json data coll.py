import json
import pandas as pd


json_data = [
    {"description": "Haemoglobin", "result": "4000-10000", "ref_range": "/cumm", "unit": ""},
    {"description": "Neutrophils", "result": 80, "ref_range": "40-80", "unit": ""},
    {"description": "Lymphocytes", "result": 45, "ref_range": "20-40", "unit": "%"},
    {"description": "Eosinophils", "result": 1, "ref_range": "1-6", "unit": "%"},
    {"description": "Monocytes", "result": 9.15, "ref_range": "13-17", "unit": "g/dL"},
    {"description": "Total Leucocyte Count", "result": 5000, "ref_range": "2-10", "unit": "%"},
    {"description": "Basophils", "result": 0.00, "ref_range": "0-1", "unit": "%"},
    {"description": "Absolute Neutrophils", "result": 2500.00, "ref_range": "2000-7000", "unit": "/cumm"},
    {"description": "Absolute Lymphocytes", "result": 2000.00, "ref_range": "1000-3000", "unit": "/cumm"},
    {"description": "Absolute Eosinophils", "result": 50.00, "ref_range": "20-500", "unit": "/cumm"},
    {"description": "Absolute Monocytes", "result": 450.00, "ref_range": "200-1000", "unit": "/cumm"},
    {"description": "RBC Count", "result": 5, "ref_range": "4.5-5.5", "unit": "Million/cumm"},
    {"description": "MCV", "result": 80.00, "ref_range": "81-101", "unit": "fL"},
    {"description": "MCH", "result": 30.00, "ref_range": "27-32", "unit": "pg"},
    {"description": "MCHC", "result": 37.50, "ref_range": "31.5-34.5", "unit": "g/dL"},
    {"description": "Hct", "result": 40, "ref_range": "40-50", "unit": "%"},
    {"description": "RDW-CV", "result": 12, "ref_range": "11.6-14.0", "unit": "%"},
    {"description": "RDW-SD", "result": 40, "ref_range": "39-46", "unit": "fL"},
    {"description": "Platelet Count", "result": 99, "ref_range": "150", "unit": ""}
]


mapping = {
    "Haemoglobin": "HGB",
    "Neutrophils": "NEUTp",
    "Lymphocytes": "LYMp",
    "Monocytes": "MIDp",
    "RBC Count": "RBC",
    "MCV": "MCV",
    "MCH": "MCH",
    "MCHC": "MCHC",
    "Hct": "HCT",
    "RDW-CV": "RDWCV",
    "RDW-SD": "RDWSD",
    "Platelet Count": "PLT"
}


data_to_extract = ["WBC", "LYMp", "MIDp", "NEUTp", "HGB", "HCT", "MCV", "MCH","PLT"]
extracted_data = {key: None for key in data_to_extract}

for item in json_data:
    description = item['description']
    if description in mapping:
        standardized_description = mapping[description]
        if standardized_description in extracted_data:
            extracted_data[standardized_description] = item['result']
    elif description in extracted_data:
        extracted_data[description] = item['result']


df = pd.DataFrame([extracted_data])


df.to_excel(r'C:\Users\Admin\Desktop\CSB\CSB_Project\JSON Dataset.xlsx', index=False)

print("Data extracted and saved to JSON Dataset.xlsx")
