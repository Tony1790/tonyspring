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
							<button class="recmt-edit-btn" c_id = "${comment.c_id}">수정</button>
							<button class="recmt-delete-btn" c_id = "${comment.c_id}" b_id="${board.bId}">삭제</button>
							<div class="recmt-generater" style="display: none">
								<textarea rows="2" cols="80"></textarea>
								<button type="button" class="recmt-submit-btn" c_id = "${comment.c_id}">등록</button>
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
	
		var isEditing = false; //전역 변수를 false로 초기화
	
		/* 답글 버튼을 눌러 댓글작성창을 토글하는 코드 */
		$(document).on('click', ".recmt-generate-btn", function() {
			isEditing = false;
			$(this).siblings('.recmt-generater').toggle();
			$(this).siblings('.recmt-generater').find('.recmt-submit-btn').text('등록');
		});
		
		/* 취소 버튼을 눌러 댓글 작성창을 숨기는 코드 */
		$(document).on('click', ".recmt-cancel-btn", function() {
			$(this).parent('.recmt-generater').css('display', 'none');
		});
		
		/* 수정 버튼을 눌러 댓글작성창을 토글한 후, 백단에서 댓글 정보를 받아와 텍스트를 띄움 */
		$(document).on('click', '.recmt-edit-btn', function() {
			isEditing = true;
			let cId = $(this).attr('c_id');
			var _this = this;
			
			$.ajax({
				method : "POST",
				url : "/recomment/edit",
				data : {
					'c_id' : cId
				},
				success : function(data) {
					$(_this).siblings('.recmt-generater').toggle();
					$(_this).siblings('.recmt-generater').find('textarea').val(data.c_content);
					$(_this).siblings('.recmt-generater').find('.recmt-submit-btn').text('수정');
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
		
		/* 삭제 버튼을 눌러 댓글을 삭제한 후 새롭게 댓글 리스트를 받아와서 보냄 */
		$(document).on('click', '.recmt-delete-btn', function() {
			let cId = $(this).attr('c_id');
			let bId = $(this).attr('b_id');
			var _this = this;
			
			
			$.ajax({
				method : "POST",
				url : "/recomment/delete",
				data: {
					c_id : cId,
					b_id : bId
				},
			})
			.done(function(msg) {
				console.log("msg : " + msg);
				$('.cmt_list').html(msg);
			});
		  
		});

		/* 답글 -> 등록 버튼을 눌러 대댓글, 또는 수정하는 기능 구현 */
		$(document).on('click', '.recmt-submit-btn', function() {
			let cId = $(this).attr('c_id');
			let cContent = $(this).siblings('textarea').val();
			
			if(isEditing) {
				//edit 기능 구현하기!!! 백단 앞단 전부 다!!!
				$.ajax({
					method : "POST",
					url : "/comment/edit",
					data : {
						c_id : cId,
						c_content : cContent
					}
				})
				.done(function(msg) {
					$('.cmt_list').html(msg);
				})
			} else {
			$.ajax({
				method : "POST",
				url : "/recomment/create",
				data : {
					c_id : cId,
					c_content : cContent
				}
			}).done(function(msg) {
				console.log("msg : " + msg);
				$('.cmt_list').html(msg);
			});
			}
		})

		/* 댓글 다는 기능 */
		$(document).on(
				'click',
				'.cmt_submit_btn',
				function() {
					let bId = $(this).attr('bId');
					let cContent = $(this).closest('.cmt_editor').find(
							'textarea').val();

					$.ajax({
						method : "POST",
						url : "/comment/create",
						data : {
							b_id : bId,
							c_content : cContent,
						}
					}).done(function(msg) {
						console.log("msg : " + msg);
						$('.cmt_list').html(msg);
						$(document).on('.cmt_editor').find('textarea').val('');
					});
				});
	</script>
</body>
</html>