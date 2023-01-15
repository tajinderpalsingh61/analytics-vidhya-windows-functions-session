with data as
(
select  
ceil(ser/2.0) as ser
from  generate_series(1, 10) as ser
)
--------------------
--------------------
--------------------
select ser,
row_number() over w as row_number,
rank() over w as rank,
dense_rank() over w as dense_rank,
lag(ser) over w as lag,
lead(ser) over w as lead,
first_value(ser) over w as first_value,
last_value(ser) over w as last_value,
sum(ser) over w as sum,
count(ser) over w as count
from 
data window w as (order by ser)
order by 1
;