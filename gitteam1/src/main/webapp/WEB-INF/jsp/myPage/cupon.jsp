<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>테이블 예약 화면</title>
<%@include file="../common.jsp" %>
<style>
#message{
	height:600px;
}
</style>
<%//오늘 날짜 구하기 
String nowDate = request.getParameter("nowDate");
Date tempNowDate = new Date(); 
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
//원하는 데이터 포맷 지정 
nowDate = simpleDateFormat.format(tempNowDate); 

%>
</head>


<body>
<%@include file="../header.jsp" %>

<!-- ----------------------------------------------------------------------- -->
<section class="pt-8 pb-4" id="kind">
	<div class="container">
		<h3 class="mypage-title mb-4">My page</h3>

		<!---------------------- 마이페이지 메뉴바 ------------------------------------------>
		<div class="d-flex justify-content-between mb-1 border-0 text-center">
			<c:if test="${sessionScope.grade eq 'master' }">
				<a href="mypage_admin" class="form-control">회원 정보 관리</a>
			</c:if>
			<c:if test="${sessionScope.grade eq 'cafehost' || sessionScope.grade eq 'customer' }">
				<a href="mypage_member" class="form-control">회원 정보 관리</a>
			</c:if>	
			<a href="mypageBookingList?nowDate=<%=nowDate %>" class="form-control btn-primary">예약 관리</a>
			<c:if test="${sessionScope.grade=='master' }">
				<a href="cafemanage" class="form-control">카페 관리</a>
			</c:if>
			<c:if test="${sessionScope.grade eq 'cafehost'}">
				<a href="${path }/cafeupdate?cafe_id=${sessionScope.cafe_id }" class="form-control">카페 관리</a>
			</c:if>
		</div>
	</div>
</section>

<section class="py-0" id="kind">
<div class="container-sm position-relative mt-50">
	<div class="row flex-center pt-7 text-center" id="message">
		<h3 class="mx-10">${sessionScope.name }님의 스탬프는 ${stampCnt }개 입니다</h3>
		<c:forEach var="vo" begin="1" end="${stampCnt }" varStatus="status">
			<div class="col-2">
				<img src="../img/icons/stamp.png" class="img-fluid">
			</div>
		</c:forEach>
		<c:forEach var="vo2" begin="1" end="${10-stampCnt }" varStatus="status">
			<div class="col-2">
				<img src="../img/icons/stamp_black.png" class="img-fluid">
			</div>
		</c:forEach>
	</div>
</div>			
</section>

<%@include file="../footer.jsp" %>
</body>
</html>