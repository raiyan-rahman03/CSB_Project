import os
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier

file_path = r'JSON Dataset.xlsx'  # excel file path
df = pd.read_excel(file_path)


def apply_dengue_rules(row):
    return "Positive" if row['WBC'] < 4.0 and (row['LYMp'] > 40.0 or row['NEUTp'] > 70.0) and row['PLT'] < 100 else "Negative"


def apply_malaria_rules(row):
    upper_threshold = 100
    lower_threshold = 25
    return "Positive" if row['MCV'] > upper_threshold or row['MCH'] < lower_threshold else "Negative"


def apply_tb_rules(row):
    return "Positive" if row['LYMp'] > 50.0 and row['HGB'] < 12.0 and row['HCT'] < 36.0 else "Negative"


def apply_typhoid_rules(row):
    return "Positive" if row['WBC'] < 4.5 and (row['LYMp'] > 40.0 or row['NEUTp'] > 65.0) else "Negative"


df['Dengue'] = df.apply(apply_dengue_rules, axis=1)
df['Malaria'] = df.apply(apply_malaria_rules, axis=1)
df['TB'] = df.apply(apply_tb_rules, axis=1)
df['Typhoid'] = df.apply(apply_typhoid_rules, axis=1)

print(df[['Dengue', 'Malaria', 'TB', 'Typhoid']])

for index, row in df.iterrows():
    print(f"Dengue : {row['Dengue']}")
    print(f"Malaria : {row['Malaria']}")
    print(f"TB : {row['TB']}")
    print(f"Typhoid : {row['Typhoid']}")
    print("\n")