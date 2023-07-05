<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>게시글 작성하기</title>
<style>
	.content {
		width : 300px;
		height : 200px;
	}
</style>
</head>
<body>
	<h1>게시글 작성하기</h1>
	
	<form action="/board/create" method="POST">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">		
		<input type="hidden" name="bWriter" value="${user.username }"/>	
		<p><input type="text" name="bTitle" maxlength="20" minlength="2"/></p>	
		<textarea class="content" name="bContent" placeholder="내용 : "></textarea>	
		<p><input type=submit value="작성"/></p>	
	</form>
	
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple="multiple">	
	</div>
	<button id="uploadBtn">업로드</button>
	
<script>
	$(document).ready(function(){
		var regex = new RegExp("(.*?)\.(exe\sh|zip|alz)$");
		var maxSize = 10485760; //10MB
		
		function checkExtension(fileName, fileSize){
			if(fileSize >= maxSize) {
				alert("파일 사이즈를 초과했습니다.")
				return false;
			}
			
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드가 불가능합니다.")
				return false;
			}
			return true;
		}
		
		var cloneObj = $(".uploadDiv").clone();
		
		$('#uploadBtn').on('click', function(e){
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			
			//파일 데이터를 FormData에 추가
			for(var i = 0; i < files.length; i++){
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url: '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : "POST",
					dataType:'JSON',
					success: function(result) {
						console.log(result);
						$(".uploadDiv").html(cloneObj.html());
					}
			}); //ajax
		});
	});
</script>	
</body>
</html>