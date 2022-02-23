<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- ===============================================-->
<!--    Document Title-->
<!-- ===============================================-->
<title>카페 예약 사이트</title>
<%@include file="../common.jsp" %>
<link href="css/board.css" rel="stylesheet" />
<script src="js/qa.js"></script>
</head>


<body>

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->

	<%@include file="../header.jsp" %>
	<section>
		<div class="container">
			<main class="form-board-qa">
				<form name="frmBoard">
					<h1 class="h3 mb-4 fw-normal">Q&A</h1>
					<div class="searchZone mb-3">
						<input id="qa_serial" name="qa_serial" type="hidden">
						<input id="nowPage" name="nowPage" value="${page.nowPage}" type="hidden">
						<input id="qa_search" name="qa_search" class="inputTypeText" placeholder="검색어를 입력하세요." value="${page.qa_search}" type="search">
						<button type="button" id="btnQaSearch" class="btnNormal">찾기</button>
					</div>
					<!--테이블 ==========================================-->
					<table class="table">
						<thead>
							<tr>
								<th scope="col" style="width: 5%; font-size: 0.9rem">NO</th>
								<th scope="col" style="width: 55%; font-size: 0.9rem">제목</th>
								<th scope="col" style="width: 10%; font-size: 0.9rem">작성자</th>
								<th scope="col" style="width: 10%; font-size: 0.9rem">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list}">
								<tr>
									<td scope="row" class="num" style="font-size: 0.9rem">${vo.qa_serial}</td>
									<td class="subject">
										<input type="hidden" name="qa_serial" value="${vo.qa_serial}"/>
										<input type="hidden" name="grpno" value="${vo.grpno}"/>
										<input type="hidden" name="repl_id" value="${vo.repl_id}"/>
										<c:if test="${vo.secret == true}">
											<c:choose>
												<c:when test="${sessionScope.name eq vo.member_name
																		 || sessionScope.member_id eq vo.repl_id
																	 	 || sessionScope.grade eq 'master'}">
													<a href="${path}/qa_view?qa_serial=${vo.qa_serial}" style="font-size:0.9rem">${vo.subject}</a>
													<c:if test="${vo.file_cnt > 0}">
														<img src="./img/paper-clip.png" style="width:15px; height:15px;">
													</c:if>
													<c:if test="${vo.depth == 0}">
														<img src="./img/padlock.png" style="width:15px; height:15px;">
													</c:if>
												</c:when>
												<c:otherwise>
													<span style="font-size:0.9rem;">${vo.subject}</span>
													<c:if test="${vo.file_cnt > 0}">
														<img src="./img/paper-clip.png" style="width:15px; height:15px;">
													</c:if>
													<c:if test="${vo.depth == 0}">
														<img src="./img/padlock.png" style="width:15px; height:15px;">
													</c:if>
												</c:otherwise>
											</c:choose>
										</c:if>
										<c:if test="${vo.secret == false}">
											<a href="${path}/qa_view?qa_serial=${vo.qa_serial}" style="font-size:0.9rem">${vo.subject}</a>
											<c:if test="${vo.file_cnt > 0}">
												<img src="./img/paper-clip.png" style="width:15px; height:15px;">
											</c:if>
										</c:if>
									</td>
									<td class="writer-name" style="font-size: 0.9rem">${vo.member_name}</td>
									<td class="write-day" style="font-size: 0.9rem">${vo.created_date}</td>
								</tr>
							</c:forEach>
							<c:if test="${not empty sessionScope.member_id}">
								<tr class="btnChooseZone">
									<td colspan="4" class="qa_insert">
										<a href="qa_insert" class="btn btn-outline-primary">글쓰기</a>
									</td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<!-- 페이징 처리 ==========================================-->
					<div class="mt-3">
						<nav aria-label="Page navigation example">
							<ul class="pagination pagination-sm justify-content-center">
								<c:if test="${page.startPage > 1}">
									<li class="page-item">
										<a class="page-link" onclick="qa.page(${page.startPage-1})" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>
								<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
									<li class="page-item"><a class="page-link" onclick="qa.page(${i})">${i}</a></li>
								</c:forEach>
								<c:if test="${page.endPage < page.totPage}">
									<li class="page-item">
										<a class="page-link" onclick="qa.page(${page.endPage+1})" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:if>
							</ul>
						</nav>
					</div>
				</form>
			</main>
		</div>
	</section>
	<!-- <section> close ============================-->
		<!-- ============================================-->



<%@include file="../footer.jsp" %>
</body>
</html> 