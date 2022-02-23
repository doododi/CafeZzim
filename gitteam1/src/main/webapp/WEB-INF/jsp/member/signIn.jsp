<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			  <form name="frmSignIn" method="post">
			    <img class="mb-2" src="./img/CafeZzim-logo.png" alt="" width="75" height="75">
			    <h1 class="h3 mb-2 fw-normal">CafeZzim</h1>

					<div class="mt-2">
	    			<c:if test="${empty message}">
	    				<p>아이디와 비밀번호를 입력하세요.</p>
	    			</c:if>
			    	<c:if test="${message == 'failure'}">
			    		<p style="color:red">정보가 일치하지 않습니다.</p>
			  	  </c:if>
	    		</div>

			    <div class="form-floating my-3">
			      <input type="text" class="form-control" id="member_id" name="member_id" placeholder="아이디" required="required" autocomplete="off">
			      <label for="floatingInput">아이디</label>
			    </div>
			    <div class="form-floating my-2">
			      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" required="required">
			      <label for="floatingPassword">비밀번호</label>
			    </div>
			    <div class="form-check mt-3">
			      <input class="form-check-input" type="checkbox" id="useCookie" name="useCookie">
			      <label class="form-check-label" for="useCookie">
			        로그인 상태 유지
			      </label>
			    </div>
			    <button type="button" class="w-100 btn btn-lg btn-primary mt-3 mb-2" id="btnSignIn">로그인</button>
			    	<a
								href="https://kauth.kakao.com/oauth/authorize
											?client_id=201e47d1c3e1bf489c8a6f94c2413304
											&redirect_uri=http://gitteam1.cafe24.com/kakaoLogin
											&response_type=code">
								<img class="kakaoLogin mb-3" src="img/kakao_login_medium_wide.png" style="height: 45px">
					</a>
			    <div class="text-center links">
			    	<a href="searchId">아이디 찾기</a> | <a href="searchPw">비밀번호 찾기</a> | <a href="signUp">회원가입</a>
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