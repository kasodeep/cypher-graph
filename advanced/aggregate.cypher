// When you aggregate in a Cypher statement, the query must process all patterns in the MATCH clause
// to complete the aggregation to return results. This is called eager aggregation.

MATCH (a:Person)-[:ACTED_IN]->(m:Movie)
WHERE a.name = 'Tom Hanks'
RETURN a.name AS actorName,
count(*) AS numMovies

// Cypher has a built-in aggregation function, collect() that enables you to aggregate values into a list.
MATCH (a:Person)-[:ACTED_IN]->(m:Movie)
RETURN a.name AS actor,
count(*) AS total,
collect(m.title) AS movies
 ORDER BY total DESC
LIMIT 10

// this query returns the title and then for that title count the nodes/relation.
MATCH (d:Actor)-[:ACTED_IN]-(m:Movie)
RETURN m.title,
count(*) AS numMovies
 ORDER BY numMovies DESC
LIMIT 5
