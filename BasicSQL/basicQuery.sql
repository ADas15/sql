--Query all columns for all American cities in the CITY table with populations larger than 100000.
-- The CountryCode for America is USA.

select * from city where countrycode='USA' and population>100000;

--Query the NAME field for all American cities in the CITY table with populations larger than 120000.
-- The CountryCode for America is USA.

select name from city where countrycode='USA' and population>120000;

--Query a list of CITY and STATE from the STATION table.
-- where LAT_N is the northern latitude and LONG_W is the western longitude.

select city,name from station where LAT_N>0 and LONG_W<0;