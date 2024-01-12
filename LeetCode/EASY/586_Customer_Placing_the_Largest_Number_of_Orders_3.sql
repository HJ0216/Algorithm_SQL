SELECT customer_number 
  FROM (
    SELECT customer_number, RANK() OVER (ORDER BY COUNT(order_number) DESC) rank
      FROM Orders
  GROUP BY customer_number
) T
 WHERE rank = 1
;
