# 🏥 Healthcare Readmission Risk Analysis  
**End-to-End Analytics Project (Excel • Python • SQL • Power BI)**

---

## 📌 Project Overview
Hospital readmissions—especially within 30 days—are costly and often indicate gaps in discharge planning, care coordination, or post-hospital follow-up.

This project delivers an **end-to-end healthcare analytics solution** to:
- Analyze **30-day and >30-day readmissions**
- Identify **high-risk patient segments**
- Understand **clinical, demographic, and utilization drivers**
- Translate analysis into **actionable hospital recommendations**

The workflow mirrors a real-world analytics pipeline using **Excel for staging**, **Python for EDA**, **SQL for business metrics**, and **Power BI/Excel for dashboards**.

---

## 🎯 Business Objective
- Reduce **30-day hospital readmissions**
- Improve **discharge planning and follow-up care**
- Support **data-driven decisions** for hospital administrators and clinicians
- Highlight patient groups requiring **proactive intervention**

---

## 📂 Dataset Description
- **Source:** Public hospital readmission dataset (Diabetes encounters)
- **Level:** Patient encounter level
- **Size:** ~100,000 hospital encounters
- **Key Attributes:**
  - Demographics (age, gender, race)
  - Admission & discharge information
  - Length of stay
  - Diagnoses & procedures
  - Medication counts
  - Prior outpatient, emergency, and inpatient visits
  - Readmission outcome (`<30`, `>30`, `NO`)

---

## 🧱 Project Structure
```
healthcare-readmission-analysis/
│
├── README.md
│
├── data/
│   ├── raw           
│
├── notebooks/
│   ├── Readmission_Risk_Assessment.ipynb
│
├── sql/
│   ├── 01_schema.sql
│   ├── 02_data_validation.sql
│   ├── 03_eda.sql
│   ├── 04_business_metrics.sql
│   └── 05_advanced_analysis.sql
│
├── dashboards/
│   ├── powerbi
│   ├── Excel
│
├── insights/
│   ├── key_findings.md
│   └── recommendations.md
```

## 🔄 End-to-End Workflow

### 1️⃣ Problem Understanding

Focused on 30-day readmissions as a key healthcare quality metric

Readmission Definition:

Treated readmission as:

- Multi-class outcome: <30, >30, NO

- Binary outcome (for risk analysis):

- 1 → Readmitted within 30 days

- 0 → Not readmitted within 30 days

Stakeholders Identified:

- Hospital management

- Care coordinators

- Clinicians

---

2️⃣ Excel-Based Data Cleaning & Feature Engineering

Initial preprocessing and feature creation were performed in Excel.

Features Created:

Admission Category

Emergency

Urgent

Elective

Other

Discharge Category

Home

Transferred to Facility

Left Against Medical Advice

Expired / Other

Why Excel?

Improves business interpretability

Enables early validation of category logic

The Excel-processed dataset was then exported for Python and SQL analysis.

---

3️⃣ Python-Based Exploratory Data Analysis (EDA)

Python served as the core analytical layer.

Tools Used

pandas, numpy, matplotlib, seaborn, scipy

Target Variable Creation
df['target'] = (df['readmitted'] == '<30').astype(int)


1 → Readmitted within 30 days

0 → Not readmitted within 30 days

EDA Performed

Univariate Analysis

Age distribution

Length of stay

Medication and procedure counts

Admission and discharge categories

Bivariate Analysis

Age × Readmission

Admission category × Readmission

Discharge category × Readmission

Length of stay × Readmission

Multivariate Analysis

Age × Diagnosis × Readmission

Admission type × Length of stay × Readmission

Prior utilization × Discharge outcome



4️⃣ Feature Engineering in Python

Additional analytical features were engineered:

Age group buckets

Length-of-stay categories

Prior utilization indicators

Diagnosis category consolidation

Purpose: Improve interpretability and prepare data for SQL metrics and dashboards.

---

5️⃣ SQL-Based Business Metrics & Analysis

## 🔍 Analysis Workflow

### 1️⃣ Data Validation
- Checked missing values
- Validated target distribution
- Identified invalid hospital stay durations

### 2️⃣ Exploratory Data Analysis (EDA)
- Readmission distribution
- Age group & gender analysis
- Admission type & discharge category impact
- Length of stay & medication burden
- Prior inpatient and emergency utilization

### 3️⃣ Business Metrics & KPIs
- Overall 30-day readmission rate
- Readmission rate by admission type and discharge category
- High-risk patient share
- Average length of stay comparison
- Medication burden impact

### 4️⃣ Advanced SQL Analysis
- Patient risk ranking using window functions
- High / Medium / Low risk segmentation based on prior utilization


---

6️⃣ Dashboards (Power BI / Excel)

Interactive dashboards were built to visualize:

Overall readmission rate

Readmission by age, diagnosis, and admission type

Length of stay impact

High-risk patient segments

Dashboards are designed for non-technical stakeholders.

--- 

📈 Key Insights

Readmission risk increases significantly for patients aged 50–80

Emergency admissions show the highest 30-day readmission rates

Longer hospital stays correlate with higher clinical complexity

Prior inpatient visits strongly predict early readmission
--- 

💡 Business Recommendations

Implement risk-based discharge planning for elderly patients

Prioritize follow-ups for patients with prior inpatient visits

Improve medication reconciliation for high-complexity cases

Use readmission risk indicators to guide care coordination
---

⚠️ Limitations & Assumptions

Observational data (no causal inference)

Simplified diagnosis grouping

Unobserved clinical severity factors

Results depend on historical patterns
---

🚀 Future Enhancements

Predictive modeling (Logistic Regression, Tree-based models)

Model explainability (SHAP)

Cost impact analysis

Integration with real-time EHR data
