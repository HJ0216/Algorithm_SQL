SELECT DATETIME 시간
  FROM ANIMAL_INS
 WHERE DATETIME = (
                    SELECT MIN(DATETIME)
                      FROM ANIMAL_INS
                  )
;
