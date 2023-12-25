  SELECT ORDER_ID, 
         PRODUCT_ID, 
         TO_CHAR(OUT_DATE, 'YYYY-MM-DD') OUT_DATE,
         DECODE(SIGN(OUT_DATE - DATE '2022-05-02'), -1, '출고완료', 0, '출고대기', 1, '출고대기', '출고미정') 출고여부
    FROM FOOD_ORDER
ORDER BY ORDER_ID
;
