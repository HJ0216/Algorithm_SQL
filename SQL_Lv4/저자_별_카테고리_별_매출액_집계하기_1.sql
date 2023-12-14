  SELECT A.AUTHOR_ID
         , A.AUTHOR_NAME
         , B.CATEGORY
         , SUM(BS.SALES * B.PRICE) TOTAL_SALES
    FROM BOOK B
    JOIN AUTHOR A
      ON B.AUTHOR_ID = A.AUTHOR_ID
    JOIN BOOK_SALES BS
      ON B.BOOK_ID = BS.BOOK_ID
   WHERE TO_CHAR(SALES_DATE, 'YYYY-MM') = '2022-01'
GROUP BY A.AUTHOR_ID
         , A.AUTHOR_NAME
         , B.CATEGORY
ORDER BY A.AUTHOR_ID ASC
         , B.CATEGORY DESC
;