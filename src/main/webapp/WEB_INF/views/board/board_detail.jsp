<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세페이지</title>
</head>
<body>
	<h1>게시글 상세페이지</h1>
	<table>
		<tr>
			<td colspan="2"> 제목 : ${board.bTitle}</td>
			<td>작성일자 : ${board.bDateTime}</td>
		</tr>
		<tr>
			<td colspan="2">작성자 : ${board.bWriter}</td>
			<td>조회수 : </td>
			<td>댓글수 : </td>
		</tr>
		
		<tr>
			<td>내용 : ${board.bContent}</td>
		</tr>
		<tr>
			<td class="edit_td_btn">
				<a class="edit_btn" href="/board/before-edit?bId=${board.bId}">수정</a>
			</td>
			<td class="delete_td_btn">
				<a class="delete_btn" href="/board/delete?bId=${board.bId}" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
			</td>
			<td class="re_content_btn">
				<a class="re_content_btn" href="/board/beforeRecreate?bId=${board.bId}">답글</a>
			</td>
		</tr>
	</table>
</body>
</html>