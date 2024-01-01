CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
    result NUMBER;
    counter NUMBER := 0;

BEGIN
    FOR descSalary IN (
        SELECT DISTINCT salary FROM Employee ORDER BY salary DESC
    )
    LOOP
        counter := counter + 1;
        IF counter = N THEN
            result := descSalary.salary;
            EXIT;
        END IF;
    END LOOP;

    RETURN result;

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END
;