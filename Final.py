import os
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier

file_path = r'C:\Users\GIGABYTE\Desktop\New folder\JSON Dataset.xlsx'  # excel file path
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

X = df.drop(['dengue', 'malaria', 'TB', 'typhoid'], axis=1)
y_dengue = df['dengue']
y_malaria = df['malaria']
y_TB = df['TB']
y_typhoid = df['typhoid']


if len(X) > 1:
    X_train, X_test, y_dengue_train, y_dengue_test = train_test_split(
        X, y_dengue, test_size=0.2, random_state=42)
    _, _, y_malaria_train, y_malaria_test = train_test_split(
        X, y_malaria, test_size=0.2, random_state=42)
    _, _, y_TB_train, y_TB_test = train_test_split(
        X, y_TB, test_size=0.2, random_state=42)
    _, _, y_typhoid_train, y_typhoid_test = train_test_split(
        X, y_typhoid, test_size=0.2, random_state=42)
else:
    X_train, X_test = X, X
    y_dengue_train, y_dengue_test = y_dengue, y_dengue
    y_malaria_train, y_malaria_test = y_malaria, y_malaria
    y_TB_train, y_TB_test = y_TB, y_TB
    y_typhoid_train, y_typhoid_test = y_typhoid, y_typhoid

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



def diagnose_disease(df, index):
    sample = df.iloc[index].drop(['dengue', 'malaria', 'TB', 'typhoid']).values
    sample_scaled = scaler.transform([sample])
    dengue_pred = clf_dengue.predict(sample_scaled)
    malaria_pred = clf_malaria.predict(sample_scaled)
    tb_pred = clf_TB.predict(sample_scaled)
    typhoid_pred = clf_typhoid.predict(sample_scaled)

    diagnosis = {
        "dengue": bool(dengue_pred[0]),
        "malaria": bool(malaria_pred[0]),
        "TB": bool(tb_pred[0]),
        "typhoid": bool(typhoid_pred[0])
    }

    return diagnosis



sample_index = 0
predictions = diagnose_disease(df, sample_index)
print(predictions)
