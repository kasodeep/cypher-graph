// Here are some important things to know about a subquery:
// A subquery returns values referred to by the variables IN the RETURN clause.
// A subquery cannot RETURN variables WITH the same name used IN the enclosing query.
// You must explicitly pass IN variables from the enclosing query to a subquery.

MATCH (m:Movie)
CALL {
  WITH m
  MATCH (m)<-[r:RATED]-(u:User)
  WHERE r.rating = 5
  RETURN count(u) AS numReviews
}
RETURN m.title, numReviews
 ORDER BY numReviews DESC

// With UNION, the queries you are combining must return the same number of properties or data.
MATCH (p:Person)
WITH p
LIMIT 100
CALL {
  WITH p
  OPTIONAL MATCH (p)-[:ACTED_IN]->(m:Movie)
  RETURN m.title + ": " + "Actor" AS work
  UNION
  WITH p
  OPTIONAL MATCH (p)-[:DIRECTED]->(m:Movie)
  RETURN m.title+ ": " + "Director" AS work
}
RETURN p.name, collect(work)
