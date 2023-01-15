with data as
(
select 
case when ser < 6 then 'P1' else 'P2' end as part, 
ser 
from  generate_series(1, 10) as ser
)
------------------
------------------
------------------
select part, ser,
sum(ser) 
over(partition by part 
rows between 1 preceding and 1 following) 
as total_with_val,
sum(ser) 
over(partition by part  
rows between unbounded preceding and unbounded following) 
as total_unbounded
from data
order by ser
;
