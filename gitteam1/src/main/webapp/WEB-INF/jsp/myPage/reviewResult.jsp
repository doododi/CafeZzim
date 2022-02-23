<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>리뷰작성완료 | CafeZzim</title>
<%@include file="../common.jsp" %>
<link rel="stylesheet" href="css/review.css">
</head>


<body>
<%@include file="../header.jsp" %>

<!-- ----------------------------------------------------------------------- -->
<section class="pt-8 pb-2" id="kind">
	<div class="container">
		<h3 class="mb-4">My page</h3>

		<!---------------------- 마이페이지 메뉴바 ------------------------------------------>
		<div class="d-flex justify-content-between mb-1 border-0">
			<input type="button" class="form-control" value="회원 정보 관리">
			<input type="button" class="form-control btn-primary" value="예약 관리">
			<input type="button" class="form-control" value="카페 관리">
		</div>
	</div>
</section>

<section class="pt-4 pb-6">

	<div class="container">
		<div class="text-center">
			<h5 class="">${ msg }</h5>
			<p></p>
		</div>

		<div class="row">
			<div class="col-12"><a href="/" class="w-100 btn btn-lg btn-primary" id="reviewSaveBtn">메인으로</a></div>
		</div>
		
	</div>

</section>

<%@include file="../footer.jsp" %>
<script type="text/javascript" src="js/review.js"></script>
</body>
</html>