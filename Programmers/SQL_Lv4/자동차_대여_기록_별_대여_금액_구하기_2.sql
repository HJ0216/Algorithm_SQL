WITH CONDITION1 AS
(
    SELECT CAR_TYPE
           , DURATION_TYPE
           , DISCOUNT_RATE
      FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
     WHERE CAR_TYPE = '트럭'
)
, CONDITION2 AS
(
    SELECT CAR_ID
           , DAILY_FEE
           , DURATION_TYPE
           , DISCOUNT_RATE
      FROM CAR_RENTAL_COMPANY_CAR CC
      JOIN CONDITION1 C
        ON CC.CAR_TYPE = C.CAR_TYPE
)
  SELECT DISTINCT HISTORY_ID
         , DAILY_FEE
            * (END_DATE - START_DATE + 1)
            * (100 -
                    NVL(
                        (SELECT DISTINCT DISCOUNT_RATE 
                          FROM CONDITION2 
                         WHERE DURATION_TYPE = 
                                                CASE
                                                   WHEN (END_DATE - START_DATE + 1) >= 90 THEN '90일 이상'
                                                   WHEN (END_DATE - START_DATE + 1) >= 30 THEN '30일 이상'
                                                   WHEN (END_DATE - START_DATE + 1) >= 7 THEN '7일 이상'
                                                   ELSE NULL
                                               END), 0)
              ) * 0.01 AS FEE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H
    JOIN CONDITION2 C 
      ON H.CAR_ID = C.CAR_ID
ORDER BY FEE DESC
         , HISTORY_ID DESC
;
