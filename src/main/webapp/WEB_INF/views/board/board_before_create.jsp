<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/8d73f2706e.js" crossorigin="anonymous"></script>
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
	
	<form role="form" action="/board/create" method="POST">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">		
		<input type="hidden" name="bWriter" value="${user.username }"/>	
		<p><input type="text" name="bTitle" maxlength="20" minlength="2"/></p>	
		<textarea class="content" name="bContent" placeholder="내용 : "></textarea>	
		<button type="submit">Submit</button>	
	</form>
	
	<!-- <div class="uploadDiv">
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
	</div> -->
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-heading">File Attach</div>
			<!-- /.panel-heading -->
			<div class="form-group uploadDiv">
				<input type="file" name="uploadFile" multiple>
			</div>
			
			<div class="uploadResult">
				<ul>
				
				</ul>
			</div>
		</div>
	</div>
	
<script>
	/* function showImage(fileCallPath) {
		//alert(fileCallPath);
		$(".bigPictureWrapper").css("display", "flex").show();
		
		$(".bigPicture").html("<img src='/display?fileName=" + encodeURI(fileCallPath) + "'>").animate({width:'100%', height:'100%'}, 1000);
	} */
	
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
		
		function showUploadedResult(uploadResultArr) {
			if(!uploadResultArr || uploadResultArr.length == 0) {
				return;
			}
			var uploadUL = $(".uploadResult ul");
			var str = "";
			
			$(uploadResultArr).each(
					function(i, obj) {
						//image 타입
						if(obj.image) {
							var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
							//var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
							
							str += "<li data-path='"+ obj.uploadPath +"'";
							str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName+"'data-type='" + obj.image+"'";
							str + " ><div>";
							str += "<span> " + obj.fileName + "</span>";
							str += "<button type='button' data-file=\'" +fileCallPath+"\'data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
							str += "<img src='/display?fileName=" + fileCallPath+ "'>";
							str += "</div>";
							str + "</li>";
							
							
						} else {
							var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
							var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
							
							str += "<li data-path='"+ obj.uploadPath +"'";
							str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName+"'data-type='" + obj.image+"'";
							str + " ><div>";
							str += "<span> " + obj.fileName + "</span>";
							str += "<button type='button' data-file=\'" +fileCallPath+"\'data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
							str += "<img src='/img/attach.jpg'>";
							str += "</div>";
							str + "</li>";
						}
					});
			uploadUL.append(str);
		}
		
		
		
		var cloneObj = $(".uploadDiv").clone();
		
		$("input[type='file']").change(function(e){
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			//파일 데이터를 FormData에 추가
			for(var i = 0; i < files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				
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
						showUploadedResult(result);
						//$(".uploadDiv").html(cloneObj.html());
					}
			}); //ajax
		});
		
		 $(".uploadResult").on('click', 'button', function(e) {
			console.log("delete file");
			var targetFile = $(this).data('file');
			var type = $(this).data("type"); 
			var targetLi = $(this).closest("li");
			
			$.ajax({
				
				url:'/deleteFile',
				data : {fileName: targetFile, type:type},
				dataType:'text',
				type:'POST',
				success: function(result) {
					alert(result);
					targetLi.remove();
				}
			}); //$ajax
		});//function end
		
		var formObj = $("form[role='form']");
			
		$("button[type='submit']").on("click",function(e){
			e.preventDefault();
			
			console.log("submit clicked");
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj) {
				var jobj = $(obj);
				
				console.dir(jobj);
				
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='" + jobj.data("filename") + "'>";
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='" + jobj.data("uuid") + "'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='" + jobj.data("path") + "'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='" + jobj.data("type") + "'>";
			});
			formObj.append(str).submit();
		})
			
		
	});
</script>	
</body>
</html>