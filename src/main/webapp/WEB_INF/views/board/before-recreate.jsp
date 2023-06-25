<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 작성</title>
<style>
	.content {
		width : 300px;
		height : 200px;
	}
</style>
</head>
<body>
	<h1>답글 작성</h1>
	<h1>${board.bId }</h1>
	<h1>${board.bGroup}</h1>
	<h1>${board.bOrder}</h1>
	<form action="/board/recreate" method="POST">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="bWriter" value="${user.username }"/>
		<input type="hidden" name="bId" value="${board.bId}"/>
		<input type="hidden" name="bGroup" value="${board.bGroup}">
		<input type="hidden" name="bOrder" value="${board.bOrder}">
		<input type="hidden" name="bDepth" value="${board.bDepth}">
		<p><input type="text" name="bTitle" maxlength="20" minlength="2" placeholder="제목 : "/></p>
		<textarea class="content" name="bContent" placeholder="내용 : "></textarea>
		<p><input type=submit value="작성"/></p>
	</form>
</body>
</html>