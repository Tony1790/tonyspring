<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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

	<div class="cmt_container">
		<div class=cmt_box>
			<div class="cmt_count_box">
				<span>댓글 수 : </span>
			</div>
			<div class="cmt_list">
				<ul>

				</ul>
			</div>
		</div>
		<form action="/comment/create" method="post">
			<div class="cmt_editor">
				<textarea rows="5" cols="25" name=c_content
					placeholder="댓글을 입력하세요" wrap="soft" required></textarea>
				<input type="hidden" name="b_id" value="${board.bId}" />
				<input type="hidden" name="c_writer" value="${principal.username}">
				<button type="submit" class="cmt_submit_btn">작성</button>
			</div>
		</form>
	</div>
</body>
</html>