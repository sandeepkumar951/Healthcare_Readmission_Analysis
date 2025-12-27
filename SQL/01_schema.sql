CREATE TABLE patient_readmissions (
    encounter_id INT,
    patient_id INT,
    age_group VARCHAR(20),
    gender VARCHAR(10),
    admission_type VARCHAR(30),
    discharge_category VARCHAR(30),
    time_in_hospital INT,
    num_medications INT,
    num_procedures INT,
    num_lab_procedures INT,
    prior_outpatient INT,
    prior_emergency INT,
    prior_inpatient INT,
    diagnosis_category VARCHAR(50),
    readmitted VARCHAR(10),
    target INT
);
