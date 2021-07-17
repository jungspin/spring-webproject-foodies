<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>register</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body> 
<jsp:include page="../includes/header.jsp"></jsp:include>
<br />
<br />
<br />
<div class="container" >
	<h2>임시 회원가입 페이지</h2>
	<table class="table table-borderless" style="border: solid 1px lightgray;">
		<thead></thead>
		<tbody>
			<form action="/register" method="post" onsubmit="return submitCheck();">
				<tr>
					<td>
						<div class="form-group">
						<input type="text" class="form-control chk" id="id" placeholder="아이디를 입력해주세요" name="username" required="required" />
						<div class="valid" id="idValid">영문 소문자, 숫자 포함 4~10자입니다</div>
					</td>
					<td>
						<button type="button" class="btn-sm btn-primary" id="btnCheckid">중복확인</button>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<input type="password" class="form-control chk" id="password" placeholder="비밀번호를 입력해주세요" name="password" required="required" />
							<div class="valid" id="pwValid">영어 소문자, 숫자, 특수문자 포함 8~20자입니다</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<input type="password" class="form-control chk" id="pwConfirm" placeholder="비밀번호를 한번더 입력하세요." />
							<div class="valid" id="pwCfmValid"></div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<input type="email" class="form-control" id="email" placeholder="이메일을 입력해주세요" name="email" required="required" />
						<div class="valid" id="emailValid">이메일 인증을 해주세요</div>
						<div class="form-group">
							<input type="hidden" class="form-control" id="emailCheck" placeholder="인증코드를 입력해주세요" /> 
							<input type="hidden" class="btn-sm btn-primary" id="btn-emailKey" value="인증확인" />
						</div>
					</td>
					<td>
						<button type="button" class="btn-sm btn-primary" id="btnEmail">이메일인증</button>
					</td>
				</tr>
				<tr>
					<td>
						<label for="gender">성별</label> <br /> 
						<input type="radio" name="gender" value="true" checked="checked" />여성&nbsp; 
						<input type="radio" name="gender" value="false" />남성
					</td>
				</tr>
				<tr>
					<td>
						<label for="gender">나이</label> <br /> 
						<input type="radio" name="age" value="age_10" checked="checked" />10대 &nbsp; 
						<input type="radio" name="age" value="age_20" />20대 &nbsp; 
						<input type="radio" name="age" value="age_30" />30대 &nbsp; 
						<input type="radio" name="age" value="age_40" />40대 &nbsp; 
						<input type="radio" name="age" value="age_more" />50대 이상 &nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<!-- 그냥 못 넘어가게 해야돼 -->
						<button type="submit" class="btn btn-primary" id="btn-submit">회원가입</button>
							  	<br/><br/>
						  <a href="/login" >이미 foodies 의 회원이신가요? 🤔</a>
					
						
					</td>
				</tr>

			</form>
		</tbody>

	</table>
</div>



<script src="/js/register.js"></script>
<script>
	$("#btn-submit").click(function submitCheck() {
		var idValid = $("#idValid").text();
		var pwValid = $("#pwValid").text();
		var pwCfmValid = $("#pwCfmValid").text();
		var emailValid = $("#emailValid").text();

		if (idValid != "아이디 중복검사를 완료했습니다") {
			//console.log(1, idValid);
			alert("아이디를 확인해주세요");
			return false;
		} else if(pwValid != "사용가능한 비밀번호 입니다"){
			
		} else if (pwCfmValid != "비밀번호가 확인되었습니다") {
			//console.log(2, pwValid);
			alert("비밀번호를 확인해주세요");
			return false;
		} else if (emailValid != "이메일이 인증되었습니다") {
			//console.log(4, emailValid);
			alert("이메일 인증을 해주세요");
			return false;
		} else {
			if(!confirm("회원가입 하시겠습니까?")){
				return false;
			}
			return true;
		}

	});
</script>
</body>
</html>