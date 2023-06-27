<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
					<div class="recmt-generater" style="display : none">
						<textarea rows="2" cols="80"></textarea>
						<button type="button" class="recmt-submit-btn">등록</button>
						<button type="button" class="recmt-cancel-btn">취소</button>
					</div>
				</li>
			</c:forEach>
		</ul>