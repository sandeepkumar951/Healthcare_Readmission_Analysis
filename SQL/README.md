# 🏥 Healthcare Readmission Analytics (SQL Project)

## 📌 Project Overview

Hospital readmissions within 30 days are a major driver of healthcare costs and a key indicator of care quality.  
This project analyzes **30-day hospital readmissions** using a **SQL-first analytics approach**, with data prepared in Python and all insights, KPIs, and risk segmentation derived using SQL.

The project focuses on:
- Identifying **key drivers of readmission**
- Quantifying **business-relevant healthcare KPIs**
- Segmenting patients into **risk tiers** for targeted intervention

---

## 🎯 Business Objective

- Reduce avoidable 30-day hospital readmissions  
- Identify high-risk patient groups early  
- Support data-driven discharge planning and care management  

**Primary Question:**  
> *Which patient characteristics and utilization patterns are most strongly associated with early readmissions?*

---

## 🧱 Tech Stack

- **SQL** – Core analytics, KPIs, and risk analysis  
- **Python** – Data preparation and feature engineering (pre-SQL)  
- **Database** – PostgreSQL / MySQL compatible SQL  
- **Techniques** – Aggregations, CASE logic, window functions, percentiles  

---
```
🗂️ Project Structure
healthcare-readmission-sql/
│
├── README.md
│
├── sql/
│   ├── 01_schema.sql              -- Table design
│   ├── 02_data_validation.sql     -- Data quality checks
│   ├── 03_data_cleaning.sql       -- SQL-based cleaning
│   ├── 04_eda.sql                 -- Exploratory Data Analysis
│   ├── 05_business_metrics.sql    -- Healthcare KPIs
│   ├── 06_advanced_analysis.sql   -- Risk scoring & segmentation
│
├── insights/
│   ├── key_findings.md
│   └── recommendations.md
```

🔄 End-to-End Workflow
1️⃣ Data Preparation (Python)

Loaded raw healthcare readmission dataset

Standardized columns

Created binary target variable:

target = 1 → Readmitted within 30 days

target = 0 → Otherwise

Exported clean dataset for SQL ingestion

Python is used only for preparation — all analysis is done in SQL.

2️⃣ Schema Design (01_schema.sql)

Designed an analytics-ready table

Optimized for aggregation, segmentation, and KPI analysis

3️⃣ Data Validation (02_data_validation.sql)

Missing value checks

Target distribution verification

Sanity checks for numeric ranges

4️⃣ Exploratory Data Analysis (03_eda.sql)

Key analyses include:

Overall readmission rate

Age group vs readmission

Admission type & discharge category impact

Length of stay and medication burden

Prior inpatient & emergency utilization

5️⃣ Business Metrics & KPIs (04_business_metrics.sql)

Healthcare-focused KPIs:

30-day readmission rate

High-risk patient percentage

Average length of stay (readmitted vs non-readmitted)

Utilization-driven risk metrics

These metrics translate raw analysis into decision-ready insights.

6️⃣ Advanced Risk Analysis (05_advanced_analysis.sql)

Composite risk scoring using:

Length of stay

Medication count

Prior inpatient & emergency visits

Patient ranking using window functions

Risk quartile segmentation

Identification of top 10% highest-risk patients

🔍 Key Insights

Summarized from SQL analysis:

Older patients show higher readmission risk

Longer hospital stays strongly correlate with readmission

Prior inpatient and emergency visits are powerful predictors

High medication burden reflects elevated clinical complexity

A small high-risk segment drives a large share of readmissions

(See insights/key_findings.md for details)

💡 Recommendations

Flag high-risk patients at discharge

Prioritize elderly and long-stay patients for follow-up

Enroll high-utilization patients in care management programs

Implement medication reconciliation for complex cases

Focus interventions on the highest-risk quartile

(See insights/recommendations.md for details)
