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
<script src='./js/mpcafe.js'></script>

<!-- ===============================================-->
<!--    Document Title-->
<!-- ===============================================-->
<title>마이페이지_카페관리</title>
<%@include file="../common.jsp" %>   
<script
	src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/gsap-latest-beta.min.js"></script>
<script
	src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/ScrollTrigger.min.js"></script>    
</head>


<body>
<!-- ===============================================-->
<!--    Main Content-->
<!-- ===============================================-->
<!--    헤더   -->
<%@include file="../header.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%//오늘 날짜 구하기 
Date tempNowDate = new Date(); 

//원하는 데이터 포맷 지정 
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
String nowDate = simpleDateFormat.format(tempNowDate); 
%>


<!-- 마이페이지 내 메뉴- -->
<section class="pt-8 pb-4" id="kind">
	<div class="container">
		<h3 class="mypage-title mb-4">My page</h3>

<!--------- 마이페이지 메뉴바(어차피 관리자만 접근 가능해서, 따로 조건을 설정하지 않음) -------------------------------->
		<div class="d-flex justify-content-between mb-1 border-0 text-center">			
			<a href="mypage_admin" class="form-control bgBrownLighten1 mb-5">회원 정보 관리</a>	
			<a href="/mypageBookingList?nowDate=<%=nowDate %>&id=${sessionScope.member_id}" class="form-control text-center bgBrownLighten1 mb-5" class="form-control">예약 관리</a>
			<a href="cafemanage" class="form-control btn-primary bgBrownLighten1 mb-5">카페 관리</a>
		</div>
	</div>
</section>
							
<!------------------------------- 카페리스트------------------- -->
	<section id="shadowbox" class="pt-1 pb-1 ml-5">
		<div class="container">	
			
				<!----------------------- 검색창 ------------------------------------------>
				<form name='frm_search' id='frm_search' method='post'>
					<div class="input-group my-3">
					   <input type="text" class="form-control" placeholder="카페ID 또는 카페명 검색" value='${findStr }' name='findStr'>
					   <div class="input-group-append">
					    <button class="btn btn-secondary" type="button" id='btnSearch'>
					     <i class="fa fa-search"></i>
						</button>
					  </div>
					</div>
					<input type='hidden' name='cafe_id'>
				</form>			
				<br/><br/>
			
				<!------------------------ 검색된 예약페이지 ------------------->
			<div class="row align-items-center" id='item'>		
				<c:forEach var='vo' items="${list}">
					<div class="col-md-6 col-lg-3">
						<a href="${path }/cafeupdate?cafe_id=${vo.cafe_id }">
						<div class="location-item card shadow-lg mb-4 border-0" style="height:300px">
							<div class="location-img">
								<img src="upload/${vo.title_photo }" class="img-fluid">
							</div>
							<div class="location-desc pt-1 px-4" style="height: 150px">
								<h4>${vo.cafe_name }</h4>
								<span class="text-muted">${vo.cafe_address }</span>
								<br/>
								<small class="text-muted">카페아이디: ${vo.cafe_id }</small>
							</div>
						</div>	
						</a>
					</div>			
				</c:forEach>
			</div>
		</div>	 
	</section>
<!-- -----------------   footer----------------   -->
<%@include file="../footer.jsp" %>
</body>
</html>