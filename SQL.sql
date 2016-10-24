SELECT name, population
FROM countries
WHERE name like '%United States%' and population > 0

SELECT name, surfacearea
FROM countries
WHERE name like '%United States%' and population > 0

SELECT name, population, *
FROM countries
WHERE continent = 'Africa' and population < 30000000 and lifeexpectancy > 45

SELECT name, governmentform
FROM countries
WHERE governmentform like '%Republic%'
ORDER BY governmentform

SELECT *
FROM countries
WHERE governmentform like '%Republic%' and indepyear > 1945

SELECT *
FROM countries
WHERE governmentform not like '%Republic%' and indepyear > 1945

SELECT name, lifeexpectancy
FROM countries
WHERE lifeexpectancy > 0
ORDER BY lifeexpectancy desc limit 15

SELECT name, lifeexpectancy
FROM countries
WHERE lifeexpectancy > 0
ORDER BY lifeexpectancy asc limit 15

SELECT name, surfacearea, population, (surfacearea/population) AS population_density
FROM countries
WHERE population > 0
ORDER BY population_density asc limit 5

SELECT name, surfacearea, population, (surfacearea/population) AS population_density
FROM countries
WHERE population > 0
ORDER BY population_density desc limit 5

SELECT name, population, surfacearea
FROM countries
WHERE population > 0
ORDER BY surfacearea desc limit 10

SELECT name, population, surfacearea
FROM countries
WHERE population > 0
ORDER BY population asc limit 10

SELECT name, population, surfacearea
FROM countries
WHERE population > 0
ORDER BY surfacearea asc limit 10

SELECT name, population, surfacearea
FROM countries
WHERE population > 0
ORDER BY population desc limit 10


Select *
FROM countries
where surfacearea > 0 and gnp > 0
ORDER BY surfacearea desc
)
SELECT name, gnp
FROM smallest_countries
WHERE gnp > 0
ORDER BY gnp asc limit 10

With smallest_countries AS
(
Select *
FROM countries
where surfacearea > 0 and gnp > 0
ORDER BY surfacearea desc
)
SELECT name, gnp, (gnp/population) AS per_capita
FROM smallest_countries
WHERE gnp > 0
ORDER BY gnp asc limit 1


With smallest_countries AS
(
Select *
FROM countries
where surfacearea > 0 and gnp > 0
ORDER BY surfacearea desc
)
SELECT name, gnp, (gnp/population) AS per_capita
FROM smallest_countries
WHERE gnp > 0
ORDER BY gnp desc limit 1

With smallest_countries AS
(
Select *
FROM countries
where surfacearea > 0
ORDER BY surfacearea desc limit 10
)
SELECT sum(surfacearea)
FROM smallest_countries

With smallest_countries AS
(
Select *
FROM countries
where surfacearea > 0
ORDER BY surfacearea asc limit 10
)
SELECT sum(surfacearea)
FROM smallest_countries

SELECT continent, sum(surfacearea) AS sum_of_area, sum(population) AS sum_of_population
FROM countries
Group by continent

SELECT headofstate, sum(population) AS
FROM countries
group by headofstate
ORDER BY influence desc limit 1

SELECT headofstate, sum(surfacearea) AS influence
FROM countries
group by headofstate
ORDER BY influence desc limit 1

SELECT governmentform, count(governmentform) AS GOV
FROM countries
GROUP BY governmentform
ORDER BY GOV desc LIMIT 10

SELECT name, governmentform, surfacearea
FROM countries
WHERE surfacearea > 0
ORDER BY surfacearea desc limit 10

select name, count(*), surfacearea
from countries
group by surfacearea, name
order by surfacearea desc
limit (
	select count(name) * .05
	from countries
)
