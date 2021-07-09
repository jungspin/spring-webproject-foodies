<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shorcut icon" href="airbnb.ico" type="image/x-icon">
    <title>FOODIES</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 에어비엔비 메인 css -->
<link rel="stylesheet" href="/css/style.css">
</head>

<!-- 첫페이지 시작 -->
<header id ="main-page">
    
    <!-- 네비메뉴 -->
    <nav class="main-navi">
        <div class="logo">
            <a href="/">
                <i class="fas fa-hamburger"></i> FOODIES
            </a>
             
            
        </div>

        <div class="search">
            <button class="btn">
                <div>음식점 검색하기</div>
                <div class="bicon">
                    <i class="fas fa-search"></i>
                </div>
            </button>
            
            
        </div>

        <div class="menu" id="host">
            <div class="item">회원가입</div>
            <div class="item">로그인</div>
              <div class="item">게시판</div>       
       
            <div class="item">           
                
            </div>   
            
        </div>
    </nav>
    <nav class="banner" id="banner">
        <div><!DOCTYPE html>
            <html lang="en">
              <head>
                <!-- Bootstrap cdn 설정 -->
                <link
                  rel="stylesheet"
                  href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
                />
                <link
                  rel="stylesheet"
                  href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css"
                />
                <link
                  rel="stylesheet"
                  href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
                />
                <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
              </head>
              <body>
                <!-- carousel를 구성할 영역 설정 -->
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
                      <li
                        data-target="#carousel-example-generic"
                        data-slide-to="0"
                        class="active"
                      ></li>
                      <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    </ol>
                    <!-- 실제 이미지 아이템 -->
                    <!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. -->
                    <div class="carousel-inner" role="listbox">
                      <!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->
                      <div class="item active">
                        <!-- 아미지 설정- -->
                        <a href ="https://www.tokkijung.co.kr/sns/company/brand_tokki_menu.php#sec1">
                        <img
                          src="/banner/rabbit2.jpg"
                          style="width: 100%; height: 700px; ;"
                        /></a>
                        <!-- 캡션 설정 (생략 가능) -->
                        <!-- 글자 색은 검은색 -->
                        
                        <div class="carousel-caption" style="color: black">
                          먹자 먹자 먹자
                        </div>
                      </div>
                      <div class="item">
                      
                      <a href ="https://www.tokkijung.co.kr/sns/company/brand_tokki_menu.php#sec1">
                        <img 
                          src="/banner/rabbit1.jpg"
                          style="width: 100%;height: 700px;"
                        /></a>
                        <div class="carousel-caption" style="color: black">선생님 먹방</div>
                      </div>
                    </div>
                    <!-- 왼쪽 화살표 버튼 -->
                    <!-- href는 carousel의 id를 가르킨다. -->
                    <a
                      class="left carousel-control"
                      href="#carousel-example-generic"
                      role="button"
                      data-slide="prev"
                    >
                      <!-- 왼쪽 화살표 -->
                      <span
                        class="glyphicon glyphicon-chevron-left"
                        aria-hidden="true"
                      ></span>
                    </a>
                    <!-- 오른쪽 화살표 버튼 -->
                    <!-- href는 carousel의 id를 가르킨다. -->
                    <a
                      class="right carousel-control"
                      href="#carousel-example-generic"
                      role="button"
                      data-slide="next"
                    >
                      <!-- 오른쪽 화살표 -->
                      <span
                        class="glyphicon glyphicon-chevron-right"
                        aria-hidden="true"
                      ></span>
                    </a>
                  </div>
                </div>
                <script>
                  $(function () {
                    // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
                    $('#carousel-example-generic').carousel({
                      // 슬리아딩 자동 순환 지연 시간
                      // false면 자동 순환하지 않는다.
                      interval: 3000,
                      // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
                      pause: 'hover',
                      // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
                      wrap: true,
                      // 키보드 이벤트 설정 여부(?)
                      keyboard: true,
                    });
                  });
                </script>
              </body>
            </html>
            </div>
    </nav>
    <!-- 썸네일 슬라이더  -->
    
    <!-- 글자박스 -->

    <div class="box">
        <h1>즐거운 <br> 먹방 생활</h1>
        <p>FOODIES가 엄선한 음식점들을 만나보세요.</p>
          <button>음식 아이디어 얻기</button>
    </div>


</header>
<div id="all">
<!-- 첫페이지 끝 -->
<!-- 둘러보기 Section -->
<section id="around">
<h1>가까운 여행지 둘러보기</h1>
<div class="grid">
    <div class="item">
        <img src="img/서울.jpg " alt="image">
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