import os
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report

file_path = r'C:\Users\GIGABYTE\Desktop\New folder\cbc information.xlsx'
df = pd.read_excel(file_path)

def apply_dengue_rules(row):
    return 1 if row['WBC'] < 4.0 and (row['LYMp'] > 40.0 or row['NEUTp'] > 70.0) and row['PLT'] < 100 else 0

def apply_malaria_rules(row):
    upper_threshold = 100
    lower_threshold = 25
    return 1 if row['MCV'] > upper_threshold or row['MCH'] < lower_threshold else 0

def apply_tb_rules(row):
    return 1 if row['LYMp'] > 50.0 and row['HGB'] < 12.0 and row['HCT'] < 36.0 else 0

def apply_typhoid_rules(row):
    return 1 if row['WBC'] < 4.5 and (row['LYMp'] > 40.0 or row['NEUTp'] > 65.0) else 0

df['dengue'] = df.apply(apply_dengue_rules, axis=1)
df['malaria'] = df.apply(apply_malaria_rules, axis=1)
df['TB'] = df.apply(apply_tb_rules, axis=1)
df['typhoid'] = df.apply(apply_typhoid_rules, axis=1)

df['detected_dengue'] = df['dengue'].apply(lambda x: 'Detected' if x == 1 else 'Not Detected')
df['detected_malaria'] = df['malaria'].apply(lambda x: 'Detected' if x == 1 else 'Not Detected')
df['detected_TB'] = df['TB'].apply(lambda x: 'Detected' if x == 1 else 'Not Detected')
df['detected_typhoid'] = df['typhoid'].apply(lambda x: 'Detected' if x == 1 else 'Not Detected')

detected_dengue_ids = df[df['dengue'] == 1]['ID'].tolist()
detected_malaria_ids = df[df['malaria'] == 1]['ID'].tolist()
detected_TB_ids = df[df['TB'] == 1]['ID'].tolist()
detected_typhoid_ids = df[df['typhoid'] == 1]['ID'].tolist()

dengue_count = len(detected_dengue_ids)
malaria_count = len(detected_malaria_ids)
TB_count = len(detected_TB_ids)
typhoid_count = len(detected_typhoid_ids)

df['multiple_diseases'] = df[['dengue', 'malaria', 'TB', 'typhoid']].sum(axis=1).apply(lambda x: 'Yes' if x > 1 else 'No')
multiple_disease_count = df[df['multiple_diseases'] == 'Yes'].shape[0]

X = df.drop(['dengue', 'malaria', 'TB', 'typhoid', 'detected_dengue', 'detected_malaria', 'detected_TB', 'detected_typhoid', 'multiple_diseases'], axis=1)
y_dengue = df['dengue']
y_malaria = df['malaria']
y_TB = df['TB']
y_typhoid = df['typhoid']

X_train, X_test, y_dengue_train, y_dengue_test = train_test_split(X, y_dengue, test_size=0.2, random_state=42)
_, _, y_malaria_train, y_malaria_test = train_test_split(X, y_malaria, test_size=0.2, random_state=42)
_, _, y_TB_train, y_TB_test = train_test_split(X, y_TB, test_size=0.2, random_state=42)
_, _, y_typhoid_train, y_typhoid_test = train_test_split(X, y_typhoid, test_size=0.2, random_state=42)

scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)

clf_dengue = RandomForestClassifier(random_state=42)
clf_dengue.fit(X_train_scaled, y_dengue_train)

clf_malaria = RandomForestClassifier(random_state=42)
clf_malaria.fit(X_train_scaled, y_malaria_train)

clf_TB = RandomForestClassifier(random_state=42)
clf_TB.fit(X_train_scaled, y_TB_train)

clf_typhoid = RandomForestClassifier(random_state=42)
clf_typhoid.fit(X_train_scaled, y_typhoid_train)

y_dengue_pred = clf_dengue.predict(X_test_scaled)
y_malaria_pred = clf_malaria.predict(X_test_scaled)
y_TB_pred = clf_TB.predict(X_test_scaled)
y_typhoid_pred = clf_typhoid.predict(X_test_scaled)

print("Number of individuals detected with Dengue:", dengue_count)
print("Number of individuals detected with Malaria:", malaria_count)
print("Number of individuals detected with TB:", TB_count)
print("Number of individuals detected with Typhoid:", typhoid_count)
print("Number of individuals with multiple diseases:", multiple_disease_count)

print("\nClassification Report - Dengue:")
print(classification_report(y_dengue_test, y_dengue_pred))

print("\nClassification Report - Malaria:")
print(classification_report(y_malaria_test, y_malaria_pred))

print("\nClassification Report - TB:")
print(classification_report(y_TB_test, y_TB_pred))

print("\nClassification Report - Typhoid:")
print(classification_report(y_typhoid_test, y_typhoid_pred))

print("\nIDs Detected for Dengue:")
print(detected_dengue_ids)

print("\nIDs Detected for Malaria:")
print(detected_malaria_ids)

print("\nIDs Detected for TB:")
print(detected_TB_ids)

print("\nIDs Detected for Typhoid:")
print(detected_typhoid_ids)

detected_ids_df = pd.DataFrame({
    'Dengue Detected': detected_dengue_ids,
    'Malaria Detected': detected_malaria_ids,
    'TB Detected': detected_TB_ids,
    'Typhoid Detected': detected_typhoid_ids
})

detected_ids_df = detected_ids_df.applymap(lambda x: 'None Detected' if x == [] else x)

summary_df = pd.DataFrame({
    'Disease': ['Dengue', 'Malaria', 'TB', 'Typhoid', 'Multiple Diseases'],
    'Number of Cases': [dengue_count, malaria_count, TB_count, typhoid_count, multiple_disease_count]
})

output_dir = r'C:\Users\GIGABYTE\Desktop\New folder'

if not os.path.exists(output_dir):
    os.makedirs(output_dir)

summary_file_path = os.path.join(output_dir, 'disease_detection_summary.csv')
detected_ids_file_path = os.path.join(output_dir, 'detected_cases_details.csv')

summary_df.to_csv(summary_file_path, index=False)
detected_ids_df.to_csv(detected_ids_file_path, index=False)

print("Disease detection summary exported to:", summary_file_path)
print("Detected cases details exported to:", detected_ids_file_path)
