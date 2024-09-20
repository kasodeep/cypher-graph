// by identifying labels type.
MATCH (p)-[:ACTED_IN]->(m)
WHERE p:Person AND m:Movie AND m.title='The Matrix'
RETURN p.name

// not null.
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WHERE p.name='Jack Nicholson' AND m.tagline IS NOT null
RETURN m.title, m.tagline

// pattern matching.
MATCH (p:Person)-[:ACTED_IN]->()
WHERE p.name STARTS
WITH 'Michael'
RETURN p.name

MATCH (m:Movie)
WHERE m.title ENDS
WITH ' I'
RETURN m.title, m.released

MATCH (m:Movie)
WHERE m.title CONTAINS 'River'
RETURN m.title, m.released

// toLower function -> This also creates in-sensitive checking.
MATCH (p:Person)-[:ACTED_IN]->()
WHERE toLower(p.name) STARTS
WITH 'michael'
RETURN p.name

// exists function.
MATCH (p:Person)-[:WROTE]->(m:Movie)
WHERE NOT exists( (p)-[:DIRECTED]->(m) )
RETURN p.name, m.title

// if in list.
MATCH (p:Person)
WHERE p.born IN [1965, 1970, 1975]
RETURN p.name, p.born

MATCH (p:Person)-[r:ACTED_IN]->(m:Movie)
WHERE 'Neo' IN r.roles AND m.title='The Matrix'
RETURN p.name, r.roles

// To discover the properties of a node.
MATCH (p:Person)
RETURN p.name, keys(p)
