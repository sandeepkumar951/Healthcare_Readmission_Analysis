-- Rank patients by inpatient visits

WITH patient_risk AS (
    SELECT
        patient_nbr,
        SUM(number_inpatient) AS total_inpatient_visits
    FROM admissions
    GROUP BY patient_nbr
)
SELECT *,
       RANK() OVER (ORDER BY total_inpatient_visits DESC) AS risk_rank
FROM patient_risk
ORDER BY risk_rank;

-- High-risk segmentation
SELECT
    patient_nbr,
    SUM(number_inpatient) AS visits,
    CASE 
        WHEN SUM(number_inpatient) >= 5 THEN 'High Risk'
        WHEN SUM(number_inpatient) BETWEEN 2 AND 4 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_segment
FROM admissions
GROUP BY patient_nbr;
