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

-- 테이블 데이터 tonyspring.spring_session:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
INSERT INTO `spring_session` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES
	('c7209760-2cde-46c2-be3a-2267f96bb4b1', '5989abbd-58d2-42dd-afea-fdaf77415dd5', 1686880348358, 1686883154145, 7200, 1686890354145, 'tom');
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;

-- 테이블 데이터 tonyspring.spring_session_attributes:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
INSERT INTO `spring_session_attributes` (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`, `ATTRIBUTE_BYTES`) VALUES
	('c7209760-2cde-46c2-be3a-2267f96bb4b1', 'SPRING_SECURITY_CONTEXT', _binary 0xaced00057372003d6f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e636f6e746578742e5365637572697479436f6e74657874496d706c000000000000023a0200014c000e61757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b78707372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e000000000000023a0200024c000b63726564656e7469616c737400124c6a6176612f6c616e672f4f626a6563743b4c00097072696e636970616c71007e0004787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c7371007e0004787001737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00067870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000001770400000001737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f72697479000000000000023a0200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b7870740009524f4c455f555345527871007e000d737200486f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e61757468656e7469636174696f6e2e57656241757468656e7469636174696f6e44657461696c73000000000000023a0200024c000d72656d6f74654164647265737371007e000f4c000973657373696f6e496471007e000f787074000f303a303a303a303a303a303a303a3174002436613165393761362d313364392d343266382d613935312d3033383063653965653038327073720022636f6d2e746f6e79737072696e672e6578616d706c652e646f6d61696e2e5573657200000000000000010200095a001369734163636f756e744e6f6e457870697265645a001269734163636f756e744e6f6e4c6f636b65645a0017697343726564656e7469616c734e6f6e457870697265645a00096973456e61626c65644c000b617574686f72697469657371007e00064c000870617373776f726471007e000f4c0009754461746554696d6571007e000f4c0005754e616d6571007e000f4c0008757365726e616d6571007e000f7870010101017371007e000c0000000177040000000171007e00107874003c2432612431302454774849684236334a594e6f79566d52694d4561424f6463417873594c66595145455962424457734e362e6a6a53384e5a5a662e6570740003746f6d740003746f6d);
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;

-- 테이블 데이터 tonyspring.tn_auth:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tn_auth` DISABLE KEYS */;
INSERT INTO `tn_auth` (`u_id`, `u_auth`) VALUES
	('tom', 'ROLE_USER'),
	('tom1', 'ROLE_ADMIN'),
	('tony1', 'ROLE_USER'),
	('tony2', 'ROLE_USER');
/*!40000 ALTER TABLE `tn_auth` ENABLE KEYS */;

-- 테이블 데이터 tonyspring.tn_board:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tn_board` DISABLE KEYS */;
INSERT INTO `tn_board` (`b_id`, `b_title`, `b_content`, `b_writer`, `b_datetime`) VALUES
	(1, 'test1', 'test1', 'test1', '2023-06-12 11:53:30'),
	(2, 'test2', 'test2', 'test2', '2023-06-12 11:53:43'),
	(3, 'test3', 'test3', 'test3', '2023-06-12 11:53:49');
/*!40000 ALTER TABLE `tn_board` ENABLE KEYS */;

-- 테이블 데이터 tonyspring.tn_user:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tn_user` DISABLE KEYS */;
INSERT INTO `tn_user` (`u_id`, `u_password`, `u_name`, `u_datetime`, `u_isAccountNonExpired`, `u_isAccountNonLocked`, `u_isCredentialNonExpired`, `u_isEnabled`) VALUES
	('tom', '$2a$10$TwHIhB63JYNoyVmRiMEaBOdcAxsYLfYQEEYbBDWsN6.jjS8NZZf.e', 'tom', '2023-06-15 10:33:38', 1, 1, 1, 1),
	('tom1', '$2a$10$/6Ga5sZeU3y4OS7FW52M.uRVPo5tY8i3g2E8xeM7kuICdHLwkuW3m', 'tom1', '2023-06-15 10:52:36', 1, 1, 1, 1),
	('tony', '$2a$10$06d5pxUKufmu8nXjR6a9.uZiGfi0kZSSM6HN7noZoBXu.193Fb6t2', 'tony', '2023-06-15 09:44:31', 1, 1, 1, 1),
	('tony1', '$2a$10$oCXggttoK.nUbyZNvmqRJedMH82IUGf9yAMzYYfr6JrbvPTzg6Q6O', 'Antony', '2023-06-15 09:59:48', 1, 1, 1, 1),
	('tony2', '$2a$10$r.WnLb3wmeZs2DgyW70MbOD9WjShUDfKUV2FWgL2i3LYRt3Q.N.Ha', 'tony2', '2023-06-15 10:02:50', 1, 1, 1, 1);
/*!40000 ALTER TABLE `tn_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
