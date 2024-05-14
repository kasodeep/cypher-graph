MATCH (p:Person)
WHERE p.name = 'Jane Doe'
DELETE p

MATCH (p:Person { name: 'Jane Doe' })-[r:ACTED_IN]->(m:Movie {title: 'The Matrix'})
DELETE r
RETURN p, m

// if we have realtionships with other nodes.
MATCH (p:Person { name: 'Jane Doe' })
DETACH DELETE p

// to remove the labels.
MATCH (p:Person { name: 'Jane Doe' })
REMOVE p:Developer
RETURN p

// to remove attriutes.
MATCH (p:Person)-[r:ACTED_IN]->(m:Movie)
WHERE p.name = 'Michael Caine' AND m.title = 'The Dark Knight'
REMOVE r.roles
RETURN p, r, m
