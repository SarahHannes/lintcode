
select avg(num) as median
from (select num, row_number() over(order by num) as row_num, count(*) over() as total_row
    from Number) as t
where if(total_row%2=1, row_num in ((total_row+1)/2), row_num in (total_row/2+1, total_row/2))

