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
<style>
body {
	background: #fafafa url(https://jackrugile.com/images/misc/noise-diagonal.png);
	color: #444;
	font: 100%/30px 'Helvetica Neue', helvetica, arial, sans-serif;
	text-shadow: 0 1px 0 #fff;
}

strong {
	font-weight: bold; 
}

em {
	font-style: italic; 
}

table {
	background: #f5f5f5;
	border-collapse: separate;
	box-shadow: inset 0 1px 0 #fff;
	font-size: 12px;
	line-height: 24px;
	margin: 30px auto;
	text-align: left;
	width: 800px;
}	

th {
	background: url(https://jackrugile.com/images/misc/noise-diagonal.png), linear-gradient(#777, #444);
	border-left: 1px solid #555;
	border-right: 1px solid #777;
	border-top: 1px solid #555;
	border-bottom: 1px solid #333;
	box-shadow: inset 0 1px 0 #999;
	color: #fff;
  font-weight: bold;
	padding: 10px 15px;
	position: relative;
	text-shadow: 0 1px 0 #000;	
}

th:after {
	background: linear-gradient(rgba(255,255,255,0), rgba(255,255,255,.08));
	content: '';
	display: block;
	height: 25%;
	left: 0;
	margin: 1px 0 0 0;
	position: absolute;
	top: 25%;
	width: 100%;
}

th:first-child {
	border-left: 1px solid #777;	
	box-shadow: inset 1px 1px 0 #999;
}

th:last-child {
	box-shadow: inset -1px 1px 0 #999;
}

td {
	border-right: 1px solid #fff;
	border-left: 1px solid #e8e8e8;
	border-top: 1px solid #fff;
	border-bottom: 1px solid #e8e8e8;
	padding: 10px 15px;
	position: relative;
	transition: all 300ms;
}

td:first-child {
	box-shadow: inset 1px 0 0 #fff;
}	

td:last-child {
	border-right: 1px solid #e8e8e8;
	box-shadow: inset -1px 0 0 #fff;
}	

tr {
	background: url(https://jackrugile.com/images/misc/noise-diagonal.png);	
}

tr:nth-child(odd) td {
	background: #f1f1f1 url(https://jackrugile.com/images/misc/noise-diagonal.png);	
}

tr:last-of-type td {
	box-shadow: inset 0 -1px 0 #fff; 
}

tr:last-of-type td:first-child {
	box-shadow: inset 1px -1px 0 #fff;
}	

tr:last-of-type td:last-child {
	box-shadow: inset -1px -1px 0 #fff;
}	

/* tbody:hover td {
	color: transparent;
	text-shadow: 0 0 3px #aaa;
} 
	tbody:hover tr:hover td {
	color: #444;
	text-shadow: 0 1px 0 #fff;
} */
</style>

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
					<c:if test="${sessionScope.grade eq 'master'}">
						<input type="text" class="form-control" placeholder="카페 이름이나 id를 입력하세요" name="findStr">
					</c:if>
					<c:if test="${sessionScope.grade eq 'cafehost' }">
						<input type="text" class="form-control" placeholder="카페 이름을 입력하세요" name="findStr">
					</c:if>
				    <div class="input-group-append">	
				    	<button class="btn btn-secondary" type="submit">
				     		<i class="fa fa-search"></i>
						</button>
			 		</div>
				</div>
			 </form>
			<div class="row align-items-center">
				<!----------------------- 예약리스트 ------------------------------------------>
				<table>
				  <thead>
				    <tr>
				      <th>No.</th>
				      <c:if test="${sessionScope.grade eq 'master' }">
				     	 <th>카페명</th>
				      </c:if>
				      <th>예약자</th>
				      <th>phone</th>
				      <th>결제금액</th>
				      <th>결제번호</th>
				      <th>예약 시간</th>
				      <th> 예약 날짜</th>
				      <th>예약 상태</th>
				      <c:if test="${param.status == past }">
				      <th>취소</th>
				      </c:if>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach var="vo" items="${list }" varStatus="status">
				    <tr>
				      <td>${vo.reserve_id }</td>
				      <c:if test="${sessionScope.grade eq 'master' }">
				      	<td>${vo.cname }</td>
				      </c:if>
				      <td>${vo.reserve_name }</td>
				      <td>${vo.phone }</td>
				      <td id="payment${status.count }" value="${vo.payment_price }" name="payment${status.count }">${vo.payment_price }</td>
				      <td id="uuid${status.count }" value="${vo.uuid }" name="uuid${status.count }">${vo.uuid }</td>
				      <td>${vo.time }</td>
				      <td>${vo.rdate }</td>
				      <td>
				      <c:if test="${vo.isCancelled eq 1 }">취소됨</c:if>
				      <c:if test="${vo.isCancelled != 1 }"></c:if>
				      </td>
				      <td>
				      	<c:if test="${param.status == past }">
							<button onclick="cancelPay(${status.count})" href="/delClick?nowDate=<%=nowDate %>&id=${sessionScope.member_id}&rid=${vo.reserve_id }" class="" >취소</button>
						</c:if>
					  </td>
				    </tr>
				  	</c:forEach>
				  </tbody>
				</table>
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