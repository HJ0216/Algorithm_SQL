with HIGHEST_SALARY_T as
(
    select name
           , departmentId
           , salary
           , dense_rank() over(partition by departmentId order by salary desc) ranking
    from Employee
)
select d.name Department
       , h.name Employee
       , h.salary Salary
  from HIGHEST_SALARY_T h
  join Department d
    on h.departmentId = d.id
 where h.ranking = 1
;
