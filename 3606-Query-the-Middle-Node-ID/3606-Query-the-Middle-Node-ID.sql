with node_cte as(select distinct id
                    from TreeNode
                    where parent != -1),

root_cte as(select distinct parent
from TreeNode
where parent != -1)

select distinct id
from node_cte
where id in (select parent from root_cte)

