MATCH (:Movie { title: 'Toy Story' })-[:IN_GENRE]->(g:Genre)<-[:IN_GENRE]-(m)
WHERE m.imdbRating IS NOT null
WITH g.name AS genre,
count(m) AS moviesInCommon,
sum(m.imdbRating) AS total
RETURN genre, moviesInCommon,
total/moviesInCommon AS score
 ORDER BY score DESC

MATCH (u:User { name: "Misty Williams" })-[r:RATED]->(:Movie)
WITH u, avg(r.rating) AS average
MATCH (u)-[r:RATED]->(m:Movie)
WHERE r.rating > average
RETURN average , m.title AS movie,
r.rating AS rating
 ORDER BY rating DESC

MATCH (m:Movie)<-[:ACTED_IN]-(a:Actor)
WHERE m.title CONTAINS 'New York'
WITH m, collect (a.name) AS actors,
count(*) AS numActors
 ORDER BY numActors DESC
RETURN collect(m { .title, actors, numActors }) AS movies

PROFILE
MATCH (p:Actor)
WHERE p.born.year = 1980
WITH p
LIMIT 3
MATCH (p)-[:ACTED_IN]->(m:Movie)
WITH p, collect(m.title) AS movies
RETURN p.name AS actor, movies

MATCH (p:Person)-[:ACTED_IN]->(m:Movie)<-[r:RATED]-(:User)
WHERE p.name = 'Tom Hanks'
WITH m, avg(r.rating) AS avgRating
WHERE avgRating > 4
RETURN m.title AS Movie, avgRating AS `AverageRating`
 ORDER BY avgRating DESC

MATCH (m:Movie)
UNWIND m.countries AS country
WITH m, trim(country) AS trimmedCountry
WITH trimmedCountry, collect(m.title) AS movies
RETURN trimmedCountry, size(movies)
