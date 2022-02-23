<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=tb2yhf2pw8"></script>
</head>


<body>
<%
String date = request.getParameter("date");
%>
	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	
		<%@include file="../header.jsp" %>
		
		<section>
			<div class="container-sm position-relative">
				<div class="row">
					<div class="col-12">
						<h2>${ find } 검색 결과</h2>
						<p>${ find } 카페 ${fn:length(list) }개가 검색되었습니다.</p>
					</div>
				</div>
				<!-- //end row -->
			</div>
			<!-- 네이버 지도가 뿌려질 곳 !  -->
			<div id="map" style="width:100%;height:75vh; margin: 0 auto;"></div>
			<form name="frm_search">
				<input type="hidden" name="findStr" id="findStr" value="${find }">
				<input type="hidden" name="date" id="date" value="<%=date %>">
			</form>
		
		</section>


<%@include file="../footer.jsp" %>
<script type="text/javascript" src="../js/map.js"></script>

</body>
</html>