DROP DATABASE medical_db;
CREATE DATABASE medical_db;
\c medical_db;

CREATE TABLE medical_center(
    id SERIAL PRIMARY KEY,
    hosp_name TEXT,
    address TEXT,
    phone_number TEXT,
    hours TEXT
);

CREATE TABLE doctor(
    id SERIAL PRIMARY KEY,
    dr_id_number TEXT,
    first_name TEXT,
    last_name TEXT,
    phone_number TEXT,
    specialty TEXT
);

CREATE TABLE patient(
    id SERIAL PRIMARY KEY,
    patient_id_number TEXT,
    first_name TEXT,
    last_name TEXT,
    phone_number TEXT,
    address TEXT,
    patient_symptoms TEXT
);

CREATE TABLE disease(
    id SERIAL PRIMARY KEY,
    name TEXT,
    typical_symptoms TEXT
);

CREATE TABLE treatment(
    id SERIAL PRIMARY KEY,
    name TEXT,
    quantity TEXT
);

CREATE TABLE chart(
    id SERIAL PRIMARY KEY,
    medical_center_id INTEGER REFERENCES medical_center NOT NULL,
    patient_id INTEGER REFERENCES patient NOT NULL,
    doctor_id INTEGER REFERENCES doctor NOT NULL,
    disease_id INTEGER REFERENCES disease,
    treatment_id INTEGER REFERENCES treatment
);

INSERT INTO medical_center (hosp_name,address,phone_number,hours)
VALUES
    ('Lakeland Regional Hospital', 'Lakeland', '7490384535', '24-hours'),
    ('Bartow Hospital','Bartow', '8634560275', '9am-5pm'),
    ('Winter Haven Hospital', 'Winter Haven', '8132538501', '5am-9pm');

INSERT INTO doctor (dr_id_number,first_name,last_name,phone_number,specialty)
VALUES
    ('8375','Ryan','Villareal', '8456392746', 'General Care'),
    ('2564','Nancy', 'Holland', '8390575432', 'Orthopedic');

INSERT INTO patient (patient_id_number,first_name,last_name,address,phone_number,patient_symptoms)
VALUES 
    ('1', 'Mike', 'Robinson', '237 Kinsley Ave', '2564148373','fever, rash, runny nose'),
    ('3','Dave', 'Mullard', '159 Hickory BLVD', '5674538765', 'bumps, rash'),
    ('125', 'Carol','Baskin', '367 Oak Bridge RD', '8547357893', 'fever, bumps, rash, runny nose, tired');

INSERT INTO disease (name, typical_symptoms)
VALUES
    ('cold', 'Fever'),
    ('Chicken Pox', 'bumps');

INSERT INTO treatment (name, quantity)
VALUES 
    ('DayQuil','30ml'),
    ('Cream', '5ml');

INSERT INTO chart (medical_center_id,patient_id,doctor_id,disease_id,treatment_id)
VALUES 
    ('1','1','1','1','1'),
    ('3','2','2','2','2'),
    ('3','2','2','1','1'),
    ('1','3','2','1','2'),
    ('2','3','1','2','2'),
    ('1','1','1','2','2');

    SELECT * FROM chart JOIN medical_center ON chart.medical_center_id = medical_center.id JOIN patient ON chart.patient_id = patient.id JOIN doctor ON chart.doctor_id = doctor.id;
    