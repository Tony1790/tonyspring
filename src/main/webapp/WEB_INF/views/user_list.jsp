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
	<h1>회원 목록</h1>
	<table>
	      	<tr>
	      		<td>id</td>
	      		<td>name</td>
	      		<td>date</td>
	      	</tr>
	      	<c:forEach var="userList" items="${userList }">
		      	<tr>
		      		<td>
		      			<a href="/user/detail?username=${userList.username }">${userList.username }</a>
		      		</td>
		      		<td>${userList.uName }</td>
		      		<td>${userList.uDateTime }</td>
		      	</tr>
	      	</c:forEach>
      </table>
</body>
</html>