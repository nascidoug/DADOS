/*
A university has started a student-advisor plan which assigns a professor as an advisor to each student for academic guidance. Write a query to find the roll number and names of students who either have a male advisor with a salary of more than 15000 or a female advisor with a salary of more than 20000.
*/
SELECT  
    A.ROLL_NUMBER,
    A.NAME
FROM student_information A
INNER JOIN faculty_information B ON A.ADVISOR = B.employee_id
WHERE 
    (B.GENDER = 'M' AND B.SALARY > 15000)
    OR
    (B.GENDER = 'F' AND B.SALARY > 20000);
