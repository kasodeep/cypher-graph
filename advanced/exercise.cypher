MATCH (n:Director)-[r:DIRECTED]-(m:Movie)-[:IN_GENRE]-(g:Genre)
WHERE m.year=2000 AND g.name="Horror"
RETURN n.name;

MATCH (p:Person)
WHERE p:Actor AND p:Director
 AND 1950 <= p.born.year < 1960
RETURN COUNT(p);
