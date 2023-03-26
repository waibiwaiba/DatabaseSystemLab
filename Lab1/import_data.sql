USE company;
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


LOAD DATA LOCAL INFILE 'D:/VSCODE/DatabaseSystemLab/Lab1/dbms_lab/department.txt' INTO TABLE department;
LOAD DATA LOCAL INFILE 'D:/VSCODE/DatabaseSystemLab/Lab1/dbms_lab/employee.txt' INTO TABLE employee;
LOAD DATA LOCAL INFILE 'D:/VSCODE/DatabaseSystemLab/Lab1/dbms_lab/project.txt' INTO TABLE project;
LOAD DATA LOCAL INFILE 'D:/VSCODE/DatabaseSystemLab/Lab1/dbms_lab/works_on.txt' INTO TABLE works_on;