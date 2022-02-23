<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>${ find } 검색 결과 | CafeZzim</title>
<%@include file="../common.jsp" %>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/ScrollTrigger.min.js"></script>
</head>


<body>

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	
		<%@include file="../header.jsp" %>
		
		<section class="py-0" id="searchMain">
			<div class="bg-holder"
				style="background-color:#f7f7f7;">
			</div>
			<div class="container-sm position-relative">
				<div class="row flex-center pt-6 pb-3">
					
					<!-- 카페 검색 form 부분 -->
					<div class="col-lg-10 col-xl-6">
						<form name="frm_search" action="search" method="post">
							<div class="cafe-find-wrap">
								<!-- 위치 혹은 카페명으로 검색 -->
								<div class="cafe-search-txt">
									<label>위치 혹은 카페명</label>
									<input type="text" name="findStr" id="searchInput" placeholder="가고싶은 카페를 저희에게 알려주세요" value="${find }" required>
								</div>
								<!-- 카페 예약 날짜 검색 -->
								<div class="cafe-search-date">
									<label>예약 날짜</label>
									<input type="text" name="date" id="datePicker" value="${date}" placeholder="날짜를 알려주세요">
								</div>
								<div class="cafe-search-btn text-center">
									<button type="submit" class="btn btn-lg btn-primary rounded-pill hover-top"><i class="fas fa-search"></i> 검색</button>
								</div>
							</div>
							<input type="hidden" name="sortBy" value="">
							<input type="hidden" name="centerLat" value="">
							<input type="hidden" name="centerLng" value="">
						</form>
					</div>
				</div>
				
			</div>
		</section>
		
		<section class="py-5" id="srchResult">
			<div class="container-sm position-relative">
				
				<h2>${ find } 검색 결과</h2>
				<p>${ find } 카페 ${fn:length(list) }개가 검색되었습니다.</p>
				
				<div class="row justify-content-between mb-3">
					<div class="col-6 col-md-3">
						<select class="form-select mb-3" aria-label=".form-select example" id="sort-choose">
	            <option selected>정렬기준</option>
	            <option value="recommend">추천 순</option>
	            <option value="rating">평점 높은 순</option>
	            <option value="like">후기 많은 순</option>
	            <option value="distance">거리 순</option>
	          </select>
					</div>
					
					<div class="col-6 col-md-3">
						<div class="text-right">
							<a href="map?findStr=${find }&date=${date}" class="btn btn-lg btn-light rounded-pill">
								<i class="fas fa-map-marker-alt"></i>
		          	<span class="fz-13">지도에서 보기</span>
		          </a>
		        </div>
					</div>
					
				</div>
				<!-- //end row -->
				
				<div class="srchResults row">
					<c:forEach var="vo" items="${list}">
						<c:choose>
							<c:when test="${vo.cond ne '휴무' }">
							<div class="srchResult-item col-xl-6" data-lat="${vo.lat }" data-lng="${vo.lng }">
								<a href="view?id=${vo.cid}&date=${date}" class="search-item card shadow-lg mb-4 border-0">
										<div class="d-flex">
											<div class="search-item-img">
												<div class="img-wrap">
													<img src="upload/${vo.thumb }" class="img-fluid" alt="서울,경기">
												</div>
											</div>
											<div class="search-item-desc py-3 px-3">
												<p class="fw-medium fz-14">${vo.name}</p>
												<p class="fz-13">${vo.address } <br/> ${vo.distance * 1000}m</p>
												<p class="fz-12"><i class="fas fa-star"></i> ${vo.rating } (${vo.rcnt})</p>
											</div>
										</div>
										
									</a>
							</div>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:forEach var="vo2" items="${list}">
						<c:choose>
							<c:when test="${vo2.cond eq '휴무' }">
							<div class="srchResult-item col-xl-6" data-lat="${vo2.lat }" data-lng="${vo2.lng }">
								<div class="search-item card shadow-lg mb-4 border-0">
									<div class="d-flex">
										<div class="search-item-img">
											<div class="img-wrap">
												<img src="upload/${vo2.thumb }" class="img-fluid" alt="서울,경기">
											</div>
										</div>
										<div class="search-item-desc py-3 px-3">
											<p class="fw-medium fz-14">${vo2.name}</p>
											<p class="fz-13">${vo2.address } <br/> ${vo2.distance * 1000}m</p>
											<p class="fz-12"><i class="fas fa-star"></i> ${vo2.rating } (${vo2.rcnt})</p>
										</div>
									</div>
										
								</div>
							</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
				
			</div>
			<!-- //end container -->
		</section>



<%@include file="../footer.jsp" %>
<script type="text/javascript" src="js/search.js"></script>
</body>
</html>