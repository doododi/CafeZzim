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
			  <form action="frmSearchPw" method="post">
			    <img class="mb-2" src="./img/CafeZzim-logo.png" alt="" width="75" height="75">
			    <h1 class="h3 mb-2 fw-normal">CafeZzim</h1>

			    <div class="mt-2">
	    				<p>아이디와 이름, 이메일을 입력하세요.</p>
	    		</div>

			    <div class="form-floating my-3">
			      <input type="text" class="form-control" id="member_id" name="memver_id" placeholder="아이디" required="required" autocomplete="off">
			      <label for="floatingInput">아이디</label>
			    </div>

			     <div class="form-floating my-3">
			      <input type="text" class="form-control" id="member_name" name="member_name" placeholder="이름" required="required" autocomplete="off">
			      <label for="floatingInput">이름</label>
			    </div>

			    <div class="form-floating my-2">
			      <input type="email" class="form-control" id="member_email" name="member_email" placeholder="이메일" required="required" autocomplete="off">
			      <label for="floatingInput">이메일</label>
			    </div>

			    <button type="button" class="w-100 btn btn-lg btn-primary my-3" id="btnSearchPw">비밀번호 찾기</button>
			    <div class="text-center links">
			    	<a href="signIn">로그인</a> | <a href="searchId">아이디 찾기</a> | <a href="signUp">회원가입</a>
			    </div>
			    <p class="mt-5 mb-3 text-muted text-center">&copy; CafeZzim</p>
			  </form>
			</main>
		</section>
		<!-- <section> close ============================-->
		<!-- ============================================-->



<%@include file="../footer.jsp" %>
</body>
</html> 