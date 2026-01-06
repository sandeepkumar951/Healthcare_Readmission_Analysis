-- Rank patients by inpatient visits

WITH patient_risk AS (
    SELECT
        patient_nbr,
        SUM(prior_inpatient) AS total_inpatient_visits
    FROM patient_readmissions
    GROUP BY patient_nbr
)
SELECT *,
       RANK() OVER (ORDER BY total_inpatient_visits DESC) AS risk_rank
FROM patient_risk
ORDER BY risk_rank;

-- High-risk segmentation
SELECT
    patient_nbr,
    SUM(prior_inpatient) AS visits,
    CASE 
        WHEN SUM(prior_inpatient) >= 5 THEN 'High Risk'
        WHEN SUM(prior_inpatient) BETWEEN 2 AND 4 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_segment
FROM patient_readmissions
GROUP BY patient_nbr;
