select id, count(id) as num
from (select requester_id as id from RequestAccept
    union all
    select accepter_id as id from RequestAccept) t
group by id
order by count(id) desc
limit 1