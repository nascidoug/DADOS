/*
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result.
*/

SELECT
    a.hacker_id,
    a.name,
    SUM(b.max_score) AS total_score
FROM Hackers a
LEFT JOIN (SELECT 
            hacker_id,
            challenge_id,
            MAX(score) max_score
           FROM Submissions
           GROUP BY hacker_id, challenge_id
          ) b ON a.hacker_id = b.hacker_id
GROUP BY a.hacker_id, a.name
HAVING total_score > 0
ORDER BY total_score DESC, a.hacker_id

