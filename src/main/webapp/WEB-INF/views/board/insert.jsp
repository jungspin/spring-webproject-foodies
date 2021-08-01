<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap"
	rel="stylesheet">
<style>
.board-start {
	background-image: url("/img/store2.jpg");
	height: 50vh;
	position: relative;
	margin-bottom: 3vh;
}

.board-start::before {
	position: absolute;
	height: 51vh;
	width: 100%;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	opacity: 0.8;
	background-color: white;
}

.board-start h2 {
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 60px;
	margin-top: 35vh;
	color: rgb(221, 151, 0);
	position: relative;
}

.input-file-button {
	padding: 6px 25px;
	background-color: #FF6600;
	border-radius: 4px;
	color: white;
	cursor: pointer;
}

.banner {
	z-index: 15;
}

/**/
.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: 6px 25px;
	color: white;
	vertical-align: middle;
	background-color: #FF6600;
	cursor: pointer;
	border: none;
	border-radius: 4px;
	height: 32px;
	
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	height: 35px;
	font-size: 18px;
	padding: 0 10px;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-radius: 5px;
}
</style>
<div class="container-fluid board-start">
	<div class="container">
		<h2>자유게시판</h2>
	</div>
</div>
<div class="container" style="margin-bottom: 6vh;">
	<form action="/member/freeboard/insert" method="post"
		enctype="multipart/form-data">
		<div class="form-group">
			<input type="text" class="form-control" id="title" name="title"
				placeholder="제목"
				style="background-color: rgb(247, 247, 247); border-radius: 0; margin-bottom: 40px; margin-top: 2vh;">
		</div>
		
		<div class="form-group">
			<input type="text" class="form-control" id="username" name="username"
				value="${principal.member.username }" readonly="readonly"
				style="background-color: rgb(247, 247, 247); border-radius: 0; margin-bottom: 40px; margin-top: 2vh;">
		</div>
		
		<div class="form-group">
			<textarea id="content" name="content" id="content"
				class="form-control" rows="10" placeholder="글내용을 작성하세요"
				style="background-color: rgb(247, 247, 247); border-radius: 0;"></textarea>
		</div>
		
		<div class="filebox" style="display: flex; flex-wrap: wrap; margin-bottom: 60px;">
			<label for="files">업로드</label> <input class="input-file-button" type="file" id="files"
				accept="image/gif, image/jpeg, image/png" onchange="fileCheck(this)" multiple="multiple" name="files">
			<input class="upload-name" value="파일선택" style="height:32px; font-weight: 100; font-size: 13px;" >
		</div>
		
		<button type="submit" class="input-file-button"
			style="border: none; font-weight: bold;">글쓰기</button>
			<button type="button" id="btn-cancel" class="input-file-button"
			style="border: none; font-weight: bold;">취소</button>
</div>
<script>
// 취소버튼 
$("#btn-cancel").on('click', function(){
	if(!confirm("작성을 취소하시겠습니까?")){ return; } 
	history.back();
})
//확장자 체크
function fileCheck(obj) {
	console.log(obj);
	pathpoint = obj.value.lastIndexOf(".");
	filepoint = obj.value.substring(pathpoint + 1, obj.length);
	filetype = filepoint.toLowerCase();

	//console.log(pathpoint);
	//console.log(filepoint); // png
	//console.log(filetype); // png

	if (filetype == "png" || filetype == "jpg" || filetype == "jpge") {

	} else {
		alert("이미지만 가능합니다");
		//$("#resImage").html("");
	}
}

$(document).ready(function() {
	var fileTarget = $('#files');
	fileTarget.on('change', function() { // 값이 변경되면
		var cur = $(".filebox input[type='file']").val();
		$(".upload-name").val(cur);
	});
});
</script>
</body>
</html>