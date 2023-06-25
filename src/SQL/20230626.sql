-- --------------------------------------------------------
-- 호스트:                          localhost
-- 서버 버전:                        11.1.0-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- tonyspring 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `tonyspring` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `tonyspring`;

-- 테이블 tonyspring.spring_session 구조 내보내기
CREATE TABLE IF NOT EXISTS `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 tonyspring.spring_session:~4 rows (대략적) 내보내기
INSERT INTO `spring_session` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES
	('5e2165ef-4089-4398-bc1c-87f2370a0220', '6830e3b3-288b-456b-aec0-13c65245f8b3', 1687712114943, 1687712114943, 7200, 1687719314943, NULL),
	('62c3bbcd-73f2-47c1-aa4d-91aa24857888', '54a946cd-39c6-401a-a0c6-008c6f10372f', 1687711576375, 1687711576375, 7200, 1687718776375, NULL),
	('e06bef8d-a1cc-4c9c-a06d-14cb250cb627', '92a4a9e5-354e-431e-a51a-0da036463a3b', 1687711386866, 1687711386897, 7200, 1687718586897, NULL);

-- 테이블 tonyspring.spring_session_attributes 구조 내보내기
CREATE TABLE IF NOT EXISTS `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `spring_session_attributes_ibfk_1` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 tonyspring.spring_session_attributes:~1 rows (대략적) 내보내기

-- 테이블 tonyspring.tn_auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `tn_auth` (
  `u_id` varchar(50) NOT NULL,
  `u_auth` varchar(50) NOT NULL,
  PRIMARY KEY (`u_id`,`u_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 tonyspring.tn_auth:~7 rows (대략적) 내보내기
INSERT INTO `tn_auth` (`u_id`, `u_auth`) VALUES
	('dong', 'ROLE_USER'),
	('emma', 'ROLE_USER'),
	('manager', 'ROLE_ADMIN'),
	('tom', 'ROLE_USER'),
	('tom1', 'ROLE_ADMIN'),
	('tony1', 'ROLE_USER'),
	('tony2', 'ROLE_USER');

-- 테이블 tonyspring.tn_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `tn_board` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_title` varchar(200) NOT NULL,
  `b_content` text NOT NULL,
  `b_writer` varchar(50) NOT NULL,
  `b_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `b_group` int(11) DEFAULT NULL,
  `b_order` int(11) DEFAULT 0,
  `b_depth` int(11) DEFAULT 0,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 tonyspring.tn_board:~7 rows (대략적) 내보내기
INSERT INTO `tn_board` (`b_id`, `b_title`, `b_content`, `b_writer`, `b_datetime`, `b_group`, `b_order`, `b_depth`) VALUES
	(16, '원글 1', '원글 1', 'manager', '2023-06-25 21:50:57', 16, 1, 0),
	(17, '답글1', '답글1', 'manager', '2023-06-25 21:51:13', 16, 1, 1),
	(18, '답글1의 답글1', '답글1의 답글1', 'manager', '2023-06-25 21:51:44', 17, 1, 1),
	(19, '답글1의 답글1', '답글1의 답글1', 'manager', '2023-06-25 21:54:20', 17, 1, 1),
	(20, '답글1의 답글1', '답글1의 답글1', 'manager', '2023-06-25 21:54:28', 17, 1, 1),
	(21, '답글2', '답글2', 'manager', '2023-06-25 21:55:00', 16, 1, 1),
	(22, '답글2', '답글2', 'manager', '2023-06-25 21:55:02', 16, 1, 1),
	(23, '답글2', '답글2', 'manager', '2023-06-25 23:36:08', 16, 1, 1);

-- 테이블 tonyspring.tn_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `tn_user` (
  `u_id` varchar(50) NOT NULL,
  `u_password` varchar(200) NOT NULL,
  `u_name` varchar(50) NOT NULL,
  `u_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `u_isAccountNonExpired` bit(1) NOT NULL,
  `u_isAccountNonLocked` bit(1) NOT NULL,
  `u_isCredentialNonExpired` bit(1) NOT NULL,
  `u_isEnabled` bit(1) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 tonyspring.tn_user:~2 rows (대략적) 내보내기
INSERT INTO `tn_user` (`u_id`, `u_password`, `u_name`, `u_datetime`, `u_isAccountNonExpired`, `u_isAccountNonLocked`, `u_isCredentialNonExpired`, `u_isEnabled`) VALUES
	('manager', '$2a$10$A1XTHFPsUdVswPs86t3ayucfcivljaRlm8U2HTSBl.YOPTMoHD.hq', 'manager', '2023-06-18 23:51:46', b'1', b'1', b'1', b'1'),
	('tony', '$2a$10$06d5pxUKufmu8nXjR6a9.uZiGfi0kZSSM6HN7noZoBXu.193Fb6t2', 'tony', '2023-06-15 09:44:31', b'1', b'1', b'1', b'1');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
