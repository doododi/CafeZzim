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
</head>
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

<body>
<%@include file="../header.jsp" %>

<!-- ----------------------------------------------------------------------- -->
<section class="pt-8 pb-4" id="kind">
	<div class="container">
		<h3 class="mypage-title mb-4 d-flex justify-content-between">My page</h3>
		<div class="d-flex justify-content-end mb-1 border-0 text-center col-2 col-xs-4">
			<a href="cupon" class="form-control">내 스탬프</a>
		</div>
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

<section class="py-3" id="location">
	<div class="container-lg">
	<!----------------------- 지난 예약 보기 버튼  ------------------------------------------>
		<div class="input-group my-3">
			<c:if test="${param.status == past }">
				<a href="/mypagePastBookingList?status=past&nowDate=<%=nowDate %>"<%-- &id=${sessionScope.member_id}" --%> class="form-control text-center bgBrownLighten1 mb-5">지난 예약 보기</a>
			</c:if>
			<c:if test="${param.status != past }">
				<a href="/mypageBookingList?nowDate=<%=nowDate %>"<%-- &id=${sessionScope.member_id}" --%> class="form-control text-center bgBrownLighten1 mb-5">유효 예약 보기</a>
			</c:if>
		</div>
		<c:if test="${empty list }">
			<div class="my-8 text-center" >
				<h1> 예약내역이 없습니다</h1>
			</div>
		</c:if>
		<c:if test="${!empty list }">
			<!----------------------- hidden 정보 저장  ------------------------------------------>
			<form action="bookingListSearch" name="frm_bookingListSearch">
			<div class="input-group my-1" hidden="hidden"><!-- hidden="hidden" -->
				<input type="text" value="${sessionScope.member_id }" name="mid" id="mid">
				<input type="text" value="${sessionScope.grade }" name="member_grade" id="member_grade">
				<input type="text" value="<%=nowDate  %>" name="nowDate" id="nowDate">
				<input  type="text" id="uuid" name="uuid" value="">
			</div>
	<!----------------------- 검색창 ------------------------------------------>
				<div class="input-group my-3">
					<input type="text" class="form-control" placeholder="카페 이름을 입력하세요" name="findStr">
				    <div class="input-group-append">	
				    	<button class="btn btn-secondary" type="submit">
				     		<i class="fa fa-search"></i>
						</button>
			 		</div>
				</div>
			 </form>
			<div class="row align-items-center">
				<!----------------------- 예약리스트 ------------------------------------------>
				<c:forEach var="vo" items="${list}" varStatus="status">
					<c:if test="${vo.isCancelled==0 }">
						<div class="col-md-6 col-lg-3">
							<a href="reserv_info?id=${vo.reserve_id }" class="location-item card shadow-lg mb-4 border-0">
								<div class="location-img">
									<img src="upload/${vo.img }" class="img-fluid">
								</div>
								<div class="location-desc pt-1 px-4">
									<h4>${vo.cname }</h4>
									<span class="text-muted">${vo.caddress }</span>
									<br/>
									<small class="text-muted">예약일자 ${vo.rdate }</small>
									<br/>
									<small class="text-muted" id="payment${status.count}">결제금액 : ${vo.payment_price }</small>
									<input type="text" id="uuid${status.count }" value="${vo.uuid }" hidden="hidden"><!-- hidden="hidden" -->
								</div>
							</a>
							<c:if test="${param.status == past }">
							<button onclick="cancelPay(${status.count})" href="/delClick?nowDate=<%=nowDate %>&id=${sessionScope.member_id}&rid=${vo.reserve_id }" class="btn mb-4 mt-1" style="float:right" >취소하기</button>
							</c:if>
						</div>
					</c:if>
				</c:forEach>
						<%-- <c:if test="${vo.isCancelled==0 }">
							<a href="/delClick?nowDate=<%=nowDate %>&id=${sessionScope.member_id}&rid=${vo.reserve_id }" class="btn mb-4 mt-1" style="float:right">예약 취소</a>
						</c:if> --%>
				<!----------------------- 취소한 예약 리스트  ------------------------------------------>
				<c:forEach var="vo" items="${list}" varStatus="status">
					<c:if test="${vo.isCancelled==1 }">
						<div class="col-md-6 col-lg-3">
							<a href="reserv_info?id=${vo.reserve_id }" class="location-item card shadow-lg mb-0 border-0">
								<div class="location-img">
									<img src="upload/${vo.img }" class="img-fluid">
								</div>
								<div class="location-desc pt-1 px-4">
									<h4>${vo.cname }</h4>
									<span class="text-muted">${vo.caddress }</span>
									<br/>
									<small class="text-muted">예약일자 ${vo.rdate }</small>
									<br/>
								</div>
							</a>
							<input type="text" class="btn mb-4 mt-1 col-4" style="float:right; background-color:#f03536" value="취소됨">
						</div>
					</c:if>
				</c:forEach>
				</div>
			</c:if>
		</div>
</section>

<%@include file="../footer.jsp" %>
<script>// 예약 취소버튼 동작 
$(function(){
let delClick = {	
	cancel: function(pos){
		document.frmOrder.action = "reserveDel";
		document.frmOrder.submit(pos);
	}
}
})

// 환불 요청 
  function cancelPay(pos) {
	var uuid = document.querySelector('#uuid'+pos).getAttribute('value');
	var payment_price = document.querySelector('#payment'+pos).getAttribute('value');
	
	var frm =  document.frm_bookingListSearch;
	frm.uuid.value = uuid;
	frm.method = "post";
	
	console.log(uuid);
	frm.action = "/delClick";
	frm.submit(pos);
  }
</script>

</body>
</html>