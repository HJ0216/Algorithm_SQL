  SELECT DISTINCT CAR_ID
         , DECODE(SUM(CASE 
                  WHEN START_DATE <= DATE '2022-10-16' 
                       AND END_DATE >= DATE '2022-10-16' THEN 1 
                  ELSE 0 
                   END), 0, '대여 가능', '대여중') AVAILABILITY
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC
;
