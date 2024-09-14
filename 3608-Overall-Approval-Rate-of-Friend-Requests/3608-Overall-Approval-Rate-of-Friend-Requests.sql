with sendcte as(select count(distinct(concat(sender_id, send_to_id))) as totalsend
from FriendRequest),

acceptcte as(select count(distinct(concat(requester_id, accepter_id))) as totalacc
from RequestAccept)

select round(totalacc/(select totalsend from sendcte), 2) as accept_rate
from acceptcte
