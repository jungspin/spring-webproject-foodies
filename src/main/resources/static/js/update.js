// 비밀번호 유효성 검사
$("#password").on('keyup', function(){ checkPW(); })

function checkPW(){
	var pw = $("#password").val();
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	if(pw.length < 8 || pw.length > 21){
	  $("#pwValid").html("8자리 ~ 20자리 이내로 입력해주세요").css('color', 'red');
	  return false;
	  
	}else if(pw.search(/\s/) != -1){
		  
	  $("#pwValid").html("비밀번호는 공백 없이 입력해주세요").css('color', 'red');
	  return false;
	  
	}else if(num < 0 || eng < 0 || spe < 0 ){
	
	  $("#pwValid").html("영어 소문자, 숫자, 특수문자를 혼합하여 입력해주세요").css('color', 'red');
	  return false;
	  
	}else {
		
		$("#pwValid").html("사용가능한 비밀번호 입니다").css('color', 'green');
	    return true;
	}
		
} //checkPW

// 비밀번호 확인
$("#pwConfirm").on('keyup', function(){ checkCfmPw(); })

function checkCfmPw(){
	var pw = $("#password").val();
	var pwCfm = $("#pwConfirm").val();
	
	if(pw != pwCfm){
		$("#pwCfmValid").html("비밀번호가 일치하지 않습니다").css('color', 'red');
	

	} else {
		$("#pwCfmValid").html("비밀번호가 확인되었습니다").css('color', 'green');
		
	}
		
} //checkCfmPw

// 이메일
$("#email").on('keyup', function(){
	$("#emailValid").html("이메일을 인증해주세요").css('color', 'red');
})

// 이메일 인증
$("#btnEmail").on('click', function(){
	var email = $("#email").val(); // 사용자 이메일 입력값
	//console.log(email);
	
	if (email == ""){
		$("#emailValid").html("이메일을 입력해주세요").css('color', 'red');
		$("#email").focus;
		return;
	} else {
		$("#emailValid").html("메일을 발송중입니다..").css('color', 'red');
		$.ajax({
			type: "POST",
			url: "/register/checkEmail",
			data: JSON.stringify(email),
			contentType: "application/json;charset=utf-8"
		})
		.done(function(resp){
			//console.log(resp);
			$("#emailValid").html("인증번호가 전송되었습니다").css('color', 'green');
			
			//isCertification=true; //추후 인증 여부를 알기위한 값
			let key = resp;
			//console.log(key);
			changeInput();
			confirmKey(key);
			
			
		})
		.fail(function(){
			alert("오류가 발생했습니다");
		})
		
		
	} // else
}) // btnEmail



// 이메일 인증키를 받기위한 input 태그 생성
function changeInput() {
	var input = document.getElementById("emailCheck");
	input.type="text";
	var button = document.getElementById("btn-emailKey");
	button.type="button";
}

// 이메일 인증 완료시 input 태그 숨기기
function hiddenInput() {
	var input = document.getElementById("emailCheck");
	input.type="hidden";
	var button = document.getElementById("btn-emailKey");
	button.type="hidden";
}

// 이메일 인증확인 마지막
function confirmKey(key){
	$("#btn-emailKey").on('click' , function(){
		var inputKey = $("#emailCheck").val();
		var keyData ={
			"rawKey" : inputKey,
			"encodedKey" : key
		}
		$.ajax({
			method:"POST",
			url: "/register/checkKey",
			data: JSON.stringify(keyData),
			contentType: "application/json;charset=utf-8"
		})
		.done(function(resp){
			//console.log(resp);
			if (resp != "success"){
				$("#emailValid").html("인증에 실패했습니다").css('color', 'red');
				document.getElementById("email").value = "";
				document.getElementById("emailCheck").value = "";
				return;
			} else {
				$("#emailValid").html("이메일이 인증되었습니다").css('color', 'green');
				hiddenInput();
			}
		})
		
	})
}

