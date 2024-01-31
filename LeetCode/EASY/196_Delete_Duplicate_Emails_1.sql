DELETE FROM PERSON
WHERE ID IN
(
    SELECT ID
    FROM
    (
        SELECT ID, EMAIL, ROW_NUMBER() OVER(PARTITION BY EMAIL ORDER BY ID ASC) TOP 
        FROM PERSON
    ) WHERE TOP > 1
)
;