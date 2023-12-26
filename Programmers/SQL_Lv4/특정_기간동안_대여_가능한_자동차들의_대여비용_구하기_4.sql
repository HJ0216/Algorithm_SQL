SELECT CAR_ID
         , CAR_TYPE
         , FEE
    FROM (
            SELECT C.CAR_ID
                   , C.CAR_TYPE
                   , C.DAILY_FEE * (100 - P.DISCOUNT_RATE) * 30 / 100 "FEE"
              FROM CAR_RENTAL_COMPANY_CAR C
              JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN P
                ON P.CAR_TYPE = C.CAR_TYPE AND P.DURATION_TYPE = '30일 이상'
             WHERE C.CAR_TYPE IN ('SUV', '세단')
               AND NOT EXISTS (
                                SELECT 1
                                  FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H
                                 WHERE C.CAR_ID = H.CAR_ID
                                   AND H.END_DATE >= TO_DATE('20221101', 'YYYYMMDD')
                                   AND H.START_DATE <= TO_DATE('20221130', 'YYYYMMDD')
                                   )
         )
   WHERE FEE >= 500000 AND FEE < 2000000
ORDER BY FEE DESC
         , CAR_TYPE
         , CAR_ID DESC
;
