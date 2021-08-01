<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../includes/header.jsp"></jsp:include>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap"
	rel="stylesheet">
<!-- 관리자 식당등록 페이지 입니다 -->
<style>
.board-start {
	background-image: url("/img/store2.jpg");
	height: 50vh;
	position: relative;
	margin-bottom: 3vh;
}

.board-start::before {
	position: absolute;
	height: 51vh;
	width: 100%;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	opacity: 0.8;
	background-color: white;
}

.board-start h2 {
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 60px;
	margin-top: 35vh;
	color: rgb(221, 151, 0);
	position: relative;
}

.input-file-button {
	padding: 6px 25px;
	background-color: #FF6600;
	border-radius: 4px;
	color: white;
	cursor: pointer;
}
.banner {
	z-index: 15;
}
/**/
.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: 6px 25px;
	color: white;
	vertical-align: middle;
	background-color: #FF6600;
	cursor: pointer;
	border: none;
	border-radius: 4px;
	height: 32px;
	
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	height: 35px;
	font-size: 18px;
	padding: 0 10px;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-radius: 5px;
}

</style>
<div class="container-fluid board-start">
	<div class="container">
		<h2>식당관리</h2>
	</div>
</div>
<div class="container">
	<form action="/manager/restaurant/update" method="post"
		enctype="multipart/form-data">
		<table class="table table-borderless"
			style="border: solid 1px lightgray;">
			
			<div class="form-group">
				<label><span
					style="color: rgb(238, 163, 0); font-weight: bold; font-size: 20px;">상호명</span></label>
					<input type="hidden" id="id" name="id" value="${restaurant.id}"/>
				<input type="text" class="form-control chk" id="mainTitle"
					value="${restaurant.mainTitle }" name="mainTitle" name="mainTitle" required="required"
					style="background-color: rgb(247, 247, 247); border-radius: 0; margin-bottom: 40px; margin-top: 2vh;" />
			</div>
			
			<div class="form-group">
				<label><span
					style="color: rgb(238, 163, 0); font-weight: bold; font-size: 20px;">연락처</span></label>
				<input type="tel" class="form-control chk" id="cntctTel"
					name="cntctTel" required="required" value="${restaurant.cntctTel }"
					style="background-color: rgb(247, 247, 247); border-radius: 0; margin-bottom: 40px; margin-top: 2vh;" />
			</div>
			
			<div class="form-group">
				<label><span
					style="color: rgb(238, 163, 0); font-weight: bold; font-size: 20px;">영업시간</span></label>
				<input type="text" class="form-control chk" id="usageDayWeekAndTime"
					name="usageDayWeekAndTime"
					value="${restaurant.usageDayWeekAndTime }"
					style="background-color: rgb(247, 247, 247); border-radius: 0; margin-bottom: 40px; margin-top: 2vh;" />
			</div>
			
			<div class="form-group">
				<label><span
					style="color: rgb(238, 163, 0); font-weight: bold; font-size: 20px;">대표메뉴</span></label>
				<input type="text" class="form-control" name="rprsntvMenu"
					id="rprsntvMenu" value="${restaurant.rprsntvMenu }"
					style="background-color: rgb(247, 247, 247); border-radius: 0; margin-bottom: 40px; margin-top: 2vh;" />
			</div>
			
			<label><span
				style="color: rgb(238, 163, 0); font-weight: bold; font-size: 20px;">위치</span></label>
			<div class="input-group mb-3">
				<input type="text" class="form-control" value="${restaurant.addr1 }"
					name="addr1" id="addr1" required readonly
					style="border-radius: 0; margin-bottom: 10px; margin-top: 2vh;" />
				<div class="input-group-append">
					<label class="input-file-button"
						onclick="sample5_execDaumPostcode()" style="margin-bottom: 40px;">주소검색</label>
				</div>
			</div>
			<div class="form-group">
				<label for="comment"><span
					style="color: rgb(238, 163, 0); font-weight: bold; font-size: 20px; margin-bottom: 5px;">가게설명</span></label>
				<textarea class="form-control" rows="5" id="itemcntnts"
					name="itemcntnts"
					style="background-color: rgb(247, 247, 247); border-radius: 0; margin-bottom: 10px; margin-top: 2vh;">${restaurant.itemcntnts }</textarea>
			</div>
			
			<div class="filebox" style="display: flex; flex-wrap: wrap; margin-bottom: 60px;">
			<label for="files">업로드</label> <input class="input-file-button" type="file" id="files"
				accept="image/gif, image/jpeg, image/png" onchange="fileCheck(this)" multiple="multiple" name="files">
			<input class="upload-name" value="파일선택" style="height:32px; font-weight: 100; font-size: 13px;" >
			<c:if test="${not empty attachLists}">
		    	 <c:forEach items="${attachLists }" var="attach">
		      		<input type="hidden" name="attachId" value="${attach.id}"/>
		      	</c:forEach>
		      </c:if>
		       <c:if test="${empty attachLists}">
		      		<input type="hidden" name="attachId" value="${attach.id}"/>
		      </c:if>
		</div>
			
			<button type="submit" class="input-file-button" id="btn-submit" style="border: none; font-weight: bold; margin-right: 10px">수정하기</button>
			<button type="button" class="input-file-button" id="btn-cancel" style="border: none; font-weight: bold;">취소</button>



		</table>
	</form>
</div>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// 주소 api
	function sample5_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = data.address; // 최종 주소 변수

				// 주소 정보를 해당 필드에 넣는다.
				document.getElementById("addr1").value = addr;
			}
		}).open();
	}
	//확장자 체크
	function fileCheck(obj) {
		console.log(obj);
		pathpoint = obj.value.lastIndexOf(".");
		filepoint = obj.value.substring(pathpoint + 1, obj.length);
		filetype = filepoint.toLowerCase();

		//console.log(pathpoint);
		//console.log(filepoint); // png
		//console.log(filetype); // png

		if (filetype == "png" || filetype == "jpg" || filetype == "jpge") {

		} else {
			alert("이미지만 첨부해주세요");
			//$("#resImage").html("");
		}
	}

	// 취소버튼
	$("#btn-cancel").on('click', function() {
		if (!confirm("등록을 취소하시겠습니까?")) {
			return false;
		}
		history.back();
	})
$(document).ready(function() {
	var fileTarget = $('#files');
	fileTarget.on('change', function() { // 값이 변경되면
		var cur = $(".filebox input[type='file']").val();
		$(".upload-name").val(cur);
	});
});
</script>
</body>
</html>