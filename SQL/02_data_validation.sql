-- Check missing values
SELECT
    COUNT(*) FILTER (WHERE age_group IS NULL) AS missing_age,
    COUNT(*) FILTER (WHERE target IS NULL) AS missing_target
FROM patient_readmissions;

-- Validate target values
SELECT target, COUNT(*) 
FROM patient_readmissions
GROUP BY target;

-- Check invalid hospital stay
SELECT COUNT(*) AS invalid_los
FROM patient_readmissions
WHERE time_in_hospital <= 0;
