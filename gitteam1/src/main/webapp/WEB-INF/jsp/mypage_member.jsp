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
<%@include file="common.jsp" %>
</head>


<body>

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	
	<%@include file="header.jsp" %>
<!-- ----------------------------------------------------------------------- -->
<section class="pt-8 pb-4" id="kind">
	<div class="container">
		<h3 class="mypage-title mb-4">My page</h3>

		<!---------------------- 마이페이지 메뉴바 ------------------------------------------>
		<div class="d-flex justify-content-between mb-1 border-0 text-center">
			<a href="mypage_member" class="form-control btn-primary">회원 정보 관리</a>
			<a href="mypageBookingList" class="form-control">예약 관리</a>
			<a href="cafemanage" class="form-control">카페 관리</a>
		</div>
	</div>
</section>
		
		<section class="py-3">
			<div class="container">
				<div class="row flex-center">
					<div class="col-12 col-md-6">
							
						<h2>회원 정보 관리</h2>
						<form name="frm_member" method="post" id="frm_member">
							<div class="row mb-3">
								<div class="col-12">
									<label>아이디</label>
								</div>
								<div class="col-12">
									<input type="text" name="member_id" id="member_id" readonly class="form-control" />
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-12">
									<label>비밀번호 변경</label>
								</div>
								<div class="col-12">
									<input type="password" name="password" id="password" required="required" class="form-control" />
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-12">
									<label>회원등급</label>
								</div>
								<div class="col-12">
									<input type="text" name="member_grade" id="member_grade" required="required" class="form-control" />
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-12">
									<label>이름</label>
								</div>
								<div class="col-12">
									<input type="text" name="member_name" id="member_name" required="required" class="form-control" />
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-12">
									<label>전화번호</label>
								</div>
								<div class="col-12">
									<input type="tel" name="member_phone" id="member_phone" required="required" class="form-control" />
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-12">
									<label>이메일</label>
								</div>
								<div class="col-12">
									<input type="text" name="email" id="email" required="required" class="form-control" />
								</div>
							</div>
							<div class="btnZone">
								<input type="button" class="btn btn-primary btn-lg btn-block col-12 my-4" 
								value="회원 정보 수정" id="btnMemberModify" />
							</div>
						</form>
					</div>
				</div>
			</div><!-- //container -->
		</section>

<%@include file="footer.jsp" %>
</body>
</html>