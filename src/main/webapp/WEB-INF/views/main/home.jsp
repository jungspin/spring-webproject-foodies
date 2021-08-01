<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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

</head>
<style>
.board-start {
	background-image: url("/img/store.jpg");
	height: 70vh;
	position: relative;
	margin-bottom: -60px;
}
.board-start::before {
	position: absolute;
	height: 70vh;
	width: 100%;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	opacity: 0.8;
	background-color: white;
}


</style>
<body>

	<!-- 네비메뉴 -->
	<nav class="main-navi nav-down">
		<div class="logo">
			<a href="/"> <i class="fas fa-hamburger"></i>FOODIES
			</a>

		</div>
	   <form action="search" method="get">
            <div class="search">
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
					<a class="a"href="/register">회원가입</a>
				</div>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_Manager')">
				<div class="item">
					<a class="a"href="/manager/goSubmit">식당등록</a>
				</div>
				<div class="item">
					<a class="a"href="/logout">로그아웃</a>
				</div>
			</sec:authorize>
		</div>
	</nav>


	<div class="main-navi2">
		<div class="logo">
			<a href="/"> <i class="fas fa-hamburger">FOODIES</i>
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
	<div class="container-fluid main-start">
		<div class="explain">
			<h2>FOODIES!</h2>
			<br>
			<h4>먹는 즐거움의 시작!</h4>
		</div>
	</div>
<!-- 		<img  id="homeimg1" src="/img/store2.jpg"> -->	
	<div class="container icons-start">
	<br>
	<hr>
<h2><i class="fas fa-hamburger"></i>&nbsp;어떤걸 드시고 싶으세요?</h2>
<hr>
</div>

	<div class="container icons-list1">
	<a style="text-decoration: none;" href= "http://localhost:8877/search?keyword=%EC%B9%98%ED%82%A8&searchBtn=">
		<div class="items" style="background-color: rgb(255, 207, 145)">
		
			<img src="/img/chicken-leg.png">
			<div class="items-detail">치킨</div>
		</div></a>
		<a style="text-decoration: none;" href= "http://localhost:8877/search?keyword=%ED%94%BC%EC%9E%90&searchBtn=">
		<div class="items" style="background-color: rgb(255, 167, 59)">
			<img src="/img/pizza.png">
			<div class="items-detail">피자</div>
		</div>
		</a>
		<a style="text-decoration: none;" href= "http://localhost:8877/search?keyword=%EB%A0%88%EC%8A%A4%ED%86%A0%EB%9E%91&searchBtn=">
		<div class="items" style="background-color: rgb(252, 195, 88)">
			<img src="/img/spaghetti.png">
			<div class="items-detail">양식</div>
		</div>
		</a>
		<a style="text-decoration: none;" href= "http://localhost:8877/search?keyword=%EC%A4%91%EA%B5%AD&searchBtn=">
		<div class="items" style="background-color: rgb(255, 66, 92)">
			<img src="/img/ramen.png">
			<div class="items-detail">중식</div>
		</div>
		</a>
		<a style="text-decoration: none;" href= "http://localhost:8877/search?keyword=%ED%95%9C%EC%8B%9D&searchBtn=">
		<div class="items" style="background-color: rgb(82, 200, 255)">
			<img src="/img/rice.png">
			<div class="items-detail">한식</div>
		</div>
		</a>
		<a style="text-decoration: none;" href= "http://localhost:8877/search?keyword=%EB%96%A1%EB%B3%B6%EC%9D%B4&searchBtn=">
		<div class="items" style="background-color: rgb(255, 62, 48)">
			<img src="/img/tteokbokki.png">
			<div class="items-detail">분식</div>
		</div>
		</a>
		<a style="text-decoration: none;" href= "http://localhost:8877/search?keyword=%EC%9D%BC%EC%8B%9D&searchBtn=">
		<div class="items" style="background-color: rgb(156, 222, 255)">
			<img src="/img/sushi.png">
			<div class="items-detail">일식</div>
		</div>
		</a>
		<a style="text-decoration: none;" href= "http://localhost:8877/search?keyword=%EC%BB%A4%ED%94%BC&searchBtn=">
		<div class="items" style="background-color: rgb(252, 187, 144)">
			<img src="/img/dessert.png">
			<div class="items-detail">카페</div>
		</div>
		</a>

	</div>
	<div class="container slide-start">
	<hr>
		<h2><i class="fas fa-hamburger"></i> &nbsp;추천음식점</h2>
		<hr>
	</div>

	<section class="vertical slider container">
		
		<c:forEach items="${lists}" var="restaurant" varStatus="st">
			<div>
				<a href="/detail/${restaurant.id}">
					<figure class="snip1384">
						<img src="${restaurant.mainImgNormal}" />
						<h2>${restaurant.mainTitle}</h2>
						<figcaption>
							<h3>${restaurant.mainTitle}</h3>
							<br>
							<p>${restaurant.itemcntnts }</p>
						</figcaption>
					</figure>
				</a>
			</div>
		</c:forEach>

	</section>
	
<div class="container icons-start">
<hr>
<h2><i class="fas fa-hamburger"></i> &nbsp;지역별음식점</h2>
<hr>
</div>
	<div >

	<div class="container icons-list">
	
		<a href="http://localhost:8877/search?keyword=%EA%B0%95%EC%84%9C%EA%B5%AC&searchBtn="><img style="border: solid grey 1px;"src="/img/강서구.jpg" class="img"></a>
		<a href="http://localhost:8877/search?keyword=%EA%B8%88%EC%A0%95%EA%B5%AC&searchBtn="><img style="border: solid grey 1px;"alt="" src="/img/금정구.jpg" class="img"></a>
		<a href="http://localhost:8877/search?keyword=%EB%8F%99%EB%9E%98%EA%B5%AC&searchBtn="><img style="border: solid grey 1px;"alt="" src="/img/동래구.jpg" class="img"></a>
		<a href="http://localhost:8877/search?keyword=%EC%A7%84%EA%B5%AC&searchBtn="><img style="border: solid grey 1px;"alt="" src="/img/부산진구.jpg" class="img"></a>
		<a href="http://localhost:8877/search?keyword=%EC%82%AC%EC%83%81%EA%B5%AC&searchBtn="><img style="border: solid grey 1px;"alt="" src="/img/사상구.jpg" class="img"></a>
		<a href="http://localhost:8877/search?keyword=%EC%88%98%EC%98%81%EA%B5%AC&searchBtn="><img style="border: solid grey 1px;"alt="" src="/img/수영구.jpg" class="img"></a>
		<a href="http://localhost:8877/search?keyword=%EC%97%B0%EC%A0%9C%EA%B5%AC&searchBtn="><img style="border: solid grey 1px;"alt="" src="/img/연제구.jpg" class="img"></a>
		<a href="http://localhost:8877/search?keyword=%ED%95%B4%EC%9A%B4%EB%8C%80&searchBtn="><img style="border: solid grey 1px;"alt="" src="/img/해운대구.jpg" class="img"></a>
	</div>
	</div>
<div class="container-fluid board-start">
	<h1>안녕</h1>
	</div>
	
	
<!-- 	<div class="container-fluid"> -->
<!-- 		<div class="explain"> -->
<!-- 			<h2>FOODIES</h2> -->
<!-- 			<br> -->
<!-- 			<h4> -->
<!-- 				먹는 즐거움의 시작! -->
<!-- 				</h3> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="container-fluid"> -->
<!-- 		<div class="explain"> -->
<!-- 			<h2>FOODIES</h2> -->
<!-- 			<br> -->
<!-- 			<h4> -->
<!-- 				먹는 즐거움의 시작! -->
<!-- 				</h3> -->
<!-- 		</div> -->
<!-- 	</div> -->

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src='<c:url value="/js/slick.js"/>'></script>
	<script>
		$(function() {
			$(window).scroll(function() {
				var num = $(this).scrollTop();
				if (num > 100) {
					$('nav').removeClass('nav-down').addClass('nav-up');
				} else {
					$('nav').removeClass('nav-up').addClass('nav-down');
				}
			});
		});

		$(function() {
			$(window).scroll(function() {
				var num = $(this).scrollTop();
				if (num > 700) {
					$('#banner').removeClass('nav-down').addClass('nav-up');
				} else {
					$('#banner').removeClass('nav-up').addClass('nav-down');
				}
			});
		});

		$(document).on('ready', function() {

			$(".vertical").slick({
				dots : false,
				vertical : false,
				fade : false,
				slidesToShow : 3,
				slidesToScroll : 3
			});

		});

		$(function() {
			// 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
			$('#carousel-example-generic').carousel({
				// 슬리아딩 자동 순환 지연 시간
				// false면 자동 순환하지 않는다.
				interval : 3000,
				// hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
				pause : 'hover',
				// 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
				wrap : true,
				// 키보드 이벤트 설정 여부(?)
				keyboard : true,
			});
		});

		$(".hover").mouseleave(function() {
			$(this).removeClass("hover");
		});
		
	</script>

<%@ include file="../includes/footer.jsp"%>
</body>
</html>