/*
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane where  are the respective minimum and maximum values of Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION. 

Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.
*/
SELECT 
    ROUND(
        SQRT(
            POWER(MAX(LAT_N) - MIN(LAT_N), 2) +
            POWER(MAX(LONG_W) - MIN(LONG_W), 2)
        ), 
        4
    ) AS euclidean_distance
FROM 
    STATION;
