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
<script src="js/notice.js"></script>
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
					<h1 class="h3 mb-4 fw-normal">notice</h1>
					<!--테이블 ==========================================-->
					<div class="ec-base-table typeWrite ">
						<input type="hidden" name="nowPage" value="${page.nowPage}"/>
						<input type="hidden" name="notice_serial"  value="${vo.notice_serial}"/>
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
								<tr class="content">
									<td colspan="2" class="main-text" style="max-width: 100%">${vo.content}</td>
								</tr>
								<c:if test="${not empty vo.notice_files}">
									<tr class="fileZone">
										<th scope="row">첨부파일</th>
										<td class="notice_file">
											<ul>
												<c:forEach var="file" items="${vo.notice_files}">
													<li>
														<a href="upload/notice/${file.notice_file}" download>
															${file.notice_origin_file}
														</a>
													</li>
												</c:forEach>
											</ul>
										</td>
									</tr>
								</c:if>
								<tr class="btnChooseZone">
									<td>
										<a href="notice" class="btn btn-outline-primary">목록</a>
									</td>
									<c:if test="${sessionScope.grade eq 'master'}">
										<td class="btnSave">
											<a href="${path}/notice_modify?notice_serial=${vo.notice_serial}" class="btn btn-primary">수정</a>
											<button id="btnDelete" class="btn btn-outline-danger">삭제</button>
										</td>
									</c:if>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 
					<div class="prev-next-board">
							<ul>
								<li class="prev"><strong>이전글</strong><a
									href="${path}/">카카오톡 알림톡 서비스 OPEN</a></li>
								<li class="next"><strong>다음글</strong><a
									href="${path}/">상품별 사이즈 측정 방법</a></li>
							</ul>
					</div>
					-->
				</form>
			</main>
		</div>
	</section>
	<!-- <section> close ============================-->
	<!-- ============================================-->



	<%@include file="../footer.jsp"%>
</body>
</html>