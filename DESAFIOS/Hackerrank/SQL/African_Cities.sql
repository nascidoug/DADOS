/*
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/

SELECT
    A.NAME
FROM CITY A
INNER JOIN COUNTRY B ON A.COUNTRYCODE = B.CODE
WHERE B.CONTINENT = 'Africa'