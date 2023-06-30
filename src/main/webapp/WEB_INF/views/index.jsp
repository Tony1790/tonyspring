<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
				<h2>${principal.username}</h2>
				<!-- principal은 현재 인증된 사용자. 
				Spring Security를 사용하는 경우, principal은 보통 UserDetails 객체를 참조하게 됩니다. 
				UserDetails는 사용자의 유저네임, 패스워드, 권한 정보 등을 포함하고 있습니다. -->
			</sec:authorize>
			<form action="/search" method="get" class="search_form">
				<select name="category" class="search_option">
					<option value="">검색</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="both">제목+내용</option>
					<option value="writer">작성자</option>
				</select> 
				<input type="text" name="keyword" class="search_keyword" size=10></input>
				<button type=submit class="search_btn">검색</button>
			</form>
		</div>
		<div>
			<sec:authorize access="isAuthenticated()">
				<a href="/user/info">내 정보</a>
				<a href="/admin">관리자</a>
				<a href="/board/before-create">게시글 작성하기</a>
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
			      		<td><a href="/board/detail?bId=${list.bId }">${list.bTitle }</a></td>
			      		<td><a href="/board/detail?bId=${list.bId }">${list.bContent }</a></td>
			      		<td>${list.bWriter }</td>
			      		<td>${list.bDateTime }</td>
	      			</tr>
	      	</c:forEach>
      </table>
      <div>
      	<ul>
			<c:choose>
				<c:when test="${pagination.prevPage >= 1}">
					<li>
						<a href="/?page=${pagination.prevPage}">
							◁
						</a>
					</li>
				</c:when>
			</c:choose>
			<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
				<c:choose>
					<c:when test="${pagination.page == i}">
						<li>
							<span>${i}</span>
						</li>
					</c:when>
					<c:when test="${pagination.page != i}">
						<li>
							<a href="/?page=${i}">${i}</a>
						</li>						
					</c:when>
				</c:choose>			
			</c:forEach>   
			<c:choose>
				<c:when test="${pagination.nextPage <= pagination.lastPage}">
					<li>
						<a href="/?page=${pagination.nextPage}">▷</a>
					</li>
				</c:when>
			</c:choose>   	
      	</ul>
      </div>
</body>
</html>



