import nltk
import pandas as pd
import re
from nltk.corpus import stopwords
from sklearn.preprocessing import LabelEncoder
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
import json

nltk.download('stopwords')

df = pd.read_excel('E:\Miraj Shafek things\med depart.xlsx')

stop_words = set(stopwords.words('english'))


def clean_text(text):
    text = re.sub(r'\W', ' ', text)
    text = text.lower()
    text = ' '.join([word for word in text.split() if word not in stop_words])
    return text


df['cleaned_symptoms'] = df['symptoms'].apply(clean_text)

le = LabelEncoder()
df['doctor_label'] = le.fit_transform(df['doctortype'])

vectorizer = TfidfVectorizer()
X = vectorizer.fit_transform(df['cleaned_symptoms'])
y = df['doctor_label']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

model = LogisticRegression()
model.fit(X_train, y_train)


def recommend_doctor(symptoms):
    cleaned_symptoms = clean_text(symptoms)
    transformed_symptoms = vectorizer.transform([cleaned_symptoms])
    predicted_doctor_label = model.predict(transformed_symptoms)
    predicted_doctor = le.inverse_transform(predicted_doctor_label)
    return predicted_doctor[0]


if __name__ == "__main__":

    while True:
        new_symptoms = input("Enter your symptoms: ")
        if new_symptoms.lower() == 'exit':
            print("Exiting the program.")
            break

        recommended_doctor = recommend_doctor(new_symptoms)

        output_data = {
            "symptoms": new_symptoms,
            "recommended doctor": recommended_doctor
        }

        output_file_path = 'recommendation.json'

        with open(output_file_path, 'w') as f:
            json.dump(output_data, f, indent=4)

        print(f"Recommended doctor type: {recommended_doctor}")
