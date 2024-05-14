// to view the data model
CALL db.schema.visualization()
// to view the properties of the nodes and relations.
CALL db.schema.nodeTypeProperties()
CALL db.schema.relTypeProperties()

// to view the indexes.
SHOW CONSTRAINTS

CALL db.labels()
CALL db.propertyKeys()

// labels() function.
MATCH (p:Person)
WHERE p.born.year > 1960
 AND p:Actor
 AND p:Director
RETURN p.name, p.born, labels(p)

// relationship types.
MATCH (p:Person)-[r]->(m:Movie)
WHERE p.name = 'Tom Hanks'
RETURN m.title AS movie, type(r) AS relationshipType
