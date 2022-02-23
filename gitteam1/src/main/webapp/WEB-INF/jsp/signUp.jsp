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
<script src="js/signUp.js"></script>
</head>


<body>

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	
	<%@include file="header.jsp" %>
		<section class="">
			<div class="container">
	      <div class="row flex-center">
						<div class="mb-3">
							<img class="d-block mx-auto mb-4" src="img/icons/coffee-cup-thin.png"
								alt="" width="72" height="72">
						</div>
						<div class="col-md-6">
							<form class="needs-validation" novalidate>
								<div class="row mb-3">
									<h2>회원가입</h2>
									<div class="col-6">
										<label class="radio-inline col-md-6"><input
											type="radio" name="member_grade" value="customer" checked>개인회원</label>
									</div>
									<div class="col-6">
										<label class="radio-inline col-md-6"><input
											type="radio" name="member_grade" value="cafehost">카페운영자</label>
									</div>
								</div>
								<div class="row">
									<div class="mb-3">
										<label for="member_id">아이디</label>
										<div class="input-group">
											<input type="text" class="form-control" id="member_id" 
											placeholder="" value="" required>
											<button type="button" class="btn btn-primary" id="btnIdCheck">중복확인</button>										
										</div> 
										<div class="invalid-feedback">아이디를 입력해주세요.</div>
									</div>
									
									<div class="mb-3">
										<label for="password">비밀번호</label> 
										<input type="password" class="form-control" id="password" 
										placeholder="" value="" required>
										<div class="invalid-feedback"></div>
									</div>
									<div class="mb-3">
										<label for="password_check">비밀번호 확인</label> 
										<input type="password" class="form-control" id="password_check" 
										placeholder="" value="" required>
										<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
									</div>
									<div class="mb-3">
										<label for="member_name">이름</label> 
										<input type="text" class="form-control" id="member_name" 
										placeholder="" value="" required>
										<div class="invalid-feedback">이름을 입력해주세요.</div>
									</div>
									<div class="mb-3">
										<label for="member_phone">전화번호</label> 
										<input type="tel" class="form-control" id="member_phone" 
										placeholder="" value="" required>
										<div class="invalid-feedback">(-)없이 전화번호를 입력해주세요.</div>
									</div>
								</div>
								<div class="mb-3">
									<label for="email">이메일 <span class="text-muted"></span></label>
									<input type="email" class="form-control" id="email" 
									placeholder="you@example.com" required>
									<div class="invalid-feedback">이메일을 입력해주세요.</div>
								</div>

								<div class="mb-2"></div>
								<button class="btn btn-primary btn-lg btn-block col-12 my-4"
									type="submit" id="btnSignUp">가입하기</button>
							</form>
						</div>				
	      </div>
	    </div><!-- <container>-->
		</section>

<%@include file="footer.jsp" %>
</body>
</html>