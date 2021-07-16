<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../includes/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style >
.star-rating {
  display:flex;
  flex-direction: row-reverse;
  font-size:1.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}

/* explanation */

article {
  background-color:#ffe;
  box-shadow:0 0 1em 1px rgba(0,0,0,.25);
  color:#006;
  font-family:cursive;
  font-style:italic;
  margin:4em;
  max-width:30em;
  padding:2em;
}
</style>
<body>
<div class="container" >
<h2 class="text-warning">${restaurant.mainTitle} 에 대한 ${principal.member.username } 님의 생각을 공유해주세요🤗</h2>

<div class="form-group">

  <div class="star-rating">
  <input type="radio" id="5-stars" name="rating" value="5" />
  <label for="5-stars" class="star">&#9733;</label>
  <input type="radio" id="4-stars" name="rating" value="4" />
  <label for="4-stars" class="star">&#9733;</label>
  <input type="radio" id="3-stars" name="rating" value="3" />
  <label for="3-stars" class="star">&#9733;</label>
  <input type="radio" id="2-stars" name="rating" value="2" />
  <label for="2-stars" class="star">&#9733;</label>
  <input type="radio" id="1-star" name="rating" value="1" />
  <label for="1-star" class="star">&#9733;</label>
</div>


  
	<!-- <input type="hidden" class="form-control" id="username" value="" name="username" readonly="readonly" /> -->
  <textarea class="form-control" rows="10" id="resContents"></textarea>
  
  	 <div class="custom-file">
	    <input type="file" class="custom-file-input" id="resImage">
	    <label class="custom-file-label" for="customFile">클릭하면 사진첨부 가능</label> 
	  </div>
   

  
   <button type="submit" class="btn btn-primary" id="btn-sumbit">리뷰등록</button>
  <button type="submit" class="btn btn-primary" id="btn-cancel">취소</button>

</div>

</div>
<script>
// 취소버튼 클릭
$("#btn-cancel").on('click', function(){
	if(!confirm("리뷰작성을 취소하시겠습니까?")){ return; } 
	history.back();
})

</script>

</body>
</html>