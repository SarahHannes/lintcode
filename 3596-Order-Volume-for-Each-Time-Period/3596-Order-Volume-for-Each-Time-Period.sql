select customer_id,
count(distinct(case when datediff('2023-04-03', order_date) <= 30
                    then order_id else null end)) as orders_30d,
ifnull(sum(case when datediff('2023-04-03', order_date) <= 30
                    then amount else 0 end), 0) as amount_30d,

count(distinct(case when datediff('2023-04-03', order_date) <= 60
                    then order_id else null end)) as orders_60d,
ifnull(sum(case when datediff('2023-04-03', order_date) <= 60
                    then amount else 0 end), 0) as amount_60d,

count(distinct(case when datediff('2023-04-03', order_date) <= 90
                    then order_id else null end)) as orders_90d,
ifnull(sum(case when datediff('2023-04-03', order_date) <= 90
                    then amount else 0 end), 0) as amount_90d

from orders
group by customer_id