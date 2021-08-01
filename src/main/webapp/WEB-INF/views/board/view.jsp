<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <link rel="stylesheet" href="/css/storedetail.css"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap"
	rel="stylesheet">
<title>foodies</title>

<style type="text/css">
.container-fluid {
	background-image: url("/img/store2.jpg");
	height: 20vh;
	position: relative;
}

.container-fluid::before {
	position: absolute;
	height: 105%;
	width: 100%;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	opacity: 0.8;
	background-color: white;
}

.board-start h2 {
	position: relative;
	font-size: 60px;
	margin-top: 10vh;
	color: rgb(221, 151, 0);
	font-family: 'Nanum Gothic Coding', monospace;
}

.banner {
	z-index: 15;
}

.input-file-button {
	padding: 6px 25px;
	background-color: #FF6600;
	border-radius: 4px;
	color: white;
	cursor: pointer;
}

.input-file-button:hover {
	border: none;
	outline: none;
}

textarea:focus {
	outline: none;
}

input:focus {
	outline: none;
}
</style>
</head>

<body>
	<jsp:include page="../includes/header.jsp"></jsp:include>

	<div style="height: 80px"></div>
	<div class="container-fluid board-start" style="height: 30vh;">
		<div class="container">
			<h2>자유게시판</h2>
		</div>
	</div>

	<div id="demo" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
		</ul>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>

	<div class="container">
		<h2 style="margin-top: 5vh; margin-bottom: 0.5vh;">${freeBoard.title}</h2>
		<div style="margin-bottom: 10vh;">
			<span>작성&nbsp;</span> <span style="font-weight: bold;">${freeBoard.member.username}&nbsp;&nbsp;&nbsp;</span>
			<span>조회&nbsp;</span> <span
				style="color: rgb(255, 143, 143); font-weight: bold;">${freeBoard.clickCnt}</span>
		</div>

		<c:forEach items="${attachList }" var="attach">
			<div>
				<img
					src="/resources/upload/${attach.uploadpath}/${attach.uuid}_${attach.filename}"
					style="width: 300px" />
			</div>
		</c:forEach>
		<p style="margin-bottom: 10vh;">${freeBoard.content}</p>
	</div>
	<div class="container">
		<a href="/list"><button type="button" id="btnList"
				class="input-file-button" style="border: none;">목록</button></a>
		<c:if test="${principal.member.username==freeBoard.member.username}">
			<button type="button" id="btnUpdate" class="input-file-button"
				style="border: none;">수정</button>
			<button type="button" id="btnDelete" class="input-file-button"
				style="border: none; background-color: rgb(252, 117, 93);">삭제</button>

		</c:if>
		<br /> <br />

		<div class="container" style="padding-top: 3vh;">
			<table class="table table-borderless" style="padding-top: 3vh;">
				<c:forEach items="${freeBoard.freeComment}" var="comment">
					<tr style="height: 5vh;">
						<td style="width: 7vw;">${comment.member.username }
						<td style="width: 7vw;"><fmt:formatDate
								value="${comment.regDate}" pattern="yyyy-MM-dd" /></td>
						<td style="width: 35vw;">${comment.content }</td>
						<td><button type="button" id="btnDeleteC"
								class="input-file-button"
								style="width: 5vw; border: none; background-color: rgb(252, 117, 93);">삭제</button></td>

					</tr>
				</c:forEach>

			</table>
		</div>

		<div class="container"
			style="display: flex; flex-wrap: wrap; margin-bottom: 30px; margin-top: 3vh;">
			<textarea id="msg" class="form-control" rows="1" name="content"
				style="height: 80px; width: 50vw; background-color: rgb(235, 235, 235); border: none;"></textarea>
			<input type="button" value="댓글쓰기" class="btn btn-secondary  btn-sm"
				id="btnComment"
				style="background-color: #FF6600; font-weight: bold;">
		</div>

	</div>
	<!-- 	<div id="replyResult"></div> -->


	<script>
//댓글쓰기
$("#btnComment").click(function(){
	if(${empty principal.member}){
		alert("로그인을 먼저 해주세요");
		location.href="/login";
		return;
	}
	if($("#msg").val()==""){
		alert("댓글을 써주세요");
		return;
	}
	data = {
			"freeboard_id" :${freeBoard.id},
			"content" : $("#msg").val()
	}
	
	$.ajax({
		type:"POST",
		url:"/board/freeComment/"+${freeBoard.id},
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data)
     })
     
     .done(function(){
    	 alert("댓글이 등록 되었습니다");
    	 location.href = "/board/view/"+${freeBoard.id}
     })
     .fail(function(){
    	 alert("댓글 등록을 실패했습니다")
     })
})
//댓글 삭제
$("#btnDeleteC").click(function(){
	if(!confirm("삭제하시겠습니까?"))  return false;
	var a = $("#comment_id").val();
	$.ajax({
		type :"DELETE",
		url :"/board/freeComment/"+ a,
	})
	.done(function(resp){
		alert("삭제되었습니다");
		location.href = "/board/view/"+${freeBoard.id};
	})//ajax
})  //btnDelete
//글 삭제
$("#btnDelete").click(function(){
	if(!confirm("해당 글을 삭제하시겠습니까?") )  return false
	$.ajax({
		type :"DELETE",
		url : "/member/board/delete/${freeBoard.id}",
		success:function(resp){
			if(resp=="success"){
				alert("삭제되었습니다");
				location.href="/list"
			}
		} //success
	})//ajax
})  //btnDelete
//수정폼
$("#btnUpdate").click(function(){
	if(!confirm("수정하시겠습니까?")) return false
	location.href="/member/board/updateFreeboard/${freeBoard.id}"
	
});//btnDelete

</script>
</html>
