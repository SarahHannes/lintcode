select distinct id
from boxes
where is_empty = 1 and (id-1 in (select id from boxes where is_empty=1) or
                        id+1 in (select id from boxes where is_empty=1))
