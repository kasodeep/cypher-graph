// scoping variables.
WITH 'Tom Hanks' AS actorName
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WHERE p.name = actorName
RETURN m.title AS movies

WITH 'toy story' AS mt, 'Tom Hanks' AS actorName
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WITH m, toLower(m.title) AS movieTitle
WHERE p.name = actorName
 AND movieTitle CONTAINS mt
RETURN m.title AS movies, movieTitle

WITH 'Tom Hanks' AS theActor
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WHERE p.name = theActor
WITH m ORDER BY m.year
LIMIT 5

MATCH (n:Movie)
WHERE n.imdbRating IS NOT null AND n.poster IS NOT null
WITH n {
  .title,
  .imdbRating,
  actors: [ (n)<-[:ACTED_IN]-(p) | p { tmdbId:p.imdbId, .name } ],
  genres: [ (n)-[:IN_GENRE]->(g) | g { .name }]
}
 ORDER BY n.imdbRating DESC
LIMIT 4
RETURN collect(n)
