--Query all columns for all American cities in the CITY table with populations larger than 100000.
-- The CountryCode for America is USA.

select * from city where countrycode='USA' and population>100000;

--Query the NAME field for all American cities in the CITY table with populations larger than 120000.
-- The CountryCode for America is USA.

select name from city where countrycode='USA' and population>120000;

--Query a list of CITY and STATE from the STATION table.
-- where LAT_N is the northern latitude and LONG_W is the western longitude.

select city,name from station where LAT_N>0 and LONG_W<0;

--Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
-- For example, if there are three records in the table with CITY values 'New York', 'New York', 'Bengalaru',
-- there are 2 different city names: 'New York' and 'Bengalaru'. The query returns , because

select count(city)-count(distinct(city)) from station;

--Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths
-- (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one
-- that comes first when ordered alphabetically.

select city, length(city)
from (
        select
        city,
        ROW_NUMBER() OVER ( ORDER BY LENGTH( CITY ) ASC,  CITY ) shortest_rn,
        ROW_NUMBER() OVER ( ORDER BY LENGTH( CITY ) DESC, CITY ) longest_rn
        from station
    )
where shortest_rn = 1
or longest_rn = 1;

--Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
select distinct(city)
from station
where
city like ('a%')
or
city like ('e%')
or
city like ('i%')
or
city like ('o%')
or
city like ('u%');

--Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
select distinct(city)
from station
where
city like ('%a')
or
city like ('%e')
or
city like ('%i')
or
city like ('%o')
or
city like ('%u');

