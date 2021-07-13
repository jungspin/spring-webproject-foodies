<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 <br/>
 <br/>
 <br/>
<div class="container">
  <h2>임시 로그인 페이지</h2>
  <form action="/loginProc" method="post">
  <div class="form-group">
      <label for="id">아이디</label>
      <input type="text" class="form-control" id="username" placeholder="아이디를 입력해주세요" name="username">
      <div id="erroeMsg" style="color: red">${errorMessage}</div>
      <!-- id 값 읽어서 비어있으면 말고 있으면 alert.. -->
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호</label>
      <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력해주세요" name="password">
    </div>

    <button type="submit" class="btn btn-primary">Submit</button>
  </form> 
</div>


</body>
</html>