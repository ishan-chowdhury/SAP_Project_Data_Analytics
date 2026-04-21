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
