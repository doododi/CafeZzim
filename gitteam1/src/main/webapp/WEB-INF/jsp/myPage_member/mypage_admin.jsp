<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
			<c:if test="${sessionScope.grade eq 'cafehost' }">
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
					<div class="col-12">
	<!----------------------- 검색창 ------------------------------------------>
					<c:if test="${sessionScope.grade eq 'master'}">
						<form class="d-flex mb-3" id="frm_member" method="post">
							<input type="hidden" name="member_id" />
							<div class="input-group my-3">
								<input type="text" class="form-control" name="findStr" placeholder="이름 or 회원ID">
						    <div class="input-group-append">
						    	<button class="btn btn-secondary" type="submit">
						     	<i class="fa fa-search"></i>
									</button>
						  	</div>
							</div>	
						</form>

						<div class="row">
							<c:forEach var="vo" items="${list }">
								<div class="col-xl-6 mb-3">
									<div class="d-flex">
										<div class="">
											<img class="img-fluid me-4 me-md-3 me-lg-4"
												src="img/gallery/user-1.png" width="100" alt="">
										</div>
										<div class="admin-member-desc">
											<p>${vo.member_name }</p>
											<p>회원ID : ${vo.member_id }</p>
											<input type="button" style="width:100px" class="btn btn-primary btn-sm btn-block col-12" 
											value="회원 관리" id="btnView" onclick="view('${vo.member_id }')"/>
										</div>
									</div>
								</div>
							</c:forEach>
						</div><!-- //row -->
					</c:if>
					</div>
				</div>
			</div><!-- //container -->
		</section>

<%@include file="../footer.jsp" %>
</body>
</html>