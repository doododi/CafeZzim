<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<%//오늘 날짜 구하기 
Date tempNowDate = new Date(); 

//원하는 데이터 포맷 지정 
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
String nowDate = simpleDateFormat.format(tempNowDate); 
%>
	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	
	<%@include file="../header.jsp" %>
<!-- ----------------------------------------------------------------------- -->
<section class="pt-8 pb-4" id="kind">
	<div class="container">
		<h3 class="mypage-title mb-4">My page</h3>

		<!---------------------- 마이페이지 메뉴바 ------------------------------------------>
		<div class="d-flex justify-content-between mb-1 border-0 text-center">
			<c:if test="${sessionScope.grade eq 'master' }">
				<a href="mypage_admin" class="form-control btn-primary">회원 정보 관리</a>
			</c:if>
			<c:if test="${sessionScope.grade eq 'cafehost' || sessionScope.grade eq 'customer'}">
				<a href="mypage_member" class="form-control btn-primary">회원 정보 관리</a>
			</c:if>
			<a href="/mypageBookingList?nowDate=<%=nowDate %>&id=${sessionScope.member_id}" 
			class="form-control text-center bgBrownLighten1">예약 관리</a>
			<c:if test="${sessionScope.grade eq 'master'}">
				<a href="cafemanage" class="form-control">카페 관리</a>
			</c:if>
			<c:if test="${sessionScope.grade eq 'cafehost'}">
				<a href="${path }/cafeupdate?cafe_id=${sessionScope.cafe_id }" class="form-control">카페 관리</a>
			</c:if>	
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
									<input type="hidden" name="member_grade" id="member_grade" 
									readonly="readonly" class="form-control" value="${vo.member_grade }"/>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-12">
									<label>아이디</label>
								</div>
								<div class="col-12">
									<input type="text" name="member_id" id="member_id" readonly 
									class="form-control" value="${vo.member_id }"/>
									<div class="invalid-feedback">아이디를 입력해주세요.</div>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-12">
									<label>비밀번호 변경</label>
								</div>
								<div class="col-12">
									<input type="password" name="password" id="password" 
									required="required" class="form-control" 
									placeholder="변경하지 않을 경우 빈칸으로 놓으세요." />
									<div class="invalid-feedback">변경하지 않을 경우 빈칸으로 놓으세요.
									(변경시 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.)</div>
									<input type="hidden" name="pwd" id="pwd" value="${vo.password }"/>
								</div>
							</div>
							<div>
								<div class="invalid-feedback"></div>
							</div>
							<div class="row mb-3">
								<div class="col-12">
									<label>이름</label>
								</div>
								<div class="col-12">
									<input type="text" name="member_name" id="member_name" 
									required="required" class="form-control" value="${vo.member_name }"/>
									<div class="invalid-feedback">이름을 입력해주세요.</div>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-12">
									<label>전화번호</label>
								</div>
								<div class="col-12">
									<input type="tel" name="member_phone" id="member_phone" 
									required="required" class="form-control" value="${vo.member_phone }"/>
									<div class="invalid-feedback">(-)없이 9~11자 숫자로만 전화번호를 입력해주세요.</div>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-12">
									<label>이메일</label>
								</div>
								<div class="col-12">
									<input type="text" name="member_email" id="member_email" 
									required="required" class="form-control" value="${vo.member_email }"/>
									<div class="invalid-feedback">이메일을 정확히 입력해주세요. 예시)you@example.com</div>
								</div>
							</div>
							<div class="btn-group col-12">
								<input type="button" class="btn btn-primary col-6" 
								value="회원 정보 수정" name="btnMemberModify" id="btnMemberModify" />
								<input type="button" class="btn btn-danger col-6" 
								value="회원 탈퇴" name="btnMemberDelete" id="btnMemberDelete" />
							</div>
						</form>
					</div>
				</div>
			</div><!-- //container -->
		</section>

<%@include file="../footer.jsp" %>
</body>
</html>