// to see the performance.
PROFILE
MATCH (p:Person)-[:ACTED_IN]-()
WHERE p.born < '1950'
RETURN p.name

// extra complex query.
MATCH (m:Movie)
UNWIND m.languages AS language
WITH language, collect(m) AS movies
MERGE (l:Language { name:language })
WITH l, movies
UNWIND movies AS m
WITH l, m
MERGE (m)-[:IN_LANGUAGE]->(l);

// use case relationship.
MATCH (n:Actor)-[:ACTED_IN]->(m:Movie)
CALL apoc.
MERGE .relationship(n,
'ACTED_IN_' + left(m.released, 4),
{ },
{ },
m ,
{ }
) YIELD rel
RETURN count(*) AS `Number of relationships merged`;
