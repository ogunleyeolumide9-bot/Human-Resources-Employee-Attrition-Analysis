SELECT *
FROM malhub_data.default.hr_employee_attrition

-- Total Employees
SELECT COUNT(*) AS Total_Employees
FROM malhub_data.default.hr_employee_attrition

-- Total Employees Who Left
SELECT COUNT(*) AS Employees_Left
FROM malhub_data.default.hr_employee_attrition
WHERE Attrition = 'Yes';

-- Attrition Rate
SELECT
ROUND(
(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) /
COUNT(*),2) AS Attrition_Rate
FROM malhub_data.default.hr_employee_attrition

-- Average Age
SELECT
ROUND(AVG(Age),2) AS Average_Age
FROM malhub_data.default.hr_employee_attrition

-- Average Monthly Income
SELECT
ROUND(AVG(MonthlyIncome),2) AS Average_Monthly_Income
FROM malhub_data.default.hr_employee_attrition

-- Average Years at Company
SELECT
ROUND(AVG(YearsAtCompany),2) AS Average_Years_At_Company
FROM malhub_data.default.hr_employee_attrition

-------------------------------------------------
-- Attrition by Department

SELECT
Department,
COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/
COUNT(*),2) AS Attrition_Rate
FROM malhub_data.default.hr_employee_attrition
GROUP BY Department
ORDER BY Attrition_Rate DESC;

-------------------------------------------------
-- Attrition by Job Role

SELECT
JobRole,
COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM malhub_data.default.hr_employee_attrition
GROUP BY JobRole
ORDER BY Employees_Left DESC;

-------------------------------------------------
-- Attrition by Gender

SELECT
Gender,
COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM malhub_data.default.hr_employee_attrition
GROUP BY Gender;

-------------------------------------------------
-- Attrition by Marital Status

SELECT
MaritalStatus,
COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM malhub_data.default.hr_employee_attrition
GROUP BY MaritalStatus;

-------------------------------------------------
-- Overtime Analysis

SELECT
OverTime,
COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/
COUNT(*),2) AS Attrition_Rate
FROM malhub_data.default.hr_employee_attrition
GROUP BY OverTime;

-------------------------------------------------
-- Job Satisfaction

SELECT
JobSatisfaction,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM malhub_data.default.hr_employee_attrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-------------------------------------------------
-- Education Field

SELECT
EducationField,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM malhub_data.default.hr_employee_attrition
GROUP BY EducationField
ORDER BY Employees DESC;

-------------------------------------------------
-- Salary by Department

SELECT
Department,
ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM malhub_data.default.hr_employee_attrition
GROUP BY Department
ORDER BY Average_Salary DESC;

-------------------------------------------------
-- Top Highest Paid Job Roles

SELECT
JobRole,
ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM malhub_data.default.hr_employee_attrition
GROUP BY JobRole
ORDER BY Average_Salary DESC;

-------------------------------------------------
-- Attrition by Age Group

SELECT
CASE
WHEN Age < 25 THEN 'Under 25'
WHEN Age BETWEEN 25 AND 34 THEN '25-34'
WHEN Age BETWEEN 35 AND 44 THEN '35-44'
WHEN Age BETWEEN 45 AND 54 THEN '45-54'
ELSE '55+'
END AS Age_Group,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM malhub_data.default.hr_employee_attrition
GROUP BY
CASE
WHEN Age < 25 THEN 'Under 25'
WHEN Age BETWEEN 25 AND 34 THEN '25-34'
WHEN Age BETWEEN 35 AND 44 THEN '35-44'
WHEN Age BETWEEN 45 AND 54 THEN '45-54'
ELSE '55+'
END
ORDER BY Age_Group;

-------------------------------------------------
-- Years at Company

SELECT
YearsAtCompany,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM malhub_data.default.hr_employee_attrition
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

-------------------------------------------------
-- Employees with High Monthly Income

SELECT
EmployeeNumber,
Age,
Gender,
Department,
JobRole,
MonthlyIncome
FROM malhub_data.default.hr_employee_attrition
ORDER BY MonthlyIncome DESC;
