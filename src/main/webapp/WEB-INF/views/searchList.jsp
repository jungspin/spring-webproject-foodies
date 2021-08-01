<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./includes/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet"
	href="/css/home.css">

<c:if test = "${msg eq '검색결과가 없습니다'}">
<script>
alert('${msg}')
location.href ="/"
</script>
</c:if>

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<div class="container">
	<h2 style="font-weight: bold;">&nbsp;&nbsp;검색게시판</h2>
	<h4>&nbsp;&nbsp;&nbsp;&nbsp;'${keyword }' 로 검색한 결과 : ${size } 건</h4>
	
	
	<div class="form-group text-right">
	
	</div>

	<div class="grid">
           <c:forEach items="${restaurant}" var="restaurant" varStatus="st">
   <a href= "/detail/${restaurant.id}" style="text-decoration: none; color: black; ">
  <div class="card">   
    <img src="${ restaurant.mainImgThumb}"class="card-img-top" style="width: 300px;" alt="...">
    <div class="card-body" style="width: 300px;">
      <h5 class="card-title" style="font-weight: bolder; font-size: 25px; margin-top:20px;">${restaurant.mainTitle }</h5>
      <p class="card-text" style="font-size: 15px;">${restaurant.usageDayWeekAndTime }</p>
        <p class="card-text">${restaurant.rprsntvMenu }</p>
      <p class="card-text"><small class="text-muted">${restaurant.addr1 }</small></p>
    </div>

</div>
</a>
</c:forEach> 

  
    
    
    
    
    
    
    
 
  </div>
<%-- </tr>
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
	 --%>

</div>

</body>
</html>