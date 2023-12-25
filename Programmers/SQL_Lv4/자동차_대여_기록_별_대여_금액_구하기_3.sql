SELECT DISTINCT HISTORY_ID,
       DAILY_FEE * (END_DATE - START_DATE + 1) *
       (100 - NVL(
           (SELECT DISTINCT DISCOUNT_RATE 
              FROM CAR_RENTAL_COMPANY_CAR CC
              JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN CP 
                ON CC.CAR_TYPE = CP.CAR_TYPE
             WHERE CC.CAR_TYPE = '트럭'
               AND DURATION_TYPE = 
                                    CASE
                                       WHEN (END_DATE - START_DATE + 1) >= 90 THEN '90일 이상'
                                       WHEN (END_DATE - START_DATE + 1) >= 30 THEN '30일 이상'
                                       WHEN (END_DATE - START_DATE + 1) >= 7 THEN '7일 이상'
                                       ELSE NULL
                                    END), 0)) * 0.01 AS FEE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H
    JOIN CAR_RENTAL_COMPANY_CAR CC 
      ON H.CAR_ID = CC.CAR_ID
    JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN CP 
      ON CC.CAR_TYPE = CP.CAR_TYPE
   WHERE CC.CAR_TYPE = '트럭'
ORDER BY FEE DESC
         , HISTORY_ID DESC
;
