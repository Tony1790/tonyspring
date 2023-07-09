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

-- 테이블 데이터 tonyspring.spring_session:~1 rows (대략적) 내보내기
INSERT INTO `spring_session` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES
	('42d899f2-cb1d-46db-9065-f8e1c7ef2f59', '64abdb6b-d244-4188-a724-bc54461e6d30', 1688934544436, 1688934544436, 7200, 1688941744436, NULL),
	('4e8ee6bd-0f9b-4f09-a413-24d1c2a689ab', '61d2d672-ad97-40e4-b7b6-11b292d00318', 1688933837280, 1688934698654, 7200, 1688941898654, 'manager');

-- 테이블 tonyspring.spring_session_attributes 구조 내보내기
CREATE TABLE IF NOT EXISTS `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `spring_session_attributes_ibfk_1` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 tonyspring.spring_session_attributes:~1 rows (대략적) 내보내기
INSERT INTO `spring_session_attributes` (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`, `ATTRIBUTE_BYTES`) VALUES
	('4e8ee6bd-0f9b-4f09-a413-24d1c2a689ab', 'SPRING_SECURITY_CONTEXT', _binary 0xaced00057372003d6f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e636f6e746578742e5365637572697479436f6e74657874496d706c000000000000023a0200014c000e61757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b78707372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e000000000000023a0200024c000b63726564656e7469616c737400124c6a6176612f6c616e672f4f626a6563743b4c00097072696e636970616c71007e0004787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c7371007e0004787001737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00067870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000001770400000001737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f72697479000000000000023a0200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000a524f4c455f41444d494e7871007e000d737200486f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e61757468656e7469636174696f6e2e57656241757468656e7469636174696f6e44657461696c73000000000000023a0200024c000d72656d6f74654164647265737371007e000f4c000973657373696f6e496471007e000f787074000f303a303a303a303a303a303a303a3174002466373662303533362d313633372d343831372d613865642d6164336461636532663661627073720022636f6d2e746f6e79737072696e672e6578616d706c652e646f6d61696e2e5573657200000000000000010200095a001369734163636f756e744e6f6e457870697265645a001269734163636f756e744e6f6e4c6f636b65645a0017697343726564656e7469616c734e6f6e457870697265645a00096973456e61626c65644c000b617574686f72697469657371007e00064c000870617373776f726471007e000f4c0009754461746554696d657400194c6a6176612f74696d652f4c6f63616c4461746554696d653b4c0005754e616d6571007e000f4c0008757365726e616d6571007e000f7870010101017371007e000c0000000177040000000171007e00107874003c243261243130244131585448465073556456737750733836743361797563666369766c6a61526c6d385532485453426c2e594f50544d6f48442e68717372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770a05000007e706121733d1787400076d616e616765727400076d616e61676572);

-- 테이블 tonyspring.tn_attach 구조 내보내기
CREATE TABLE IF NOT EXISTS `tn_attach` (
  `UUID` varchar(255) NOT NULL,
  `uploadPath` varchar(255) NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `fileType` char(1) DEFAULT 'I',
  `b_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 tonyspring.tn_attach:~4 rows (대략적) 내보내기
INSERT INTO `tn_attach` (`UUID`, `uploadPath`, `fileName`, `fileType`, `b_id`) VALUES
	('95f74088-2a62-4036-a687-8ca58fb1d4d2', '2023\\07\\09', '1111.png', '1', 44),
	('5489d669-8077-4b83-98bf-d4970617c992', '2023\\07\\09', '2222.png', '1', 44),
	('98ee13f0-fdee-4d26-8fcb-cbf8dbc5293e', '2023\\07\\09', '3333.png', '1', 44),
	('7e57726f-cb1a-45dc-9315-a6624d572c21', '2023\\07\\09', '4444.png', '1', 44),
	('bd4a9aef-2b69-4cf9-98bf-82c046ca6d40', '2023\\07\\10', '1111.png', '1', 50),
	('0437bc1a-290c-40a6-90f2-50d486722b72', '2023\\07\\10', '2222.png', '1', 50),
	('dc162d5e-0e17-42e3-9068-98d87bb023fd', '2023\\07\\10', '3333.png', '1', 50),
	('5e0f0a92-1263-494d-98f3-085a03d5d214', '2023\\07\\10', '4444.png', '1', 50);

-- 테이블 tonyspring.tn_auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `tn_auth` (
  `u_id` varchar(50) NOT NULL,
  `u_auth` varchar(50) NOT NULL,
  PRIMARY KEY (`u_id`,`u_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 tonyspring.tn_auth:~8 rows (대략적) 내보내기
INSERT INTO `tn_auth` (`u_id`, `u_auth`) VALUES
	('dong', 'ROLE_USER'),
	('emma', 'ROLE_USER'),
	('manager', 'ROLE_ADMIN'),
	('peter', 'ROLE_USER'),
	('tom', 'ROLE_USER'),
	('tom1', 'ROLE_ADMIN'),
	('tony', 'ROLE_ADMIN'),
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 tonyspring.tn_board:~15 rows (대략적) 내보내기
INSERT INTO `tn_board` (`b_id`, `b_title`, `b_content`, `b_writer`, `b_datetime`, `b_group`, `b_order`, `b_depth`) VALUES
	(28, 'origin 1', '', 'manager', '2023-06-27 15:40:16', 28, 0, 0),
	(29, 'org 1 reply 1', '', 'manager', '2023-06-27 15:40:26', 28, 1, 1),
	(30, 'org1 reply 1 reply 1', '', 'manager', '2023-06-27 15:40:46', 28, 2, 2),
	(31, 'Principal principal', 'Principal principal', 'manager', '2023-06-28 22:52:45', 31, 0, 0),
	(32, 'org2 reply 1', '', 'manager', '2023-06-28 22:53:02', 31, 4, 1),
	(33, 'org 2 reply 2', '', 'manager', '2023-06-28 22:53:34', 31, 1, 1),
	(34, 'org 2 reply 2 reply2', '', 'manager', '2023-06-28 22:54:06', 31, 5, 2),
	(35, 'org 2 re 2 rere 2', '', 'manager', '2023-06-28 22:55:04', 31, 3, 2),
	(36, 'org 2 re 2 rere 2', '', 'manager', '2023-06-28 22:55:08', 31, 2, 2),
	(38, 'test1', 'test1', 'manager', '2023-07-09 21:23:19', 38, 0, 0),
	(39, 'test4', 'test4', 'manager', '2023-07-09 21:27:04', 39, 0, 0),
	(41, 'test999', 'test999', 'manager', '2023-07-09 21:35:42', 41, 0, 0),
	(44, '테스트1', '테스트1', 'manager', '2023-07-09 21:44:14', 44, 0, 0),
	(50, '1234', '1234', 'manager', '2023-07-10 05:30:45', 50, 0, 0);

-- 테이블 tonyspring.tn_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `tn_comment` (
  `c_id` int(10) NOT NULL AUTO_INCREMENT,
  `b_id` int(10) NOT NULL,
  `c_content` varchar(255) DEFAULT NULL,
  `c_writer` varchar(255) DEFAULT NULL,
  `c_date` timestamp NULL DEFAULT current_timestamp(),
  `c_group` int(10) NOT NULL DEFAULT 0,
  `c_order` int(10) NOT NULL DEFAULT 0,
  `c_depth` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`c_id`),
  KEY `tn_comment_ibfk_1` (`b_id`),
  CONSTRAINT `tn_comment_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `tn_board` (`b_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 tonyspring.tn_comment:~29 rows (대략적) 내보내기
INSERT INTO `tn_comment` (`c_id`, `b_id`, `c_content`, `c_writer`, `c_date`, `c_group`, `c_order`, `c_depth`) VALUES
	(1, 28, '111', 'manager', '2023-06-27 07:06:23', 1, 0, 0),
	(2, 28, '1112', 'manager', '2023-06-27 07:08:19', 2, 0, 0),
	(3, 28, '123', 'manager', '2023-06-27 07:35:18', 3, 0, 0),
	(4, 28, '123', 'manager', '2023-06-27 07:53:48', 4, 0, 0),
	(5, 28, 'ㅁㄴㅇ', 'manager', '2023-06-27 08:01:26', 5, 0, 0),
	(7, 28, '123', 'manager', '2023-06-27 08:42:55', 7, 0, 0),
	(8, 28, 'zxcv', 'manager', '2023-06-27 08:57:53', 8, 0, 0),
	(9, 28, '12222', 'manager', '2023-06-27 08:59:39', 9, 0, 0),
	(10, 28, '123', 'manager', '2023-06-27 09:00:44', 10, 0, 0),
	(11, 28, '핳하', 'manager', '2023-06-27 09:01:00', 11, 0, 0),
	(12, 28, 'ㅁㄴㅇㄹ', 'manager', '2023-06-27 09:01:24', 12, 0, 0),
	(13, 28, 'ㅁㄴㅇㄹ', 'manager', '2023-06-27 09:01:27', 13, 0, 0),
	(14, 28, 'ㅁㄴㅇㄹ', 'manager', '2023-06-27 09:01:37', 14, 0, 0),
	(15, 28, '7888', 'manager', '2023-06-27 09:01:42', 15, 0, 0),
	(16, 29, '1\n', 'manager', '2023-06-27 09:01:57', 16, 0, 0),
	(17, 29, '222\n', 'manager', '2023-06-27 09:03:08', 17, 0, 0),
	(18, 29, '333\n', 'manager', '2023-06-27 09:03:18', 18, 0, 0),
	(19, 29, '444', 'manager', '2023-06-27 09:06:00', 19, 0, 0),
	(20, 29, '555', 'manager', '2023-06-27 09:06:03', 20, 0, 0),
	(22, 28, '댓글\n', 'manager', '2023-06-28 13:57:18', 22, 0, 0),
	(23, 28, 'reply1', 'manager', '2023-06-28 13:57:36', 22, 3, 1),
	(24, 28, 'reply2', 'manager', '2023-06-28 13:57:54', 22, 1, 1),
	(25, 28, 'reply1 reply1', 'manager', '2023-06-28 13:58:20', 22, 4, 2),
	(26, 28, 'reply2 reply 1', 'manager', '2023-06-28 13:58:35', 22, 2, 2),
	(27, 28, 'reply1 reply11', 'manager', '2023-06-28 13:59:37', 22, 5, 3),
	(28, 28, 'reply1 reply111', 'manager', '2023-06-28 13:59:43', 22, 6, 4),
	(29, 31, 'r1', 'manager', '2023-07-01 05:42:00', 29, 0, 0),
	(30, 31, 'r2', 'manager', '2023-07-01 05:42:02', 30, 0, 0),
	(31, 31, 'r3', 'manager', '2023-07-01 05:42:04', 31, 0, 0),
	(32, 31, '12345', 'peter', '2023-07-03 11:57:34', 29, 1, 1),
	(33, 50, '123', 'manager', '2023-07-09 20:31:19', 33, 0, 0),
	(34, 50, '321', 'manager', '2023-07-09 20:31:21', 34, 0, 0);

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
	('peter', '$2a$10$lGivGG9OG4YYO5g4dApSzebQ5XqcEaJQNyHjth8NDgXF3YBXcX1e6', 'parker', '2023-07-01 17:14:54', b'1', b'1', b'1', b'1'),
	('tony', '$2a$10$06d5pxUKufmu8nXjR6a9.uZiGfi0kZSSM6HN7noZoBXu.193Fb6t2', 'tony', '2023-06-15 09:44:31', b'1', b'1', b'1', b'1');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
