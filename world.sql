use world;
SELECT * FROM city;
SELECT * FROM countrylanguage;
-- 1. Using COUNT, get the number of cities in the USA.
SELECT COUNT(ID) FROM city WHERE countryCode='USA';
-- 2. Find out the population and life expectancy for people in Argentina.
SELECT name, population, lifeExpectancy FROM country WHERE name='Argentina';
-- 3. Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
SELECT name FROM country WHERE lifeExpectancy IS NOT NULL ORDER BY lifeExpectancy DESC LIMIT 1;
-- 4. Using JOIN ... ON, find the capital city of Spain.
SELECT ci.name FROM city ci JOIN country c ON c.code = ci.countryCode WHERE c.name='Spain' AND c.capital=ci.id;
-- 5. Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
SELECT cl.language FROM countrylanguage cl JOIN country c ON c.code = cl.countryCode WHERE c.region='Southeast Asia';
-- 6. Using a single query, list 25 cities around the world that start with the letter F.
SELECT name FROM city WHERE name LIKE 'F%' LIMIT 25;
-- 7. Using COUNT and JOIN ... ON, get the number of cities in China.
SELECT COUNT(id) FROM city ci JOIN country c ON c.code = ci.countryCode WHERE c.name='China';
-- 8. Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
SELECT name FROM country WHERE population IS NOT NULL AND population=0 ORDER BY population ASC LIMIT 1;
-- 9. Using aggregate functions, return the number of countries the database contains.
SELECT COUNT(*) FROM country;
-- 10. What are the top ten largest countries by area?
SELECT  name FROM country ORDER BY surfaceArea DESC LIMIT 10;
-- 11. List the five largest cities by population in Japan.
SELECT ci.name FROM country c JOIN city ci ON ci.countryCode = c.code WHERE c.name='Japan' ORDER BY ci.population;
-- 12. List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
UPDATE country SET headofState = 'Elizabeth II' WHERE headofState = 'Elisabeth II';
SELECT name, code FROM country WHERE headOfState='Elizabeth II';
-- 13. List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
SELECT name FROM country WHERE population/surfaceArea != 0 ORDER BY population/surfaceArea ASC LIMIT 10;
-- 14. List every unique world language.
SELECT DISTINCT language FROM countrylanguage;
-- 15. List the names and GNP of the world's top 10 richest countries.
SELECT name, gnp FROM country ORDER BY gnp DESC LIMIT 10;
-- 16. List the names of, and number of languages spoken by, the top ten most multilingual countries.
SELECT c.name, COUNT(countryCode) AS numberoflanguages FROM countrylanguage cl JOIN country c ON c.code = cl.countryCode ORDER BY numberoflanguages DESC LIMIT 10;
-- 17. List every country where over 50% of its population can speak German.
SELECT c.name FROM country c JOIN countrylanguage cl ON c.code = cl.countryCode WHERE cl.language='German' AND cl.percentage>50;
-- 18. Which country has the worst life expectancy? Discard zero or null values.
SELECT name FROM country WHERE lifeExpectancy>0 AND lifeExpectancy IS NOT NULL ORDER BY lifeExpectancy ASC LIMIT 1;
-- 19. List the top three most common government forms.
SELECT governmentForm FROM country GROUP BY governmentForm ORDER BY COUNT(governmentForm) DESC LIMIT 3;
-- 20. How many countries have gained independence since records began?
SELECT COUNT(*) FROM country WHERE indepYear IS NOT NULL;
