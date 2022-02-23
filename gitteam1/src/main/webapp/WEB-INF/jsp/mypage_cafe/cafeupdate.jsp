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
<title>카페정보 수정</title>
<%@include file="../common.jsp"%>
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
<section class="pt-8 pb-4" id="kind">
	<div class="container">
		<h3 class="mypage-title mb-4">My page</h3>
		<!---------------------- 마이페이지 메뉴바 ------------------------------------------>
		<div class="d-flex justify-content-between mb-1 border-0 text-center">			
			<c:if test="${sessionScope.grade eq 'master' }">
				<a href="mypage_admin" class="form-control bgBrownLighten1 mb-5">회원 정보 관리</a>
			</c:if>
			<c:if test="${sessionScope.grade eq 'cafehost' }">
				<a href="mypage_member" class="form-control bgBrownLighten1 mb-5">회원 정보 관리</a>
			</c:if>
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
	
	<!-------------------------------------------    사진관리 부분   -------------------------------------------->
	<section class="pt-1 pb-1 ml-5">
		<div class="container">
			<h3>카페 사진 관리</h3>	<br/>		
			<!------ 메인(타이틀)사진 수정 ------>			
			<div class="col-md-6 col-lg-6">
				<div class="location-item card shadow-lg mb-4 border-0" style="height: 250px">
					<div class="location-img">
						<img src="upload/${vo.title_photo }" name="title_photo" class="img-fluid">
					</div>
					<form name='frm_titleupload' id='frm_titleupload' method='post'>			
						<div class="location-desc pt-1 px-3" style="height: 100px">
						<input type="file" name="title_photo" class="form-control">
						<input type="hidden" name="cafe_id" value="${vo.cafe_id}">
						<input type="hidden" name="pre_title" value="${vo.title_photo }">
						<button type="button" id="btnTitlephoto" class="btn btn-link">메인사진 수정</button>	
						</div>
					</form>	
				</div>
			</div>				
			<!------ 기타사진 삭제 및 추가 ------->			
			<div class="row align-items-center"><br/>
				<c:if test="${not empty vo.otherphotos }">
					<c:forEach var='photo' items='${vo.otherphotos }'>
						<div class="col-md-6 col-lg-3">
							<div class="location-item card shadow-lg mb-4 border-0" style="height: 200px">
								<div class="location-img">
									<img src="upload/${photo.photo_name }" class="img-fluid">
								</div>
								<div class="location-desc pt-1 px-3" style="height: 50px">
								<a href="${path }/deleteOtherphoto?photo_name=${photo.photo_name }&cafe_id=${vo.cafe_id}">	
									<button type="button" class="btn btn-link">삭제</button></a>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<button type="button" id="plus-photo" class="btn btn-outline-primary" onclick="show_fileupload()">기타사진 추가</button><br/><br/>			
			<form name='frm_upload' id='frm_upload' method='post'>
				<div class="imageadd" id="imageadd" style="display: none">
	       			<input type="file" name="photo_name" class="form-control" multiple='multiple'>
					<input type="hidden" name="cafe_id" value="${vo.cafe_id}"><br />
					<button type="button" id="btnOtherphoto" class="btn btn btn-primary">사진 업로드</button>
				</div>
			</form><br />
		</div>
	</section>
	
	<!------------------------------- 수정 버튼 클릭시 보내는 form   ------------------------------------------>
	<form name='frm_cafe' id='frm_cafe' method='POST'> 
	<section id="viewTitle" class="py-0">
		<div class="container">
			<!--  영업일관리 버튼 -->
			<div class="btnOffday">
				<h3>영업일 관리</h3>
				<a href="${path }/dayOff?cafe_id=${vo.cafe_id }" class="btn btn-link btn-lg" style="padding:2px; font-size:19px">클릭해서 관리페이지로 이동
				<i class="far fa-calendar-alt" style="color: #0000FF"></i></a><br /><br/>
			</div>
			<!-------------------   카페기본정보(cafe_info부분)   ------------------->
			<h3>카페 기본정보 수정</h3>
			<label for="formGroupExampleInput" class="form-label">카페이름</label> 
			<input type="text" class="form-control" name="cafe_name" value="${vo.cafe_name }"> <br /> 
			<label for="formGroupExampleInput2" class="form-label">카페주소</label> 
			<input type="text" class="form-control" name="cafe_address" value="${vo.cafe_address }"> <br />
			<label for="formGroupExampleInput2" class="form-label">카페 상세정보</label>
			<textarea name="cafe_detail" class="form-control" aria-label="With textarea" style="height: 150px">${vo.cafe_detail }</textarea><br />
			<label for="formGroupExampleInput2" class="form-label">카페 예약가능 총 좌석수</label>
			<div class="row g-2">
				<div class="col-md">
					<div class="form-floating">
						<select class="form-select" name="avail_4seats" id="floatingSelectGrid" aria-label="Floating label select example">
							<option selected value="${vo.avail_4seats }">${vo.avail_4seats }석</option>
							<option value="0">0석</option>
							<option value="1">1석</option>
							<option value="2">2석</option>
							<option value="3">3석</option>
							<option value="4">4석</option>
							<option value="5">5석</option>
						</select> 
						<label for="floatingSelectGrid">4인 테이블석(3~4인 이용가능)</label>
					</div>
				</div>
				<div class="col-md">
					<div class="form-floating">
						<select class="form-select" name="avail_2seats"	id="floatingSelectGrid" aria-label="Floating label select example">
							<option selected value="${vo.avail_2seats }">${vo.avail_2seats }석</option>
							<option value="0">0석</option>
							<option value="1">1석</option>
							<option value="2">2석</option>
							<option value="3">3석</option>
							<option value="4">4석</option>
							<option value="5">5석</option>
						</select> 
						<label for="floatingSelectGrid">2인 테이블석(1~2인 이용가능)</label>
					</div>
				</div>
			</div><br /><br />
			<input type="hidden" name="cafe_id" value='${vo.cafe_id }'>	
		<!-----   카페검색키워드 수정(수정버튼클릭시 같이 수정)   ---->			
		<h3>검색 키워드 관리</h3>
		<div class="row">
			<c:if test="${not empty vo.cafesearch }">
				<c:forEach var='name' items='${vo.cafesearch }'>
					<div class="col">
						<input type="text" class="form-control" name="search_name" value="${name.search_name }">
					</div>
				</c:forEach>
			</c:if>
		</div>	
	</div>
	</section>
	</form>
	
	<!-----------------------------   카페메뉴 수정   ------------------------------------------>
	<section id="target" class="py-5">
		<div class="container">
			<div id="menu" class="panel-item py-0">
				<h3>음료 메뉴 수정</h3>
				<c:if test="${not empty vo.menu}">
					<c:forEach var='menu' items='${vo.menu }'>
						<c:if test='${menu.menu_type == 2 }'>
							<div class="mb-3">
								<input type="text" class="menuname" value="${menu.menu_name}">
								<input type="text" class="menuprice" value="${menu.menu_price}">
								<input type="hidden" name="menu_id" value="${menu.menu_id }">
								<a href="${path }/deleteMenu?menu_id=${menu.menu_id }&cafe_id=${vo.cafe_id}">
								<button type="button" class="btn btn-link">삭제</button></a>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
				<button type="button" id="plus-drink" class="btn btn-outline-primary btn-sm" onclick="show_drinkadd()">음료메뉴 추가</button>				
				<!-- 메뉴insert위한 폼 -->
				<form id="frm_addDrink" name="frm_addDrink" method='post'> 
					<div class="mb-3" id="drinkadd" style="display: none">
						<input type="hidden" name="cafe_id" value="${vo.cafe_id}">
						<input type="text" name="menu_name" class="menuid2" placeholder="새 메뉴 입력">
						<input type="text" name="menu_price" class="menuid1" placeholder="가격 입력">
						<input type="hidden" name="menu_type" value="2"><br/><br/>			
						<button type="button" id="btnDrink" class="btn btn btn-primary">새 음료메뉴 입력</button>					
					</div>
				</form><br /> <br />
					<h3>메인 메뉴 수정</h3>
					<c:if test="${not empty vo.menu}">
						<c:forEach var='menu' items='${vo.menu }'>
							<c:if test='${menu.menu_type == 1 }'>
								<div class="mb-3">
									<input type="text" class="menuname" value="${menu.menu_name}">
									<input type="text" class="menuprice" value="${menu.menu_price}">
									<a href="${path }/deleteMenu?menu_id=${menu.menu_id }&cafe_id=${vo.cafe_id}">
									<button type="button" class="btn btn-link">삭제</button></a>
								</div>
							</c:if>
						</c:forEach>
					</c:if>			
					<button type="button" id="plus-food" class="btn btn-outline-primary btn-sm" onclick="show_foodadd()">메인메뉴 추가</button>								
					<!-- 메뉴insert위한 폼 -->		
					<form id="frm_addFood" name="frm_addFood" method='post'> 
						<div class="mb-3" id="foodadd" style="display: none">
							<input type="text" name="menu_name" class="menuid4" placeholder="새 메뉴입력"> 
							<input type="text" name="menu_price" class="menuid1" placeholder="새 가격입력">
							<input type="hidden" name="menu_type" value="1"><br/><br/>		
							<input type="hidden" name="cafe_id" value="${vo.cafe_id}">
							<button type="button" id="btnFood" class="btn btn-outline-primary btn-sm">새 메인메뉴 입력</button>						
						</div>
					</form>
			</div><br />
			<!---------------------------------- 카페정보수정 버튼 --------------------------------------------->
			<div class="row">
				<button type="button" id='btnSave' class="btn btn-lg btn-primary mx-0 mb-2">카페 수정 정보 저장</button>
			</div>
		</div><!-- //container -->
	</section>
	<!---------footer -------->
	<%@include file="../footer.jsp"%>
</body>
</html>