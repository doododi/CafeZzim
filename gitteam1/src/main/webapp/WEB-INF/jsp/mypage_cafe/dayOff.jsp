<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="./js/mpcafe.js"></script>
<!-- ===============================================-->
<!--    Document Title-->
<!-- ===============================================-->
<title>영업일 관리</title>
<%@include file="../common.jsp"%>
<link rel="stylesheet" href="./css/dayOff.css">
</head>


<body>
<!-- ===============================================-->
<!--    Main Content-->
<!-- ===============================================-->
<!--    헤더   -->
<%@include file="../header.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%//오늘 날짜 구하기 
Date tempNowDate = new Date(); 

//원하는 데이터 포맷 지정 
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
String nowDate = simpleDateFormat.format(tempNowDate); 
%>

<!-- 마이페이지 내 메뉴- -->
	<section class="pt-8 pb-2" id="kind">
		<div class="container">
			<h3 class="mypage-title mb-4">My page</h3>
			<!---------------------- 마이페이지 메뉴바 ------------------------------------------>
			<div class="d-flex justify-content-between mb-1 border-0 text-center">
			<a href="mypage_member" class="form-control bgBrownLighten1 mb-5">회원 정보 관리</a>
			<a href="/mypageBookingList?nowDate=<%=nowDate %>&id=${sessionScope.member_id}" class="form-control text-center bgBrownLighten1 mb-5" class="form-control">예약 관리</a>
			<c:if test="${sessionScope.grade eq 'master'}">
				<a href="cafemanage" class="form-control btn-primary bgBrownLighten1 mb-5">카페 관리</a>
			</c:if>
			<c:if test="${sessionScope.grade eq 'cafehost'}">
				<a href="${path }/cafeupdate?cafe_id=${sessionScope.cafe_id }" class="form-control btn-primary bgBrownLighten1 mb-5">카페 관리</a>
			</c:if>
		</div>
		</div>
	</section>
	<!-------------------------- 영업일 관리 창 ------------------------------------------>

	<!-------------------------- 영업일 관리 ------------------------------------------>
	<section class="py-3" id="dayOffCheck">
		<div class="container">
			<h1 class="h3 mb-2 fw-norma mb-4">영업일 관리</h1>
			<div class="col-xxl-4 col-xl-7 mb-2">
				<div class="card card-header-actions h-100">
					<div class="card-header">
						<p class="fw-normal">${vo.cafe_name}의 휴무일</p>
					</div>
					<div class="card-body">
						<div class="dayOff-list">						
							<!-- 휴무 및 일시정지일 리스트 -->
							<c:if test="${not empty vo.offlist }">
							<c:forEach var='dvo' items="${vo.offlist }">
								<ul class="dayOff-item mb-3">
									<li class="dayOff-item-marker">
										<span class="timeline-item-content"> 
										<strong class="fw-bold">${dvo.off_date } </strong> 
										${dvo.start_time } - ${dvo.end_time } ${dvo.off_type} 
										<a href="${path }/deleteOff?off_id=${dvo.off_id }&cafe_id=${vo.cafe_id}">
										<i role="button" id="btnOn_${dvo.off_id }" class="fas fa-times-circle fa-lg" style="color: #f00"></i></a>
										</span>
									</li>
								</ul>							
							</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<!---------------------- 휴무일 또는 일시중지 설정 ------------------------------------------>
			<hr class="my-4">
			<div class="col-md-7 col-lg-7">
				<h4 class="mb-3">휴무일  일시정지 설정</h4>
				<form id="frm_dayoff" name="frm_dayoff" class="dayOffCheck" method='post'>
				<input type="hidden" name="cafe_id" value="${vo.cafe_id}">
					<div class="cafe-dayOff-date col-md-7 mb-4">
						<label for="datePicker" class="form-label">날짜</label>
						<div class="choose-date mb-1">
							<input type="text" name="off_date" id="datePicker" class="form-control w-75 dayPicker" placeholder="날짜를 알려주세요">
						</div>
					</div>
					<div class="cafe-dayOff-time col-7 mb-4">
						<div class="select-zone mb-1">
							<label>시간</label> 
							<i class="fas fa-plus-circle fa-lg" id="plus-time" onclick="show_select(); toggle_time()"></i> 
							<i class="fas fa-minus-circle fa-lg" id="minus-time" onclick="hide_select(); toggle_time()"></i>
							<br/>(휴무가 아닌 일시정지를 원하시면 시간을 입력해주세요)
						</div>
						<div class="select-time" id="select-time">
							<div class="start-time mb-3">
							시작시간
								<select name="start_time" id="select-start" class="form-select select-start w-75" placeholder="시작 시간을 선택하세요.">
									<option selected value=""></option>
									<option value="10:00">10:00</option>
									<option value="11:00">11:00</option>
							 		<option value="12:00">12:00</option>
									<option value="13:00">13:00</option>
									<option value="14:00">14:00</option>
									<option value="15:00">15:00</option>
									<option value="16:00">16:00</option>
									<option value="17:00">17:00</option>
									<option value="18:00">18:00</option>
									<option value="19:00">19:00</option>
								</select>
							</div>
							<div class="end-time mb-3">
							종료시간
								<select name="end_time" id="select-end" class="form-select select-end w-75" placeholder="종료 시간을 선택하세요.">
									<option selected value=""></option>
									<option value="11:00">11:00</option>
							 		<option value="12:00">12:00</option>
									<option value="13:00">13:00</option>
									<option value="14:00">14:00</option>
									<option value="15:00">15:00</option>
									<option value="16:00">16:00</option>
									<option value="17:00">17:00</option>
									<option value="18:00">18:00</option>
									<option value="19:00">19:00</option>
									<option value="20:00">20:00</option>
								</select>
							</div>
						</div>
					</div>			
					<button type="button" class="btn btn-primary btn-lg w-25" id="dayOff-apply">적용</button>
				</form>
			</div>
		</div> <!-- //container -->
	</section>
	<!---------footer -------->
	<%@include file="../footer.jsp"%>
</body>
</html>