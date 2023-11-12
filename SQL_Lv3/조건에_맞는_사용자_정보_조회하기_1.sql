WITH CONDITION AS ( SELECT WRITER_ID
                      FROM USED_GOODS_BOARD
                  GROUP BY WRITER_ID
                    HAVING COUNT(BOARD_ID)>=3
                  )
  SELECT USER_ID
      , NICKNAME
      , CITY || ' ' || STREET_ADDRESS1 || ' ' || STREET_ADDRESS2 AS "전체주소"
      , SUBSTR(TLNO, 1, 3) || '-' || SUBSTR(TLNO, 4, 4) || '-' || SUBSTR(TLNO, 8, 4) AS "전화번호"
    FROM CONDITION UGB
    JOIN USED_GOODS_USER UGU
      ON UGB.WRITER_ID = UGU.USER_ID
ORDER BY USER_ID DESC
;
