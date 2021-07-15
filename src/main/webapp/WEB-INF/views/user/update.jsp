<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../includes/header.jsp"></jsp:include>
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
	<div class="container" >
	<h2>임시 회원정보수정 페이지</h2>
	<table class="table table-borderless" style="border: solid 1px lightgray;">
		<thead></thead>
		<tbody>
			<tr>
				<td>
					<div class="form-group">
					<input type="text" class="form-control chk" id="username" value="${member.username }" name="username" readonly="readonly"/>
					<input type="hidden" id="id" value="${member.id }"/>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
						<input type="password" class="form-control chk" id="password" name="password" placeholder="비밀번호를 입력하세요"  required="required" />
						<div class="valid" id="pwValid">영어 소문자, 숫자, 특수문자 포함 8~20자입니다</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
						<input type="password" class="form-control chk" id="pwConfirm" placeholder="비밀번호를 한번더 입력하세요" required="required"/>
						<div class="valid" id="pwCfmValid"></div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<input type="email" class="form-control" id="email" value="${member.email }" name="email" required="required" />
					<div class="valid" id="emailValid"></div>
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
				<h5>성별</h5>
					<c:choose>
						<c:when test="${member.gender eq true }">
							<input type="radio" name="gender" id="gender" value="true" checked="checked"/>여성&nbsp; 
							<input type="radio" name="gender" id="gender" value="false" />남성
			                         </c:when>
						<c:otherwise>
							<input type="radio" name="gender" id="gender" value="true" />여성&nbsp; 
							<input type="radio" name="gender" id="gender" value="false" checked="checked" />남성
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>
				<h5>나이</h5>
					<c:if test="${member.age eq 'age_10'}"> 
					<input type="radio" name="age" id="age_10" value="age_10" checked="checked"  />10대 &nbsp; 
					<input type="radio" name="age"  id="age_20" value="age_20" />20대 &nbsp; 
					<input type="radio" name="age"  id="age_30" value="age_30" />30대 &nbsp; 
					<input type="radio" name="age" id="age_40"  value="age_40" />40대 &nbsp; 
					<input type="radio" name="age" id="age_more"  value="age_more" />50대 이상 &nbsp;
					</c:if>
					
					<c:if test="${member.age eq 'age_20'}"> 
					<input type="radio" name="age" id="age_10" value="age_10" />10대 &nbsp; 
					<input type="radio" name="age"  id="age_20" value="age_20"  checked="checked" />20대 &nbsp; 
					<input type="radio" name="age"  id="age_30" value="age_30" />30대 &nbsp; 
					<input type="radio" name="age" id="age_40"  value="age_40" />40대 &nbsp; 
					<input type="radio" name="age" id="age_more"  value="age_more" />50대 이상 &nbsp;
					</c:if>
					
					<c:if test="${member.age eq 'age_30'}"> 
					<input type="radio" name="age" id="age_10" value="age_10" />10대 &nbsp; 
					<input type="radio" name="age"  id="age_20" value="age_20"  />20대 &nbsp; 
					<input type="radio" name="age"  id="age_30" value="age_30"  checked="checked" />30대 &nbsp; 
					<input type="radio" name="age" id="age_40"  value="age_40" />40대 &nbsp; 
					<input type="radio" name="age" id="age_more"  value="age_more" />50대 이상 &nbsp;
					</c:if>
					
					<c:if test="${member.age eq 'age_40'}"> 
					<input type="radio" name="age" id="age_10" value="age_10" />10대 &nbsp; 
					<input type="radio" name="age"  id="age_20" value="age_20" />20대 &nbsp; 
					<input type="radio" name="age"  id="age_30" value="age_30"  />30대 &nbsp; 
					<input type="radio" name="age" id="age_40"  value="age_40"  checked="checked" />40대 &nbsp; 
					<input type="radio" name="age" id="age_more"  value="age_more" />50대 이상 &nbsp;
					</c:if>
					
					<c:if test="${member.age eq 'age_more'}"> 
					<input type="radio" name="age" id="age_10" value="age_10"  />10대 &nbsp; 
					<input type="radio" name="age"  id="age_20" value="age_20"/>20대 &nbsp; 
					<input type="radio" name="age"  id="age_30" value="age_30"  />30대 &nbsp; 
					<input type="radio" name="age" id="age_40"  value="age_40" />40대 &nbsp; 
					<input type="radio" name="age" id="age_more"  value="age_more"  checked="checked" />50대 이상 &nbsp;
					</c:if>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" class="btn btn-primary" id="btn-update">수정하기</button>
					<button type="button" class="btn btn-danger" id="btn-delete">탈퇴하기</button>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<script src="/js/update.js"></script>
<script>
// 탈퇴
$("#btn-delete").on('click', function(){
	var id = $("#id").val();
	if(!confirm("정말 탈퇴하시겠습니까? 😢")){
		return;
	} 
	$.ajax({
		url:"/member/delete/"+id,
		method:"DELETE"
	})
	.done(function(resp){
		if(resp != "success"){
			alert("탈퇴에 실패했습니다");
		}
		alert("그동안 Foodies를 이용해주셔서 감사합니다");
		location.href="/";
	})
	
})

// 수정 요청
$("#btn-update").on('click', function(){
	var id = $("#id").val();
	var username = $("#username").val();
	var password = $("#password").val();
	var email = $("#email").val();
	var gender = $('input[name="gender"]:checked').val();
	var age = $('input[name="age"]:checked').val();
	
	
	var updateData = {
		"id": id,
		"username": username,
		"password": password,
		"email": email,
		"gender": gender,
		"age": age
	}
	
	//console.log(gender);
	//console.log(age);
		var idValid = $("#idValid").text();
		var pwValid = $("#pwValid").text();
		var pwCfmValid = $("#pwCfmValid").text();
		var emailValid = $("#emailValid").text();
	
	if(pwValid != "사용가능한 비밀번호 입니다" || password == ""){
		alert("올바른 비밀번호를 입력해주세요");
		return;
	} else if (pwCfmValid != "비밀번호가 확인되었습니다" || password == "") {
		//console.log(2, pwValid);
		alert("비밀번호를 확인해주세요");
		return;
	} else if (emailValid != "이메일이 인증되었습니다"|| email == "") {
		//console.log(4, emailValid);
		alert("이메일 인증을 해주세요");
		return;
	} else {
		if(!confirm("수정하시겠습니까?")){
			return;
		}
		$.ajax({
			method: "PUT",
			url: "/member/update",
			contentType: "application/json;charset=utf-8",
			data: JSON.stringify(updateData),
		})
		.done(function(resp){
			if (resp != "success"){
				alert("수정에 실패했습니다");
				return;
			}
			location.href="/member/mypage/"+${member.id}
		
		})
	} // else 
})			
</script>
</body>
</html>