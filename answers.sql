-- question 1.1: Find the total number of patient admissions
SELECT COUNT(*) AS total_admissions
FROM admissions;

-- question 1.2: Calculate the average length of stay for all patients
SELECT AVG(DATEDIFF(discharge_date, admission_date)) AS average_length_of_stay
FROM admissions;

-- question 2.1: Group admissions by primary_diagnosis and calculate total admissions
SELECT primary_diagnosis, COUNT(*) AS total_admissions
FROM admissions
GROUP BY primary_diagnosis;

-- question 2.2: Group admissions by service and calculate the average length of stay
SELECT service, AVG(DATEDIFF(discharge_date, admission_date)) AS average_length_of_stay
FROM admissions
GROUP BY service;

-- question 2.3: Group discharges by discharge_disposition and count discharges
SELECT discharge_disposition, COUNT(*) AS total_discharges
FROM discharges
GROUP BY discharge_disposition;

-- question 3.1: Show services where the total number of admissions is greater than 5
SELECT service, COUNT(*) AS total_admissions
FROM admissions
GROUP BY service
HAVING total_admissions > 5;

-- question 3.2: Find the average length of stay for "Stroke" primary diagnosis
SELECT AVG(DATEDIFF(discharge_date, admission_date)) AS average_length_of_stay
FROM admissions
WHERE primary_diagnosis = 'Stroke';

-- question 4.1: Group emergency department visits by acuity and calculate total visits
SELECT acuity, COUNT(*) AS total_visits
FROM ed_visits
GROUP BY acuity;

-- question 4.2: Group admissions by primary_diagnosis and service, showing total admissions
SELECT primary_diagnosis, service, COUNT(*) AS total_admissions
FROM admissions
GROUP BY primary_diagnosis, service;

-- question 5.1: Group admissions by month and calculate total admissions
SELECT MONTH(admission_date) AS admission_month, COUNT(*) AS total_admissions
FROM admissions
GROUP BY admission_month
ORDER BY admission_month;

-- question 5.2: Find the maximum length of stay for each primary_diagnosis
SELECT primary_diagnosis, MAX(DATEDIFF(discharge_date, admission_date)) AS max_length_of_stay
FROM admissions
GROUP BY primary_diagnosis;

-- Calculate total and average length of stay for each service, ordered by highest average length of stay
SELECT service,
       SUM(DATEDIFF(discharge_date, admission_date)) AS total_length_of_stay,
       AVG(DATEDIFF(discharge_date, admission_date)) AS average_length_of_stay
FROM admissions
GROUP BY service
ORDER BY average_length_of_stay DESC;
