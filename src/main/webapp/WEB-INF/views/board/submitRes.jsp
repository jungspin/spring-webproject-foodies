<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../includes/header.jsp"></jsp:include> 

<!-- 관리자 식당등록 페이지 입니다 -->
<div class="container" >
<br/>
<br/>
<br/>
	<h2>임시 식당등록 페이지</h2>
	<table class="table table-borderless" style="border: solid 1px lightgray;">
		<thead></thead>
		<tbody>
			<form action="/register" method="post" >
				<tr>
					<td>
						<div class="form-group">
						<label>상호명</label>
						<input type="text" class="form-control chk" id="resName" placeholder="정확한 상호명을 기재해주세요" name="resName" required="required" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
						<label>연락처</label>
							<input type="tel" class="form-control chk" id="resContact" name="resContact" required="required" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
						<label>영업시간</label>
							<input type="text" class="form-control chk" id="resTime" name="resContact" placeholder="00:00a.m ~ 00:00a.m 형식으로 입력해주세요" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
						<label>대표메뉴</label>
						<input type="text" class="form-control" id="resMenu" placeholder="예) 삼겹살덮밥, 하이라이스.." name="resMenu" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
					<label>위치</label>
					<div class="input-group mb-3">
					 <input type="text" class="form-control" placeholder="주소를 입력해주세요" name="resAddr" id="resAddr" required readonly />
					  <div class="input-group-append">
					    <button class="btn btn-primary" type="button" onClick="goPopup();">주소검색</button>
					  </div>
					</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
						  <label for="comment">가게설명</label>
						  <textarea class="form-control" rows="5" id="resContents"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label>사진등록</label>
						<form>
						  <div class="custom-file">
						    <input type="file" class="custom-file-input" id="resImage">
						    <label class="custom-file-label" for="customFile">클릭하면 사진첨부 가능</label> 
						  </div>
						</form>
					</td>
				</tr>
				<tr>
					<td>
						<!-- 그냥 못 넘어가게 해야돼 -->
						<button type="submit" class="btn btn-primary" id="btn-submit">등록하기</button>
					</td>
				</tr>

			</form>
		</tbody>

	</table>
</div>
<script>
//Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});

//opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup() {
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/manager/juso", "pop",
			"width=570,height=420, scrollbars=yes, resizable=yes");

	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr) {
	var addressEl = document.querySelector("#resAddr");
	addressEl.value = roadFullAddr;

}
</script>
</body>
</html>