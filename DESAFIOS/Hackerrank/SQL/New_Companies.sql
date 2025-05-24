/*
Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy:
FOUNDER >> LEAD MANAGER >> SENIOR MANAGER >> MANAGER >> EMPLOYEE
Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Note:

The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
*/

SELECT
    c.company_code,
    c.founder,
    COALESCE(l.qtd_lead, 0) AS lead_managers,
    COALESCE(s.qtd_senior, 0) AS senior_managers,
    COALESCE(m.qtd_manager, 0) AS managers,
    COALESCE(e.qtd_employee, 0) AS employees
FROM Company c
LEFT JOIN (
    SELECT company_code, COUNT(DISTINCT lead_manager_code) AS qtd_lead
    FROM Lead_Manager
    GROUP BY company_code
) l ON c.company_code = l.company_code
LEFT JOIN (
    SELECT company_code, COUNT(DISTINCT senior_manager_code) AS qtd_senior
    FROM Senior_Manager
    GROUP BY company_code
) s ON c.company_code = s.company_code
LEFT JOIN (
    SELECT company_code, COUNT(DISTINCT manager_code) AS qtd_manager
    FROM Manager
    GROUP BY company_code
) m ON c.company_code = m.company_code
LEFT JOIN (
    SELECT company_code, COUNT(DISTINCT employee_code) AS qtd_employee
    FROM Employee
    GROUP BY company_code
) e ON c.company_code = e.company_code
ORDER BY c.company_code
