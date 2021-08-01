<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../includes/header.jsp"></jsp:include>
<style>
.grid{

	display: grid;
	grid-template-columns: repeat(auto-fit,minmax(300px,1fr));
	margin-left: 255px;
	
grid-template-columns:  0.5fr 0.5fr 1fr;
	
	 
}
.grid .card{
		
	height: 80%;
	display: grid;
    transition:.3s;
	width:350px;
}

.grid .card:hover{
	transform: scale(1.2);
	
}
</style>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<div class="container">
<h2>${principal.member.username } 의 맛집리스트 🍽</h2>
<br/>
<c:if test="${empty bookmarkLists }">
	<h4>🙋‍♂️자신만의 맛집리스트를 만들어보세요🙋‍♀️</h4>
</c:if>

</div>

<div class="grid">

<c:forEach items="${bookmarkLists}" var="bookmark" >
	<div class="cards"  >
  <div class="card" >	
    <img style="width:300px; height:200px;"src="${bookmark.restaurant.mainImgNormal }">
    <div class="card-body" style="width: 270px;">
 
      <h5 class="card-title" style="font-weight: bolder; font-size: 27px; margin-top:20px; margin-left:25px;"> ${bookmark.restaurant.mainTitle }</h5><br>
    <input type="hidden" id="memberId" value="${principal.member.id }" />
       <input type="hidden" id="bookmarkId" value="${bookmark.id }" />
          <a href="/detail/${ bookmark.restaurant.id}" class="btn btn-warning">상세보기</a>&nbsp;&nbsp;
      <button type="button" class="btn btn-danger"  data-value="${bookmark.id}"id="btn-like-cancel${bookmark.id }">빼기</button>
    </div>
</div>
  </div>

</c:forEach> 

  </div>
<script>
$("button[id^='btn-like-cancel']").on("click", function(){
	var memberId = $("#memberId").val();
	var bookmarkId = $("#bookmarkId").val();
	var b = $(this).attr('data-value');
	if(!confirm("리스트에서 삭제하겠습니까?")){
		return false;
	} else {
		var id = $("id").val();
		$.ajax({
			method: "DELETE",
			url: "/member/bookmark/del/"+b
		})
		.done(function(resp){
			if (resp == "success"){
				alert("삭제 되었습니다");
				console.log(memberId);
				location.href="/member/mypage/bookmark/"+memberId;
			}
		})
		.fail(function(e){
			alert("오류가 발생했습니다. 다시 시도해주세요");
		})
			
		}
	
})
</script>
</body>
</html>