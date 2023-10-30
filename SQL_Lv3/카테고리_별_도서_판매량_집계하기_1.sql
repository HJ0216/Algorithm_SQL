  SELECT B.CATEGORY, 
         SUM(BS.SALES) TOTAL_SALES
    FROM BOOK B
    JOIN BOOK_SALES BS
      ON B.BOOK_ID = BS.BOOK_ID
   WHERE TO_CHAR(BS.SALES_DATE, 'YYYY-MM') = '2022-01'
GROUP BY B.CATEGORY
ORDER BY B.CATEGORY
;
