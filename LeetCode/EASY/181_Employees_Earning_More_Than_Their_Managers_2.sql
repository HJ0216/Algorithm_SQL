SELECT A.name "Employee"
  FROM Employee A
  JOIN Employee B
    ON A.managerId = B.id
   AND A.salary >= B.salary
;
