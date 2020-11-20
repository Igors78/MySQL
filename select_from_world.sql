1.
Read the notes about this table. Observe the result of running this
SQL command to show the name, continent and population of all countries.

SELECT name, continent, population FROM world

name	continent	population
Afghanistan	Asia	32225560
Albania	Europe	2845955
Algeria	Africa	43000000
Andorra	Europe	77543
Angola	Africa	31127674
Antigua and Barbuda	Caribbean	96453
Argentina	South America	44938712
Armenia	Eurasia	2957500

Results truncated.

2.
How to use WHERE to filter records. Show the name for the countries that have a 
population of at least 200 million. 200 million is 200000000, there are eight zeros.

SELECT name FROM world
WHERE population > 200000000;

name
Brazil
China
India
Indonesia
Nigeria
Pakistan
United States

3.
Give the name and the per capita GDP for those countries with a population of at
least 200 million.

SELECT name, gdp/population
FROM world
WHERE population > 200000000;

4.
Show the name and population in millions for the countries of the
continent 'South America'. Divide the population by 1000000 to get population in millions.

SELECT name, population/1000000
FROM world
WHERE continent = 'South America';

5.
Show the name and population for France, Germany, Italy

SELECT name, population
FROM world
WHERE name IN ('France','Germany','Italy');

6.
Show the countries which have a name that includes the word 'United'

SELECT name
FROM world
WHERE name LIKE '%United%';

7.
Two ways to be big: A country is big if it has an area of more than 3 million sq km
or it has a population of more than 250 million.

Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population, area
FROM world
WHERE area > 3000000
OR population > 250000000

8.
Exclusive OR (XOR). Show the countries that are big by area (more than 3 million)
or big by population (more than 250 million) but not both. Show name, population and area.

Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
United Kingdom has a small population and a small area, it should be excluded.

SELECT name, population, area
FROM world
WHERE area > 3000000
XOR population > 250000000

9.
Show the name and population in millions and the GDP in billions
for the countries of the continent 'South America'. Use the ROUND
function to show the values to two decimal places.

For South America show population in millions and GDP in billions both to 2 decimal places.
Millions and billions

SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2)
FROM world
WHERE continent = 'South America';

10.
Show the name and per-capita GDP for those countries with a GDP
of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.

Show per-capita GDP for the trillion dollar countries to the nearest $1000.

SELECT name, ROUND((gdp/population)/1000)*1000
FROM world
WHERE gdp > 1000000000000;

11.
Greece has capital Athens.

Each of the strings 'Greece', and 'Athens' has 6 characters.

Show the name and capital where the name and the capital have the same number of characters.

SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH (capital);

12.
The capital of Sweden is Stockholm. Both words start with the letter 'S'.

Show the name and the capital where the first letters of each match.
Do not include countries where the name and the capital are the same word.

SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1)
AND name <> capital;

13.
Equatorial Guinea and Dominican Republic have all of the vowels
(a e i o u) in the name. They do not count because they have more than one word in the name.

Find the country that has all the vowels and no spaces in its name.

SELECT name
FROM world
WHERE name LIKE '%u%' 
AND name LIKE '%a%' 
AND name LIKE '%o%' 
AND name LIKE '%i%'
AND name LIKE '%e%'
AND name NOT LIKE '% %';

-- BBC QUIZ

world
name	continent	area	population	gdp
Afghanistan	South Asia	652225	26000000	
Albania	Europe	28728	3200000	6656000000
Algeria	Middle East	2400000	32900000	75012000000
Andorra	Europe	468	64000	
Brazil	South America	8550000	182800000	564852000000
Colombia	South America	1140000	45600000	
Nauru	Asia-Pacific	21	9900	
Uzbekistan	Central Asia	447000	26000000	

1. Select the code which gives the name of countries beginning with U
SELECT name
  FROM world
 WHERE name LIKE 'U%'
2. Select the code which shows just the population of United Kingdom?
 SELECT population
  FROM world
 WHERE name = 'United Kingdom'
3. Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:
 SELECT continent 
   FROM world 
  WHERE 'name' = 'France'
  'name' should be name
4. Select the result that would be obtained from the following code:
 SELECT name, population / 10 
  FROM world 
 WHERE population < 10000
 Nauru	990
5. Select the code which would reveal the name and population of countries in Europe and Asia
SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia')
6. Select the code which would give two rows
SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo')
7. Select the result that would be obtained from this code:
SELECT name FROM world
 WHERE continent = 'South America'
   AND population > 40000000
Brazil
Colombia

