<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
      <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FOOODIES</title>


 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
        integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="/css/style.css">
   <link rel="preconnect" href="https://fonts.googleapis.com">
<script src="/static/js/include-html.js"></script>

</head>
<jsp:include page="../includes/header.jsp"></jsp:include>
<jsp:include page="../includes/banner.jsp"></jsp:include>
<jsp:include page="./recommend-photo.jsp"></jsp:include>
<jsp:include page="./review-photo.jsp"></jsp:include>
<!-- 슬라이드 -->
  
    <!-- 글자박스 -->

    <div class="box">
        <h1>즐거운 <br> 먹방 생활</h1>
        <p>FOODIES가 엄선한 음식점들을 만나보세요.</p>
          <button>음식 아이디어 얻기</button>
    </div>



<div id="all">
<!-- 첫페이지 끝 -->
<!-- 둘러보기 Section -->
<section id="around">
<h1>가까운 여행지 둘러보기</h1>
<div class="grid">
    <div class="item">
        <img src="${food.mainImgThumb}" alt="image">
        <div> <div class="bold">서울</div> <r> 차로 5시간거리</div>
    </div>
    <div class="item">
        <img src="img/대구.jpg " alt="image">
        <div><div class="bold">대구</div> <r> 차로 1.5시간거리</div>
    </div>
    <div class="item">
        <img src="img/울산.jpg" alt="image">
        <div> <div class="bold">울산</div> <r> 차로 1시간거리 </div>
    </div>
    <div class="item">
        <img src="img/대전.jpg" alt="image">
        <div> <div class="bold">대전</div> <r> 차로 3.5시간거리 </div>
    </div>
    <div class="item">
        <img src="img/광주.jpg " alt="image">
        <div> <div class="bold">광주</div> <r> 차로 3.5시간거리</div>
    </div>
    <div class="item">
        <img src="img/인천.jpg " alt="image">
        <div><div class="bold">인천</div>  <r> 차로 5시간거리</div>
    </div>
    <div class="item">
        <img src="img/의정부시.jpg " alt="image">
        <div> <div class="bold">의정부시</div> <r> 차로 5.5시간거리</div>
    </div>
    <div class="item">
        <img src="img/청주시.jpg " alt="image">
        <div> <div class="bold">청주시</div> <r> 차로 3.5시간거리</div>
    </div>
    
    
    </div>
    <!-- 둘러보기 섹션 끝 live 섹션 시작 -->

</section>

<section id="live">
<h1>어디에서나, 여행은 살아보는거야</h1>
<div class="grid">
<div class="item">
    <img src="img/1.jpg" alt="image">
    <div> 자연을 만끽할 수 있는 숙소</div>
</div>
<div class="item">
    <img src="img/4.jpg " alt="image">
    <div> 독특한 공간</div>
</div>
<div class="item">
    <img src="img/2.jpg" alt="image">
    <div> 집 전체 </div>
</div>
<div class="item">
    <img src="img/3.jpg" alt="image">
    <div> 반려동물 동반가능 </div>
</div>


</div>


</section>
<!-- live 섹션 끝 호스트되어보기섹션 시작 -->
<section id="behost">
    <div class="item">
        
        <div class="box">
            <h1>호스트가<br>되어보세요</h1>
            <p>숙소를 공유하여 부수입을 올리고 새로운<br>가능성을 만나세요.</r></p>
              <button id="button1">자세히 알아보기</button>
    
    
    
        </div>
    </div>

</section>
<!-- 체험둘러보기 섹션 -->
<section id="experi">
    <h1>체험 둘러보기</h1>
    <p>현지 전문가와 함께하는 독특한 액티비티에 오프라인이나 온라인으로 참여해 보세요.</p>
    <div class="grid">
      
        <div class="item">
            <img src="img/체험1.jpg" alt="image">
            <div> 추천컬렉션: 여행본능을 깨우는 체험
                <p>온라인 체험으로 집에서 랜선여행을 즐기세요</p></div>

        </div>

            <div class="item">
                <img src="img/체험2.jpg" alt="image">
                <div> 온라인체험
                    <p>호스트와 실시간으로 소통하면서 액티비티를 즐겨보세요</p></div>
            </div>

  
                <div class="item">
                    <img src="img/체험3.jpg" alt="image">
                    <div> 체험
                        <p>어디서든 세계 각지의 매력을 만나실 수 있습니다.</p></div>
                </div>

</section>

<!-- footer -->
<div class="footer">
    <div class="box">
    <div><p><span class="h">소개</span><br>에어비앤비 이용방법<br> 뉴스룸<br> 투자자 정보<br> 에어비앤비플러스<br>
        에어비앤비 Luxe<br> 호텔투나잇<br> 에어비엔비 비즈니스 프로그램<br>
    호스트 분들이 있기에 가능합니다.<br>채용정보<br>창립자편자</p>
        </div>
    <div><p><span class="h">커뮤니티</span><br>다양성 및 소속감<br>접근성<br>에어비앤비 어소시에이트
        <br>구호인력을 위한 숙소<br> 게스트 추천<br>
    Airbnb.org</p>
</div>
   <div><p><span class="h">호스팅하기</span><br>숙소호스팅<br>온라인 체험 호스팅하기<br>체험 호스팅하기<br> 책임감 있는 호스팅<br>자료 센터<br>커뮤니티 센터<br></p>
</div>
<div> <p><span class="h">에어비앤비 지원</span><br>에어비앤비의 코로나19 대응방안<br>도움말 센터<br>예약취소 옵션<br>에어비엔비 이웃 민원 지원<br>신뢰와 안전</p>
</div>
  

</div>
<br><br><br><br><br><br><br><br><br>

<hr>
<br>
<span id="a">

<div class="btm"> 
<span><p>© 2021 Airbnb, Inc.·개인정보 처리방침·이용약관·사이트맵·한국의 변경된 환불 정책·회사 세부정보</p> </span><br>
</div>
<div class="btm"> 
  <img src="/img/globe.png" alt="icon"> &nbsp;&nbsp;<u>한국어(KR)</u>&nbsp;&nbsp;&nbsp;
  <img src="/img/north-korea-won.png" alt="icon">&nbsp;&nbsp; <u>KRW</u>
  </div>
  <div class="btm"> 
  <img src="/img/facebook.png" alt="icon">&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="/img/twitter.png" alt="icon">&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="/img/instagram-symbol.png" alt="icon">&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="/img/blog.png" alt="icon">&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="/img/greenpencil.png" alt="icon">
</div>
</span>
</div>
</div>
<body>
    
</body>
</html>