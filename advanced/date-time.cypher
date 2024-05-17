RETURN date(), datetime(), time()

MATCH (x:Test { id: 1 })
RETURN x.date.day, x.date.year,
x.datetime.year, x.datetime.hour,
x.datetime.minute

MATCH (x:Test { id: 1 })
 SET x.date1 = date('2022-01-01'),
x.date2 = date('2022-01-15')
RETURN x

MATCH (x:Test { id: 1 })
RETURN duration.between(x.date1, x.date2)

MATCH (x:Test { id: 1 })
RETURN duration.inDays(x.datetime1, x.datetime2).days

MATCH (x:Test { id: 1 })
RETURN x.date1 + duration({ months: 6 })
