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
	<!----------------------- 검색창 ------------------------------------------>
						<form class="d-flex mb-3">
							<div class="input-group my-3">
								<input type="text" class="form-control" placeholder="이름 or 회원ID">
						    <div class="input-group-append">
						    	<button class="btn btn-secondary" type="submit">
						     	<i class="fa fa-search"></i>
									</button>
						  	</div>
							</div>	
						</form>

						<div class="row">
							<div class="col-xl-6 mb-3">
								<div class="d-flex">
									<div class="">
										<img class="img-fluid me-4 me-md-3 me-lg-4"
											src="img/gallery/user-1.png" width="100" alt="">
									</div>
									<div class="admin-member-desc">
										<p>{회원이름}</p>
										<p>회원ID:{회원ID}</p>
										<a href="">회원 관리</a>
									</div>
								</div>
							</div>

							<div class="col-xl-6 mb-3">
								<div class="d-flex">
									<div class="">
										<img class="img-fluid me-4 me-md-3 me-lg-4"
											src="img/gallery/user-1.png" width="100" alt="">
									</div>
									<div class="admin-member-desc">
										<p>{회원이름}</p>
										<p>회원ID:{회원ID}</p>
										<a href="">회원 관리</a>
									</div>
								</div>
							</div>
							
							<div class="col-xl-6 mb-3">
								<div class="d-flex">
									<div class="">
										<img class="img-fluid me-4 me-md-3 me-lg-4"
											src="img/gallery/user-1.png" width="100" alt="">
									</div>
									<div class="admin-member-desc">
										<p>{회원이름}</p>
										<p>회원ID:{회원ID}</p>
										<a href="">회원 관리</a>
									</div>
								</div>
							</div>
						</div><!-- //row -->
					</div>
				</div>
			</div><!-- //container -->
		</section>

<%@include file="footer.jsp" %>
</body>
</html>