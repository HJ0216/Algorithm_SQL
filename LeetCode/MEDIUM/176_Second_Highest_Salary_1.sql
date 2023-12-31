SELECT MAX(salary) SecondHighestSalary
  FROM
(
    SELECT ROWNUM rn, salary
      FROM
    (
          SELECT DISTINCT salary
            FROM Employee
        ORDER BY salary DESC
    )
)
WHERE rn = 2
;
