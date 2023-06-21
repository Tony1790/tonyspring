<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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