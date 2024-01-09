SELECT E.name
       , B.bonus
FROM Employee E
LEFT JOIN Bonus B
ON E.empId = B.empId
WHERE NOT EXISTS
(
   SELECT 1
     FROM Bonus B
    WHERE E.empId = B.empId
    AND B.bonus >= 1000
)
;
