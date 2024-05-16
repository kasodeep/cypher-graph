MATCH (p:Person)
WHERE p.name CONTAINS "Thomas"
RETURN p { .* } AS person
 ORDER BY p.name ASC

MATCH (m:Movie)<-[:ACTED_IN]-(p:Person)
WHERE m.title CONTAINS 'Toy Story' AND
p.died IS null
RETURN date().year - p.born.year AS ageThisYear

MATCH (m:Movie)<-[:ACTED_IN]-(p:Person)
WHERE m.title CONTAINS 'Toy Story' AND
p.died IS null
RETURN 'Movie: ' + m.title AS movie

// case clause.
MATCH (m:Movie)<-[:ACTED_IN]-(p:Person)
WHERE p.name = 'Henry Fonda'
RETURN m.title AS movie,

CASE
 WHEN m.year < 1940 THEN 'oldies'
 WHEN 1940 <= m.year < 1950 THEN 'forties'
 WHEN 1950 <= m.year < 1960 THEN 'fifties'
 WHEN 1960 <= m.year < 1970 THEN 'sixties'
 WHEN 1970 <= m.year < 1980 THEN 'seventies'
 WHEN 1980 <= m.year < 1990 THEN 'eighties'
 WHEN 1990 <= m.year < 2000 THEN 'nineties'
ELSE 'two-thousands'
END
 AS timeFrame
