Create Database Healthcare_Management;
Use Healthcare_Management;

# Creating Patients Table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(10),
    contact_number VARCHAR(15),
    address VARCHAR(255)
);

# Creating Treatments Table
CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY,
    patient_id INT,
    treatment_date DATE,
    treatment_description VARCHAR(255),
    doctor_name VARCHAR(100),
    cost DECIMAL(10, 2),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

# Creating Diagnoses Table
CREATE TABLE diagnoses (
    diagnosis_id INT PRIMARY KEY,
    patient_id INT,
    diagnosis_date DATE,
    diagnosis_description VARCHAR(255),
    doctor_name VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

# Sample Data for Patients
INSERT INTO patients VALUES
    (1, 'Alice', 'Johnson', '1980-03-20', 'Female', '555-123-4567', '789 Oak St'),
    (2, 'Bob', 'Williams', '1995-11-10', 'Male', '555-987-6543', '456 Pine St'),
    (3, 'Charlie', 'Miller', '1972-07-05', 'Male', '555-234-5678', '123 Elm St'),
    (4, 'Diana', 'Smith', '1988-01-15', 'Female', '555-876-5432', '987 Maple Ave'),
    (5, 'Edward', 'Brown', '1990-09-28', 'Male', '555-345-6789', '654 Cedar Dr'),
    (6, 'Fiona', 'Davis', '1985-04-12', 'Female', '555-654-3210', '321 Birch Ln'),
    (7, 'George', 'Jones', '1978-12-03', 'Male', '555-789-0123', '876 Pine Ln'),
    (8, 'Helen', 'Anderson', '1992-06-18', 'Female', '555-210-9876', '543 Oak Dr'),
    (9, 'Ian', 'Taylor', '1982-02-25', 'Male', '555-432-1098', '210 Cedar Ave'),
    (10, 'Jasmine', 'Clark', '1998-08-08', 'Female', '555-901-2345', '789 Birch Dr');

# Sample Data for Treatments
INSERT INTO treatments VALUES
    (1, 1, '2024-02-07', 'X-ray Examination', 'Dr. Johnson', 200.00),
    (2, 2, '2024-03-08', 'Physical Therapy', 'Dr. Anderson', 120.00),
    (3, 1, '2024-02-05', 'X-ray Examination', 'Dr. Johnson', 200.00),
    (4, 2, '2024-04-08', 'Physical Therapy', 'Dr. Anderson', 120.00),
    (5, 1, '2024-02-12', 'Blood Test', 'Dr. Williams', 80.00),
    (6, 2, '2024-03-15', 'MRI Scan', 'Dr. Davis', 300.00),
    (7, 1, '2024-03-20', 'Dental Cleaning', 'Dr. Smith', 90.00),
    (8, 2, '2024-02-25', 'Eye Examination', 'Dr. Brown', 150.00),
    (9, 1, '2024-03-02', 'Counseling Session', 'Dr. Miller', 180.00),
    (10, 2, '2024-03-05', 'Allergy Testing', 'Dr. White', 250.00);

# Sample Data for Diagnoses
INSERT INTO diagnoses VALUES
    (1, 1, '2024-01-08', 'Sprained Ankle', 'Dr. Smith'),
    (2, 2, '2024-01-15', 'Common Cold', 'Dr. Davis'),
    (3, 1, '2024-02-02', 'High Blood Pressure', 'Dr. Johnson'),
    (4, 2, '2024-02-10', 'Allergic Rhinitis', 'Dr. Anderson'),
    (5, 1, '2024-03-05', 'Migraine', 'Dr. Miller'),
    (6, 2, '2024-03-12', 'Gastroenteritis', 'Dr. Robinson'),
    (7, 1, '2024-04-20', 'Insomnia', 'Dr. White'),
    (8, 2, '2024-05-08', 'Sinusitis', 'Dr. Harris'),
    (9, 1, '2024-06-15', 'Type 2 Diabetes', 'Dr. Taylor'),
    (10, 2, '2024-07-02', 'Hypothyroidism', 'Dr. Martinez');

# Query to Retrieve Patient Information with Treatment and Diagnosis Details
SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    p.date_of_birth,
    p.gender,
    p.contact_number,
    p.address,
    t.treatment_date,
    t.treatment_description,
    t.doctor_name AS treatment_doctor,
    t.cost AS treatment_cost,
    d.diagnosis_date,
    d.diagnosis_description,
    d.doctor_name AS diagnosis_doctor
FROM
    patients p
LEFT JOIN
    treatments t ON p.patient_id = t.patient_id
LEFT JOIN
    diagnoses d ON p.patient_id = d.patient_id;
