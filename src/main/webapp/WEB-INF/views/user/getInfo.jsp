<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
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
<body>
 <br/>
<div class="container">
  <h2>비밀번호 확인</h2>
  <!-- 액션이 # 인데도 간다?! -->
  <form action="#" method="post">
  
    <div class="form-group">
      <label for="pwd">비밀번호 확인</label>
      <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력해주세요" name="password">
      <input type="hidden" name="username" value='<sec:authentication property="principal.member.username"/>'  />
      <input type="hidden" name="id" value='<sec:authentication property="principal.member.id"/>'  />
    </div>

    <button type="submit" class="btn btn-primary">Submit</button>
  </form> 
</div>

</body>
</html>