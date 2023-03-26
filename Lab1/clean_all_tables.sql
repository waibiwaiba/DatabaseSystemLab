USE company;
SET FOREIGN_KEY_CHECKS = 0;
-- 禁用外键约束
TRUNCATE TABLE department;
TRUNCATE TABLE project;
TRUNCATE TABLE employee;
TRUNCATE TABLE works_on;
SET FOREIGN_KEY_CHECKS = 1;
-- 启用外键约束
