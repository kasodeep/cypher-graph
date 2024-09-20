// What MERGE does is create the node or relationship if it does not exist in the graph.
MERGE (p:Person { name: 'Michael Caine' })

MATCH (p:Person { name: 'Michael Caine' })
MATCH (m:Movie { title: 'The Dark Knight' })
MERGE (p)-[:ACTED_IN]->(m)

MERGE (p:Person { name: 'Chadwick Boseman' })
MERGE (m:Movie { title: 'Black Panther' })
MERGE (p)-[:ACTED_IN]-(m)

MERGE (p:Person { name: 'Emily Blunt' })-[:ACTED_IN]->(m:Movie {title: 'A Quiet Place'})
RETURN p, m

MATCH (p:Person { name: "Daniel Kaluuya" })
MERGE (m:Movie { title: "Get Out" })
MERGE (p)-[:ACTED_IN]->(m)
