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
<script src="js/signUp.js"></script>
</head>


<body>

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	
	<%@include file="../header.jsp" %>
		<section class="">
			<div class="container">
	      <div class="row flex-center">
						<div class="mb-3">
							<img class="d-block mx-auto mb-4" src="img/icons/coffee-cup-thin.png"
								alt="" width="72" height="72">
						</div>
						<div class="col-md-6">
							<form class="needs-validation" novalidate id="frm_member" method="post">
								<div class="row mb-3">
									<h2>회원가입</h2>
									<div class="row flex-center text-center">
									<a href="https://kauth.kakao.com/oauth/authorize
											?client_id=201e47d1c3e1bf489c8a6f94c2413304
											&redirect_uri=http://gitteam1.cafe24.com/kakaoLogin
											&response_type=code">
										<img class="kakaoLogin mb-3" src="img/kakao_login_medium_wide.png" style="height:40px">
									</a>
									</div>
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
											<input type="text" class="form-control" id="member_id" name="member_id" 
											placeholder="" value="${param.member_id}" required>
											<button type="button" class="btn btn-primary" id="btnIdCheck">중복확인</button>										
										</div> 
										<div class="invalid-feedback">아이디를 입력해주세요.</div>
									</div>
									
									<div class="mb-3">
										<label for="password">비밀번호</label> 
										<input type="password" class="form-control" id="password" name="password"
										placeholder="" value="${param.password}" required>
										<div class="invalid-feedback">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</div>
									</div>
									<div class="mb-3">
										<label for="password_check">비밀번호 확인</label> 
										<input type="password" class="form-control" id="password_check" name="password_check"
										placeholder="" value="${param.password_check}" required>
										<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
									</div>
									<div class="mb-3">
										<label for="member_name">이름</label> 
										<input type="text" class="form-control" id="member_name" name="member_name"
										placeholder="" value="${param.member_name}" required>
										<div class="invalid-feedback">이름을 입력해주세요.</div>
									</div>
									<div class="mb-3">
										<label for="member_phone">전화번호</label> 
										<input type="text" class="form-control" id="member_phone" name="member_phone"
										placeholder="" value="${param.member_phone}" required>
										<div class="invalid-feedback">(-)없이 9~11자 숫자로만 전화번호를 입력해주세요.</div>
									</div>
								</div>
								<div class="mb-3">
									<label for="member_email">이메일 <span class="text-muted"></span></label>
									<div class="input-group">
										<input type="text" class="form-control" id="member_email" name="member_email"
										placeholder="you@example.com" value="${param.member_email}" required>
										<button type="button" class="btn btn-primary" id="btnEmail">중복확인</button>	
									</div>
									<div class="invalid-feedback">이메일을 정확히 입력해주세요. 예시)you@example.com</div>
								</div>

								<div class="mb-2"></div>
								<input class="btn btn-primary btn-lg btn-block col-12 my-4"
									type="button" id="btnSignUp" value="가입하기">
							</form>
						</div>				
	      </div>
	    </div><!-- <container>-->
		</section>

<%@include file="../footer.jsp" %>
</body>
</html>