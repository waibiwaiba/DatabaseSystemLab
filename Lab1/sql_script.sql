USE company;
-- 1：参加了项目名为“SQL Project”的员工名字；
SELECT ENAME
FROM EMPLOYEE e,
    WORKS_ON w,
    PROJECT p
WHERE e.ESSN = w.ESSN
    AND w.PNO = p.PNO
    AND p.PNAME = 'SQL Project';
-- 2：在“Research Department”工作且工资低于3000元的员工名字和地址；
SELECT ENAME,
    ADDRESS
FROM EMPLOYEE e,
    DEPARTMENT d
WHERE e.DNO = d.DNO
    AND d.DNAME = 'Research Department'
    AND e.SALARY < 3000;
-- 3：没有参加项目编号为P1的项目的员工姓名；
SELECT ENAME
FROM EMPLOYEE
WHERE ESSN NOT IN (
        SELECT ESSN
        FROM WORKS_ON
        WHERE PNO = 'P1'
    );
-- 4：由张红领导的工作人员的姓名和所在部门的名字；
SELECT e.ENAME,
    d.DNAME
FROM EMPLOYEE e,
    DEPARTMENT d
WHERE e.DNO = d.DNO
    AND e.SUPERSSN =(
        SELECT ESSN
        FROM EMPLOYEE
        WHERE ENAME = '张红'
    );
-- 5：至少参加了项目编号为P1和P2的项目的员工号；
-- INTERSECT 在mysql中不能用：SELECT ESSN FROM WORKS_ON WHERE PNO='P1' INTERSECT SELECT ESSN FROM WORKS_ON WHERE PNO='P2';
-- 参考：SELECT A.id FROM A INNER JOIN B ON A.id = B.id;
-- 改为：
SELECT ESSN
FROM WORKS_ON
WHERE PNO = 'P1'
    AND EXISTS (
        SELECT ESSN
        FROM WORKS_ON
        WHERE PNO = 'P2'
            AND ESSN = WORKS_ON.ESSN
    );
-- 6：参加了全部项目的员工号码和姓名；
-- SELECT ESSN,
--     ENAME
-- FROM EMPLOYEE
-- WHERE NOT EXISTS (
--         SELECT PNO
--         FROM PROJECT
--         WHERE NOT EXISTS (
--                 SELECT ESSN
--                 FROM WORKS_ON
--                 WHERE ESSN = EMPLOYEE.ESSN
--                     AND PNO = PROJECT.PNO
--             )
--     );
SELECT EMPLOYEE.ESSN,
    ENAME
FROM EMPLOYEE
    JOIN WORKS_ON ON EMPLOYEE.ESSN = WORKS_ON.ESSN
GROUP BY EMPLOYEE.ESSN,
    ENAME
HAVING COUNT(DISTINCT WORKS_ON.PNO) = (
        SELECT COUNT(*)
        FROM PROJECT
    );
-- 7：员工平均工资低于3000元的部门名称；
SELECT DNAME
FROM DEPARTMENT d,
    EMPLOYEE e
GROUP BY d.DNO
HAVING AVG(e.SALARY) < 3000;
-- 8：至少参与了3个项目且工作总时间不超过8小时的员工名字；
select ENAME
from EMPLOYEE
    natural join WORKS_ON
group by ESSN
having count(PNO) >= 3
    and sum(HOURS) <= 8;
-- 9：每个部门的员工小时平均工资；
SELECT DNO,
    sum(SALARY) / sum(HOURS) as AVGSALARYPERHOUR
from EMPLOYEE
    join WORKS_ON on EMPLOYEE.ESSN = WORKS_ON.ESSN
GROUP BY DNO;