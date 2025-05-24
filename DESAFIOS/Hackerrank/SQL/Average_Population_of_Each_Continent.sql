/*
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
SELECT
    B.CONTINENT,
    FLOOR(AVG(A.POPULATION))
FROM CITY A
INNER JOIN COUNTRY B ON A.COUNTRYCODE = B.CODE
GROUP BY B.CONTINENT
