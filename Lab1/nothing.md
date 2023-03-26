Windows 操作系统中有类似 Unix 系统下的 script logfile 命令的功能，可以记录命令行会话的输入和输出到指定的文件中。

该命令为 Start-Transcript，使用方法如下：

打开 PowerShell 命令行工具。
输入 `Start-Transcript -Path "logfile.txt" -Append`命令，其中 logfile.txt 是指定的日志文件路径。
执行需要记录的命令。
输入 `Stop-Transcript` 命令停止记录。
执行以上命令后，所有在 Start-Transcript 和 Stop-Transcript 之间执行的命令及其输出都会被记录在指定的日志文件中。

linux:
`script logfile`
In the end of your session just type `exit`.
All your console output will be recorded to the file logfile.

CREATE TABLE IF NOT EXISTS `EMPLOYEE` (
    `ENAME` varchar(20) DEFAULT NULL,
    `ESSN` varchar(20) NOT NULL,
    `ADDRESS` varchar(50) DEFAULT NULL,
    `SALARY` varchar(10) DEFAULT NULL,
    `SUPERSSN` varchar(25) DEFAULT NULL,
    `DNO` varchar(10) DEFAULT NULL,
    PRIMARY KEY (`ESSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

describe `EMPLOYEE`;

CREATE TABLE IF NOT EXISTS `DEPARTMENT` (
  `DNAME` varchar(30) DEFAULT NULL,
  `DNO` varchar(20) NOT NULL,
  `MGRSSN` varchar(20) DEFAULT NULL,
  `MGRSTARTDATE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

describe `DEPARTMENT`;

CREATE TABLE IF NOT EXISTS `PROJECT` (
  `PNAME` varchar(30) DEFAULT NULL,
  `PNO` varchar(20) NOT NULL,
  `PLOCATION` varchar(50) DEFAULT NULL,
  `DNO` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

describe `PROJECT`;

CREATE TABLE IF NOT EXISTS `WORKS_ON` (
  `ESSN` varchar(20) NOT NULL,
  `PNO` varchar(20) NOT NULL,
  `HOURS` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ESSN`, `PNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

describe `WORKS_ON`;


LOAD DATA LOCAL INFILE "D:\pet.txt" INTO TABLE pet;
LOAD DATA LOCAL INFILE "D:\VSCODE\DatabaseSystemLab\Lab1\dbms_lab\department.txt" INTO TABLE department;---fail
LOAD DATA LOCAL INFILE 'D:/VSCODE/DatabaseSystemLab/Lab1/dbms_lab/department.txt' INTO TABLE department;
LOAD DATA LOCAL INFILE 'D:/VSCODE/DatabaseSystemLab/Lab1/dbms_lab/employee.txt' INTO TABLE employee;
LOAD DATA LOCAL INFILE 'D:/VSCODE/DatabaseSystemLab/Lab1/dbms_lab/project.txt' INTO TABLE project;
LOAD DATA LOCAL INFILE 'D:/VSCODE/DatabaseSystemLab/Lab1/dbms_lab/works_on.txt' INTO TABLE works_on;

-- 获取数据库中所有表格的名称
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'company';

-- 对每个表格执行DESCRIBE指令
SET @database_name = 'company';
SET @query = '';

SELECT CONCAT('DESCRIBE ', table_name, ';') INTO @query 
FROM information_schema.tables 
WHERE table_schema = @database_name;

PREPARE stmt FROM @query;
EXECUTE stmt;

mysql -u username -p company < D:\VSCODE\DatabaseSystemLab\Lab1\sql_script.sql > D:\VSCODE\DatabaseSystemLab\Lab1\output.txt

for powershell:
Invoke-Expression "mysql -u username -p company < D:\VSCODE\DatabaseSystemLab\Lab1\sql_script.sql > D:\VSCODE\DatabaseSystemLab\Lab1\output.txt"


mysql -u username -p company --default-character-set=utf8 -e "source .\\Lab1\\sql_script.sql" > D:\VSCODE\DatabaseSystemLab\Lab1\output.txt



mysql -u username -p company -e "source D:\\VSCODE\\DatabaseSystemLab\\Lab1\\sql_script.sql" > D:\VSCODE\DatabaseSystemLab\Lab1\output.txt

mysql -u username -p company -e "source .\\Lab1\\sql_script.sql" > D:\VSCODE\DatabaseSystemLab\Lab1\output.txt

mysql -u root -p company -e "source .\Lab1\sql_script.sql" | Out-File -Encoding UTF8 -FilePath "D:\VSCODE\DatabaseSystemLab\Lab1\output.txt"

mysql -u root -p company -e "source .\Lab1\sql_script.sql"

mysql -u root -p company -e "source .\Lab1\sql_script.sql" | Out-File -Encoding Default -FilePath "D:\VSCODE\DatabaseSystemLab\Lab1\output.txt"


ALTER DATABASE company CHARACTER SET utf8 COLLATE utf8_general_ci;
mysql > use company;
mysql > SHOW VARIABLES LIKE 'character_set_database';
+------------------------+--------+
| Variable_name          | Value  |
+------------------------+--------+
| character_set_database | latin1 |
+------------------------+--------+
1 row in set, 1 warning (0.00 sec)

mysql> SHOW VARIABLES LIKE 'character_set_server';
+----------------------+-------+
| Variable_name        | Value |
+----------------------+-------+
| character_set_server | utf8  |
+----------------------+-------+
1 row in set, 1 warning (0.00 sec)


TRUNCATE TABLE 