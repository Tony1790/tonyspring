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
	<h1>Home</h1>
		<hr>
		<div>
			<sec:authorize access="isAnonymous()">
				<a href="/login">로그인</a>
				<a href="/beforeSignUp">회원가입</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<a href="/logout">로그아웃</a>
				<sec:authentication property="principal" var="principal"/>
				<h2>${principal}</h2>
				<!-- principal은 현재 인증된 사용자. 
				Spring Security를 사용하는 경우, principal은 보통 UserDetails 객체를 참조하게 됩니다. 
				UserDetails는 사용자의 유저네임, 패스워드, 권한 정보 등을 포함하고 있습니다. -->
			</sec:authorize>
		</div>
		<div>
			<sec:authorize access="isAuthenticated()">
				<a href="/user/info">내 정보</a>
				<a href="/admin">관리자</a>
			</sec:authorize>
		</div>
		 <table>
      	<tr>
      		<td>id</td>
      		<td>title</td>
      		<td>content</td>
      		<td>writer</td>
      	</tr>
      	<c:forEach var="list" items="${list }">
	      	<tr>
	      		<td>${list.bId }</td>
	      		<td>${list.bTitle }</td>
	      		<td>${list.bContent }</td>
	      		<td>${list.bWriter }</td>
	      		<td>${list.bDateTime }</td>
	      	</tr>
      	</c:forEach>
      </table>
</body>
</html>