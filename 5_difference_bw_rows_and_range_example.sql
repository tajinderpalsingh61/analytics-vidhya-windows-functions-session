with data as
(
select  
ser
from  generate_series(1, 10) as ser
union all
select 10 as ser
)
--------------------
--------------------
--------------------
select ser,
sum(ser) 
over(order by ser 
rows between unbounded preceding and current row)
as rows_example,
sum(ser) 
over(order by ser
range between unbounded preceding and current row
) as range_example
from data
order by 1
;
