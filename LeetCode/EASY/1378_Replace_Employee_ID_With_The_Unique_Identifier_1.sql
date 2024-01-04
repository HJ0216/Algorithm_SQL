   SELECT e.name, eUNI.unique_id
     FROM Employees e
LEFT JOIN EmployeeUNI eUNI
       ON e.id = eUNI.id
;
