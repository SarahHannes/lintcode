with cte as(select id, name, row_number() over(order by id) % 2 as row_within
            from seat),
    grp_cte as(select *, count(*) over(partition by row_within order by id) as grp
            from cte),

    lastperson_cte as(select id, name
                    from grp_cte
                    where grp in  (select distinct grp
                                    from grp_cte
                                    group by grp
                                    having count(grp) < 2)),

    swap_cte as(select *
                from grp_cte
                where id not in (select id from lastperson_cte))


select new_id as id, name
from (select *, case
            when row_within = 1 then id+1
            else id-1
            end as new_id 
    from swap_cte) t
union all
select * from
lastperson_cte