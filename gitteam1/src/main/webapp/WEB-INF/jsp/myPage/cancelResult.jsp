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
		<h3 class="mypage-title mb-4">My page</h3>

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
		<div class="container-sm position-relative mt-50">
			<div class="row flex-center pt-7 text-center" id="message">
				<h3 class="mx-10">${param.cafe_name }예약이 취소 되었습니다.</h3>
		</div>
	</div>
	<div class="container-lg mb-3 mt-3">
		<form action="mypageBookingList" name="frm_bookingListSearch" method="post">
			<div class="input-group my-1" hidden="hidden">
				<!-- hidden="hidden" -->
				<input type="text" value="${sessionScope.member_id }" name="id"
					id="mid"> <input type="text"
					value="${sessionScope.grade }" name="member_grade"
					id="member_grade"> <input type="text"
					value="${vo.nowDate }" name="nowDate" id="nowDate"> <input
					type="text" id="uuid" name="uuid" value="${vo.uuid }">
			</div>
			<!----------------------- 검색창 ------------------------------------------>
			<div class="d-flex text-center">
				<div class="col-6">
					<button type="submit" class="form-control btn-primary" id="btnBookingList">예약내용 확인하기</button>
				</div>
				<div class="col-6">
					<a href="/" class="form-control" id="btnGoHome">다른예약하기</a>
				</div>
				
			</div>
		</form>

	</div>

</section>



<%@include file="../footer.jsp" %>
<script>// 예약 취소버튼 동작 

var btnBookingList = document.getElementById("btnBookingList");

btnBookingList.addEventListener("click", function(){

});

</script>

</body>
</html>