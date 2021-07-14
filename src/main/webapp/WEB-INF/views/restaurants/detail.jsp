<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/storedetail.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
        integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <title>상세보기</title>
</head>

<body>
    <!-- 네비게이션 -->
    <nav class="main-navi nav-down">
        <div class="logo">
            <a href="/">
                <i class="fas fa-hamburger"></i>FOODIES
            </a>
        </div>
        <form class="">
            <div class="search">
                <input type="text" class="search-input" placeholder="지역 및 식당, 음식">
                <button class="search-button"><i class="fas fa-search"></i></button>
            </div>
        </form>

        <div class="menu" id="host">
           <div class="item"> <a href="/register">회원가입</a></div>
            <div class="item"><a href="/login">로그인</a></div>
            <div class="item"><a href="list">게시판</a></div>
        </div>
    </nav>

    <div class="headerdiv"></div>

    <div class="container detail-title">
        <div class="name" id="main_title">${restaurant.mainTitle}</div>
        <div class="stars">&nbsp;4.7</div>
    </div>
    <div class="container detail-subtitle">${restaurant.itemcntnts}</div>
    <div class="container detail-status">
        <i class="fas fa-eye"></i> &nbsp;43,210 &nbsp;<i class="fas fa-bookmark"></i> &nbsp;3,210 &nbsp;<i
            class="fas fa-star"></i> &nbsp;210
    </div>

    <div class="container">

        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
            </ul>

            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="${restaurant.mainImgNormal}">
                </div>
                <div class="carousel-item">
                    <img src="${restaurant.mainImgNormal}">
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
    </div>

    <div class="container details-main">
        <div class="details-explain">
            <h6>영업시간</h6>
            <div>${restaurant.usageDayWeekAndTime}</div>
            <h6>메뉴 </h6>
            <div>${restaurant.rprsntvMenu}</div>
            <h6>매장소개</h6>
            <div>${restaurant.itemcntnts}</div>
            <h6>전화번호</h6>
            <div>${restaurant.cntctTel} </div>       
            <h6>주소</h6>
            <div>${restaurant.addr1}</div><br>
        </div>
        <!-- 지도를 표시할 div 입니다 -->
        <div class="details-side">
            <!-- 지도 위쪽 메뉴 -->
            <div class="side-menu">
                <div class="side-bottons">
                </div>
            </div>
            <div id="map" style="width:20vw;height:25vw;"></div>
        </div>
    </div>
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9d918e400d0d27925a89d2d4d6ccd0db"></script>
   <!--  <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${restaurant.lat}, ${restaurant.lng}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(${restaurant.lat}, ${restaurant.lng}); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

    </script> -->
    <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${restaurant.lat}, ${restaurant.lng}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(${restaurant.lat}, ${restaurant.lng}); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">${restaurant.mainTitle} <br><a href="https://map.kakao.com/link/map/${restaurant.mainTitle},${restaurant.lat},${restaurant.lng}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${restaurant.mainTitle},${restaurant.lat},${restaurant.lng}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(${restaurant.lat}, ${restaurant.lng}); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
    
    </script>
</body>


</html>
