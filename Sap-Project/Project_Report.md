# Capstone Project Submission

**Project Title:** Order-to-Cash Data Analytics: Hybrid SAP App & Python Machine Learning Pipeline

## Mandatory Details
* **Name:** Ishan Chowdhury
* **Roll Number:** 2305132
* **Batch/Program:** SAP Data Analytics

---

## 1. Problem Statement
In modern business environments, sales managers struggle to gain consolidated, real-time insights from standard SAP ERP systems. Furthermore, standard SAP reporting lacks predictive Machine Learning capabilities, making it impossible to automatically segment customers or forecast behaviors without relying on heavy third-party software. Data scientists often need a seamless pipeline that pulls precise data from SAP S/4HANA (using CDS views and ABAP) into modern algorithmic Python environments for real Machine Learning analytics.

## 2. Solution/Features
This project pioneers a **Hybrid SAP & M.L. Data Analytics Pipeline**. 

**Key Features:**
- **Modular SAP Logic Extraction:** Automatically pulls Sales Document Header (VBAK) and Item (VBAP) data using optimized ABAP Includes and Core Data Services (CDS Views), conforming to modern S/4HANA 'Code-to-Data' architecture.
- **Python Data Analytics Frontend:** Integrates a Python script leveraging `pandas` to aggregate and manipulate the SAP CSV data.
- **Machine Learning (Predictive Analytics):** Implements `scikit-learn` K-Means Clustering (Artificial Intelligence) to automatically segment and classify customers into value tiers (Platinum, Gold, Silver) based on their historical buying behavior, quantities, and net revenues.
- **Visual Analytics Output:** Automatically renders a 5-quadrant dashboard using `seaborn` plotting tools to visualize timelines, distributions, product mappings, and ML cluster boundaries.

## 3. Step-by-Step SAP Implementation Process
Following project guidelines, below is the implementation path:
1. **Define Architecture:** Identified `VBAK` and `VBAP` tables for Order-to-Cash extraction logic.
2. **Develop CDS View (`Z_SALES_ANALYTICS.cds`):** Created a Data Definition Language (DDL) entity directly on the HANA DB layer to aggregate Sales Net values using `@DefaultAggregation: #SUM`.
3. **Modular ABAP Development (`SE38`):** Split the legacy unified report into `_TOP` (Declarations), `_SEL` (UI parameters), and `_F01` (Logic). 
4. **Build Interactive ALV Grid:** Developed dynamic traffic light logic and HOTSPOT navigation enabling users to double-click an SAP Grid row and be routed directly to transaction `VA03`.
5. **Python Linkage:** Executed the SAP program in background mode to spool `sap_export_data.csv`. 
6. **M.L. Pipeline Execution:** Ran the `sap_analytics_dashboard.py` pipeline, transforming the static CSV into an actionable AI graphical cluster matrix.

## 4. Screenshots
*(Note: Evaluators can run `sap_analytics_dashboard.py` to see the Live ML Dashboard!)*

### Screenshot 1: SAP Backend (Interactive ALV & Hotspots)
*(Insert screenshot of the standard SAP grid displaying the extracted data)*
- **Description:** The robust ABAP Backend module presenting the raw data with interactive elements.

### Screenshot 2: Python AI Dashboard
*(Insert screenshot of `sap_ml_dashboard_output.png`)*
- **Description:** The resulting 5-quadrant visual analytics dashboard showing trendlines and the K-Means Customer Segmentation ML Map.

## 5. Tech Stack
- **Backend Technology:** SAP System (ERP)
- **Backend Languages:** ABAP, SAP Core Data Services (CDS)
- **Frontend Algorithms:** Python 3
- **Machine Learning:** `scikit-learn` (Unsupervised K-Means Clustering AI)
- **Data Engineering & Viz:** `pandas`, `matplotlib`, `seaborn`

## 6. Unique Points
- **Unsupervised Machine Learning Integration:** Incorporating real statistical AI sets this project an echelon above standard reporting. It algorithmically generates intelligence rather than just printing raw records.
- **Enterprise Standards:** The `INCLUDE` programming logic and the usage of CDS Views demonstrate mastery over SAP's strict development guidelines.

## 7. Future Improvements
- **Direct Live Connection:** Removing the CSV middleware by using the `pyrfc` library to establish a live RFC trace into SAP OData services.
- **Forecasting:** Expanding the AI to utilize `SARIMAX` time-series forecasting, explicitly predicting exactly how much inventory to order for the next quarter.
