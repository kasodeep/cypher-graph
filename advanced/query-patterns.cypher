// A pattern is a combination of nodes and relationships that is used to traverse the graph at runtime.
PROFILE
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WHERE p.name = 'Tom Hanks'
 AND exists { (p)-[:DIRECTED]->(m) }
RETURN m.title

PROFILE
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)<-[:DIRECTED]-(p)
WHERE p.name = 'Tom Hanks'
RETURN m.title

// The difference between using EXPLAIN AND PROFILE is that EXPLAIN provides estimates of the query steps
// WHERE PROFILE provides the exact steps AND number of rows retrieved for the query.
