<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 가입</h1>
	<hr>
	<span>${principal}</span>
	<form action="/signup" method="POST">
	<!-- crsf -->
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="text" name="username" placeholder="id 입력">
		<input type="text" name="uName" placeholder="name 입력">
		<input type="password" name="password" placeholder="password 입력">
		<button type="submit">가입하기</button>
	</form>
</body>
</html>