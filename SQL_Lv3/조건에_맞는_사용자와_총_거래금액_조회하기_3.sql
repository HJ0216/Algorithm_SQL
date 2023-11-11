 SELECT USER_ID,
         NICKNAME,
         TOTAL_SALES
    FROM (SELECT UGU.USER_ID,
                 UGU.NICKNAME,
                 (SELECT SUM(PRICE) 
                    FROM USED_GOODS_BOARD UGB 
                   WHERE UGB.WRITER_ID = UGU.USER_ID 
                     AND UGB.STATUS = 'DONE'
                 ) AS TOTAL_SALES
            FROM USED_GOODS_USER UGU
         )
   WHERE TOTAL_SALES >= 700000
ORDER BY TOTAL_SALES
;