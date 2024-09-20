MERGE (p:Person { name: 'McKenna Grace' })
  ON CREATE SET p.createdAt = datetime()
  ON MATCH SET p.updatedAt = datetime()
 SET p.born = 2006
RETURN p
