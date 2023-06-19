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
	<h1>유저 상세페이지</h1>
	<table>
		<hr>
		<tr>
			<td>${user.username}</td>
			<td>${user.uName }</td>
      		<td>${user.uDateTime }</td>
		</tr>
	</table>
</body>
</html>