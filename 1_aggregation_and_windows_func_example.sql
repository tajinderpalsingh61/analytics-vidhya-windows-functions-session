-- Aggregation example
with data as
(
select ser 
from  generate_series(1, 10) as ser
)
------------------
------------------
------------------
select sum(ser) as total
from data
;


-- Analytical example
with data as
(
select ser 
from  generate_series(1, 10) as ser
)
------------------
------------------
------------------
select ser,  sum(ser) over() as total
from data
;