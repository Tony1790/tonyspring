<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>편집페이지</title>
<style>
	.content {
		width : 300px;
		height : 200px;
	}
</style>
</head>
<body>
	<h1>게시글 수정</h1>
	<form action="/board/edit?bId=${board.bId}" method="POST">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">		
		<input type="hidden" value="${board.bId}">	
		<p><input type="text" name="bTitle" placeholder="${board.bTitle}" maxlength="20" minlength="2"/></p>	
		<textarea class="content" name="bContent" placeholder="${board.bContent}"></textarea>	
		<p><input type=submit value="작성"/></p>	
	</form>
</body>
</html>