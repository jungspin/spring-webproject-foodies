<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./includes/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:if test = "${msg eq '검색결과가 없습니다'}">
<script>
alert('${msg}')
location.href ="/"
</script>
</c:if>

<div class="container">
	<h2>검색게시판</h2>
	<div class="form-group text-right">
	
	</div>

	<table class="table table-hover">
		<thead>
			<tr>
				<th>사진</th>
				<th>식당이름</th>
				<th>대표메뉴</th>
				<th>주소</th>
				<th>영업시간</th>
			
			</tr>
		</thead>
		<tbody>
			  <c:forEach items="${restaurant}" var="restaurant" varStatus="st">
				<tr>
					<td><img src = "${ restaurant.mainImgThumb}"></td>
					<td><a href="/detail/${restaurant.id}">${restaurant.mainTitle }</a></td>
					<td>${restaurant.rprsntvMenu }</td>
					<td>${restaurant.addr1 }</td>
					<td>${restaurant.usageDayWeekAndTime }</td>
				</tr>
			</c:forEach> 
		
		</tbody>
	</table>
	

</div>

</body>
</html>