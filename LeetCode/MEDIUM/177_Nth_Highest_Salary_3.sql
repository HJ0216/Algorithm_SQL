CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
    result NUMBER;

BEGIN
    SELECT salary
    INTO result
    FROM 
    (
        SELECT salary, ROWNUM "RN"
        FROM 
        (
            SELECT DISTINCT salary
            FROM Employee
            ORDER BY salary DESC
        )
    )
    WHERE RN = N;

    RETURN result;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
END
;
