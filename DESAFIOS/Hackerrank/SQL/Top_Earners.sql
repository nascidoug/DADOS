/*
We define an employee's total earnings to be their monthly  worked, 
and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
Write a query to find the maximum total earnings for all employees as well as the total number of 
employees who have maximum total earnings. Then print these values as  space-separated integers.
*/
SELECT MAX(months * salary) AS max_total_earnings,
       COUNT(*) AS employees_with_max_earnings
FROM Employee
WHERE months * salary = (SELECT MAX(months * salary) FROM Employee);
