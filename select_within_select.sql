1.
List each country name where the population is larger than that of 'Russia'.

world(name, continent, area, population, gdp)

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

2.
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

SELECT name FROM world
  WHERE continent = 'Europe'
AND gdp/population >
     (SELECT gdp/population FROM world
      WHERE name = 'United Kingdom');

3.

List the name and continent of countries in the continents
containing either Argentina or Australia. Order by name of the country.

SELECT name, continent FROM world
WHERE continent IN (SELECT continent FROM world
WHERE name IN ('Argentina','Australia'))
ORDER BY name;

4.
Which country has a population that is
more than Canada but less than Poland? Show the name and the population.

SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
AND population < (SELECT population FROM world WHERE name = 'Poland');

5.
Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

The format should be Name, Percentage for example:

name	percentage
Albania	3%
Andorra	0%
Austria	11%
...	...
Decimal places
Percent symbol %

SELECT name,
CONCAT(ROUND(100*population/(SELECT population FROM world
                              WHERE name = 'Germany'))
, '%')
FROM world
WHERE continent = 'Europe'

6.
Which countries have a GDP greater than every country
in Europe? [Give the name only.] (Some countries may have NULL gdp values)

SELECT name
 FROM world
 WHERE gdp >= ALL(SELECT gdp
                          FROM world
                          WHERE gdp>0
                          AND continent = 'Europe')
AND continent <> 'Europe';

7.
Find the largest country (by area) in each continent, show the continent, the name and the area:

SELECT continent, name, area 
  FROM world
 WHERE area IN (SELECT MAX(area) 
                  FROM world 
                 GROUP BY continent);

8.
List each continent and the name of the country that comes first alphabetically.

SELECT continent, name 
FROM world x
WHERE x.name <= ALL(SELECT y.name FROM world y
                    WHERE x.continent=y.continent)
ORDER BY continent;

9.
Find the continents where all countries have a population <= 25000000.
Then find the names of the countries
associated with these continents. Show name, continent and population.

SELECT name, continent, population 
FROM world x 
WHERE 25000000 > ALL(SELECT population 
                     FROM world y 
                     WHERE y.continent = x.continent);

10.
Some countries have populations more than three times that of any of their neighbours
(in the same continent). Give the countries and continents.

SELECT x.name, x.continent
  FROM world x
  WHERE x.population >ALL(SELECT population*3
                            FROM world y
                            WHERE y.continent = x.continent
                            AND x.name<>y.name);

-- QUIZ

1. Select the code that shows the name, region and population of the smallest country in each region
SELECT region, name, population FROM bbc x
WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)
2. Select the code that shows the countries belonging to regions with all populations over 50000
SELECT name,region,population FROM bbc x WHERE 50000 < ALL
(SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)
3. Select the code that shows the countries with a less than a third of
the population of the countries around it
SELECT name, region FROM bbc x
 WHERE population < ALL
 (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)
4. Select the result that would be obtained from the following code:
SELECT name FROM bbc
 WHERE population >
       (SELECT population
          FROM bbc
         WHERE name='United Kingdom')
   AND region IN
       (SELECT region
          FROM bbc
         WHERE name = 'United Kingdom')
Table-D
France
Germany
Russia
Turkey
5. Select the code that would show the countries with a greater GDP than
any country in Africa (some countries may have NULL gdp values).
SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')
6. Select the code that shows the countries with population smaller than
Russia but bigger than Denmark
SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')
7. Select the result that would be obtained from the following code:
SELECT name FROM bbc
 WHERE population > ALL
       (SELECT MAX(population)
          FROM bbc
         WHERE region = 'Europe')
   AND region = 'South Asia'
Table-B
Bangladesh
India
Pakistan

