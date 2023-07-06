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
	
	.uploadResult {
		width : 100%;
		background-color: gray;
	}
	
	.uploadResult ul {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}
	
	.uploadResult ul li {
		list-style: none;
		padding: 10px;
		align-content: center;
		text-align: center;
	}
	
	.uploadResult ul li img {
		width: 100px;
	}
	
	.uploadResult ul li span {
		color : white;
	}
	.bigPictureWrapper {
		position: absoulte;
		display: none;
		justify-content: center;
		align-items: center;
		top: 0%;
		width: 100%;
		height: 100%;
		background-color: gray;
		z_index : 100;
		background: rgba(255, 255, 255, 0.5);
	}
	.bigPicture {
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.bigPicture img {
		width: 600px;
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
	<div class="uploadResult">
		<ul>
		</ul>
	</div>
	<button id="uploadBtn">업로드</button>
	<div class="bigPictureWrapper">
		<div class="bigPicture">
		</div>
	</div>
<script>
	function showImage(fileCallPath) {
		//alert(fileCallPath);
		$(".bigPictureWrapper").css("display", "flex").show();
		
		$(".bigPicture").html("<img src='/display?fileName=" + encodeURI(fileCallPath) + "'>").animate({width:'100%', height:'100%'}, 1000);
	}

	$(document).ready(function(){
		var regex = new RegExp("(.*?)\.(exe\sh|zip|alz)$");
		var maxSize = 10485760; //10MB
		var uploadResult = $(".uploadResult ul");
		
		function showUploadedFile(uploadResultArr) {
			var str = "";
			
			$(uploadResultArr).each(
					function(i, obj) {
						if(!obj.image) {
							var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
							str += "<li><div><a href='/download?fileName="+fileCallPath+"'>" + "<img src='/img/attach.jpg'>" + obj.fileName + "</a>" 
									+ "<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>" +"</div></li>";
						} else {
							var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
							var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
							
							originPath = originPath.replace(new RegExp(/\\/g),"/");
							
							str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\"><img src='/display?fileName="+fileCallPath+"'></a>"
									+ "<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span>" +"</li>";
						}
					});
			uploadResult.append(str);
		}
		
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
						showUploadedFile(result);
						$(".uploadDiv").html(cloneObj.html());
					}
			}); //ajax
		});
		
		$(".uploadResult").on('click', 'span', function(e) {
			var targetFile = $(this).data('file');
			var type = $(this).data("type");
			console.log(targetFile);
			
			$.ajax({
				
				url:'/deleteFile',
				data : {fileName: targetFile, type:type},
				dataType:'text',
				type:'POST',
				success: function(result) {
					alert(result);
				}
			}); //$ajax
		});//function end
	});
</script>	
</body>
</html>