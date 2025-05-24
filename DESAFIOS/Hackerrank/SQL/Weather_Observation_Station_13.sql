/*
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 387880 and less than 1372345. Truncate your answer to  decimal places.
*/
SELECT 
    ROUND(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345
