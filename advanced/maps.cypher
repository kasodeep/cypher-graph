// A Cypher map is list of key/value pairs where each element of the list is of the format 'key': value. A node or relationship can have a property that is a map.
RETURN {Jan: 31, Feb: 28, Mar: 31, Apr: 30 ,
May: 31, Jun: 30 , Jul: 31, Aug: 31, Sep: 30,
Oct: 31, Nov: 30, Dec: 31}['Feb'] AS daysInFeb

RETURN {Jan: 31, Feb: 28, Mar: 31, Apr: 30 ,
May: 31, Jun: 30 , Jul: 31, Aug: 31, Sep: 30,
Oct: 31, Nov: 30, Dec: 31}.Feb AS daysInFeb

RETURN keys({Jan: 31, Feb: 28, Mar: 31, Apr: 30 ,
May: 31, Jun: 30 , Jul: 31, Aug: 31, Sep: 30,
Oct: 31, Nov: 30, Dec: 31}) AS months

// map projections.
MATCH (m:Movie)
WHERE m.title CONTAINS 'Matrix'
RETURN m { .title, .released } AS movie
