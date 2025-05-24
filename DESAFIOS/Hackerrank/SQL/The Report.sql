/*
You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
Grades contains the following columns Grade (1-10), Min_Mark and Max_Mark
*/

SELECT 
    CASE 
        WHEN g.Grade < 8 THEN NULL
        ELSE Name
    END AS Name,
    g.Grade,
    s.Marks
FROM Students s
LEFT JOIN Grades g ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY g.Grade DESC,
    CASE WHEN g.Grade >= 8 THEN s.Name ELSE NULL END ASC,
    CASE WHEN g.Grade < 8 THEN s.Marks ELSE NULL END ASC