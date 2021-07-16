<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../includes/header.jsp"></jsp:include>
<%-- <!DOCTYPE html>
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
	href="${pageContext.request.contextPath}/css/home.css">
<link rel="preconnect" href="https://fonts.googleapis.com">

</head>
<body>

	<!-- 네비메뉴 -->
	<nav class="main-navi nav-down">
		<div class="logo">
			<a href="/"> <i class="fas fa-hamburger"></i> &nbsp; FOODIES
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
				<a href="list">게시판</a>
			</div>
			<sec:authorize access="isAuthenticated()"></sec:authorize>
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
	</nav>


	<div class="main-navi2">
		<div class="logo">
			<a href="/"> <i class="fas fa-hamburger"></i> &nbsp;FOODIES
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
			<sec:authorize access="isAuthenticated()"></sec:authorize>
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
		</div> --%>
	</div>
	<div class="banner nav-down" id="banner">
		<div style="width: 150px; height: 500px;">
			<!-- carousel를 사용하기 위해서는 class에 carousel와 slide 설정한다. -->
			<!-- carousel는 특이하게 id를 설정해야 한다.-->
			<div id="carousel-example-generic" class="carousel slide">
				<!-- carousel의 지시자 -->
				<!-- 지시자라고는 하는데 ol태그의 class에 carousel-indicators를 넣는다. -->
				<ol class="carousel-indicators">
					<!-- li는 이미지 개수만큼 추가하고 data-target은 carousel id를 가르킨다. -->
					<!-- data-slide-to는 순서대로 0부터 올라가고 0은 active를 설정한다. -->
					<!-- 딱히 이 부분은 옵션별로 설정하게 없다. -->
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				</ol>
				<!-- 실제 이미지 아이템 -->
				<!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. -->
				<div class="carousel-inner" role="listbox">
					<!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->
					<div class="item active">
						<!-- 아미지 설정- -->
						<a
							href="https://www.tokkijung.co.kr/sns/company/brand_tokki_menu.php#sec1">
							<img src="/banner/rabbit2.jpg"
							style="width: 100%; height: 700px;" />
						</a>
						<!-- 캡션 설정 (생략 가능) -->
						<!-- 글자 색은 검은색 -->

						<div class="carousel-caption" style="color: black">먹자 먹자 먹자
						</div>
					</div>
					<div class="item">

						<a
							href="https://www.tokkijung.co.kr/sns/company/brand_tokki_menu.php#sec1">
							<img src="/banner/rabbit1.jpg"
							style="width: 100%; height: 700px;" />
						</a>
						<div class="carousel-caption" style="color: black">선생님 먹방</div>
					</div>
				</div>
				<!-- 왼쪽 화살표 버튼 -->
				<!-- href는 carousel의 id를 가르킨다. -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <!-- 왼쪽 화살표 --> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				</a>
				<!-- 오른쪽 화살표 버튼 -->
				<!-- href는 carousel의 id를 가르킨다. -->
				<a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <!-- 오른쪽 화살표 --> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				</a>
			</div>
		</div>
	</div>
	<div class="container-fluid main-start">
		<div class="explain">
			<h2>FOODIES</h2>
			<br>
			<h4>먹는 즐거움의 시작!</h4>
		</div>
	</div>
	<div class="container slide-start">
		<h2>추천음식점</h2>
	</div>

	<section class="vertical slider container">

		<c:forEach items="${lists}" var="restaurant" varStatus="st">
			<div>
				<a href="/detail/${restaurant.id}">
					<figure class="snip1384">
						<img src="${restaurant.mainImgNormal}" />
						<figcaption>
							<h3>${restaurant.mainTitle}</h3>
							<%-- <p>${restaurant.itemcntnts }</p> --%>
						</figcaption>
					</figure>
				</a>
			</div>
		</c:forEach>

	</section>


	<div class="container-fluid">
		<div class="explain">
			<h2>FOODIES</h2>
			<br>
			<h4>
				먹는 즐거움의 시작!
				</h3>
		</div>
	</div>
	<div class="container-fluid">
		<div class="explain">
			<h2>FOODIES</h2>
			<br>
			<h4>
				먹는 즐거움의 시작!
				</h3>
		</div>
	</div>
	<div class="container-fluid">
		<div class="explain">
			<h2>FOODIES</h2>
			<br>
			<h4>
				먹는 즐거움의 시작!
				</h3>
		</div>
	</div>

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
				dots : true,
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


</body>
</html>