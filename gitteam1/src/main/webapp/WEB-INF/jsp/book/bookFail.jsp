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
	height:400px;
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
<section class="py-0" id="kind">
<div class="container-sm position-relative mt-50">
	<div class="row flex-center pt-7 text-center" id="message">
		<h3 class="mx-10">${param.cafe_name } 예약이 예기치 못한 오류로 실패하였습니다.</h3>
	</div>
</div>
<div class="container-lg mb-3 mt-3">
	<div class="d-flex text-center">
		<div class="col-6"><a href="/" class="form-control">다른예약하기</a></div>
		<div class="col-6"><a href="mypageBookingList?nowDate=<%=nowDate %>&id=${sessionScope.member_id}" class="form-control btn-primary">예약내용 확인하기</a></div>
	</div>
</div>				
</section>

<%@include file="../footer.jsp" %>
</body>
</html>