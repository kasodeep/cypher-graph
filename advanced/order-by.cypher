MATCH (p:Person)
WHERE p.born.year = 1980
RETURN p.name AS name, p.born AS birthDate
 ORDER BY p.born DESC

MATCH (p:Person)
WHERE p.born IS NOT null
RETURN p.name AS name, p.born AS birthDate
 ORDER BY p.born DESC

MATCH (p:Person)-[:DIRECTED | ACTED_IN]->(m:Movie)
WHERE p.name = 'Tom Hanks'
 OR p.name = 'Keanu Reeves'
RETURN m.year, m.title
 ORDER BY m.year DESC , m.title

// What is the youngest actor that acted in the most highly-rated movie?
MATCH (m:Movie)<-[ACTED_IN]-(p:Person)
WHERE m.imdbRating IS NOT null
RETURN m.title, m.imdbRating, p.name, p.born
 ORDER BY m.imdbRating DESC, p.born DESC

// skip, limit, distinct.
MATCH (p:Person)
WHERE p.born.year = 1980
RETURN p.name AS name,
p.born AS birthDate
 ORDER BY p.born SKIP 40
LIMIT 10

MATCH (p:Person)-[:DIRECTED | ACTED_IN]->(m:Movie)
WHERE p.name = 'Tom Hanks'
RETURN DISTINCT m.title, m.released
 ORDER BY m.title
