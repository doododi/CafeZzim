<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="css/signIn.css" rel="stylesheet" />
<script src="js/sign.js"></script>
</head>


<body>

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->

		<%@include file="../header.jsp" %>

		<section class="py-8" id="searchMain">
			<main class="form-signin">
			  <form name="frmSearchIdCheck" method="post">
			    <img class="mb-2" src="./img/CafeZzim-logo.png" alt="" width="75" height="75">
			    <h1 class="h3 mb-2 fw-normal">CafeZzim</h1>

					<div class="mt-2">
			    		<p>아이디를 찾았습니다.</p>
	    		</div>
							<label>아이디</label>
	    		<div>
						<input type="text" class="form-control" id="show_member_id" readonly="readonly" value="${member_id}">
	    		</div>
					<div class="d-grid gap-2 d-md-block">
				    <button type="button" class="w-100 btn btn-lg btn-outline-primary mt-3" id="btnMoveSearchPw">비밀번호 찾기</button>
	 			    <button type="button" class="w-100 btn btn-lg btn-outline-primary mt-3" id="btnMoveSignIn">로그인</button>
					</div>

			    <p class="mt-5 mb-3 text-muted text-center">&copy; CafeZzim</p>
			  </form>
			</main>
		</section>
		<!-- <section> close ============================-->


<%@include file="../footer.jsp" %>
</body>
</html> 