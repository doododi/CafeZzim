<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<%@include file="../common.jsp"%>
<link href="css/board.css" rel="stylesheet" />
<script src="js/qa.js"></script>
</head>


<body>

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->

	<%@include file="../header.jsp"%>
	<section>
		<div class="container">
			<main class="form-board-notice-view">
				<form name="frmBoard">
					<h1 class="h3 mb-4 fw-normal">Q&A</h1>
					<!--테이블 ==========================================-->
					<div class="ec-base-table typeWrite ">
						<input type="hidden" name="nowPage" value="${page.nowPage}"/>
						<input type="hidden" name="qa_serial" value="${vo.qa_serial}"/>
						<table class="table view">
							<colgroup>
								<col style="width: 130px;" />
								<col style="width: auto;" />
							</colgroup>
							<tbody>
								<tr class="subject">
									<th scope="row">제목</th>
									<td>${vo.subject}</td>
								</tr>
								<tr class="writer_name">
									<th scope="row">작성자</th>
									<td>${vo.member_name}</td>
								</tr>
								<tr class="created_date">
									<th scope="row">작성일</th>
									<td>${vo.created_date}</td>
								</tr>
								<tr class="content">
									<td colspan="2" class="main-text">${vo.content}</td>
								</tr>
								<c:if test="${not empty vo.qa_files}">
									<tr class="fileZone">
										<th scope="row">첨부파일</th>
										<td class="qa_file">
											<ul>
												<c:forEach var="file" items="${vo.qa_files}">
													<li>
														<a href="upload/qa/${file.qa_file}" download>
															${file.qa_origin_file}
														</a>
													</li>
												</c:forEach>
											</ul>
										</td>
									</tr>
								</c:if>
								<tr class="btnChooseZone">
									<td>
										<a href="qa" class="btn btn-outline-primary">목록</a>
									</td>
									<td class="btnSave">
									<c:if test="${vo.depth eq 0}">
										<c:if test="${sessionScope.grade eq 'master'}">
											<button type="button" id="btnRepl" class="btn btn-primary">답변</button>
										</c:if>
										<c:if test="${sessionScope.name eq vo.member_name}">
											<a href="${path}/qa_modify?qa_serial=${vo.qa_serial}" class="btn btn-outline-primary">수정</a>
										</c:if>
										<c:if test="${sessionScope.name eq vo.member_name || sessionScope.grade eq 'master'}">
											<button class="btn btn-outline-danger" id="btnDelete">삭제</button>
										</c:if>
									</c:if>
									<c:if test="${vo.depth eq 1}">
										<c:if test="${sessionScope.name eq vo.member_name}">
											<a href="${path}/qa_modify?qa_serial=${vo.qa_serial}" class="btn btn-outline-primary">수정</a>
										</c:if>
										<c:if test="${sessionScope.name eq vo.member_name || sessionScope.grade eq 'master'}">
											<button type="button" class="btn btn-outline-danger" id="btnDeleteRepl">삭제</button>
										</c:if>
									</c:if>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</main>
		</div>
	</section>
	<!-- <section> close ============================-->
	<!-- ============================================-->



	<%@include file="../footer.jsp"%>
</body>
</html>
