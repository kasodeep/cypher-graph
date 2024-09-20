// the set keyword is used.
MATCH (p:Person)-[r:ACTED_IN]->(m:Movie)
WHERE p.name = 'Michael Caine' AND m.title = 'The Dark Knight'
 SET r.roles = ['Alfred Penny']
RETURN p, r, m

MATCH (p:Person)
WHERE p.name = 'Gene Hackman'
 SET p.born = null
RETURN p
