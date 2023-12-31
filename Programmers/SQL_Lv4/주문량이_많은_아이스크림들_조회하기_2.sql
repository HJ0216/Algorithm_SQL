WITH TOTAL_TABLE AS (
    SELECT FLAVOR
           , TOTAL_ORDER
    FROM FIRST_HALF
    UNION
    SELECT FLAVOR
           , TOTAL_ORDER
    FROM JULY
)
SELECT FLAVOR
  FROM
(
      SELECT RANK() OVER (ORDER BY SUM(TOTAL_ORDER) DESC) ORDER_RANK
             , FLAVOR
        FROM TOTAL_TABLE
    GROUP BY FLAVOR
)
 WHERE ORDER_RANK <= 3
;
