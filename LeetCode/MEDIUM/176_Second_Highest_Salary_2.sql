SELECT MAX(salary) SecondHighestSalary
  FROM
(
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) "RANKING"
    FROM Employee
)
 WHERE RANKING = 2
;
