<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>마이 페이지</h1>
	<hr>
		<div>
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal" var="principal"/>
				<h2>${principal}</h2>
				<a href="/user/before_edit?username=${principal.username}">회원정보 수정</a>
				<a href="/user/delete?username=${principal.username}" onclick="return confirm('정말 삭제하시겠습니까?')">회원 탈퇴</a>
			</sec:authorize>
			<p>
				<a href="/">돌아가기</a>
			</p>
		</div>
</body>
</html>