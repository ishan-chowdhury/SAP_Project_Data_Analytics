# SAP Data Analytics Capstone Project 

This repository contains the deliverables for the SAP Data Analytics Capstone Project. The project focuses on an SAP Data Analytics scenario: **Real ABAP Development Scenario — Custom ALV Report (Order-to-Cash Analytics)** combined with a **Python Machine Learning/Analytics Pipeline**.

## Project Structure
This project has been implemented utilizing an Enterprise-Grade modular architecture and modern Hybrid analytical pipelines.

### SAP Server Backend (`/src` folder)
- `/src/Z_SALES_ANALYTICS_ALV.abap`: The main ABAP executable program.
- `/src/Z_SALES_ANALYTICS_TOP.abap`: SAP Include for Global Data Definitions.
- `/src/Z_SALES_ANALYTICS_SEL.abap`: SAP Include for Selection Screen UI variables.
- `/src/Z_SALES_ANALYTICS_F01.abap`: SAP Include representing the Business Logic and Analytics algorithms.
- `/src/Z_SALES_ANALYTICS.cds`: A Core Data Services (CDS) view that projects the data on the HANA database layer.

### Python Analytics Frontend (Root folder)
- `sap_export_data.csv`: A realistically mocked data export from the SAP backend.
- `sap_analytics_dashboard.py`: A Python script utilizing `pandas`, `seaborn`, and `matplotlib` to parse the SAP CSV and generate a graphical analytical dashboard.

## How to use this project

### 1. Python Analytics Pipeline (Local)
1. Ensure Python 3 is installed along with `pandas`, `matplotlib`, and `seaborn`.
   ```bash
   pip install pandas matplotlib seaborn
   ```
2. Run the analytics dashboard script:
   ```bash
   python sap_analytics_dashboard.py
   ```
3. A large graphical dashboard will appear displaying revenue trends, top customers, and distribution KPIs.

### 2. SAP ABAP Backend Setup (System)
1. Go to Transaction Code `SE38` (ABAP Editor).
2. Create programs matching the filenames in the `src` folder. Paste the source code respectively.
3. Save, Check, and Activate all objects.
4. Press `F8` to run the main report. Enter your date bounds and explore the analytics ALV grid!
=======
# 📊 SAP Project Data Analytics

A comprehensive data analytics project based on SAP modules, focusing on extracting insights from enterprise data related to **Financial Accounting (FI), Material Management (MM), and Sales & Distribution (SD)**.

---

## 🚀 Project Overview

This project demonstrates how SAP-generated data can be analyzed to uncover meaningful business insights. It simulates a real-world enterprise environment and applies data analytics techniques to improve decision-making across different business functions.

The project integrates concepts from:
- SAP system configuration  
- Business process workflows  
- Data analysis and visualization  

---

## 🎯 Objectives

- Analyze SAP-based business data to derive insights  
- Understand relationships between FI, MM, and SD modules  
- Perform data cleaning, transformation, and visualization  
- Build meaningful dashboards and reports  
- Support business decision-making using data  

---

## 📂 Project Structure
SAP_Project_Data_Analytics/
│── data/ # Raw and processed datasets
│── notebooks/ # Jupyter notebooks for analysis
│── scripts/ # Data processing and analysis scripts
│── visuals/ # Graphs and visualizations
│── report/ # Project report (PDF)
│── README.md # Project documentation


---

## 🧠 Key Features

- Data preprocessing and cleaning  
- Exploratory Data Analysis (EDA)  
- Visualization of business trends  
- Integration of multiple SAP modules  
- KPI analysis (sales, revenue, inventory, etc.)  

---

## 🛠️ Tech Stack

- Python  
- Pandas  
- NumPy  
- Matplotlib / Seaborn  
- Jupyter Notebook  

---

## 📊 Analysis Performed

### Financial Accounting (FI)
- Revenue analysis  
- Expense tracking  
- Profitability insights  

### Material Management (MM)
- Inventory analysis  
- Procurement trends  
- Vendor performance  

### Sales & Distribution (SD)
- Sales trends  
- Customer segmentation  
- Order-to-cash insights  

---

## 📌 Sample Insights

- Identification of high-revenue products  
- Inventory bottleneck detection  
- Customer purchase patterns  
- Sales performance across regions  

---

## 📄 Report

The detailed SAP implementation and analytics report is included in the repository:
- SAP Project Report – Organizational Setup and System Configuration  

---

## ⚙️ How to Run

1. Clone the repository: git clone https://github.com/ishan-chowdhury/SAP_Project_Data_Analytics.git
2. Navigate to the project folder: cd SAP_Project_Data_Analytics
3. Install dependencies: pip install -r requirements.txt
4. Run Jupyter Notebook: jupyter notebook

---

## 👤 Author

Ishan Chowdhury  
Roll No: 2305132  

---

## 📌 Future Enhancements

- Integration with real SAP datasets  
- Dashboard using Power BI / Streamlit  
- Machine Learning for prediction  
- Advanced KPI automation  

---

## ⭐ Contributing

Contributions are welcome! Feel free to fork the repo and submit a pull request.

---

## 📜 License

This project is for academic and educational purposes.
>>>>>>> 45c9f50cd3e8e004197a1d2a36d709bfe244e031
