<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
        integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="/css/style.css">
   <link rel="preconnect" href="https://fonts.googleapis.com">
<script src="/static/js/include-html.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</head>
<style>
.post-slider{
  width:70%;
  margin:0px auto;
  position:relative;
}
.post-slider .silder-title{
  text-align:center;
  margin:30px auto;
}
.post-slider .next{
  position:absolute;
  top:50%;
  right:30px;
  font-size:2em;
  color:gray;
  cursor: pointer;
}
.post-slider .prev{
  position:absolute;
  top:50%;
  left:30px;
  font-size:2em;
  color:gray;
    cursor: pointer;
}
.post-slider .post-wrapper{
  width:84%;
  height:350px;
  margin:0px auto;
  overflow: hidden;
  padding:10px 0px 10px 0px;
}
.post-slider .post-wrapper .post{
  width:300px;
  height:300px;
  margin:0px 10px;
  display:inline-block;
  background:white;
  border-radius: 5px;
}
.post-slider .post-wrapper .post .post-info{
  font-size:15px;
  height:30%;
  padding-left:10px;
}
.post-slider .post-wrapper .post .slider-image{
  width:100%;
  height:175px;
  border-top-left-radius:5px;
  border-top-right-radius:5px;
}
</style>
<body>
 <div class="page-wrapper" style="position:relative;">
      <!--page slider -->
      <div class="post-slider">
        <h1 class="silder-title">추천 음식점</h1>
       
        <div class="post-wrapper">
         <c:forEach items="${lists}" var="restaurant" varStatus="st"> 
          <div class="post">
            <a href="/detail/${restaurant.id}"><img src="${restaurant.mainImgNormal}" class="slider-image">
            <div class="post-info">
              <h4>${restaurant.mainTitle} </h4>
              <i class="far fa-user" style="height:10%;">${restaurant.itemcntnts }</i>
            </div></a>
          </div>
         </c:forEach>
        </div>
      </div>
      <!--post slider-->
    </div>
    <div class="page-wrapper" style="position:relative;">
      <!--page slider -->
      <div class="post-slider">
        <h1 class="silder-title">리뷰 음식점</h1>
        <i class="fas fa-chevron-left prev"></i>  
        <i class="fas fa-chevron-right next"></i>  
        <div class="post-wrapper">
         <c:forEach items="${lists}" var="restaurant" varStatus="st"> 
          <div class="post">
            <img src="${restaurant.mainImgNormal}" class="slider-image">
            <div class="post-info">
              <h4><a href="#">${restaurant.mainTitle} </a></h4>
              <i class="far fa-user" style="height:10%;">${restaurant.itemcntnts }</i>
            </div>
          </div>
         </c:forEach>
        </div>
      </div>
      <!--post slider-->
    </div>
    <script>
    $('.post-wrapper').slick({
    	  slidesToShow: 3,
    	  slidesToScroll: 2,
    	  autoplay: true,
    	  autoplaySpeed: 3000,
    	  nextArrow:$('.next'),
    	  prevArrow:$('.prev'),
    	});</script>
    	   <script>
    $('.post-wrapper').slick({
    	  slidesToShow: 3,
    	  slidesToScroll: 2,
    	  autoplay: true,
    	  autoplaySpeed: 3000,
    	  nextArrow:$('.next'),
    	  prevArrow:$('.prev'),
    	});</script>
    	
</body>
</html>