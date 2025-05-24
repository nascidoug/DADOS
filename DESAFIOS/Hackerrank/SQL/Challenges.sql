/*
Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.
*/
SELECT 
    cc.hacker_id,
    cc.name,
    cc.total
FROM (
    SELECT 
        h.hacker_id,
        h.name,
        COUNT(c.challenge_id) AS total
    FROM Hackers h
    LEFT JOIN Challenges c ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
) AS cc
JOIN (
    SELECT 
        MAX(challenge_count) AS max_total
    FROM (
        SELECT 
            hacker_id,
            COUNT(challenge_id) AS challenge_count
        FROM Challenges
        GROUP BY hacker_id
    ) AS sub
) AS m ON 1=1
WHERE 
    cc.total = m.max_total
    OR cc.total IN (
        SELECT total
        FROM (
            SELECT 
                hacker_id,
                COUNT(challenge_id) AS total
            FROM Challenges
            GROUP BY hacker_id
        ) AS t
        GROUP BY total
        HAVING COUNT(*) = 1
    )
ORDER BY cc.total DESC, cc.hacker_id;
