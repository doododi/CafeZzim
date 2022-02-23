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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="js/sale.js"></script>
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
		<h3 class="title mb-3">메출 현황(전체 합산)</h3>
	</div>
</section>
		<section class="py-3">
			<div class="container">
				<div class="row flex-center">
					<div class="col-12">
					
					<div>
						<!--차트가 그려질 부분-->
						<canvas id="myChart"></canvas>
					</div>
	<!----------------------- 월별 조회 ------------------------------------------>
						<div class="mt-6"></div>
						<hr/>
							<h3 class="">월별 매출 조회</h3>
						<form class="d-flex flex-row-reverse mb-3" id="frm_select" name="frm_select" method="post">
						<div class="row select-year" id="select-year">
							<div class="col-md-3 mt-4">
								<input type="text" class="form-control" style="height:100%" 
								value="${param.sale_year }-${param.sale_month }">
							</div>
							<div class="col-md-3">
								<label>년도</label>
								<select name="sale_year" id="sale_year"
									class="form-select select-year">
									<option selected value="${param.sale_year }"></option>
							 		<option value="2022">2022</option>
							 		<option value="2021">2021</option>
									<option value="2020">2020</option>
									<option value="2019">2019</option>
								</select>
							</div>
							<div class="select-time col-md-3">
								<label>월</label>
								<select name="sale_month" id="sale_month"
									class="form-select select-month">
									<option selected value="${param.sale_month }"></option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>
							</div>
							<div class="col-md-2 mt-4">
								<input class="btn btn-primary btn-xs btn-block" style="height:100%; width:100%"
										type="button" id="btnYear" value="조회">
							</div>
						</div><!-- row end -->
						</form>
						
						<div class="card-body">
					  <div class="table-responsive">
					   <table class="table table-bordered" id="dataTable">
					    <thead>
					     <tr>
				        <th>순위</th>
				        <th>카페 이름</th> 
				        <th>매출</th>
				       </tr>
				      </thead>
				      <c:forEach var="vo" items="${list }" varStatus="status">
					     <tr>
				        <th>${status.count}</th>
				        <th>${vo.cafe_name}</th>
				        <th>${vo.sales}</th>
				       </tr>
				      </c:forEach>
				      <!-- <tbody></tbody> -->
					   </table>
					 </div>
					</div>
					
					</div>
				</div>
			</div><!-- //container -->
		</section>

<%@include file="../footer.jsp" %>
</body>
</html>