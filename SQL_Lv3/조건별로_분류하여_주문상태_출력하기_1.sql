  SELECT ORDER_ID, 
         PRODUCT_ID, 
         TO_CHAR(OUT_DATE, 'YYYY-MM-DD') OUT_DATE,
         CASE
             WHEN OUT_DATE <= DATE '2022-05-01' THEN '출고완료'
             WHEN OUT_DATE > DATE '2022-05-01' THEN '출고대기'
             ELSE '출고미정'
         END 출고여부
    FROM FOOD_ORDER
ORDER BY ORDER_ID
;
