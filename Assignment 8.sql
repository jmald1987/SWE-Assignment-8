-- PART A --
--1--
SELECT COUNT(*)
FROM actors
WHERE date_of_birth > '1970-01-01';

--2--
SELECT MAX(domestic_takings),MIN(domestic_takings)
FROM movie_revenues;

--3--
SELECT SUM(movie_length)
FROM movies
WHERE age_certificate = '15';

--4--
SELECT COUNT(*)
FROM directors
WHERE nationality = 'Japanese';

--5--
SELECT AVG(movie_length)
FROM movies
WHERE movie_lang = 'Chinese';

-- PART B --
--1--
SELECT nationality, COUNT(*)
FROM directors
GROUP BY nationality;

--2--
SELECT age_certificate, movie_lang, SUM(movie_length)
FROM movies
GROUP BY age_certificate, movie_lang;

--3--
SELECT movie_lang
FROM movies
GROUP BY movie_lang
HAVING SUM(movie_length) > 500;

-- PART C --
--1--
SELECT act.first_name, act.last_name
FROM actors act 
JOIN movies_actors mv_act ON act.actor_id = mv_act.actor_id
JOIN movies mv ON mv_act.movie_id = mv.movie_id
JOIN directors dir ON dir.director_id = mv.director_id
WHERE dir.director_id=3
order by act.first_name;

--2--
SELECT first_name, last_name, date_of_birth, gender
FROM actors
WHERE date_of_birth = (select min(date_of_birth) from actors where gender = 'M')
UNION
SELECT first_name, last_name, date_of_birth, gender
FROM actors
WHERE date_of_birth = (select min(date_of_birth) from actors where gender = 'F');


--3--
SELECT movie_name, movie_length, age_certificate
FROM movies
WHERE movie_length > (select avg(movie_length) from movies)
GROUP BY age_certificate, movie_name, movie_length;


-- PART D -- 
-- Group: Robert Guzman, Johnny Maldonado, Koy Torres--
-- Modifications to app from project 3. 
