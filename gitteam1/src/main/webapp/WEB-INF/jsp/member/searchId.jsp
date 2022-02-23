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
			  <form name="frmSearchId" method="post">
			    <img class="mb-2" src="./img/CafeZzim-logo.png" alt="" width="75" height="75">
			    <h1 class="h3 mb-2 fw-normal">CafeZzim</h1>

					<div class="mt-2">
	    			<c:if test="${empty message}">
	    				<p>이름과 전화번호를 입력하세요.</p>
	    			</c:if>
			    	<c:if test="${message == 'failure'}">
			    		<p style="color:red">정보가 일치하지 않습니다.</p>
			  	  </c:if>
	    		</div>

			    <div class="form-floating my-3">
			      <input type="text" class="form-control" id="member_name" name="member_name" placeholder="이름" required="required" autocomplete="off">
			      <label for="floatingInput">이름</label>
			    </div>
			    <div class="form-floating my-2">
			      <input type="text" class="form-control" id="member_phone" name="member_phone" placeholder="전화번호" required="required" autocomplete="off">
			      <label for="floatingInput">전화번호</label>
			    </div>

			    <button type="button" class="w-100 btn btn-lg btn-primary my-3" id="btnSearchId">아이디 찾기</button>
			    <div class="text-center links">
			    	<a href="searchPw">비밀번호 찾기</a> | <a href="signIn">로그인</a> | <a href="signUp">회원가입</a>
			    </div>
			    <p class="mt-5 mb-3 text-muted text-center">&copy; CafeZzim</p>
			  </form>
			</main>
		</section>
		<!-- <section> close ============================-->

<%@include file="../footer.jsp" %>
</body>
</html> 