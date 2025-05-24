/*
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result.
*/

SELECT
    h.hacker_id,
    h.name,
    SUM(s.max_score) result
FROM Hackers h
LEFT JOIN (
    SELECT 
        hacker_id,
        challenge_id,
        MAX(score) max_score
    FROM Submissions
    GROUP BY 
        hacker_id,challenge_id) s ON h.hacker_id = s.hacker_id
GROUP BY 
    h.hacker_id,
    h.name
HAVING result <> 0
ORDER BY 
    SUM(s.max_score) DESC, hacker_id
