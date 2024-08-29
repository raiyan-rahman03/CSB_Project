import nltk
import pandas as pd
import re
from nltk.corpus import stopwords
from sklearn.preprocessing import LabelEncoder
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
import json

# Download NLTK stopwords if not already downloaded
nltk.download('stopwords')

# Load dataset
df = pd.read_excel('E:\Miraj Shafek things\med depart.xlsx')

# Define stop words
stop_words = set(stopwords.words('english'))


def clean_text(text):
    text = re.sub(r'\W', ' ', text)
    text = text.lower()
    text = ' '.join([word for word in text.split() if word not in stop_words])  # Remove stopwords
    return text


# Clean symptoms
df['cleaned_symptoms'] = df['symptoms'].apply(clean_text)

# Encode doctor labels
le = LabelEncoder()
df['doctor_label'] = le.fit_transform(df['doctortype'])

# Vectorize the symptoms
vectorizer = TfidfVectorizer()
X = vectorizer.fit_transform(df['cleaned_symptoms'])
y = df['doctor_label']

# Split data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train model
model = LogisticRegression()
model.fit(X_train, y_train)

# Predict
y_pred = model.predict(X_test)


def recommend_doctor(symptoms):
    cleaned_symptoms = clean_text(symptoms)
    transformed_symptoms = vectorizer.transform([cleaned_symptoms])
    predicted_doctor_label = model.predict(transformed_symptoms)
    predicted_doctor = le.inverse_transform(predicted_doctor_label)
    return predicted_doctor[0]


if __name__ == "__main__":
    new_symptoms = input("Enter your symptoms: ")
    recommended_doctor = recommend_doctor(new_symptoms)

    # Prepare data for JSON output
    output_data = {
        "symptoms": new_symptoms,
        "recommended_doctor_type": recommended_doctor
    }

    # Save the JSON output
    output_file_path = 'recommendation.json'

    with open(output_file_path, 'w') as f:
        json.dump(output_data, f, indent=4)

    print(f"Recommended doctor type: {recommended_doctor}")
