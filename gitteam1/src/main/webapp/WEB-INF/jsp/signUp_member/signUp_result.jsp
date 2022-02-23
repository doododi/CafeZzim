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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="js/signUp.js"></script>
</head>


<body>

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	
	<%@include file="../header.jsp" %>
		<section class="">
			<div class="container">
	      <div class="row flex-center text-center">
						<div class="mb-1">
							<img class="d-block mx-auto mb-4" src="img/CafeZzim-logo.png"
								alt="" width="75" height="75">
						</div>
						<div class="col-md-6">
							<form class="">
								<output class="mb-1 fs-1 fw-bold" id="msg">${msg }</output>
								<p class="mb-3">좋은 서비스로 찾아뵙겠습니다.</p>
								
								<div class="d-flex justify-content-between mb-1 border-0 text-center">
									<a href="signIn" class="form-control btn-primary">로그인</a>
									<a href="/" class="form-control">홈으로</a>
								</div>
							</form>
						</div>				
	      </div>
	    </div><!-- <container>-->
		</section>

<%@include file="../footer.jsp" %>
</body>
</html>