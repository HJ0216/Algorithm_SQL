select 
    distinct t1.id
    , case
        when t1.p_id is null then "Root"
        when t1.id = t2.p_id then "Inner"
        else "Leaf"
    end "type"
from 
    Tree t1
left join
    Tree t2
on
    t1.id = t2.p_id
;
