<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성하기</title>
<style>
	.content {
		width : 300px;
		height : 200px;
	}
</style>
</head>
<body>
	<h1>게시글 작성하기</h1>
	
	<form action="/board/create" method="POST">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">		
		<input type="hidden" name="bWriter" value="${user.username }"/>	
		<p><input type="text" name="bTitle" maxlength="20" minlength="2"/></p>	
		<textarea class="content" name="bContent" placeholder="내용 : "></textarea>	
		<p><input type=submit value="작성"/></p>	
	</form>
</body>
</html>