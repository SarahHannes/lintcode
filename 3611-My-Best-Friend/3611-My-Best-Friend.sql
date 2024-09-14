-- get friend's id
with cte as(select st.id as own_id, name, fid
from Friend fr
right join Student st
on st.id = fr.id),

-- get own score
cte2 as(select own_id, name, fid, sc.value as own_score
from cte
left join Score as sc
on sc.id = own_id),

-- get friend's score
cte3 as(select own_id, name, fid, own_score, sc.value as fr_score
from cte2
left join Score as sc
on sc.id = fid)

-- filter
select name
from cte3
where fr_score > own_score
order by name desc