// traversal always happens in form of depth first search.

// find p as a node, then find a movie then it's co-stars.
MATCH (p:Person)-[:ACTED_IN]->(m:Movie),
(coActors:Person)-[:ACTED_IN]->(m)
WHERE p.name = 'Eminem'
RETURN m.title AS movie , collect(coActors.name) AS coActors

// it's better to not have a label on the non-anchor side.
MATCH (p:Person)-[:ACTED_IN]->(m)
WHERE p.name = 'Tom Hanks'
RETURN m.title AS movie

// shortest path.
MATCH p = shortestPath((p1:Person)-[*]-(p2:Person))
WHERE p1.name = "Eminem"
 AND p2.name = "Charlton Heston"
RETURN p

MATCH p = shortestPath((p1:Person)-[:ACTED_IN*2]-(p2:Person))
WHERE p1.name = "Eminem"
 AND p2.name = "Charlton Heston"
RETURN p

// upto 4 hops
MATCH (p:Person { name: 'Eminem' })-[:ACTED_IN*1..4]-(others:Person)
RETURN others.name
