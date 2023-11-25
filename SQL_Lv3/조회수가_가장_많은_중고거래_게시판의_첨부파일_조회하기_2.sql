WITH RankedViews AS (
    SELECT UGB.BOARD_ID,
           UGF.FILE_ID,
           UGF.FILE_NAME,
           UGF.FILE_EXT,
           RANK() OVER (ORDER BY UGB.VIEWS DESC) AS rnk
      FROM USED_GOODS_BOARD UGB
      JOIN USED_GOODS_FILE UGF 
        ON UGB.BOARD_ID = UGF.BOARD_ID
)
SELECT ('/home/grep/src/' 
        || BOARD_ID 
        || '/' 
        || FILE_ID 
        || FILE_NAME 
        || FILE_EXT) FILE_PATH
FROM RankedViews
WHERE rnk = 1
ORDER BY FILE_ID DESC
;
