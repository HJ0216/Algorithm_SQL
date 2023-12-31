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
         , CASE
            WHEN (END_DATE - START_DATE + 1) >= 90 
            THEN DAILY_FEE
                 * (100 - (SELECT DISTINCT DISCOUNT_RATE FROM CONDITION2 WHERE DURATION_TYPE = '90일 이상'))
                 * 0.01
                 * (END_DATE - START_DATE + 1)
            WHEN (END_DATE - START_DATE + 1) >= 30 
            THEN DAILY_FEE
                 * (100-(SELECT DISTINCT DISCOUNT_RATE FROM CONDITION2 WHERE DURATION_TYPE = '30일 이상'))
                 * 0.01
                 * (END_DATE - START_DATE + 1)
            WHEN (END_DATE - START_DATE + 1) >= 7 
            THEN DAILY_FEE
                 * (100-(SELECT DISTINCT DISCOUNT_RATE FROM CONDITION2 WHERE DURATION_TYPE = '7일 이상'))
                 * 0.01
                 * (END_DATE - START_DATE + 1)
            ELSE DAILY_FEE*(END_DATE - START_DATE + 1)
         END FEE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H
    JOIN CONDITION2 C
      ON H.CAR_ID = C.CAR_ID
ORDER BY FEE DESC
        , HISTORY_ID DESC
;
