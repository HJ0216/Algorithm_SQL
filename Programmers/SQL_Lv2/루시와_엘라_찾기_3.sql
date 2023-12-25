  SELECT ANIMAL_ID, 
         NAME, 
         SEX_UPON_INTAKE
    FROM ANIMAL_INS
   WHERE 
       CASE 
           WHEN NAME IN ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty') THEN 1 
           ELSE 0 
       END = 1
ORDER BY ANIMAL_ID
;
