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
		<div>
			<ul>
				<c:choose>
					<c:when test="${pagination.prevPage >= 1}">
						<li><a href="/?page=${pagination.prevPage}"> ◁ </a></li>
					</c:when>
				</c:choose>
				<c:forEach var="i" begin="${pagination.startPage}"
					end="${pagination.endPage}" step="1">
					<c:choose>
						<c:when test="${pagination.page == i}">
							<li><span>${i}</span></li>
						</c:when>
						<c:when test="${pagination.page != i}">
							<li><a href="/?page=${i}">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pagination.nextPage <= pagination.lastPage}">
						<li><a herf="/?page=${pagination.nextPage}">▷</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
</body>
</html>