<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
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
<body> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../includes/header.jsp"></jsp:include>
<br />
<br />
<br />
<div class="container" style="border: solid 1px lightgray;">
	<h2>임시 회원정보 페이지</h2>
	<table class="table table-borderless">
		<thead></thead>
		<tbody>

			<tr>
				<td>
					<div class="form-group">
						<h3>아이디</h3>
						<div>${member.username}</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
						<h3>이메일</h3>
						<div>${member.email}</div>
					</div>
				</td>
			</tr>

			<tr>
				<td>
				<h3>성별</h3><br />
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
			</tr>
			
			<tr>
				<td><h3>나이</h3> <br /> 
		
					<input type="radio" name="age" id="age_10" value="age_10" checked="checked" onclick="return(false)" />10대 &nbsp; 
					<input type="radio" name="age"  id="age_20" value="age_20"  onclick="return(false)"/>20대 &nbsp; 
					<input type="radio" name="age"  id="age_30" value="age_30"  onclick="return(false)"/>30대 &nbsp; 
					<input type="radio" name="age" id="age_40"  value="age_40"  onclick="return(false)"/>40대 &nbsp; 
					<input type="radio" name="age" id="age_more"  value="age_more"  onclick="return(false)"/>50대 이상 &nbsp;
			
		
			
				</td>
			</tr>
			<tr>
				<td>
					<!-- 그냥 못 넘어가게 해야돼 -->
					<button type="submit" class="btn btn-primary" id="btn-submit">Submit</button>
				</td>
			</tr>

		</tbody>

	</table>
</div>




<script>
window.onload = function(resp){
	console.log(resp);
	//document.getElementById('')
}
	
</script>
</body>
</html>