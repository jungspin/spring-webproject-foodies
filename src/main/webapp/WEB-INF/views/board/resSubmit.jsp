<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../includes/header.jsp"></jsp:include> 

<!-- 관리자 식당등록 페이지 입니다 -->
<div class="container" >
<br/>
<br/>
<br/>
	<h2>임시 식당등록 페이지</h2>
		<form action="/manager/submit" method="post" enctype="multipart/form-data">
	<table class="table table-borderless" style="border: solid 1px lightgray;">
		<thead></thead>
		<tbody>
		
				<tr>
					<td>
						<div class="form-group">
						<label>상호명</label>
						<input type="text" class="form-control chk" id="mainTitle" placeholder="정확한 상호명을 기재해주세요" name="mainTitle" required="required" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
						<label>연락처</label>
							<input type="tel" class="form-control chk" id="cntctTel" name="cntctTel" required="required" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
						<label>영업시간</label>
							<input type="text" class="form-control chk" id="usageDayWeekAndTime" name="usageDayWeekAndTime" placeholder="00:00a.m ~ 00:00a.m 형식으로 입력해주세요" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
						<label>대표메뉴</label>
						<input type="text" class="form-control" name="rprsntvMenu" id="rprsntvMenu" placeholder="예) 삼겹살덮밥, 하이라이스.."  />
						</div>
					</td>
				</tr>
				<tr>
					<td>
					<label>위치</label>
						<div class="input-group mb-3">
						 	<input type="text" class="form-control" placeholder="주소를 입력해주세요" name="addr1" id="addr1" required readonly />
						  	<div class="input-group-append">
						    <button class="btn btn-primary" type="button" onclick="sample5_execDaumPostcode()">주소검색</button>
					  		</div>
					  </div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
						  <label for="comment">가게설명</label>
						  <textarea class="form-control" rows="5" id="itemcntnts" name="itemcntnts" ></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label>사진등록</label>
						    <div class="form-group" id="fileContainer">
						      <input type="file" accept="image/gif, image/jpeg, image/png" onchange="fileCheck(this)" class="form-control-file border" name="files" id="files" multiple />
						    </div>
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit" class="btn btn-primary" id="btn-submit">등록하기</button>
						<button type="button" class="btn btn-primary" id="btn-cancel">취소</button>
					</td>
				</tr>

			
		</tbody>

	</table>
	</form>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// 주소 api
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addr1").value = addr;
            }
        }).open();
    }
//확장자 체크
function fileCheck(obj){
	console.log(obj);
	pathpoint = obj.value.lastIndexOf(".");
	filepoint = obj.value.substring(pathpoint+1, obj.length);
	filetype = filepoint.toLowerCase();
	
	//console.log(pathpoint);
	//console.log(filepoint); // png
	//console.log(filetype); // png
	
	if (filetype == "png" || filetype == "jpg" || filetype == "jpge" ){
		
	} else {
		alert("이미지만 첨부해주세요");
		//$("#resImage").html("");
	}
}

// 취소버튼
$("#btn-cancel").on('click', function(){
	if (!confirm("등록을 취소하시겠습니까?")){
		return false;
	}
	history.back();
})

</script>
</body>
</html>