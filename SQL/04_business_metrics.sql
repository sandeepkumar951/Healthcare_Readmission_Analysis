/* =========================================================
   STEP 4: BUSINESS METRICS & KPIs
   Project: Healthcare Readmission Analytics
   Purpose:
   - Translate EDA findings into hospital KPIs
   ========================================================= */


/* ---------------------------------------------------------
   4.1 OVERALL READMISSION KPIs
   --------------------------------------------------------- */

-- Total patients, readmissions, and 30-day readmission rate
SELECT
    COUNT(*) AS total_encounters,
    SUM(target) AS readmitted_within_30_days,
    ROUND(100 * AVG(target)::NUMERIC, 4) AS readmission_rate_30d
FROM patient_readmissions;


/* ---------------------------------------------------------
   4.2 READMISSION RATE BY ADMISSION TYPE
   --------------------------------------------------------- */

SELECT
    admission_type,
    COUNT(*) AS total_cases,
    SUM(target) AS readmitted_cases,
    ROUND(100 * AVG(target)::NUMERIC, 4) AS readmission_rate
FROM patient_readmissions
GROUP BY admission_type
ORDER BY readmission_rate DESC;


/* ---------------------------------------------------------
   4.3 READMISSION RATE BY DISCHARGE CATEGORY
   --------------------------------------------------------- */

SELECT
    discharge_category,
    COUNT(*) AS total_cases,
    SUM(target) AS readmitted_cases,
    ROUND(100 * AVG(target)::NUMERIC, 4) AS readmission_rate
FROM patient_readmissions
GROUP BY discharge_category
ORDER BY readmission_rate DESC;


/* ---------------------------------------------------------
   5.4 READMISSION RATE BY AGE GROUP
   --------------------------------------------------------- */

SELECT
    age_group,
    COUNT(*) AS total_patients,
    SUM(target) AS readmitted_patients,
    ROUND(100 * AVG(target)::NUMERIC, 4) AS readmission_rate
FROM patient_readmissions
GROUP BY age_group
ORDER BY readmission_rate DESC;


/* ---------------------------------------------------------
   4.5 HIGH-RISK PATIENT SHARE
   --------------------------------------------------------- */

-- Patients with prior inpatient visits and long hospital stay
SELECT
    COUNT(*) AS high_risk_patients,
    ROUND(
        100.0 * COUNT(*) /
        (SELECT COUNT(*) FROM patient_readmissions),
        2
    ) AS high_risk_patient_percentage
FROM patient_readmissions
WHERE prior_inpatient > 0
  AND time_in_hospital > 7;


/* ---------------------------------------------------------
   4.6 AVERAGE LENGTH OF STAY COMPARISON
   --------------------------------------------------------- */

SELECT
    CASE
        WHEN target = 1 THEN 'Readmitted (<30 Days)'
        ELSE 'Not Readmitted'
    END AS readmission_status,
    ROUND(100 * AVG(time_in_hospital)::NUMERIC, 2) AS avg_length_of_stay
FROM patient_readmissions
GROUP BY readmission_status;


/* ---------------------------------------------------------
   4.7 MEDICATION BURDEN & READMISSION
   --------------------------------------------------------- */

SELECT
    CASE
        WHEN num_medications <= 5 THEN 'Low (0–5)'
        WHEN num_medications BETWEEN 6 AND 10 THEN 'Medium (6–10)'
        WHEN num_medications BETWEEN 11 AND 20 THEN 'High (11–20)'
        ELSE 'Very High (21+)'
    END AS medication_burden,
    COUNT(*) AS total_patients,
    SUM(target) AS readmitted_patients,
    ROUND(100 * AVG(target)::NUMERIC, 4) AS readmission_rate
FROM patient_readmissions
GROUP BY medication_burden
ORDER BY readmission_rate DESC;


/* ---------------------------------------------------------
   4.8 UTILIZATION-BASED READMISSION METRICS
   --------------------------------------------------------- */

-- Prior inpatient visits
SELECT
    prior_inpatient,
    COUNT(*) AS total_patients,
    SUM(target) AS readmitted_patients,
    ROUND(100 * AVG(target)::NUMERIC, 4) AS readmission_rate
FROM patient_readmissions
GROUP BY prior_inpatient
ORDER BY prior_inpatient DESC;

-- Prior emergency visits
SELECT
    prior_emergency,
    COUNT(*) AS total_patients,
    SUM(target) AS readmitted_patients,
    ROUND(100 * AVG(target)::NUMERIC, 4) AS readmission_rate
FROM patient_readmissions
GROUP BY prior_emergency
ORDER BY prior_emergency DESC;


/* ---------------------------------------------------------
   4.9 CLINICAL COMPLEXITY INDICATORS
   --------------------------------------------------------- */

SELECT
    CASE
        WHEN num_procedures = 0 THEN 'No Procedures'
        WHEN num_procedures BETWEEN 1 AND 2 THEN '1–2 Procedures'
        ELSE '3+ Procedures'
    END AS procedure_intensity,
    COUNT(*) AS total_patients,
    SUM(target) AS readmitted_patients,
    ROUND(100 * AVG(target)::NUMERIC, 4) AS readmission_rate
FROM patient_readmissions
GROUP BY procedure_intensity
ORDER BY readmission_rate DESC;


/* ---------------------------------------------------------
   5.10 SUMMARY KPI VIEW (EXECUTIVE READY)
   --------------------------------------------------------- */

SELECT
    ROUND(AVG(target)::NUMERIC, 4) AS overall_readmission_rate,
    ROUND(AVG(time_in_hospital)::NUMERIC, 2) AS avg_length_of_stay,
    ROUND(AVG(num_medications)::NUMERIC, 2) AS avg_medications,
    ROUND(AVG(prior_inpatient)::NUMERIC, 2) AS avg_prior_inpatient_visits
FROM patient_readmissions;

