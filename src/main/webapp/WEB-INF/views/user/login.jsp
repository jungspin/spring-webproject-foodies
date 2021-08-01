<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
body {
	background-image: url("/img/store.jpg");
	background-size: 100vw 100vh;
	font-family: 'Noto Sans KR', sans-serif;
}

div.blackbox {
	background-color: rgba(0, 0, 0, .5);
	padding-top: 20vh;
	height: 100vh;
	width: 100vw;
	align-items: center;
	height: 100vh;
}

div.centerbox {
	border-radius:10px;
	background-color: rgb(255, 255, 255);
	height: 70vh;
	width: 25vw;
}

div.loginlogo {
	padding-top: 40px;
	padding-bottom: 40px;
	text-align: center;
	align-content: center;
	font-size: 60px;
	color: rgb(247, 194, 48);
	font-family: 'Noto Sans KR', sans-serif;
}

.inputgroup {
	background-color: rgb(238, 238, 238);
	height: 6vh;
	border: 0px;
	border-radius: 1px;
}

.submitbutton {
	margin-left: 20px;
	margin-top: 30px;
	background-color: rgb(253, 169, 0);
	height: 6vh;
	width: 20.5vw;
	border: 0px;
	color: white;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 25px;
	font-weight: 400;
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
			<div class="loginlogo">
				<i class="fas fa-hamburger"></i>FOODIES
			</div>
			<form action="/loginProc" method="post">
				<div class="form-group">
					<input type="text" class="form-control inputgroup" id="username"
						placeholder="ID" name="username">
					<div id="erroeMsg" style="color: red">${errorMessage}</div>
					<!-- id 값 읽어서 비어있으면 말고 있으면 alert.. -->
				</div>
				<div class="form-group">
					<input type="password" class="form-control inputgroup"
						id="password" placeholder="PASSWORD" name="password">
				</div>

				<button type="submit" class="submitbutton"
					>로그인</button>
					<a href="/"><button type="button" class="submitbutton"
					style="margin-bottom: 40px;">홈으로</button></a>
			</form>
			<a href="/register" style="margin-left: 10%;">🤔아직 FOODIES의 회원이
				아니신가요?</a>
		</div>

	</div>


</body>
</html>