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
row_number() over(order by ser) as row_number,
rank() over(order by ser) as rank,
dense_rank() over(order by ser) as dense_rank,
lag(ser) over(order by ser) as lag,
lead(ser) over(order by ser) as lead,
first_value(ser) over(order by ser) as first_value,
last_value(ser) over(order by ser) as last_value,
sum(ser) over(order by ser) as sum,
count(ser) over(order by ser) as count
from data
order by 1
;