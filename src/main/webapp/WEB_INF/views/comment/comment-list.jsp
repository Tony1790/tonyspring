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
				</li>
			</c:forEach>
		</ul>