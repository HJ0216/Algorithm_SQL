SELECT A.name Employee
  FROM Employee A
       , Employee B
 WHERE A.managerId = B.id
   AND A.salary >= B.salary
;
