select name
from Employee E1
join 
(
    select managerId
    from Employee
    group by managerId
    having count(id) >= 5
) E2
on E1.id = E2.managerId 
;
