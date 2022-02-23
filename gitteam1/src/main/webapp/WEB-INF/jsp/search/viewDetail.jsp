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
<title>${vo.name} | CafeZzim</title>
<%@include file="../common.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/ScrollTrigger.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=tb2yhf2pw8"></script>
</head>


<body>

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	
		<%@include file="../header.jsp" %>
		
		<section id="slider" class="pt-6 pb-4">
			
				<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
				  <div class="carousel-indicators d-flex flex-center">
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				    <c:forEach var="photo" items="${vo.photos}" varStatus="status">
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.count}" aria-label="${status.count+1}"></button>
				    </c:forEach>
				  </div>
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <div>
								<img src="upload/${vo.thumb }" class="img-fluid">
							</div>
				    </div>
				    <c:forEach var="photo" items="${vo.photos}" varStatus="status">
				    <div class="carousel-item">
				      <div>
								<img src="upload/${photo }" class="img-fluid">
							</div>
				    </div>
				    </c:forEach>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div><!-- //슬라이드 부분 끝 -->
				
			
		</section>

		<section id="viewTitle" class="py-0">
			<div class="container">

				<p class="display-5">${vo.name}</p>
				<p class="">${vo.address }</p>
				<p class=""><i class="fas fa-star"></i>${vo.rating } (${fn:length(review) })</p>

				<div class="d-flex">
					<div class="col-5">
						<a href="order?id=${vo.cid}&date=${date}" class="btn btn-lg btn-light w-100 mx-0 mb-2">자리 찜하기</a>
						
						<!-- <button type="button"
							class="btn btn-lg btn-primary w-100 mx-0 mb-2">예약하기</button> -->
					</div>
					<div class="col-5">
						<a href="order?id=${vo.cid}&date=${date }&pay=1" class="btn btn-lg btn-primary w-100 mx-0 mb-2">결제하기</a>
					</div>
					<div class="col-2">
						<input type="hidden" id="mid" value="${sessionScope.member_id }">
						<input type="hidden" id="cid" value="${vo.cid }">
						<button type="button" class="btn w-100 mx-0 mb-2" id="btnToggleZzim">
							<i class="${className} fa-heart text-danger" id="btnToggleHeart"></i>
						</button>
					</div>
				</div>

			</div>
		</section>
		
		<section id="target">
			<div class="container">
				<div class="main-tool-bar-wrap">
					<div class="main-tool-bar">
						<ul class="nav nav-pills d-flex">
			        <li class="nav-item"><a href="#info" class="nav-link active" aria-current="page">카페 정보</a></li>
			        <li class="nav-item"><a href="#menu" class="nav-link">메뉴 보기</a></li>
			        <li class="nav-item"><a href="#review" class="nav-link">리뷰 보기</a></li>
			      </ul>
					</div>
				
				</div>


			<div id="viewDetailContent">
				<div id="info" class="panel-item py-5">
					<div>${vo.detail }</div>
					<div id="map" class="mt-4"
						style="border: 0; width: 100%; height: 320px;"></div>
					<form name="frm_location">
						<input type="hidden" name="cname" value="${vo.name }">
						<input type="hidden" name="lat" value="${vo.lat }">
						<input type="hidden" name="lng" value="${vo.lng }">
					</form>
					<script>
					var mapname = document.frm_location.cname.value;
					var maplat = document.frm_location.lat.value;
					var maplng = document.frm_location.lng.value;
					var HOME_PATH = window.HOME_PATH || '.';
	
					var cityhall = new naver.maps.LatLng(maplat, maplng),
					    map = new naver.maps.Map('map', {
					        center: cityhall.destinationPoint(0, 0),
					        zoom: 18
					    }),
					    marker = new naver.maps.Marker({
					        map: map,
					        position: cityhall
					    });
	
					var contentString = [
					        '<div style="width:200px;padding:10px;">',
					        '	<p>',mapname,
					        '',
					        '',
					        '',
					        '',
					        '	</p>',
					        '</div>'
					    ].join('');
	
					var infowindow = new naver.maps.InfoWindow({
					    content: contentString
					});
	
					naver.maps.Event.addListener(marker, "click", function(e) {
					    if (infowindow.getMap()) {
					        infowindow.close();
					    } else {
					        infowindow.open(map, marker);
					    }
					});
	
					infowindow.open(map, marker);
					</script>
				</div>
				<div id="menu" class="panel-item py-5">
				
					<h3>음료 메뉴</h3>
					<c:forEach var="m" items="${menu}" varStatus="status">
					<c:if test="${m.type eq 2}">
					<div class="mb-3 form-check">
						<%-- <input type="checkbox" class="form-check-input" id="drink${status.count}" value="${m.name }"> --%>
						<label class="form-check-label" for="drink${status.count}">${m.name }</label>
						<span>${m.price } <i class="fas fa-won-sign"></i></span>
					</div>
					</c:if>
					</c:forEach>
					<h3>메인 메뉴</h3>
					<c:forEach var="m" items="${menu}" varStatus="status">
					<c:if test="${m.type eq 1}">
					<div class="mb-3 form-check">
						<%-- <input type="checkbox" class="form-check-input" id="dessert${status.count}" value="${m.name }"> --%>
						<label class="form-check-label" for="dessert${status.count}">${m.name }</label>
						<span>${m.price } <i class="fas fa-won-sign"></i></span>
					</div>
					</c:if>
					</c:forEach>
				</div>

				<div id="review" class="panel-item py-5">
					<p class="display-6">총점 ${vo.rating }</p>
					
					<c:forEach var="rv" items="${review}">
					<!-- review 시작 -->
					<div class="row">
						<div class="col-2">
							<img src="upload/${rv.photo }" class="img-fluid">
						</div>
						<div class="col-10">
							<div class="row">
								<div class="col-8">
									<img src="img/gallery/profile-none.png"
										class="img-fluid img-profile "> ${rv.mid }
								</div>
								<div class="col-4">
									<p class="">
										<i class="fas fa-star"></i> ${rv.score }
									</p>
								</div>
							</div>
							<p>${rv.content}</p>
						</div>
					</div>
					<!-- //review 끝 -->
					</c:forEach>
					

				</div>
			</div>


		</div><!-- //container -->
      
		</section>


<%@include file="../footer.jsp" %>
<script src="js/view.js"></script>

</body>
</html>