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


<title>테이블 예약 화면</title>
<%@include file="../common.jsp" %>
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
<section class="py-0" id="kind">
<div class="container-sm position-relative">
	<div class="row flex-center pt-8">
		<h3 class="mx-10">${param.cafe_name} - 예약 완료!</h3>
</div>
	</div>		
</section>

<section class="py-5" id="location">
	<div class="container-lg">
		<div class="row align-items-center">
			<!-- 예약리스트 -->
				<!-- <a href="" class="location-item card shadow-lg mb-4 border-0"> -->
					<div class="location-img my-4">
						<img src="../img/gallery/${param.photo }" class="img-fluid col-lg-8 col-12 w-100" alt="서울,경기">
					</div>
					<div class="pt-1 px-4">
						<h4>${param.cafe_address }</h4>
						<span class="text-muted">${param.cafe_name }</span>
						<br/>
						<small>예약일자 ${param.reserve_date }</small>
						<br/>
						<br/>
						<c:choose>
							<c:when test="${cupon>0 }">
								<h6 class="mt-4">축하합니다!!</h6>
								<h6 class="mt-4">${sessionScope.name } 님께 ${cupon} 개의 쿠폰이 지급되었습니다!</h6>
								<br/>
								<h6 class="mt-4">남은 스탬프는 ${stamp} 개 입니다</h6>
							</c:when>
							<c:otherwise>
							<h6 class="mt-4">${sessionScope.name }님께 ${giveStamp }개의 스탬프가 지급되었습니다. </h6>
							<h6 class="mt-4">현재 스탬프는 ${stamp} 개 입니다</h6>
							</c:otherwise>
												
						</c:choose>
					</div>
			<!-- 	</a> -->
		</div>
		<div class="d-flex text-center">
			<div class="col-6"><a href="/" class="form-control">다른예약하기</a></div>
			<div class="col-6"><a href="mypageBookingList?nowDate=<%=nowDate %>" class="form-control btn-primary">예약내용 확인하기</a></div>
		</div>
	</div>
</section>

<%@include file="../footer.jsp" %>
</body>
</html>