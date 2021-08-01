<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../includes/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
<title>register</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style type="text/css">
.board-start {
	background-image: url("/img/store2.jpg");
	height: 40vh;
	position: relative;
}

.board-start::before {
	position: absolute;
	height: 41vh;
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
	margin-top: 25vh;
	color: rgb(221, 151, 0);
	position: relative;
	font-size: 60px;
	margin-top: 25vh;
	color: rgb(221, 151, 0);
}

.my-detail {
	margin-top: 5vh;
	font-size: 20px;
}

input[type='radio'] {
	background: rgb(238, 163, 0);
}

.btn-orange {
	height: 5vh;
	width: 7vw;
	background-color: rgb(252, 178, 19);
	font-family: 'Do Hyeon', sans-serif;
	border: none;
	border-bottom: 3px solid rgb(202, 156, 56);
	border-left: 3px solid rgb(202, 156, 56);
	color: rgb(255, 250, 239);
	border-radius: 6px;
	border-left: 3px solid rgb(202, 156, 56);
	border-bottom: 3px solid rgb(202, 156, 56);
}

.btn-orange:hover {
	border: none;
}

.banner {
	z-index: 20;
}
</style>

</head>

<body>


	<div style="height: 80px"></div>


	<div class="container-fluid board-start">
		<div class="container">
			<h2>회원정보</h2>
		</div>
	</div>


	<div class="container my-detail">
		<div class="container">
			<span><span
				style="color: rgb(238, 163, 0); font-weight: bold;">ID:</span>&nbsp;&nbsp;
				${member.username}</span> <br /> <br /> <span><span
				style="color: rgb(238, 163, 0); font-weight: bold;">EMAIL:</span>&nbsp;&nbsp;${member.email}
			</span> <br /> <br /> <br />

			<h2 style="color: rgb(238, 163, 0); font-weight: bold;">성별</h2>
				<input type="radio" name="gender" value="true" <c:if test="${member.gender eq true}">checked="checked"</c:if>
						onclick="return(false)" />여성&nbsp; 
				<input type="radio" name="gender" value="false" <c:if test="${member.gender eq false}">checked="checked"</c:if>
						onclick="return(false)" />남성
                
				
			<br /> <br /> <br />
			<!-- 진짜 이렇게 해야된다고..? 더 쉬운방법 ㅠ 찾아보자 ㅠ -->
			<h2 style="color: rgb(238, 163, 0); font-weight: bold;">나이</h2>

			<input type="radio" id="age_10" name="age" value="age_10" <c:if test="${member.age eq 'age_10'}">checked="checked"</c:if> onclick="return(false)"/>10대 &nbsp; 
			<input type="radio" id="age_20" name="age" value="age_20" <c:if test="${member.age eq 'age_20'}">checked="checked"</c:if> onclick="return(false)"/>20대 &nbsp; 
			<input type="radio" id="age_30" name="age" value="age_30" <c:if test="${member.age eq 'age_30'}">checked="checked"</c:if> onclick="return(false)"/>30대 &nbsp; 
			<input type="radio" id="age_40" name="age" value="age_40" <c:if test="${member.age eq 'age_40'}">checked="checked"</c:if> onclick="return(false)"/>40대 &nbsp; 
			<input type="radio" id="age_more" name="age" value="age_more" <c:if test="${member.age eq 'age_more'}">checked="checked"</c:if> onclick="return(false)"/>50대 이상 &nbsp;
			<br /> <br /> <br />
			<div style="display: flex; flex-wrap: wrap;">
				<a href="/member/mypage/bookmark/${member.id }"><button type="button" class="btn-orange" id="btn-show"
					style="margin-right: 10px">나의맛집</button></a>
				<a href="/member/update/${member.id }"><button type="button"
						class="btn-orange" id="btn-update">회원수정</button></a>
			</div>
		</div>
	</div>

</body>
</html>