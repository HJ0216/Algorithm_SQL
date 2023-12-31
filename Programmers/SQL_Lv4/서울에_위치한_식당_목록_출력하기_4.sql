  SELECT DISTINCT I.REST_ID
         , I.REST_NAME
         , I.FOOD_TYPE
         , I.FAVORITES
         , I.ADDRESS
         , (SELECT ROUND(AVG(R.REVIEW_SCORE), 2)
              FROM REST_REVIEW R
             WHERE R.REST_ID = I.REST_ID) SCORE
    FROM REST_INFO I
    JOIN REST_REVIEW R 
      ON I.REST_ID = R.REST_ID
   WHERE SUBSTR(I.ADDRESS, 1, 2) = '서울'
ORDER BY SCORE DESC,
         FAVORITES DESC
;
