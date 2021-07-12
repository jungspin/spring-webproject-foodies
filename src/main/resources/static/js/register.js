// 아이디 중복 검사
$("#btnCheckid").on('click', function(){
	checkId();

	if (checkId() == false){
		$("#id").focus;
		return;
	}
	
	var id = $("#id").val();
	
	$.ajax({
		type: "POST",
		url: "/register/checkId",
		contentType: "application/json;charset=utf-8",
		data: id
	})
	.done(function(resp){
		//console.log(resp);
		if (resp == 1) {
			alert("사용할 수 없는 아이디 입니다");
			inputText();
			//console.log("이거 돼?")
			
		} else {
			alert("사용 가능한 아이디 입니다");
			$("#id").html(id);
			$("#idValid").html("아이디 중복검사를 완료했습니다").css('color', 'green');
		
		} 
	}) // done
}) // btnCheckid

// 사용할 수 없는 아이디일 경우 칸 비우기
function inputText(){
    document.getElementById("id").value = "";
}


// 아이디 유효성 검사
$("#id").on('keyup', function(){
	checkId();
})

function checkId(){
	var id = $("#id").val();
	var num = id.search(/[0-9]/g);
	var eng = id.search(/[a-z]/ig);
	
	if(id.length == 0){
		$("#idValid").html("아이디를 입력해주세요").css('color', 'red');
		return false;
	}
	if(num < 0 || eng < 0 ){
		  $("#idValid").html("영어 소문자, 숫자 혼합하여 입력해주세요").css('color', 'red');
		  return false;
	} else if (id.length < 4 || id.length > 9){
			$("#idValid").html("아이디는 4자 이상 10자 이하로 입력해주세요").css('color', 'red');
			return false;
	} else if(num < 0 || eng < 0 ){
		  $("#idValid").html("영어 소문자, 숫자 혼합하여 입력해주세요").css('color', 'red');
		  return false;
	} else {
	$("#idValid").html("아이디 중복검사를 해주세요").css('color', 'green');
		return true;
	}
		
} //checkId

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
			$("#emailValid").html("인증번호가 전송되었습니다").css('color', 'green');
			//console.log(resp);
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
		if (inputKey != key){
			isEmailCertification=false;
			//alert("인증에 실패했습니다");
			$("#emailValid").html("인증에 실패했습니다").css('color', 'red');
			document.getElementById("email").value = "";
			document.getElementById("emailCheck").value = "";
			
		} else {
			isEmailCertification=true;
			//alert("이메일이 인증되었습니다");
			$("#emailValid").html("이메일이 인증되었습니다").css('color', 'green');
			hiddenInput();
		}
})
}





/*// 이메일 인증키를 받기위한 input 태그 생성
const mkInput = () => {
	const div = document.getElementById("emailCheckDiv");
	const newP = document.createElement('p');
	newP.innerHTML = "<input type='text' ></input>";
	
	div.appendChild(newP);​
} // mkInput*/



