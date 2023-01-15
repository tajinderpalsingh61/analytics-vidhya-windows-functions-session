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
sum(ser) over(partition by part) as total
from data
order by ser
;