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
					<c:forEach items="${commentList}" var="comment">
						<li>
							<div>
								<span>${comment.c_writer}</span>
							</div>
							<div>
								<span>${comment.c_content}</span>
							</div>
							<div>
								<span>${comment.c_date}</span>
							</div>
							<button class="recmt-generate-btn">답글</button>
							<button class="recmt-edit-btn">수정</button>
							<button class="recmt-delete-btn">삭제</button>
							<div class="recmt-generater" style="display: none">
								<textarea rows="2" cols="80"></textarea>
								<button type="button" class="recmt-submit-btn">등록</button>
								<button type="button" class="recmt-cancel-btn">취소</button>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="cmt_editor">
			<textarea rows="5" cols="25" name=c_content
				placeholder="댓글을 입력하세요" wrap="soft" required></textarea>
			<input type="hidden" name="b_id" value="${board.bId}" />
			<button type="submit" class="cmt_submit_btn" bId="${board.bId}">작성</button>
		</div>
	</div>
	<script>
		/* 답글 버튼을 눌러 댓글작성창을 토글하는 코드 */
		$(document).on('click', ".recmt-generate-btn", function() {
			$(this).siblings('.recmt-generater').toggle();
		});
		
		/* 취소 버튼을 눌러 댓글 작성창을 숨기는 코드 */
		$(document).on('click', ".recmt-cancel-btn", function() {
			$(this).parent('.recmt-generater').css('display', 'none');
		});
		
		$(document).on('click', 'recmt-edit-btn', function() {
			
		})
		
		$(document).on('click', '.cmt_submit_btn', function() {
			let bId = $(this).attr('bId');
			let cContent = $(this).closest('.cmt_editor').find('textarea').val();
			
			$.ajax({
				method : "POST",
				url : "/comment/create",
				data: {
					b_id : bId,
					c_content : cContent,
				}
			})
			.done(function(msg) {
				console.log("msg : " + msg);
				$('.cmt_list').html(msg);
				$(document).on('.cmt_editor').find('textarea').val('');
			});
		});
	</script>
</body>
</html>