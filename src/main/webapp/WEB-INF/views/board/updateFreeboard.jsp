<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/storedetail.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
        integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
<div class="container">
	<h3>${freeBoard.member.username}님의 글 수정</h3>
	<input type="hidden" name="id" id="id" value="${freeBoard.id}">
	<div class="form-group">
		<label for="title">제목:</label> <input type="text" class="form-control" id="title" name="title" value="${freeBoard.title }">
	</div>
	<div class="form-group">
		<label for="writer">글쓴이:</label> <input type="text" class="form-control" id="username" name="username" value="${freeBoard.member.username }" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="content">내용</label>
		<textarea class="form-control" rows="5" id="content" name="content">${freeBoard.content }</textarea>
	</div>
	<div class="form-group text-right">
		<button type="button" class="btn btn-primary btn-sm" id="btnModify">수정하기</button>
	</div>
</div>
<script>
$("#btnModify").click(function(){
	
	data = {
		"username" : $("#username").val(),
		"title" : $("#title").val(),
		 "id" : $("#id").val(),	 
		"content" : $("#content").val()
	}
	$.ajax({
		type : "PUT",
		url : "/board/updateFreeboard/${freeBoard.id}",
		contentType: "application/json;charset=utf-8",
		data : JSON.stringify(data)
	})
	.done(function(resp){
		if(resp=="success"){
			alert("수정성공");
			location.href="/";
		}
	})
	
})

</script>

</body>
</html>




