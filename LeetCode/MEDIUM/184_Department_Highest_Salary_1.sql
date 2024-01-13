select d.name Department
       , e.name Employee
       , e.salary Salary
  from Employee e
  join Department d
    on e.departmentId = d.id
 where (e.departmentId, e.salary) in (
      select departmentId, max(Salary)
        from Employee
    group by departmentId
);
