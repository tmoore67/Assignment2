-- 1.
SELECT r.name, 
    COUNT(*) as country_count
FROM regions r
JOIN countries c ON r.region_id = c.region_id
GROUP BY r.name
HAVING COUNT(*) >= 2
ORDER BY country_count DESC;

-- 2.
SELECT r.name,
    COUNT(DISTINCT l.language) AS distinct_languages
FROM regions r
JOIN countries c 
    ON r.region_id = c.region_id
JOIN country_languages cl
    ON c.country_id = cl.country_id
JOIN languages l
    ON cl.language_id = l.language_id
GROUP BY r.name
ORDER BY distinct_languages DESC;

--3.
SELECT name,
    SUM(cl.official) AS official_languages,
    COUNT(*) AS total_languages
FROM countries c
JOIN country_languages cl
    ON c.country_id = cl.country_id
GROUP BY c.country_id, c.name
ORDER BY official_languages DESC, total_languages;

--4.
SELECT cnts.name,
    COUNT(DISTINCT c.country_id) AS officially_speak_english
FROM continents cnts
JOIN regions r
    ON cnts.continent_id = r.continent_id
JOIN countries c
    ON r.region_id = c.region_id
JOIN country_languages cl
    ON c.country_id = cl.country_id
JOIN languages l
    on cl.language_id = l.language_id
WHERE l.language = "English"
    AND cl.official = 1
GROUP BY cnts.name
ORDER BY officially_speak_english;

--5.
SELECT cnts.name,
    SUM(cs.population) AS total_pop_2000
FROM continents cnts
LEFT JOIN regions r
    ON cnts.continent_id = r.continent_id
LEFT JOIN countries c
    ON r.region_id = c.region_id
LEFT JOIN country_stats cs
    ON c.country_id = cs.country_id
    AND cs.year = 2000
GROUP BY cnts.name
ORDER BY total_pop_2000;

-- HARD 1. (grouped alphabetically)
SELECT LEFT(c.name, 1) AS letter,
    SUM(c.area) AS total_area
FROM countries c
GROUP BY letter
ORDER BY letter;

-- HARD 4. 
SELECT r.name AS region_name,
    SUM(cs.population) / SUM(c.area) AS avergage_population_density
FROM regions r
JOIN countries c
    ON c.region_id = r.region_id
JOIN country_stats cs
    ON c.country_id = cs.country_id
WHERE cs.year = 2004
GROUP BY r.name;

-- 1989 DIV 10
-- 1989 - (1989 % 10)

-- HARD 5.  
SELECT c.name, 
       (FLOOR(cs.year / 10) * 10) AS decade,
       AVG(cs.population) as average_population,
       AVG(cs.gdp) as average_gdp
FROM country_stats cs
JOIN countries c
    ON c.country_id = cs.country_id
GROUP BY c.name, decade
ORDER BY c.name, decade;

DESCRIBE regions;
show tables;

DESCRIBE languages;
DESCRIBE country_languages;
DESCRIBE countries;
DESCRIBE country_stats;

DESCRIBE continents;



SELECT name
FROM continents;

DESCRIBE country_stats;

