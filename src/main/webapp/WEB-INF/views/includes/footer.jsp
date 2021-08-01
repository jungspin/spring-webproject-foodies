<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.footer {
    
    background-color: #f1f1f1;
    margin-top: 60px;
    text-align:center;
    height: 39vh;
    border: 1px solid rgb(218, 211, 211);  
    
  }
  .footer a{
  text-decoration: none;
  
  }
  .footer .box{    
    display: grid;
    grid-template-columns: 0.5fr 0.5fr 0.5fr 0.5fr;    
    width: 100%;
    text-align: center;
    margin: 10px;
  }       
  .footer p {
    cursor: pointer;
      font-size: 1rem;
      text-align: left;
      line-height: 2.5;
      font-size: 14px;
  }

  .footer .h{
      font-weight: 700;
      font-size: 13px;
      
  }
</style>
<body>
<div class="footer">
    <div class="box">
    <div><p><span class="h">소개</span><br><a href="invester">Foodies를 응원해주세요!</a><br>  <a href="invester">투자자 정보</a>
   <br><a href="invester">채용정보</a><br><a href="invester">창립자편자</a></p>
        </div>
    <div><p><span class="h">커뮤니티</span><br> <a href="/list">자유게시판</a><br><a href="/register">회원가입</a> <br><a href="/login"> 로그인</a>
        <br>
    <a href="/">Foodies.com</a></p>
</div>
   <div><p><span class="h">Foodies와 함께하기 </span><br><a href="/insert">음식점 공유하기</a><br><a href="/">식당 리뷰</a><br><a href="/">추천식당 함께하기</a><br> 
</div>
<div> <p><span class="h">Foodies 지원</span><br><a href="/19">Foodies 코로나19 대응방안</a><br>
</div>
  

</div>


<span> <p>© 2021 Footer, Inc.·개인정보 처리방침·이용약관·사이트맵·한국의 변경된 환불 정책·회사 세부정보</p> </span><br>
</div>

</body>
</html>