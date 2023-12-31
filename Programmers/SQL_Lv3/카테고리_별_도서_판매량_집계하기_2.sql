  SELECT B.CATEGORY, 
         SUM(BS.SALES) AS TOTAL_SALES
    FROM BOOK B
    JOIN BOOK_SALES BS
      ON B.BOOK_ID = BS.BOOK_ID
   WHERE EXTRACT(YEAR FROM BS.SALES_DATE) = 2022
     AND EXTRACT(MONTH FROM BS.SALES_DATE) = 1
GROUP BY B.CATEGORY
ORDER BY B.CATEGORY
;
