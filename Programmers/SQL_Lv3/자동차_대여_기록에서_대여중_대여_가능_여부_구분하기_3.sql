  SELECT DISTINCT CAR_ID,
         CASE
             WHEN EXISTS (
                     SELECT 1
                       FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                      WHERE CAR_ID = D.CAR_ID
                        AND START_DATE <= DATE '2022-10-16'
                        AND END_DATE >= DATE '2022-10-16'
                 ) THEN '대여중'
             ELSE '대여 가능'
         END AVAILABILITY
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY D
ORDER BY CAR_ID DESC
;
