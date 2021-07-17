<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../includes/header.jsp"></jsp:include>
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
   <!--  <nav class="main-navi nav-down">
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
    </nav> -->

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
         <%--    <div class="carousel-inner">
             
                <c:if test="${not empty restaurant.mainImgNormal or not empty attachList }">
                   <div class="carousel-item active">
                    <img src="${restaurant.mainImgNormal}">
                    <c:forEach items="${ attachList}" var="attach">
                    	  <img src="/resources/upload/${attach.uploadpath}/${attach.uuid}_${attach.filename}" />
                    </c:forEach>
                      </div>
                	<div class="carousel-item">
             
                    <img src="${restaurant.mainImgNormal}">
               
                	</div>
                  </c:if>
            
            </div> --%>
            
                       <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
               
                    <c:choose>
                    	  <c:when test="${ restaurant.mainImgNormal eq null }">
                    	  	
                    	  </c:when>
                    	  <c:otherwise>
                    	  	
                    	  	<img src="${restaurant.mainImgNormal}">
                    	  </c:otherwise>
                    </c:choose>
                  <!-- 이부분이 해결돼야 리뷰에도 사진올리고 어쩌고저쩌고 -->
                    <c:if test="${not empty attachList }">
                        <c:forEach items="${ attachList}" var="attach">
                    	  	<!-- The slideshow -->
				            <div class="carousel-inner">
				                <div class="carousel-item active">
				                      <img src="/resources/upload/${attach.uploadpath}/${attach.uuid}_${attach.filename}" />
				                </div>
				            </div>
                    	</c:forEach>
                    </c:if>
                    
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
        
        
   		<!--      지도를 표시할 div 입니다 -->
        <div id="map" style="width:100%;height:350px;"></div>
        
        <!-- 비회원 -->
        <sec:authorize access="isAnonymous()">
        	<a href="/register">foodies 의 회원이 되시면 리뷰를 남길 수 있어요😎</a>
            </sec:authorize>
            
         <!-- 회원 -->
        <sec:authorize access="hasRole('ROLE_Member')">
        	<a href="/member/review/${restaurant.id }"><button type="button" class="btn btn-warning" id="btn-submit">리뷰쓰기</button></a>
        	</sec:authorize>
        
         <!-- 관리자 -->
         <sec:authorize access="hasRole('ROLE_Manager')">
           <a href="/manager/restaurant/update/${restaurant.id}"><button type="submit" class="btn btn-warning" id="btn-submit">수정</button></a>
           <a href="#"><button type="button" class="btn btn-warning" id="btn-delete">삭제</button></a>
            </sec:authorize>
    </div>
    
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66159ace2b774061f4844aad5cb1be92&libraries=services"></script>

<script>
// 삭제 요청
$("#btn-delete").on('click', function(){
	//alert("dd");
	if (!confirm("정말로 삭제하시겠습니까?")){
		return false;
	}
	$.ajax({
		method: "DELETE",
		url: "/manager/restaurant/del/"+${restaurant.id}
	})
	.done(function(resp){
		if(resp == "success"){
			alert("삭제 되었습니다");
			location.href="/";
		}
	})
	.fail(function(){
		alert("삭제 실패");
	})
})

// 지도 api
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch("${restaurant.addr1}", function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
         var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><a href="https://map.kakao.com/link/search/부산${restaurant.mainTitle }">${restaurant.mainTitle}</a></div>'
        });
        infowindow.open(map, marker);
        

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});  
</script>

</body>


</html>
