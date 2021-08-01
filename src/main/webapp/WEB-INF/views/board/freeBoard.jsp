<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="../includes/header.jsp"%> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<head>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FOODIES</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="/css/home.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
</head>
<style>
.board-start {
	background-image: url("/img/store2.jpg");
	height: 50vh;
	position: relative;
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
	margin-bottom:10px;
}

.board-start h2 {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 700;
	font-size: 70px;
	margin-left: -100px;
	margin-top: 34vh;
	color: rgb(221, 151, 0); 
	position: relative;
}

table {
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 25px;
	
}

table thead tr th {
	text-align: center;
	background-color: rgb(250, 197, 105);
	height: 50px;
	padding-bottom: 20px;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 50px;
	color: white;
	box-shadow: 0 2px 0px 0px rgb(107, 107, 107);
	font-size: 20px;
	
}

table thead tr th:first-child {
	border-top-left-radius: 6px;
}

table thead tr th:last-child {
	border-top-right-radius: 6px;
}

table tbody tr td {
margin-top:50px;
	text-align: center;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 20px;
	
}

table tbody tr td:nth-child() {
	background-color: rgb(255, 242, 200);
	text-decoration: none;
}

.btn-sm {
	background-color: rgb(255, 207, 50);
	font-weight: bold;
	border-radius: 10px;
	border: none;
	margin-right: 200px;
	font-size: 20px;
	
}
.aa {
	font-weight: bold;
	text-decoration: none;
	color: teal;
}

.btn-sm:hover {
	background-color: rgb(230, 186, 43);
	border: none;
	outline: none;
	color: rgb(255, 250, 235);
}

.btn-sm:focus {
	background-color: rgb(230, 186, 43);
	border: none;
	outline: none;
	color: rgb(255, 250, 235);
}
</style>
<!-- 네비메뉴 -->
	<nav class="main-navi nav-down">
		<div class="logo">
			<a href="/"> <i class="fas fa-hamburger"></i>FOODIES
			</a>

		</div>
	   <form action="search" method="get">
            <div class="search search1">
                <input type="text" name="keyword" class="search-input" placeholder="지역 및 식당, 음식">
                <button class="search-button" name="searchBtn"><i class="fas fa-search"></i></button>
            </div>
        </form>

		<div class="menu" id="host">
			<div class="item">
				<a class="a"href="list">게시판</a>
			</div>
			<%-- <sec:authorize access="isAuthenticated()"></sec:authorize> --%>
			<sec:authorize access="hasRole('ROLE_Member')">
				<div class="item">
					<a class="a"
						href="/member/mypage/<sec:authentication property="principal.member.id"/>">마이페이지</a>
				</div>
				<div class="item">
					<a class="a"href="/logout">로그아웃</a>
				</div>
			</sec:authorize>

			<sec:authorize access="isAnonymous()">
				<div class="item">
					<a class="a"href="/login">로그인</a>
				</div>
				<div class="item">
					<a class="a" href="/register">회원가입</a>
				</div>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_Manager')">
				<div class="item">
					<a class="a"href="/manager/submit">식당등록</a>
				</div>
				<div class="item">
					<a class="a" href="/logout">로그아웃</a>
				</div>
			</sec:authorize>
		</div>
	</nav>


	<div class="main-navi2">
		<div class="logo">
			<a href="/"> <i class="fas fa-hamburger"></i>FOODIES
			</a>


		</div>
		<form class="">
			<div class="search2">
				<input type="text" class="search-input" placeholder="지역 및 식당, 음식">
				<button class="search-button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>

		<div class="menu" id="host">
			<div class="item">
				<a href="list">게시판</a>
			</div>
			<%-- <sec:authorize access="isAuthenticated()"></sec:authorize> --%>
			<sec:authorize access="hasRole('ROLE_Member')">
				<div class="item">
					<a
						href="/member/mypage/<sec:authentication property="principal.member.id"/>">마이페이지</a>
				</div>
				<div class="item">
					<a href="/logout">로그아웃</a>
				</div>
			</sec:authorize>

			<sec:authorize access="isAnonymous()">
				<div class="item">
					<a href="/login">로그인</a>
				</div>
				<div class="item">
					<a href="/register">회원가입</a>
				</div>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_Manager')">
				<div class="item">
					<a href="/manager/submit">식당등록</a>
				</div>
				<div class="item">
					<a href="/logout">로그아웃</a>
				</div>
			</sec:authorize>
		</div>
	</div>
	<br>
<div class="container-fluid board-start">
	
<div class="container" >
	<h2>자유게시판</h2>
	</div>
<br><br>
	<table class="table table-hover" id="freeboard">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			  <c:forEach items="${lists.content}" var="board" varStatus="st">
				<tr id="freeboardtr">
					<td>${ board.id}</td>
					<td><a href="/board/view/${board.id}">${board.title }</a></td>
					<td>${board.member.username }</td>
					<td><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd" /></td>
					<td>${board.clickCnt }</td>
				</tr>
			</c:forEach> 
		
		</tbody>
	</table>
	    <!-- 회원 -->
        <sec:authorize access="hasRole('ROLE_Member')">
        <div class="form-group text-right">
		<a href="/member/freeboard/insert">
		<button type="button" class="btn btn-secondary btn-sm" id="writeBtn">글쓰기</button></a>
	</div>
        	</sec:authorize>
	<div class="d-flex justify-content-between mt-3">
		<ul class="pagination">
			<c:if test="${lists.first ==  false }">
				<li class="page-item"><a class="page-link" href="?page=${lists.number-1 }">Previous</a></li>
			</c:if>
			<c:if test="${lists.last ==  false }">
				<li class="page-item"><a class="page-link" href="?page=${lists.number+1 }">Next</a></li>
			</c:if>
			
		</ul>
		
		 <!-- 비회원 -->
        <sec:authorize access="isAnonymous()">
        	<h4>foodies 의 회원이셔야 게시글을 남길 수 있어요😎</h4>	
        	<a class="aa" href="/login"><button style="text-decoration: none;"class="btn-sm">로그인하기</button></a>
        	<a class="aa"href="/register"><button style="text-decoration: none;"class="btn-sm">회원가입하기</button></a>
        	<br>
            </sec:authorize>
	</div>

 
            
     

</div>
</body>
</html>