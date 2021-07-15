<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../includes/header.jsp"></jsp:include>
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

<br />
<br />
<br />
<div class="container">
  <h2>임시 회원정보 페이지</h2>
  <div class="card">
    <div class="card-body">
    	<h4>${member.username}</h4>
    	<br/>
    	<h5>email: ${member.email}</h5>
    	<br/>
    	<h5>성별</h5>
    	
		<c:choose>
			<c:when test="${member.gender eq true }">
				<input type="radio" name="gender" value="true" checked="checked" onclick="return(false)"/>여성&nbsp; 
				<input type="radio" name="gender" value="false" onclick="return(false)"/>남성
                         </c:when>
			<c:otherwise>
				<input type="radio" name="gender" value="true"  onclick="return(false)"/>여성&nbsp; 
				<input type="radio" name="gender" value="false" checked="checked" onclick="return(false)"/>남성
			</c:otherwise>
		</c:choose>
		<br/>
		<br/>
    	<!-- 진짜 이렇게 해야된다고..? 더 쉬운방법 ㅠ 찾아보자 ㅠ -->
		<h5>나이</h5>
	
			<c:if test="${member.age eq 'age_10'}"> 
			<input type="radio" name="age" id="age_10" value="age_10" checked="checked" onclick="return(false)" />10대 &nbsp; 
			<input type="radio" name="age"  id="age_20" value="age_20"  onclick="return(false)"/>20대 &nbsp; 
			<input type="radio" name="age"  id="age_30" value="age_30"  onclick="return(false)"/>30대 &nbsp; 
			<input type="radio" name="age" id="age_40"  value="age_40"  onclick="return(false)"/>40대 &nbsp; 
			<input type="radio" name="age" id="age_more"  value="age_more"  onclick="return(false)"/>50대 이상 &nbsp;
			</c:if>
			
			<c:if test="${member.age eq 'age_20'}"> 
			<input type="radio" name="age" id="age_10" value="age_10" onclick="return(false)" />10대 &nbsp; 
			<input type="radio" name="age"  id="age_20" value="age_20"  checked="checked"  onclick="return(false)"/>20대 &nbsp; 
			<input type="radio" name="age"  id="age_30" value="age_30"  onclick="return(false)"/>30대 &nbsp; 
			<input type="radio" name="age" id="age_40"  value="age_40"  onclick="return(false)"/>40대 &nbsp; 
			<input type="radio" name="age" id="age_more"  value="age_more"  onclick="return(false)"/>50대 이상 &nbsp;
			</c:if>
			
			<c:if test="${member.age eq 'age_30'}"> 
			<input type="radio" name="age" id="age_10" value="age_10" onclick="return(false)" />10대 &nbsp; 
			<input type="radio" name="age"  id="age_20" value="age_20"  onclick="return(false)"/>20대 &nbsp; 
			<input type="radio" name="age"  id="age_30" value="age_30"  checked="checked" onclick="return(false)"/>30대 &nbsp; 
			<input type="radio" name="age" id="age_40"  value="age_40"  onclick="return(false)"/>40대 &nbsp; 
			<input type="radio" name="age" id="age_more"  value="age_more"  onclick="return(false)"/>50대 이상 &nbsp;
			</c:if>
			
			<c:if test="${member.age eq 'age_40'}"> 
			<input type="radio" name="age" id="age_10" value="age_10" onclick="return(false)" />10대 &nbsp; 
			<input type="radio" name="age"  id="age_20" value="age_20" onclick="return(false)"/>20대 &nbsp; 
			<input type="radio" name="age"  id="age_30" value="age_30"  onclick="return(false)"/>30대 &nbsp; 
			<input type="radio" name="age" id="age_40"  value="age_40"  checked="checked" onclick="return(false)"/>40대 &nbsp; 
			<input type="radio" name="age" id="age_more"  value="age_more"  onclick="return(false)"/>50대 이상 &nbsp;
			</c:if>
			
			<c:if test="${member.age eq 'age_more'}"> 
			<input type="radio" name="age" id="age_10" value="age_10" onclick="return(false)" />10대 &nbsp; 
			<input type="radio" name="age"  id="age_20" value="age_20"onclick="return(false)"/>20대 &nbsp; 
			<input type="radio" name="age"  id="age_30" value="age_30"  onclick="return(false)"/>30대 &nbsp; 
			<input type="radio" name="age" id="age_40"  value="age_40"  onclick="return(false)"/>40대 &nbsp; 
			<input type="radio" name="age" id="age_more"  value="age_more"  checked="checked" onclick="return(false)"/>50대 이상 &nbsp;
			</c:if>
    	<br/>
    	<br/>
    	<br/>
    	<button type="button" class="btn btn-primary" id="btn-show">활동내역</button>
    	<a href="/member/update/${member.id }"><button type="button" class="btn btn-primary" id="btn-update">회원정보수정</button></a>
    </div>
  </div>
</div>
<script>
// 회원정보수정 요청
/* $("#btn-update").on('click', function(){
	$.ajax({
		method: "GET",
		url: "/member/getInfo"
	})
}) */
	
</script>
</body>
</html>