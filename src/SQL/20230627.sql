-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.11-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
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

-- 테이블 데이터 tonyspring.spring_session:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
REPLACE INTO `spring_session` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES
	('b70d56ac-df91-4532-8932-84e1abf5e0aa', '1f529767-a6cc-43cf-9374-b6f90c71fdab', 1687831928569, 1687833788381, 7200, 1687840988381, 'tony');
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;

-- 테이블 tonyspring.spring_session_attributes 구조 내보내기
CREATE TABLE IF NOT EXISTS `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `spring_session_attributes_ibfk_1` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 tonyspring.spring_session_attributes:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
REPLACE INTO `spring_session_attributes` (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`, `ATTRIBUTE_BYTES`) VALUES
	('b70d56ac-df91-4532-8932-84e1abf5e0aa', 'SPRING_SECURITY_CONTEXT', _binary 0xaced00057372003d6f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e636f6e746578742e5365637572697479436f6e74657874496d706c000000000000023a0200014c000e61757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b78707372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e000000000000023a0200024c000b63726564656e7469616c737400124c6a6176612f6c616e672f4f626a6563743b4c00097072696e636970616c71007e0004787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c7371007e0004787001737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00067870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000007704000000007871007e000d737200486f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e61757468656e7469636174696f6e2e57656241757468656e7469636174696f6e44657461696c73000000000000023a0200024c000d72656d6f7465416464726573737400124c6a6176612f6c616e672f537472696e673b4c000973657373696f6e496471007e000f787074000f303a303a303a303a303a303a303a3174002438633861303866632d313833342d343830352d393062372d3335303935316265326362637073720022636f6d2e746f6e79737072696e672e6578616d706c652e646f6d61696e2e5573657200000000000000010200095a001369734163636f756e744e6f6e457870697265645a001269734163636f756e744e6f6e4c6f636b65645a0017697343726564656e7469616c734e6f6e457870697265645a00096973456e61626c65644c000b617574686f72697469657371007e00064c000870617373776f726471007e000f4c0009754461746554696d657400194c6a6176612f74696d652f4c6f63616c4461746554696d653b4c0005754e616d6571007e000f4c0008757365726e616d6571007e000f7870010101017371007e000c000000007704000000007874003c24326124313024303664357078554b75666d75386e586a523661392e755a69476669306b5a53534d36484e376e6f5a6f4258752e31393346623674327372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770a05000007e7060f092ce078740004746f6e79740004746f6e79);
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;

-- 테이블 tonyspring.tn_auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `tn_auth` (
  `u_id` varchar(50) NOT NULL,
  `u_auth` varchar(50) NOT NULL,
  PRIMARY KEY (`u_id`,`u_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 tonyspring.tn_auth:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tn_auth` DISABLE KEYS */;
REPLACE INTO `tn_auth` (`u_id`, `u_auth`) VALUES
	('dong', 'ROLE_USER'),
	('emma', 'ROLE_USER'),
	('manager', 'ROLE_ADMIN'),
	('tom', 'ROLE_USER'),
	('tom1', 'ROLE_ADMIN'),
	('tony1', 'ROLE_USER'),
	('tony2', 'ROLE_USER');
/*!40000 ALTER TABLE `tn_auth` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 tonyspring.tn_board:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tn_board` DISABLE KEYS */;
REPLACE INTO `tn_board` (`b_id`, `b_title`, `b_content`, `b_writer`, `b_datetime`, `b_group`, `b_order`, `b_depth`) VALUES
	(41, '원글1', '', 'manager', '2023-06-27 10:05:01', 41, 0, 0),
	(42, '원글1의 답글1', '', 'manager', '2023-06-27 10:05:06', 41, 2, 1),
	(43, '원글1의 답글1의 답글1', '', 'manager', '2023-06-27 10:05:10', 41, 4, 2),
	(44, '원글1의 답글1의 답글2', '', 'manager', '2023-06-27 10:05:29', 41, 3, 2),
	(45, '원글1의 답글2', '', 'manager', '2023-06-27 10:05:48', 41, 1, 1),
	(46, '원글2', '', 'manager', '2023-06-27 10:13:48', 46, 0, 0),
	(47, '원글2의 답글1', '', 'manager', '2023-06-27 10:13:56', 46, 1, 1),
	(48, '원글2의 답글1의 답글1', '', 'manager', '2023-06-27 10:14:03', 46, 2, 2);
/*!40000 ALTER TABLE `tn_board` ENABLE KEYS */;

-- 테이블 tonyspring.tn_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `tn_comment` (
  `c_id` int(10) NOT NULL AUTO_INCREMENT,
  `b_id` int(10) NOT NULL,
  `c_content` varchar(255) DEFAULT NULL,
  `c_writer` varchar(255) DEFAULT NULL,
  `c_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `c_group` int(10) NOT NULL DEFAULT 0,
  `c_order` int(10) NOT NULL DEFAULT 0,
  `c_depth` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`c_id`),
  KEY `b_id` (`b_id`),
  CONSTRAINT `tn_comment_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `tn_board` (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 tonyspring.tn_comment:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tn_comment` DISABLE KEYS */;
REPLACE INTO `tn_comment` (`c_id`, `b_id`, `c_content`, `c_writer`, `c_date`, `c_group`, `c_order`, `c_depth`) VALUES
	(4, 46, 'ㅁㄴㅇㄹ', 'tony', '2023-06-27 11:29:50', 4, 0, 0),
	(5, 47, 'zxcv', 'tony', '2023-06-27 11:30:09', 5, 0, 0),
	(6, 46, 'ㅁㄴㅇ', 'tony', '2023-06-27 11:43:08', 6, 0, 0);
/*!40000 ALTER TABLE `tn_comment` ENABLE KEYS */;

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
/*!40000 ALTER TABLE `tn_user` DISABLE KEYS */;
REPLACE INTO `tn_user` (`u_id`, `u_password`, `u_name`, `u_datetime`, `u_isAccountNonExpired`, `u_isAccountNonLocked`, `u_isCredentialNonExpired`, `u_isEnabled`) VALUES
	('manager', '$2a$10$A1XTHFPsUdVswPs86t3ayucfcivljaRlm8U2HTSBl.YOPTMoHD.hq', 'manager', '2023-06-18 23:51:46', b'1', b'1', b'1', b'1'),
	('tony', '$2a$10$06d5pxUKufmu8nXjR6a9.uZiGfi0kZSSM6HN7noZoBXu.193Fb6t2', 'tony', '2023-06-15 09:44:31', b'1', b'1', b'1', b'1');
/*!40000 ALTER TABLE `tn_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;