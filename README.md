# **MedVisual**

## **<u>Our Sector:</u>**
- Healthcare
- Web
- AI & Machine Learning

## What Make Us Inspired To Do This 

Every year, millions of lives are at risk due to diagnostic errors, accounting for about 10% of all patient deaths worldwide. The World Health Organization estimates that these errors contribute to millions of cases of harm annually and up to **2.6 million deaths in low- and middle-income countries.**
 In developing regions, where access to experienced healthcare professionals is limited, these issues are even more pronounced. The simple loss or misplacement of lab reports can turn a challenging situation into a life-threatening disaster, leading to critical delays and misdiagnoses.


Our project is inspired by personal experiences and the harsh realities faced by many in countries like Bangladesh. My relative, who needed regular follow-up care after surgery, lived far from her specialist in Dhaka. The cost and inconvenience of travel made it nearly impossible for her to receive the necessary care. Without a way to send her medical reports remotely, her condition deteriorated. Many patients face similar challenges, often traveling long distances or even to other countries like India for advanced treatments, only to find follow-up care too expensive or logistically impossible. **This results in neglected medication management, severe complications, and avoidable deaths.**


The issue is worsened when **lab reports are lost or misplaced**, causing delays in treatment and increasing the likelihood of diagnostic errors. These experiences inspired us to create a solution that would make healthcare more accessible, reliable, and effective.

We envisioned a platform that **securely stores medical reports, provides real-time access to those reports, and displays them using clear graphical analysis, various metrics, and raw images.** During video consultations, doctors can simultaneously view and discuss these reports with patients, ensuring comprehensive and accurate medical evaluations. This real-time access allows doctors to make informed decisions quickly and provides patients with immediate feedback, reducing the need for costly and time-consuming travel.

**By leveraging technology to bridge the gap between patients and healthcare providers, we aim to reduce diagnostic errors, improve access to quality healthcare, and transform millions of lives.** Our platform eliminates barriers of distance and cost, ensuring that quality healthcare is accessible to everyone, regardless of location or financial situation. We are committed to making this vision a reality, providing reliable healthcare solutions to those who need them most



## What It Does 

**Our platform revolutionizes healthcare management by offering a seamless and efficient approach to processing medical reports and facilitating consultations. Key features include:**

### Effortless Report Processing and Visualization

- **<u>Automatic Data Extraction</u>**: Upload a medical report image, and our technology extracts and organizes key details—test names, sample information, and dates—accurately and clearly.
- **<u>Advanced Data Organization</u>**: Data is structured into an intuitive format, ensuring easy access and clear presentation.
- **<u>Innovative Visualization</u>**: Data is transformed into interactive graphs, detailed metrics, and tables, providing a clear and actionable view of medical information.

### AI-Powered Recommendations

- **<u>Symptom-Based Recommendations</u>**: Describe symptoms during appointment booking, and our AI system suggests the most suitable medical specialty, ensuring you see the right specialist.

### Real-Time Consultation

- **<u>Video Consultations</u>**: During video calls, patients and doctors can access and discuss visualized data in real time, facilitating quick and informed decision-making.

### Secure and Continuous Tracking

- **<u>Secure Storage</u>**: Reports are securely stored and tracked, preventing loss and ensuring reliable access to historical data.

### Global Connectivity and Accessibility

- **<u>Worldwide Access</u>**: Connect with specialists globally through video consultations, bridging geographical gaps and making expert medical advice accessible to those in remote or underserved areas.




## How We Built It

**We used advanced technologies to streamline medical report processing and consultations. We used Django for our robust backend, integrating several key technologies and tools to ensure a seamless user experience**

- **Data Processing and Structuring**: *We leveraged advanced OCR (Optical Character Recognition) system with Asprise OCR API with a confidence rate of over 96.5% to extract and organize data from user-uploaded medical report images. Converted the cleaned text into a detailed JSON format with keys for descriptions, results, reference ranges, and units, facilitating easy database storage and frontend display. Applied string manipulation and data cleaning methods to ensure data accuracy and consistency.*

- **JSON Structuring and Data Cleaning**: *Applied Natural Language Processing (NLP) using the Google Gemini API to clean and structure OCR-extracted text, then converted it into a detailed JSON format with keys for descriptions, results, reference ranges, and units. This process ensured data accuracy and consistency, facilitating easy database storage and effective frontend display.*


- **Doctor Recommendation System**: *Implemented an NLP-based system using NLTK and scikit-learn to recommend doctors based on user-reported symptoms. This system employs text cleaning, TF-IDF vectorization, and logistic regression to match symptoms with appropriate doctor types, providing tailored recommendations*

- **Dynamic Graphs and Metrics & Frontend Development**: *Created interactive graphs and metrics with JavaScript to enable users to gain insights through engaging data visualizations. Designed a responsive interface using HTML, CSS, JavaScript, and Django’s templating engine to ensure a seamless experience across devices.*

- **Real-Time Video Chat**: *Integrated ZEGOCLOUD’s video call functionality using ZegoUIKitPrebuilt, enabling real-time communication for virtual consultations and seamless viewing of patient reports.*

- **Comprehensive Integration**: *Combined technologies like Asprise OCR, Google Gemini, and ZEGOCLOUD with Django and scikit-learn to build a cohesive system for processing, visualizing, and managing medical reports. This integration demonstrates a high level of technical expertise and innovation.*

 ## What We Use:
-    **[+]** Innovation : **Healthcare**
-    **[+]** Functionality : AI & Machine Learning Part || Web - Backend || Web - Forntend
-    **[+]** Backend : Django, Python, RestFramework
-    **[+]** Forntend : Django Templating Engine, Javascript, CSS3, HTML5
---
## Challenges We Ran Into

1. **OCR Technology Implementation**: We faced significant difficulties in finding and implementing a reliable OCR technology. Initial attempts to integrate various OCR solutions resulted in issues with accuracy and compatibility. After extensive evaluation, we chose the Asprise OCR API, which provided the high accuracy and precision necessary for our project

2. **Video Chat Integration**:: Integrating Zoom for video chat presented its own set of challenges. We encountered problems with Zoom’s API documentation and authentication processes. To overcome these issues, we researched alternative solutions and successfully implemented ZEGOCLOUD’s video call functionality, which met our requirements and simplified the integration process




## Accomplishments We’re Proud Of

-   We are proud of achieving an OCR accuracy rate exceeding 96%, which underscores the effectiveness of our data extraction process. Integrating real-time video functionality with seamless result viewing stands out as a significant accomplishment, enhancing user interaction and engagement. Additionally, our ability to accurately represent, analyze, and classify medical data in a clear and intuitive manner demonstrates our commitment to delivering high-quality, actionable insights. These achievements highlight our dedication to combining advanced technologies to create a solution that has the potential to save millions of lives, reflecting our ambition to make a meaningful impact in healthcare.

## What We Learned

- We expanded our knowledge in integrating various external APIs, including OCR technology and video chat functionalities. We gained valuable insights into Natural Language Processing (NLP) using tools like NLTK and Google Cloud Vision, enhancing our ability to process and analyze text data effectively. We also learned to manage complex project workflows, coordinate team efforts, and apply advanced technologies such as JavaScript for dynamic visualizations. Overall, this project deepened our understanding of API integration and team management while showcasing the impact of sophisticated technology solutions in real-world applications.

## What's Next
We envision advancing our platform with cutting-edge technologies to revolutionize medical diagnostics and data management:

-	**AI-Powered Diagnostics**: We plan to develop AI models to diagnose diseases such as breast cancer, pneumonia, dengue, and leukemia. Leveraging TensorFlow and PyTorch for model training, and integrating with tools like Google Cloud Healthcare API and Microsoft Azure Health Bot, we aim for precise and efficient diagnostics.

-	**2D to 3D X-Ray Transformation**: To enhance diagnostic accuracy, we will transform 2D X-ray images into 3D models using technologies such as NVIDIA Clara and 3D Slicer. This will provide more detailed and actionable insights from medical imaging

-	**Seamless Hospital Integration**: We will implement direct integration with hospitals via RESTful APIs and FHIR standards for real-time data exchange. This will streamline report processing, reduce paper usage, and cut costs by eliminating physical report collection.

-	**Environmental and Practical Benefits**: Reducing paper reliance will promote environmental sustainability and cost savings while improving user convenience. Our approach will centralize medical data, overcoming limitations of location and paper-based processes for a more efficient, error-free system.



## Team Members

- [Md Raiyan Rahman](https://www.linkedin.com/in/md-raiyan-rahman-6420982b9/)
- [Black 2.o(Shahidullah)](https://www.linkedin.com/in/black2o-sh/)
- [Miraj](https://github.com/Hi-Miraj)

## Try it out

Github repository [TRY](https://github.com/raiyan-rahman03/CSB_Project/) 


---

***This Project Is Driven By The Need To Address Real-World Healthcare Challenges & Make A Meaningful Impact On The Lives Of Those In Need.***

---
**© Shahidullah || Raiyan || Miraj. All rights reserved.**
---