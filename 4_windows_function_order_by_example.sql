select setseed(0.5);
with data as
(
select 
case when ser < 6 then 'P1' else 'P2' end as part, 
ser
from  generate_series(1, 10) as ser
order by random()
)
------------------
------------------
------------------
select part, ser,
sum(ser) 
over(partition by part 
rows between unbounded preceding and current row) 
as total_cum_rows_wo_order_by
from data
;

select setseed(0.5);
with data as
(
select 
case when ser < 6 then 'P1' else 'P2' end as part, 
ser
from  generate_series(1, 10) as ser
order by random()
)
------------------
------------------
------------------
select part, ser,
sum(ser) 
over(partition by part order by ser
rows between unbounded preceding and current row) 
as total_cum_rows_wo_order_by
from data
;