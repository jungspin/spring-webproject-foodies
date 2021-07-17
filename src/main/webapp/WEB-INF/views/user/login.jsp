<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <!DOCTYPE html>
<html lang="en">
<head>
  <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body> -->
<jsp:include page="../includes/header.jsp"></jsp:include>
<style>
.button {
  background-color: orange;
  color: white;
  font-size: 20px;
  font-weight: 700;
  margin: 12px 0 14px;
  border: 1px solid orange;
  border-radius: 5px;
  height: 40px;
  width: 300px;
}
.input {
  height: 40px;
  width: 300px;
  border-radius: 5px;
  font-size: 20px;
  border: 1px solid gray;
}
.div {
 width: "80%";
  margin: "0 auto";
  text-align: center;

}
</style>

 <br/>
 <br/>
 <br/>
<div class="div">
  <h2>임시 로그인 페이지</h2>
  <form action="/loginProc" method="post">
  <div class="form-group">
      <input type="text" class="input" id="username" placeholder="아이디를 입력해주세요" name="username">
    </div>
    <div class="form-group">
      <input type="password" class="input" id="password" placeholder="비밀번호를 입력해주세요" name="password">
    </div>
    <a href="/register" >아직 foodies의 회원이 아니신가요?🤔</a>
	<br/>
    <button type="submit" class="button">로그인</button>
  </form> 
</div>
<c:if test="${not empty errorMessage }">
<script>
alert("${errorMessage}");
</script>
</c:if>

</body>
</html>