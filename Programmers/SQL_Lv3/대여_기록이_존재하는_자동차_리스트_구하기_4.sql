 SELECT DISTINCT CRCC.CAR_ID
    FROM CAR_RENTAL_COMPANY_CAR CRCC
   WHERE EXISTS (
                SELECT 1
                  FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY CRCRH
                 WHERE CRCC.CAR_ID = CRCRH.CAR_ID
                   AND CAR_TYPE = '세단'
                   AND START_DATE BETWEEN DATE '2022-10-01' AND DATE '2022-10-31'
                )
ORDER BY CRCC.CAR_ID DESC
;
