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
<link rel="stylesheet" href="css/pay.css">
</head>


<body>
<%@include file="../header.jsp" %>

<div class="container">
	<section class="pt-9 pb-1 ml-5" id="kind">
		<h3 class="mx-10">테이블 예약</h3>
	</section>
	<div class="card shadow-lg mb-5 border-0 p-4">
		<div class="row g-5">
			<div class="col-md-7 col-lg-8">
				<section class="pb-3 pt-0 " id="reserve"> <!-------------------- 예약일 -------------------->
					<div class="row align-items-center">
						<div class="container-lg">
							<div id='timeSelect' class="py-1">
								<h6>예약일</h6>
								<div class="d-flex flex-wrap my-2">
									<label class="col-2 col-md-2">예약 날짜</label><!-- form-control -->
									<select name="date" class="time-select form-select col-12 col-md-7">
									    <option value="" selected="selected">오늘</option>
									    <option value="">1/6</option>
									    <option value="">1/7</option>
									    <option value="">1/8</option>
									</select>
								</div>
								<div class="d-flex flex-wrap my-2">
									<label class="col-2 col-md-2">시간</label>
									<select name="date" class="time-select form-select col-12 col-md-7">
									    <option value="none" selected="selected">== 시간을 선택해 주세요 ==</option>
									    <option value="">09:00</option>
									    <option value="" disabled>10:00</option>
									    <option value="">11:00</option>
									    <option value="">12:00</option>
									    <option value="">13:00</option>
									</select>
								</div>
								
							</div>
							<div id="personInfomation"> <!-------------------- 예약자 정보 -------------------->
								<h6>예약자 정보</h6>
								<div class="d-flex flex-wrap my-2">
									<label class="col-2 col-md-2">이름</label>
									<input type="text" value="최준혁" class="time-select form-select col-12 col-md-7">
									<br/>
								</div>
								<div class="d-flex flex-wrap my-2">
									<label class="col-2">전화번호</label>
									<input type="text" value="010-3587-1116" class="time-select form-select col-12 col-md-7">
									<br/>
								</div>
								<div class="d-flex flex-wrap my-2">
									<label class="col-2"></label>
									<select name="table" class="time-select form-select col-12 col-md-7">
									    <option value="none" selected="selected">== 좌석을 선택해 주세요 ==</option>
									    <option value="">2인석</option>
									    <option value="" disabled>2인석</option>
									    <option value="">3인석</option>
									    <option value="">4인석</option>
									    <option value="">4인석</option>
									</select>
									<br/>
								</div>
								<div class="d-flex flex-wrap my-2">
									<label class="col-2">요청사항</label>
									<input type="text" class="time-select form-control col-12 col-md-7" name="request">
								</div>	
								<form id="booking" class="mt-5">
									<input type="submit" class="btn btn-primary btn-lg col-9" value="Booking">
								</form>
										
							</div>
						</div>
					</div>
				</section>
				</div>
			</div>
	    </div>
	</div>






<!-- ----------------------------------------------------------------------- -->
<!-- 	<div class="card shadow-lg w-70 mb-5 mx-8 border-0 p-4">
		<div class="row g-5">
			<div class="col-md-7 col-lg-8">
				<section class="pb-3 pt-0 " id="reserve">
					<div class="row align-items-center">
						<div class="container-lg">
							<div id='timeSelect' class="py-1">
								<h6>예약일</h6>
								<label class="col-2">예약 날짜</label>form-control
								<select name="date" class="col-7">
								    <option value="" selected="selected">오늘</option>
								    <option value="">1/6</option>
								    <option value="">1/7</option>
								    <option value="">1/8</option>
								</select>
								<br/>
								<label class="col-2">시간</label>
								<select name="date" class="col-7">
								    <option value="none" selected="selected">==시간을 선택해 주세요==</option>
								    <option value="">09:00</option>
								    <option value="" disabled>10:00</option>
								    <option value="">11:00</option>
								    <option value="">12:00</option>
								    <option value="">13:00</option>
								</select>
							</div>
							<div id="personInfomation">
								<h6>예약자 정보</h6>
								<label class="col-2">이름</label>
								<input type="text" value="최준혁" class="col-7">
								<br/>
								<label class="col-2">전화번호</label>
								<input type="text" value="010-3587-1116" class="col-7">
								<br/>
								<label class="col-2"></label>
								<select name="table" class="col-7">
								    <option value="none" selected="selected">==좌석을 선택해 주세요==</option>
								    <option value="">2인석</option>
								    <option value="" disabled>2인석</option>
								    <option value="">4인석</option>
								    <option value="">4인석</option>
								    <option value="">4인석</option>
								</select>
								<br/>
								<label class="col-2">요청사항</label>
								<input type="text" class="col-7" name="request">		
							</div>
							<form id="booking">
								<input type="submit" class="btn btn-primary btn-lg col-9" value="Booking">
							</form>
						</div>
					</div>
				</section>
			</div>
	    </div>
	</div>
 -->
<%@include file="../footer.jsp" %>
</body>
</html>