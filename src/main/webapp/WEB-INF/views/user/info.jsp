<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>info</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<br />
	<div class="container">
		<h2>임시 회원정보 페이지 (미완!!!!!)</h2>
		<form action="#" >
			<div class="form-group">
				<label for="id">아이디</label>
				<div class="d-flex justify-content-end">
					<button type="button" class="btn-sm btn-primary" id="btnCheckid">중복확인</button>
				</div>
				<input type="text" class="form-control chk" id="id" value="${member.username}" name="username" required="required" readonly="readonly">
				<div class="valid" id="idValid"></div>
			</div>

			<div class="form-group">
				<label for="pwd">비밀번호</label> 
				<input type="password" class="form-control chk" id="password" value="${member.password }" name="password" required="required">
				<div class="valid" id="pwValid"></div>
			</div>

			<div class="form-group">
				<label for="pwd">비밀번호 확인</label> 
				<input type="password" class="form-control chk" id="pwConfirm" placeholder="비밀번호를 한번더 입력하세요.">
				<div class="valid" id="pwCfmValid"></div>
			</div>

			<div class="form-group">
				<label for="email">이메일</label>
				<div class="d-flex justify-content-end">
					<button type="button" class="btn-sm btn-primary" id="btnEmail">이메일인증</button>
				</div>
				<input type="email" class="form-control" id="email" placeholder="이메일을 입력해주세요" name="email" required="required">
				<div class="valid" id="emailValid"></div>
			</div>
			
			<div class="form-group">
			<input type="hidden" class="form-control" id="emailCheck" placeholder="인증코드를 입력해주세요">
			<input type="hidden" class="btn-sm btn-primary" id="btn-emailKey" value="인증확인"/>
			
			</div>

			<label for="gender">성별</label>
			 <br /> 
			<input type="radio" name="gender" value=true checked="checked" />여성&nbsp; 
			<input type="radio" name="gender" value=false />남성
			 <br /> <br /> 
			 
			<label for="gender">나이</label> 
			<br /> 
				<input type="radio" name="age" value="age_10" checked="checked" />10대 &nbsp; 
				<input type="radio" name="age" value="age_20" />20대 &nbsp; 
				<input type="radio" name="age" value="age_30" />30대 &nbsp; 
				<input type="radio" name="age" value="age_40" />40대 &nbsp; 
				<input type="radio" name="age" value="age_more" />50대 이상 &nbsp;


			<!--  <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember"> Remember me
      </label>
    </div> -->
			<br /> <br />
			<!-- 그냥 못 넘어가게 해야돼 -->
			<button type="submit" class="btn btn-primary" id="btn-submit">Submit</button>
		</form>
	</div>

	


<script src="/js/register.js"></script>
<script>
$("#btn-submit").click(function submitCheck(){
	var idValid = $("#idValid").text();
	//console.log(0, idValid);
	var pwCfmValid = $("#pwCfmValid").text();
	var emailValid = $("#emailValid").text();
	
	
	
	if (idValid != "아이디 중복검사를 완료했습니다"){
		console.log(1, idValid);
		alert("아이디를 확인해주세요");
		return false;
	} else if (pwCfmValid != "비밀번호가 확인되었습니다"){
		console.log(2, pwValid);
		alert("비밀번호를 확인해주세요");
		return false;
	} else if (emailValid != "이메일이 인증되었습니다") {
		console.log(4, emailValid);
		alert("이메일 인증을 해주세요");
		return false;
	} else {
		true;
	}
	
});

</script>
</body>
</html>