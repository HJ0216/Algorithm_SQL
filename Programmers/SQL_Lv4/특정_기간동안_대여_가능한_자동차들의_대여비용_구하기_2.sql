WITH CON1 AS
(
    SELECT C.CAR_ID
           , C.CAR_TYPE
           , DAILY_FEE * 30 * (100-DISCOUNT_RATE)/100 "FEE"
      FROM CAR_RENTAL_COMPANY_CAR C
           , CAR_RENTAL_COMPANY_DISCOUNT_PLAN P
     WHERE C.CAR_TYPE = P.CAR_TYPE
       AND C.CAR_TYPE IN ('세단', 'SUV')
       AND DURATION_TYPE = '30일 이상'
       AND C.CAR_ID NOT IN 
                            (
                            SELECT CAR_ID
                              FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                             WHERE NOT (TO_CHAR(START_DATE, 'YYYYMMDD') > '20221130'
                                OR TO_CHAR(END_DATE, 'YYYYMMDD') < '20221101')
                            )
)
  SELECT *
    FROM CON1
   WHERE (500000 <= FEE AND FEE < 2000000)
ORDER BY FEE DESC
         , CAR_TYPE ASC
         , CAR_ID DESC
;
