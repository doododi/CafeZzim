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
<script src="js/summernote.js"></script>
</head>


<body>

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->

	<%@include file="../header.jsp"%>
	<section>
		<div class="container">
			<main class="form-board-notice-view">
				<form name="frmBoard" method="post" enctype="multipart/form-data">
					<h1 class="h3 mb-4 fw-normal">Q&A repl</h1>
					<!--테이블 ==========================================-->
					<div class="ec-base-table typeWrite ">
						<input type="hidden" name="nowPage" value="${page.nowPage}"/>
						<input type="hidden" name="qa_serial" value="${vo.qa_serial}"/>	
						<input type="hidden" name="member_id" value="${sessionScope.member_id}"/>
						<input type="hidden" name="member_name" value="${sessionScope.name}"/>
						<input type="hidden" name="isSecret" value="${vo.secret}"/>
						<input type="hidden" name="repl_id" value="${repl_id}"/>
						<table class="table insert">
							<colgroup>
								<col style="width: 130px;" />
								<col style="width: auto;" />
							</colgroup>
							<tbody>
								<tr class="whatRepl">
									<td colspan="2" class="whatRepl">
										<p style="text-align:center;">${vo.member_name}님의 ${vo.subject}에 대한 답변을 작성 중입니다.</p>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="whatRepl">
										<p>${vo.content}</p>
									</td>
								</tr>
								<tr class="subject">
									<th scope="row">제목</th>
									<td><input type="text" class="subjectText" name="subject" id="subject" value="[답변] ${vo.subject}"></td>
								</tr>
								<tr class="view">
									<td colspan="2" class="">
										<textarea class="summernote" name="content" id="content">안녕하세요. cafeZzim입니다.</textarea>
									</td>
								</tr>
								<tr class="file">
									<th scope="row">첨부파일</th>
									<td><input type="file" name="file" class="form-control" id="qa_file" multiple="multiple"></td>
								</tr>
								<tr class="btnChooseZone">
									<td>
										<a href="qa" class="btn btn-outline-primary">목록</a>
									</td>
									<td class="btnSave">
										<button type="button" id="btnQaReplSave" class="btn btn-primary">등록</button>
										<a href="qa" class="btn btn-outline-dark">취소</a>
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
