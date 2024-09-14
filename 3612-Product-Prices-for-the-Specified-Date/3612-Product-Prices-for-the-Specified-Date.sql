-- get up until the date
with cte as(select id, updated_date, new_price
from Products
where updated_date <= '2023-05-15'),

-- get latest updated_date
cte2 as(select *, max(updated_date) over(partition by id) as max_date
from cte),

-- get latest price at the latest updated_date
cte3 as(select id, new_price as price
from cte2
where updated_date = max_date)

-- join all with latest price at the latest updated date (before 2023-05-15)
select *
from cte3
union all

-- for all products with no updated price up until 2023-05-15, then default 99
select distinct id, 99 as price
from Products
where id not in (select id from cte3)
