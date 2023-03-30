DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `num` varchar(3) NOT NULL,
  `d_num` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `class_fk_department` (`d_num`),
  CONSTRAINT `class_fk_department` FOREIGN KEY (`d_num`) REFERENCES `department` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `num` varchar(3) NOT NULL,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `num` varchar(3) NOT NULL,
  `name` varchar(15) NOT NULL,
  `t_num` varchar(10) NOT NULL DEFAULT '0172510217',
  PRIMARY KEY (`num`),
  KEY `course_fk_teacher` (`t_num`),
  CONSTRAINT `course_fk_teacher` FOREIGN KEY (`t_num`) REFERENCES `teacher` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `num` varchar(3) NOT NULL,
  `name` varchar(15) NOT NULL,
  `c_num` varchar(3) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `department_fk_college` (`c_num`),
  CONSTRAINT `department_fk_college` FOREIGN KEY (`c_num`) REFERENCES `college` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `dorm`;
CREATE TABLE `dorm` (
  `num` varchar(3) NOT NULL,
  `c_num` varchar(3) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `c_num` (`c_num`),
  CONSTRAINT `dorm_ibfk_1` FOREIGN KEY (`c_num`) REFERENCES `college` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `laboratory`;
CREATE TABLE `laboratory` (
  `num` varchar(3) NOT NULL,
  `name` varchar(10) NOT NULL,
  `c_num` varchar(3) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `laboratory_fk_college` (`c_num`),
  CONSTRAINT `laboratory_fk_college` FOREIGN KEY (`c_num`) REFERENCES `college` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc` (
  `cnum` varchar(3) NOT NULL,
  `snum` varchar(10) NOT NULL,
  `grade` varchar(3) DEFAULT '60',
  PRIMARY KEY (`cnum`,`snum`),
  KEY `grade_fk_snum` (`snum`),
  CONSTRAINT `grade_fk_cnum` FOREIGN KEY (`cnum`) REFERENCES `course` (`num`),
  CONSTRAINT `grade_fk_snum` FOREIGN KEY (`snum`) REFERENCES `student` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `num` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `c_num` varchar(3) NOT NULL DEFAULT '001',
  `age` varchar(3) DEFAULT '20',
  `gender` varchar(3) DEFAULT '男',
  `balance` int DEFAULT '100',
  PRIMARY KEY (`num`),
  KEY `stu2class` (`c_num`),
  KEY `name_index` (`name` DESC),
  CONSTRAINT `stu2class` FOREIGN KEY (`c_num`) REFERENCES `class` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `num` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `d_num` varchar(3) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `d_num` (`d_num`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`d_num`) REFERENCES `department` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;