<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container">
	<h2>자유게시판</h2>
	<div class="form-group text-right">
		<a href="insert">
		<button type="button" class="btn btn-secondary btn-sm" id="writeBtn">글쓰기</button></a>
	</div>

	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			  <c:forEach items="${lists.content}" var="board" varStatus="st">
				<tr>
					<td>${ board.id}</td>
					<td><a href="/board/view/${board.id}">${board.title }( 댓글 :${board.replyCnt })</a></td>
					<td>${board.member.username }</td>
					<td><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd" /></td>
					<td>${board.clickCnt }</td>
				</tr>
			</c:forEach> 
		
		</tbody>
	</table>
	<div class="d-flex justify-content-between mt-3">
		<ul class="pagination">
			<c:if test="${lists.first ==  false }">
				<li class="page-item"><a class="page-link" href="?page=${lists.number-1 }">Previous</a></li>
			</c:if>
			<c:if test="${lists.last ==  false }">
				<li class="page-item"><a class="page-link" href="?page=${lists.number+1 }">Next</a></li>
			</c:if>
		</ul>
	</div>



</div>
</body>
</html>