/*
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/

SELECT 
    SUM(A.POPULATION)
FROM CITY A 
INNER JOIN COUNTRY B ON A.COUNTRYCODE = B.CODE
WHERE B.CONTINENT = 'Asia'