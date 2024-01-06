SELECT W2.id
  FROM Weather W1
  JOIN Weather W2
    ON (W2.recordDate - W1.recordDate) = 1
 WHERE W1.temperature < W2.temperature
;
