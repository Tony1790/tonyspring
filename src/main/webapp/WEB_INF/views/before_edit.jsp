<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 수정</title>
</head>
<body>
	<h1>회원 정보 수정</h1>
	<hr>
	<form action="/user/edit" method="POST">
	<!-- crsf -->
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="username" value="${user.username}">
		<input type="text" name="uName"  placeholder="${user.uName }">
		<input type="password" name="password" placeholder="password 변경">
		<button type="submit">수정하기</button>
	</form>
</body>
</html>