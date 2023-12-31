  SELECT ANIMAL_ID, NAME,
         EXTRACT(YEAR FROM DATETIME) || '-' ||
         LPAD(EXTRACT(MONTH FROM DATETIME), 2, '0') || '-' ||
         LPAD(EXTRACT(DAY FROM DATETIME), 2, '0') AS "날짜"
    FROM ANIMAL_INS
ORDER BY ANIMAL_ID
;
