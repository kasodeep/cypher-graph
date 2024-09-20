// return list.
MATCH (p:Person)
RETURN p.name, [p.born, p.died] AS lifeTime
LIMIT 10

MATCH (a:Person)-[:ACTED_IN]->(m:Movie)
RETURN m.title AS movie,
collect(a.name)[0] AS castMember,
size(collect(a.name)) AS castSize

MATCH (a:Person)-[:ACTED_IN]->(m:Movie)
RETURN m.title AS movie,
collect(a.name)[2..] AS castMember,
size(collect(a.name)) AS castSize

// list comprehension.
MATCH (m:Movie)
RETURN m.title AS movie,
[x IN m.countries
WHERE x CONTAINS 'USA' OR x CONTAINS 'Germany']
 AS country
LIMIT 500

// pattern comprehension.
MATCH (m:Movie)
WHERE m.year = 2015
RETURN m.title,
[(dir:Person)-[:DIRECTED]->(m) | dir.name] AS directors,
[(actor:Person)-[:ACTED_IN]->(m) | actor.name] AS actors
