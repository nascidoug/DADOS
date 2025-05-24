/*
A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.
*/
SELECT ROUND(MAX(LAT_N),4) AS "Median"
FROM (
 SELECT LAT_N,
 NTILE(4) OVER(ORDER BY LAT_N) AS Quartile 
 FROM Station
) X
WHERE Quartile = 2