SELECT TO_CHAR(SALES_DATE, 'YYYY-MM-DD') SALES_DATE
       , PRODUCT_ID
       , USER_ID
       , SALES_AMOUNT
  FROM ONLINE_SALE
 WHERE TRUNC(SALES_DATE, 'MM') = TO_DATE('2022-03-01', 'YYYY-MM-DD') 
UNION
  SELECT TO_CHAR(SALES_DATE, 'YYYY-MM-DD') SALES_DATE
         , PRODUCT_ID
         , NULL USER_ID
         , SALES_AMOUNT
    FROM OFFLINE_SALE
   WHERE TRUNC(SALES_DATE, 'MM') = TO_DATE('2022-03-01', 'YYYY-MM-DD')
ORDER BY SALES_DATE
         , PRODUCT_ID
         , USER_ID
;
