WITH CON1 AS
(
    SELECT CAR_ID
           , CAR_TYPE
           , DAILY_FEE
      FROM CAR_RENTAL_COMPANY_CAR 
     WHERE CAR_TYPE IN ('세단', 'SUV')
)
, CON2 AS
(
    SELECT DISTINCT CAR_ID
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
     WHERE EXTRACT(MONTH FROM START_DATE) = '11' 
        OR EXTRACT(MONTH FROM END_DATE) = '11'
        OR (START_DATE < TO_DATE('2022-11-01', 'YYYY-MM-DD') 
           AND END_DATE > TO_DATE('2022-11-30', 'YYYY-MM-DD'))
)
, CON3 AS
(
    SELECT CAR_TYPE
           , DISCOUNT_RATE
      FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN 
     WHERE DURATION_TYPE LIKE '30%'
       AND CAR_TYPE IN ('세단', 'SUV')
)
  SELECT * 
    FROM
(
    SELECT CAR_ID
           , CAR_TYPE
           , CASE 
                WHEN CAR_TYPE = '세단' THEN ROUND(DAILY_FEE * 30 * (100 - (SELECT DISCOUNT_RATE 
                                                                            FROM CON3 
                                                                           WHERE CAR_TYPE = '세단')) / 100)
                WHEN CAR_TYPE = 'SUV' THEN ROUND(DAILY_FEE * 30 * (100 - (SELECT DISCOUNT_RATE 
                                                                            FROM CON3 
                                                                           WHERE CAR_TYPE = 'SUV')) / 100)
             END FEE
        FROM CON1
)
   WHERE FEE IS NOT NULL
     AND FEE >= 500000
     AND FEE < 2000000
     AND CAR_ID NOT IN (
                        SELECT CAR_ID 
                          FROM CON2
                       )
ORDER BY FEE DESC
         , CAR_TYPE
         , CAR_ID DESC
;
