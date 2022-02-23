<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%//오늘 날짜 구하기 
String nowDate = request.getParameter("nowDate");
Date tempNowDate = new Date(); 
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
//원하는 데이터 포맷 지정 
nowDate = simpleDateFormat.format(tempNowDate); 
%>
<script>//날짜 구하기 
var date = new Date();
const today = (date)=>{
let formatted_date = date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear()
 return formatted_date;
}
</script>

<title>테이블 예약 화면</title>
<%@include file="../common.jsp" %>
</head>


<body>
<%@include file="../header.jsp" %>

<!-- ----------------------------------------------------------------------- -->
<section class="pt-8 pb-2" id="kind">
	<div class="container">
		<h3 class="mypage-title mb-4">My page</h3>

		<!---------------------- 마이페이지 메뉴바 ------------------------------------------>
		<div class="row px-3 text-center">
			<c:if test="${sessionScope.grade eq 'master' }">
				<div class="col-4 px-0">
				<a href="mypage_admin" class="form-control fz-12">회원 정보 관리</a>
				</div>
			</c:if>
			<c:if test="${sessionScope.grade eq 'cafehost' || sessionScope.grade eq 'customer' }">
				<div class="col-4 px-0">			
					<a href="mypage_member" class="form-control fz-12"><i class="fas fa-users-cog"></i><br>회원 정보 관리</a>
				</div>
			</c:if>
			<div class="col-4 px-0">
				<a href="mypageBookingList?nowDate=<%=nowDate %>" class="form-control btn-primary fz-12"><i class="far fa-calendar-check"></i><br>예약 관리</a>
			</div>
			<div class="col-4 px-0">
				<a href="cupon" class="form-control fz-12"><i class="fas fa-stamp"></i><br>내 스탬프</a>
			</div>
			<c:if test="${sessionScope.grade=='master' }">
				<div class="col-4 px-0">
					<a href="cafemanage" class="form-control fz-12">카페 관리</a>
				</div>
			</c:if>
			<c:if test="${sessionScope.grade eq 'cafehost'}">
				<div class="col-4 px-0">
					<a href="${path }/cafeupdate?cafe_id=${sessionScope.cafe_id }" class="form-control fz-12">카페 관리</a>
				</div>
			</c:if>			
		</div>
	</div>
</section>

<section class="py-5">

	<div class="container">
		<h3>상품 및 이용정보</h3>
		<div class="row mb-4">
			<div class="col-8">			
				<p>날짜: ${vo.rdate } ${vo.rtime }</p>
			</div>
			<div class="col-4">
				<c:choose>
					<c:when test="${vo.isCancelled == 1}">
						<p class="text-right"><span class="badge rounded-pill bg-danger">예약 취소</span></p>
					</c:when>
					<c:otherwise>
						<p class="text-right"><span class="badge rounded-pill bg-primary">예약 완료</span></p>	
					</c:otherwise>
				</c:choose>
			</div>
		
		</div>
		<div class="row mb-4">
			<div class="col-4">
				<div class="img-wrap"><img src="upload/${vo.photo }" class="img-fluid"></div>					
			</div>
			<div class="col-8">
				<p class="mb-1">${vo.cname}</p>
				<p class="mb-1">예약번호: ${vo.rid}</p>
				<p class="mb-1">인원수: <c:if test="${vo.r4seats > 0}">4인석 ${vo.r4seats }개</c:if><c:if test="${vo.r2seats > 0}">2인석 ${vo.r4seats }개</c:if></p>
			</div>
			
		
		</div>
		
		<h4>메뉴 정보</h4>
		<ul class="list-group mb-3">
			<c:forEach var="m" items="${menu}">
			<li class="list-group-item d-flex justify-content-between lh-sm">
        <div>
          <h6 class="my-0">${m.name } X ${m.amt }</h6>
          <small class="text-muted"></small>
        </div>
        <span class="text-muted">₩ ${m.price }</span>
      </li>
			</c:forEach>
			<!-- <li class="list-group-item d-flex justify-content-between lh-sm">
        <div>
          <h6 class="my-0">카페모카</h6>
          <small class="text-muted">휘핑크림 많이</small>
        </div>
        <span class="text-muted">₩ 8300</span>
      </li>
     
      <li class="list-group-item d-flex justify-content-between lh-sm">
        <div>
          <h6 class="my-0">아메리카노(ice)</h6>
          <small class="text-muted">얼음적게</small>
        </div>
        <span class="text-muted">₩ 5000</span>
      </li> -->
    </ul>
		<h4>결제 정보</h4>
		<ul class="list-group mb-3">
      
			<li class="list-group-item d-flex justify-content-between">
        <span>결제 완료일</span>
        <span>${vo.pdate}</span>
      </li>
      <li class="list-group-item d-flex justify-content-between">
        <span>결제 방법</span>
        <span>${vo.method }</span>
      </li>
      <li class="list-group-item d-flex justify-content-between">
        <span>결제(예정) 금액</span>
        <strong>₩ ${vo.price}</strong>
      </li>
      
    </ul>
		
		
		<c:choose>
			<c:when test="${vo.isCancelled == 1}">
				<form name="frm_book" method="post">
					<input type="hidden" name="rid" value="${vo.rid}">
					<div class="row">
						<div class="col-12"><a href="mypageBookingList" class="w-100 btn btn-lg btn-light">목록으로 이동</a></div>
					</div>
				</form>
			</c:when>
			<c:otherwise>
				<form name="frm_book" method="post">
					<input type="hidden" name="rid" value="${vo.rid}">
					<div class="row">
						<div class="col-7"><a href="review?rid=${vo.rid }" class="w-100 btn btn-lg btn-primary">후기 남기기</a></div>
						<div class="col-5"><a href="mypageBookingList" class="w-100 btn btn-lg btn-light">목록으로 이동</a></div>
					</div>
				</form>
			</c:otherwise>
		</c:choose>
		
		
		
	</div>

</section>

<%@include file="../footer.jsp" %>
<script type="text/javascript" src="js/review.js"></script>
</body>
</html>