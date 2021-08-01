<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>foodies</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Jua&display=swap" rel="stylesheet">
<style type="text/css">
body {
	background-image: url("/img/store2.jpg");
	background-size: cover;
	font-family: 'Noto Sans KR', sans-serif;
}

div.blackbox {
	background-color: rgba(0, 0, 0, .5);
	padding-top: 5vh;
	padding-bottom: 5vh; '
	width: 100%;
	height: 100%;
	align-items: center;
}

div.centerbox {
	background-color: rgb(255, 255, 255);
	width: 30%;
	height: 100%;
	border-radius: 15px;
}

div.loginlogo {
	padding-top: 10px;
	padding-bottom: 20px;
	text-align: center;
	align-content: center;
	font-size: 60px;
	color: rgb(247, 194, 48);
	font-family: 'Noto Sans KR', sans-serif;
}

.inputgroup {
	background-color: rgb(238, 238, 238);
	width: 28vw;
	height: 6vh;
	border: 2px;
	border-radius: 10px;
}

.inputgroup2 {
	background-color: rgb(238, 238, 238);
	height: 6vh;
	width: 30vw;
	border: 0px;
	border-radius: 10px;
	margin-bottom: 10px;
}

.submitbutton .button {
	margin-left: 20px;
	margin-bottom: 20px;
	background-color: rgb(253, 169, 0);
	border: 1px;
	color: white;
	font-family: 'Noto Sans KR', sans-serif;
	width: 25vw;
}

.form-group button {
	width: 35vw;
	height: 6vh;
	color: white;
	border: none;
	background-color: coral;
	font-family: 'Gothic A1', sans-serif;
	font-size: 18px;
	border-radius: 5px;
}

.check-button {
	width: 3.2vw;
	height: 6vh;
	color: white;
	border: none;
	background-color: coral;
	font-family: 'Gothic A1', sans-serif;
	font-size: 18px;
}

div.valid {
	margin-left: 10px;
	margin-bottom: 10px;
}

input[type="radio"] {
	display: none;
}

input[type="radio"]+label {
	font-weight: 400;
	font-size: 14px;
}

input[type="radio"]+label span {
	display: inline-block;
	width: 18px;
	height: 18px;
	margin: -2px 10px 0 0;
	vertical-align: middle;
	cursor: pointer;
	-moz-border-radius: 50%;
	border-radius: 50%;
	border: 3px solid #ffffff;
}

input[type="radio"]+label span {
	background-color: #fff;
}

input[type="radio"]:checked+label {
	color: #333;
	font-weight: 700;
}

input[type="radio"]:checked+label span {
	background-color: #ff8800;
	border: 2px solid #ffffff;
	box-shadow: 2px 2px 2px rgba(0, 0, 0, .1);
}

input[type="radio"]+label span, input[type="radio"]:checked+label span {
	-webkit-transition: background-color 0.24s linear;
	-o-transition: background-color 0.24s linear;
	-moz-transition: background-color 0.24s linear;
	transition: background-color 0.24s linear;
}

.radiogroup div {
	margin-right: 5px;
}

.radiogroup span {
	margin-left: 10px;
	margin-right: 10px;
}

.centerbox a {
	color: rgb(253, 169, 0);
	text-decoration: none;
}

.centerbox a:visited {
	color: rgb(253, 169, 0);
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="blackbox">
		<div class="centerbox container">
			<a href="/register">
				<div class="loginlogo">
					<i class="fas fa-hamburger"></i>MYPAGE
				</div>
			</a>

			<div class="form-group" style="display: flex; flex-wrap: wrap;">
				<input type="text" class="form-control inputgroup2" id="username" value="${member.username }" name="username" readonly="readonly" />
				<input type="hidden" id="id" value="${member.id }"/>
			</div>
			
			<div class="valid" id="pwValid" style="font-family: 'Gothic A1', sans-serif; margin-bottom: 5px;">비밀번호는 영문 소문자, 숫자, 특수문자 포함 8~20자입니다</div>
			<div class="form-group">
				<div class="form-group">
					<input type="password" class="form-control inputgroup" id="password" placeholder="PASSWORD" name="password" required="required" />
				</div>
				<input type="password" class="form-control inputgroup" id="pwConfirm" placeholder="PASSWORD CHECK" />
			</div>
			<div class="valid" id="pwCfmValid"></div>
			<div class="valid" id="pwValid" style="font-family: 'Gothic A1', sans-serif; margin-bottom: 5px;">
			
			이메일 인증</div>
			<div class="form-group">
				<div class="form-group" style="display: flex; flex-wrap: wrap;">
					<input type="email" class="form-control inputgroup2" id="email" value="${member.email }" name="email" required="required" />
					<button type="button" class="check-button" style="font-size: 16px;" id="btnEmail">이메일인증</button>
				</div>
				<div class="valid" id="emailValid" style="font-family: 'Gothic A1', sans-serif; margin-bottom: 5px;">이메일 인증을 해주세요</div>
				<div class="form-group">
					<input type="hidden" class="form-control" id="emailCheck" placeholder="인증코드를 입력해주세요" /> 
					<input type="hidden" class="btn-sm btn-primary" id="btn-emailKey" value="인증확인" />
				</div>
				
				
				
				<h4>연령</h4>
				<div style="display: flex; flex-wrap: wrap;" class="radiogroup">
					<div>
						<input id="option-one" name="age" value="age_10" type="radio" <c:if test="${member.age eq 'age_10'}">checked="checked"</c:if>/>  <label for="option-one"> <span></span> 10대
						</label>
					</div>
					&nbsp; &nbsp;
					<div>
						<input id="option-two" name="age" value="age_20" type="radio" <c:if test="${member.age eq 'age_20'}">checked="checked"</c:if>/>  <label for="option-two"> <span></span> 20대
						</label>
					</div>
					&nbsp;
					<div>
						<input id="option-three" name="age" value="age_30" type="radio" <c:if test="${member.age eq 'age_30'}">checked="checked"</c:if>/> <label for="option-three"> <span></span> 30대
						</label>
					</div>
					&nbsp;
					<div>
						<input id="option-four" name="age" value="age_40" type="radio" <c:if test="${member.age eq 'age_40'}">checked="checked"</c:if> />  <label for="option-four"> <span></span> 40대
						</label>
					</div>
					&nbsp;
					<div>
						<input id="option-five" name="age" value="age_more" type="radio" <c:if test="${member.age eq 'age_more'}">checked="checked"</c:if>/>  <label for="option-five"> <span></span> 50대 이상
						</label>
					</div>
				</div>
				<br>
				<h4>성별</h4>
				<div style="display: flex; flex-wrap: wrap;" class="radiogroup">
					<div>
						<input id="option-six" name="gender" value="true" checked="checked" type="radio" <c:if test="${member.gender eq true}">checked="checked"</c:if>/> <label for="option-six"> <span></span> 여성
						</label>
					</div>
					&nbsp; &nbsp;
					<div style="margin-bottom: 30px;">
						<input id="option-seven" name="gender" value="false" type="radio" <c:if test="${member.gender eq false}">checked="checked"</c:if> /> <label for="option-seven"> <span></span> 남성
						</label>
					</div>
				</div>

				<a href="#" style="margin-left: 20%;" id="btn-delete" >
					&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 탈퇴할래요😢
				</a> <br>
				
				<br>
				<div class="submitbutton">
					<button class="button" type="submit" id="btn-update">수정하기</button>
				</div>
				<div class="submitbutton">
					<a href="/"><button type="button" class="button">홈으로</button></a>
				</div>

			</div>
		</div>

<script src="/js/update.js"></script>
<script>
	// 탈퇴
	$("#btn-delete").on('click', function() {
		var id = $("#id").val();
		if (!confirm("정말 탈퇴하시겠습니까? 😢")) {
			return;
		}
		$.ajax({
			url : "/member/delete/" + id,
			method : "DELETE"
		}).done(function(resp) {
			if (resp != "success") {
				alert("탈퇴에 실패했습니다");
				return;
			}
			alert("그동안 Foodies를 이용해주셔서 감사합니다");
			location.href = "/";
		})

	})

	// 수정 요청
	$("#btn-update").on('click', function() {
		//var id = $("#id").val();
		var username = $("#username").val();
		var password = $("#password").val();
		var email = $("#email").val();
		var gender = $('input[name="gender"]:checked').val();
		var age = $('input[name="age"]:checked').val();

		var updateData = {
			//"id": id,
			"username" : username,
			"password" : password,
			"email" : email,
			"gender" : gender,
			"age" : age
		}

		//console.log(gender);
		//console.log(age);
		var idValid = $("#idValid").text();
		var pwValid = $("#pwValid").text();
		var pwCfmValid = $("#pwCfmValid").text();
		var emailValid = $("#emailValid").text();

		if (pwValid != "사용가능한 비밀번호 입니다" || password == "") {
			alert("올바른 비밀번호를 입력해주세요");
			return;
		} else if (pwCfmValid != "비밀번호가 확인되었습니다" || password == "") {
			//console.log(2, pwValid);
			alert("비밀번호를 확인해주세요");
			return;
		} else if (emailValid != "이메일이 인증되었습니다" || email == "") {
			//console.log(4, emailValid);
			alert("이메일 인증을 해주세요");
			return;
		} else {
			if (!confirm("수정하시겠습니까?")) {
				return;
			}
			$.ajax({
				method : "PUT",
				url : "/member/update",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(updateData),
			}).done(function(resp) {
				var id = $("#id").val();
				if (resp != "success") {
					alert("수정에 실패했습니다");
					return;
				}
				console.log(id);
				//location.href = "/member/mypage/" + id;

			})
		} // else 
	})
</script>
</body>


</html>