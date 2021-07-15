<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/storedetail.css">
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
<title>상세보기</title>
</head>

<body>
	<!-- 네비게이션 -->
	<nav class="main-navi nav-down">
		<div class="logo">
			<a href="/"> <i class="fas fa-hamburger"></i>FOODIES
			</a>
		</div>
		<form class="">
			<div class="search">
				<input type="text" class="search-input" placeholder="지역 및 식당, 음식">
				<button class="search-button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>

		<div class="menu" id="host">
			<div class="item">
				<a href="/register">회원가입</a>
			</div>
			<div class="item">
				<a href="/login">로그인</a>
			</div>
			<div class="item">
				<a href="list">게시판</a>
			</div>
		</div>
	</nav>

	<div class="headerdiv"></div>



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


	<div class="container details-main">
		<div class="details-explain">
			<h6>글 번호</h6>
			<div>${freeBoard.id}</div>
			<h6>글 제목</h6>
			<div>${freeBoard.title}</div>
			<h6>글 내용</h6>
			<div>${freeBoard.content}</div>

		</div>
	</div>
	<c:if test="${principal.member.username==freeBoard.member.username}">
		<button type="button" id="btnUpdate" class="btn btn-primary  btn-sm">수정</button>
		<button type="button" id="btnDelete" class="btn btn-danger  btn-sm">삭제</button>

	</c:if>
	<br />
	<br />
	<div align="center">
		<textarea rows="3" cols="50" id="msg"></textarea>
		<input type="button" value="댓글쓰기" class="btn btn-secondary  btn-sm"
			id="btnComment">
	</div>
	<hr />
	<div id="replyResult"></div>
	<hr />
	<div>
		<table class="table table-borderless">
			<c:forEach items="${freeBoard.freeComment}" var="comment">
				<tr>
				<td><input type="hidden" id="comment_id" value="${comment.id}"></td>
					<td>${comment.id}</td>
					<td>${comment.content }</td>
					<td>${comment.member.username }
					<td><fmt:formatDate value="${comment.regDate}"
							pattern="yyyy-MM-dd" /></td>
					<td><button type="button" id="btnDeleteC"
							class="btn btn-danger  btn-sm">삭제</button></td>
				</tr>
			</c:forEach>

		</table>
	</div>
	<script>
//댓글쓰기
$("#btnComment").click(function(){
	if(${empty principal.member}){
		alert("로그인하세요");
		location.href="/login";
		return;
	}
	if($("#msg").val()==""){
		alert("댓글을 적으세요");
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
    	 alert("댓글 추가 성공");
    	 location.href = "/board/view/"+${freeBoard.id}
     })
     .fail(function(){
    	 alert("댓글 추가 실패")
     })
})
//댓글 삭제
$("#btnDeleteC").click(function(){
	if(!confirm("정말 삭제할까요?"))  return false;
	var a = $("#comment_id").val();
	$.ajax({
		type :"DELETE",
		url :"/board/freeComment/"+ a,
		
	/* 	success:function(resp){
			alert(resp);
			if(resp=="success"){
				alert("삭제성공");
			location.href = "/board/view/"+${freeBoard.id};
			} 
		}*/ //success
	})
	.done(function(resp){
		alert("삭제성공");
		location.href = "/board/view/"+${freeBoard.id};
	})//ajax
})  //btnDelete
//글 삭제
$("#btnDelete").click(function(){
	if(!confirm("정말 삭제할까요?") )  return false
	$.ajax({
		type :"DELETE",
		url : "/board/delete/${freeBoard.id}",
		success:function(resp){
			if(resp=="success"){
				alert("삭제성공");
				location.href="/"
			}
		} //success
	})//ajax
})  //btnDelete
//수정폼
$("#btnUpdate").click(function(){
	if(!confirm("정말 수정할까요?")) return false
	location.href="/board/updateFreeboard/${freeBoard.id}"
	
});//btnDelete

</script>
</html>
