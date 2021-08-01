<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<jsp:include page="../includes/header.jsp"></jsp:include>
<style >
.star-rating {
  display:flex;
  flex-direction: row-reverse;
  font-size:1.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}

button {
	background: none;
}

/* explanation */

article {
  background-color:#ffe;
  box-shadow:0 0 1em 1px rgba(0,0,0,.25);
  color:#006;
  font-family:cursive;
  font-style:italic;
  margin:4em;
  max-width:30em;
  padding:2em;
}
</style>
<body>

    <div class="headerdiv"></div>

    <div class="container detail-title">
        <div class="name" id="main_title">${restaurant.mainTitle}</div>
        <div class="stars">&nbsp;<c:if test="${ avg ne 'n' }">${avg }</c:if> </div>
    </div>
    <div class="container detail-subtitle">${restaurant.itemcntnts}</div>

    <div class="container detail-status">
       <!-- 즐겨찾기버튼 -->
<%--  ${ bookmark.restaurant.id}
 ${restaurant.id }
  ${bookmark.member.id }
   ${principal.member.id} --%>
 
 	<sec:authorize access="hasAuthority('ROLE_Manager')">
 	</sec:authorize>
 	
 	<sec:authorize access="isAnonymous()">
 		<a href="/login"><h3>나만의 맛집 리스트를 만들어보세요 🍔</h3></a>
 	</sec:authorize>
 
 <sec:authorize access="hasAuthority('ROLE_Member')">
   <input type="hidden" id="member" value="${principal.member.username }"/>
        <input type="hidden" id="memberId" value="${principal.member.id }"/>
      		<c:choose>
      			<c:when test="${ (bookmark.restaurant.id eq restaurant.id) and (bookmark.member.username eq principal.member.username )}">
      				<input type="hidden" id="bookmarkId" value="${bookmark.id }" />
      			<div class="like-container">
	  				<div class="like-cnt unchecked" id="like-cnt"> 
	  					<button type="button" id="btn-like-cancel"><h1 > ❤ </h1></button> <!-- 찜취소 -->
	  				</div>
				</div>
      			</c:when>
      			
      			<c:otherwise>
      				<div class="like-container">
      			<div class="like-cnt unchecked" id="like-cnt"> 
	  				<button type="button" id="btn-like"><h1 id="btn-like">  🤍 </h1></button> <!-- 찜하기 -->
	  				</div>
				</div>
      			</c:otherwise>
      		</c:choose>
      </sec:authorize>
				
    <%--   		</c:forEach> --%>
        <!-- <i class="fas fa-eye"></i> &nbsp;43,210 &nbsp; -->
        <i class="fas fa-bookmark"></i> &nbsp;${count} &nbsp;
      <!--   <i class="fas fa-star"></i> &nbsp;210 -->
    </div>
 

    <div class="container">

        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
            </ul>
         
            
            </div> 
            
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
                    <c:if test="${not empty attachList}">
                        <c:forEach items="${ attachList}" var="attach">
                        <c:if test="${empty attach.reviewboardId }">
                    	  	<!-- The slideshow -->
				            <div class="carousel-inner">
				                <div class="carousel-item active">
				                      <img src="/resources/upload/${attach.uploadpath}/${attach.uuid}_${attach.filename}" />
				                </div>
				            </div>
				            </c:if>
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
        <div id="map" style="width:80%;height:350px;"></div>
        
        <!-- 비회원 -->
        <sec:authorize access="isAnonymous()">
        	<a href="/login">foodies 의 회원이 되시면 리뷰를 남길 수 있어요😎</a>
            </sec:authorize>
            
       <!-- 회원 -->
        <sec:authorize access="hasRole('ROLE_Member')">
        	<a href="/member/review/${restaurant.id }"><button type="button" class="btn btn-warning" id="btn-submit">리뷰쓰기</button></a>
        	</sec:authorize>
        
             <!-- 관리자 -->
         <sec:authorize access="hasRole('ROLE_Manager')">
           <a href="/manager/restaurant/update/${restaurant.id}"><button type="submit" class="btn btn-warning" id="btn-submit">수정</button></a>
           <button type="button" class="btn btn-warning" id="btn-delete">삭제</button>
            </sec:authorize>
    
   
</div>
<br/>
           <!-- 리뷰가 나타날 곳 -->
    <!-- 댓글 view단 -->
	<div class="container">
		<div class="card-header">
			<b>foodies의 후기</b>
		</div>
		<c:forEach items="${restaurant.reviewBoards}" var="review">
		
		<ul id="reply-box" class="list-group">
			<li id="reply-1" class="list-group-item d-flex justify-content-between">
				<div>  
				<input type="hidden" id="reviewId" value="${review.id }"/>
				<!-- 이 부분만 해결하면 됨 -->
				<div class="star-rating"> 
				  <input type="radio" id="1" value="5" <c:if test="${review.grade eq 5.0}">checked="checked"</c:if> onclick="return(false)"/>
				  <label for="5-stars" class="star">&#9733;</label>
				  <input type="radio" id="2"  value="4" <c:if test="${review.grade eq 4.0}">checked="checked"</c:if> onclick="return(false)"/>
				  <label for="4-stars" class="star">&#9733;</label>
					<input type="radio" id="3 " value="3" <c:if test="${review.grade eq 3.0}">checked="checked"</c:if> onclick="return(false)"/>
				  <label for="3-stars" class="star">&#9733;</label>
				   <input type="radio" id="4 " value="2" <c:if test="${review.grade eq 2.0}">checked="checked"</c:if> onclick="return(false)"/>
				  <label for="2-stars" class="star">&#9733;</label>
				   <input type="radio" id="5" value="1" <c:if test="${review.grade eq 1.0}">checked="checked"</c:if> onclick="return(false)"/>
				  <label for="1-star" class="star">&#9733;</label>
				 </div> <br/>
				
			<br/>
				${review.content }<br/>
				  작성자 : ${review.member.username } <br/>	
 					작성일 : <fmt:formatDate value="${review.regDate}" pattern="yyyy-MM-dd hh:mm:ss" />
 					<br/>
 					<c:if test="${principal.member.username eq review.member.username }">
 					<button type="button" class="btn btn-warning sm btn-review-delete" id="btn-review-delete${review.id }" data-value="${review.id }">삭제</button>
 					</c:if>
 					</div>
			</li>
		</ul>
		</c:forEach>
	</div>
 
 
   
    
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9d918e400d0d27925a89d2d4d6ccd0db&libraries=services"></script>

<script>
// 관리자 식당 삭제 요청
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
// 사용자 리뷰 삭제 요청
$(".btn-review-delete").on('click', function(){
	//alert("dd");
	var b = $(this).attr('data-value');
	if (!confirm("정말로 삭제하시겠습니까?")){
		return false;
	}
	$.ajax({
		method: "DELETE",
		url: "/member/review/del/"+b
	})
	.done(function(resp){
		if(resp == "success"){
			alert("삭제 되었습니다");
			location.href="/detail/"+${restaurant.id};
		}
	})
	.fail(function(e){
		alert(e);
		//alert("삭제 실패");
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
// 찜
$("#btn-like").on("click", function(){
	//$("#btn-like").html("❤");
	// 로그인 먼저 해야됨
	if (${empty principal}){
		alert("로그인한 사용자만 찜할 수 있습니다");
		location.href="/login";
		return;
	} else {
		var member = $("#member").val();
		var resId = ${restaurant.id};
		var isLike = true;
		
		var bookmark = {
			"member": member,
			"resId": resId,
			"isLike" : "true"
		}
		if(!confirm("찜하겠습니까?")){
			return false;
		};
		$.ajax({
			method: "POST",
			url: "/member/bookmark",
			contentType: "application/json;charset=utf-8",
			data : JSON.stringify(bookmark)
		})
		.done(function(resp){
			if(confirm("찜한 목록으로 가시겠습니까?")){
				var memberId = $("#memberId").val();
				location.href="/member/mypage/bookmark/"+memberId;
			} else {
				location.href="/detail/"+resId;
			}
		})
	}
	
	
})
// 찜 취소
$("#btn-like-cancel").on("click", function(){
	if(!confirm("찜하기를 취소하시겠습니까?")){
		return false;
	}  {
		var bookmarkId = $("#bookmarkId").val();
		$.ajax({
			method: "DELETE",
			url: "/member/bookmark/del/"+bookmarkId
		})
		.done(function(resp){
			if (resp == "success"){
				alert("취소 되었습니다");
				location.href="/detail/"+${restaurant.id};
			}
		})
		.fail(function(e){
			alert("오류가 발생했습니다. 다시 시도해주세요");
		})
			
	} // else
	
})

</script>

</body>


</html>
