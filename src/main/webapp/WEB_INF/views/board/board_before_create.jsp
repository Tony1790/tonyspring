<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� �ۼ��ϱ�</title>
<style>
	.content {
		width : 300px;
		height : 200px;
	}
</style>
</head>
<body>
	<h1>�Խñ� �ۼ��ϱ�</h1>
	
	<form action="/board/create" method="POST">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">		
		<input type="hidden" name="bWriter" value="${user.username }"/>	
		<p><input type="text" name="bTitle" maxlength="20" minlength="2"/></p>	
		<textarea class="content" name="bContent" placeholder="���� : "></textarea>	
		<p><input type=submit value="�ۼ�"/></p>	
	</form>
</body>
</html>