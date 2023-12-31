SELECT DISTINCT A.NAME, B.COUNT
  FROM ANIMAL_INS A
  JOIN (
        SELECT NAME, COUNT(NAME) AS COUNT
        FROM ANIMAL_INS
        GROUP BY NAME
        HAVING COUNT(NAME) > 1
        ) B ON A.NAME = B.NAME
ORDER BY A.NAME;
