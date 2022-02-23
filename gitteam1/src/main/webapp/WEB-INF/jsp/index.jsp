<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- ===============================================-->
<!--    Document Title-->
<!-- ===============================================-->
<title>카페찜 | CafeZzim</title>
<%@include file="common.jsp" %>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</head>


<body>

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	
		<%@include file="header.jsp" %>
		
		<section class="py-0" id="searchMain">
			<div class="bg-holder"
				style="background-image: url(img/gallery/hero-bg.jpg); background-position: center; background-size: cover;">
			</div>
			<div class="container-sm position-relative">
				<div class="row flex-center pt-8">
					
					<!-- 카페 검색 form 부분 -->
					<div class="col-lg-10 col-xl-6">
						<form name="frm_search" action="search" method="get" class="mb-6">
							<div class="cafe-find-wrap">
								<!-- 위치 혹은 카페명으로 검색 -->
								<div class="cafe-search-txt">
									<label>위치 혹은 카페명</label>
									<input type="text" name="findStr" id="searchInput" placeholder="가고싶은 카페를 저희에게 알려주세요" required>
								</div>
								<!-- 카페 예약 날짜 검색 -->
								<div class="cafe-search-date">
									<label>예약 날짜</label>
									<input type="text" name="date" id="datePicker" placeholder="날짜를 알려주세요">
								</div>
								<div class="cafe-search-btn text-center">
									<button type="submit" class="btn btn-lg btn-primary rounded-pill hover-top"><i class="fas fa-search"></i> 검색</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="row flex-center pb-4">
					<!-- 메인 카피 부분 -->
					<div class="col-md-10 col-lg-6 text-center">
						<div class="mb-3">
							<img src="img/icons/coffee-cup-thin.png" alt="카페 컵 이미지" class="multiply">
						</div>
						<h1 class="mb-4 display-3 fw-bold lh-sm">
							어떤 커피를 마실까?
						</h1>
						<h3 class="mb-4 display-6 fw-bold lh-sm">카페찜에서 검색 해보세요</h3>
						<p class="mt-3 mb-4 fs-1 text-white">
						카페찜은 국내 최다 카페 및 예약 관련 DB를 <br class="d-none d-lg-block" />보유하고 있습니다.</p>
					</div>
				</div>
			</div>
		</section>
		
		<section class="py-0" id="joinnow">
			<div class="bg-holder"
				style="background-image: url(img/illustrations/hero-bg.png); background-position: bottom; background-size: cover;">
			</div>
			<!--/.bg-holder-->

			<div class="container position-relative">
				<div class="row align-items-center pt-8 pb-4">
					<div class="col-md-5 col-lg-6 order-md-1 text-center text-md-end mb-4">
						<img class="img-fluid" src="img/illustrations/mobile_pay.svg" alt="" />
					</div>
					<div class="col-md-7 col-lg-6 text-center text-md-start">
						
						<h1 class="mb-4 display-3 fw-bold lh-sm">
							내 자리를 찜하는 <br class="d-block d-lg-none d-xl-block" />가장 스마트한 방법
						</h1>
						<p class="mt-3 mb-4 fs-1">
							다양한 국내외 여가 상품을 쉽고 빠르게 검색, <br class="d-none d-lg-block" />
							예약할 수 있으며 고객 편의 서비스를 통해 <br class="d-none d-lg-block" />
							안심하고 즐기는 여가 환경을 제공합니다.
						</p>
						<a class="btn btn-lg btn-primary rounded-pill hover-top" href="signUp"
							role="button">가입 하기</a><a class="btn btn-link ps-md-4"
							href="#" role="button"> 카페 찜 이란?</a>
					</div>
				</div>
			</div>
		</section>


		<!-- ============================================-->
		<!-- <section> begin ============================-->
		<section class="py-7">

			<div class="container">
				<div class="row">
					<div class="col-12 mx-auto align-items-center text-center">
						<p class="mb-4">이미 많은 파트너사와 함께 하고 있습니다.</p>
					</div>
				</div>
				<div
					class="row align-items-center justify-content-center justify-content-lg-around">
					<div
						class="col-6 col-sm-4 col-md-4 col-lg-2 px-md-0 mb-5 mb-lg-0 text-center">
						<img src="img/gallery/twosome_logo.svg" alt="투썸플레이스" class="img-fluid" />
					</div>
					<div
						class="col-6 col-sm-4 col-md-4 col-lg-2 px-md-0 mb-5 mb-lg-0 text-center">
						<img src="img/gallery/ediya_logo.jpg" alt="이디야" class="img-fluid" />
					</div>
					<div
						class="col-6 col-sm-4 col-md-4 col-lg-2 px-md-0 mb-5 mb-lg-0 text-center">
						<img src="img/gallery/mega_logo.jpg" alt="메가커피" class="img-fluid" />
					</div>
					<div
						class="col-6 col-sm-4 col-md-4 col-lg-2 px-md-0 mb-5 mb-lg-0 text-center">
						<img src="img/gallery/paik_logo.png" alt="빽다방" class="img-fluid"/>
					</div>
					<div
						class="col-6 col-sm-4 col-md-4 col-lg-2 px-md-0 mb-5 mb-lg-0 text-center">
						<img src="img/gallery/hollys_logo.png" alt="할리스" class="img-fluid"/>
					</div>
				</div>
			</div>
			<!-- end of .container-->

		</section>
		<!-- <section> close ============================-->
		<!-- ============================================-->


		<section class="py-5" id="location">
			<div class="container-lg">
				<div class="row align-items-center">
					<!-- 서울 경기 -->
					<div class="col-md-6 col-lg-3">
						<a href="" class="location-item card shadow-lg mb-4 border-0">
							<div class="location-img">
								<img src="img/gallery/cafe-img01.jpg" class="img-fluid" alt="서울,경기">
							</div>
							<div class="location-desc py-4 px-4">
								<h4>수도권(서울,경기)</h4>
							</div>
						</a>
					</div>
					<!-- 강릉 -->
					<div class="col-md-6 col-lg-3">
						<a href="" class="location-item card shadow-lg mb-4 border-0">
							<div class="location-img">
								<img src="img/gallery/cafe-img02.jpg" class="img-fluid" alt="강릉">
							</div>
							<div class="location-desc py-4 px-4">
								<h4>강릉</h4>
							</div>
						</a>
					</div>
					<!-- 부산 -->
					<div class="col-md-6 col-lg-3">
						<a href="" class="location-item card shadow-lg mb-4 border-0">
							<div class="location-img">
								<img src="img/gallery/cafe-img03.jpg" class="img-fluid" alt="부산">
							</div>
							<div class="location-desc py-4 px-4">
								<h4>부산</h4>
							</div>
						</a>
					</div>
					<!-- 제주도 -->
					<div class="col-md-6 col-lg-3">
						<a href="" class="location-item card shadow-lg mb-4 border-0">
							<div class="location-img">
								<img src="img/gallery/cafe-img04.jpg" class="img-fluid" alt="제주도">
							</div>
							<div class="location-desc py-4 px-4">
								<h4>제주도</h4>
							</div>
						</a>
					</div>
				</div>
			</div>
		</section>

		<section class="py-8" id="testimonial">
			<div class="container-lg">
				<div class="row flex-center">
					<div
						class="col-sm-10 col-md-5 col-lg-5 order-md-0 text-center text-md-start">
						<img class="img-fluid mb-4"
							src="img/illustrations/testimonial.png" alt="" />
					</div>
					<div
						class="col-sm-10 col-md-6 col-lg-6 text-center text-md-start offset-md-1">
						<h6 class="fw-bold fs-4 display-3 lh-sm">
							카페찜에서 예약하신 <br />회원님들의 실제 후기입니다.
						</h6>
						<p class="my-4 pe-xl-5">많은 분들이 사용해보시고 남겨주신 소중한 후기들을 확인 해보세요.</p>
						<div class="carousel slide" id="carouselExampleDark"
							data-bs-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active" data-bs-interval="10000">
									<div class="row h-100">
										<div class="col-12">
											<svg class="bi bi-star-fill"
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="#FFCC00" viewBox="0 0 16 16">
                          <path
													d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                        </svg>
											<svg class="bi bi-star-fill"
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="#FFCC00" viewBox="0 0 16 16">
                          <path
													d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                        </svg>
											<svg class="bi bi-star-fill"
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="#FFCC00" viewBox="0 0 16 16">
                          <path
													d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                        </svg>
											<svg class="bi bi-star-fill"
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="#FFCC00" viewBox="0 0 16 16">
                          <path
													d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                        </svg>
											<svg class="bi bi-star-fill"
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="#FFCC00" viewBox="0 0 16 16">
                          <path
													d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                        </svg>
											<h5 class="my-4 fw-bold lh-sm">와 저만 몰랐나요??</h5>
											<p class="mb-0 text-center text-md-start">친구 추천으로 사이트 알게 되었는데 세상 편해졌네요 ㅎㅎ 여자친구랑 커피한잔 하려고 카페 찾아보다가 평소 가고 싶었던 카페가 검색되길래 봤더니 시간별로 자리까지 예약되서 너무 편하게 이용하고 왔네요 ㅎㅎ 이런 사이트 만들어준 개발자님들 넘 감사해요 적게 일하고 많이 버세요~~</p>
										</div>
										<div class="col-xl-6 pt-4 d-flex d-sm-block flex-center">
											<div class="d-flex align-items-md-center">
												<img class="img-fluid me-4 me-md-3 me-lg-4"
													src="img/gallery/user.png" width="100" alt="" />
												<div class="w-lg-50 my-3">
													<h5 class="mb-0 fw-bold">길태수 님</h5>
													<p class="fw-normal mb-0">작사가</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="carousel-item" data-bs-interval="2000">
									<div class="row h-100">
										<div class="col-12">
											<svg class="bi bi-star-fill"
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="#FFCC00" viewBox="0 0 16 16">
                          <path
													d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                        </svg>
											<svg class="bi bi-star-fill"
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="#FFCC00" viewBox="0 0 16 16">
                          <path
													d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                        </svg>
											<svg class="bi bi-star-fill"
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="#FFCC00" viewBox="0 0 16 16">
                          <path
													d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                        </svg>
											<svg class="bi bi-star-fill"
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="#FFCC00" viewBox="0 0 16 16">
                          <path
													d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                        </svg>
											<svg class="bi bi-star-fill"
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="#FFCC00" viewBox="0 0 16 16">
                          <path
													d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                        </svg>
											<h5 class="my-4 fw-bold lh-sm">카페찜 추천합니다~!!</h5>
											<p class="mb-0 text-center text-md-start">최근에 새로운 공부를 시작해서 카페갈 일이 잦아졌는데 카페 예약이 가능한 사이트가 생겨서 너무 좋았습니다. 거리 순 카페 검색이라던지 카페 내부 사진을 미리 볼 수 있어서 카페를 미리 선택하기가 수월했고 이용후 후기를 남길 수 있고 또 다른 사람의 후기를 통해서 예약팁을 얻어갈 수 있어서 좋네요. 찜기능으로 카페를 여러번 검색하지 않아도 되서 편리했고 여러군데의 카페를 이용해도 10번 이용 시 할인이 된다는 점도 맘에 들었습니다! 앞으로도 자주 애용할게요~!!</p>
										</div>
										<div class="col-xl-6 pt-4 d-flex d-sm-block flex-center">
											<div class="d-flex align-items-md-center">
												<img class="img-fluid me-4 me-md-3 me-lg-4"
													src="img/gallery/user-1.png" width="100" alt="" />
												<div class="w-lg-50 my-3">
													<h5 class="mb-0 fw-bold">박수혜</h5>
													<p class="fw-normal mb-0">웹 개발자</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="carousel-item">
									<div class="row h-100">
										<div class="col-12">
											<svg class="bi bi-star-fill"
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="#FFCC00" viewBox="0 0 16 16">
                          <path
													d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                        </svg>
											<svg class="bi bi-star-fill"
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="#FFCC00" viewBox="0 0 16 16">
                          <path
													d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                        </svg>
											<svg class="bi bi-star-fill"
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="#FFCC00" viewBox="0 0 16 16">
                          <path
													d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                        </svg>
											<svg class="bi bi-star-fill"
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="#FFCC00" viewBox="0 0 16 16">
                          <path
													d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                        </svg>
											<svg class="bi bi-star-fill"
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="#FFCC00" viewBox="0 0 16 16">
                          <path
													d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                        </svg>
											<h5 class="my-4 fw-bold lh-sm">User friendly &amp;
												Customizable</h5>
											<p class="mb-0 text-center text-md-start">Bring to the
												table win-win survival strategies to ensure proactive
												domination. At the end of the day, going forward, a new
												normal that has evolved from generation X is on the runway
												heading towards a streamlined cloud solution. User generated
												content in real-time will have multiple touchpoints for
												offshoring.</p>
										</div>
										<div class="col-xl-6 pt-4 d-flex d-sm-block flex-center">
											<div class="d-flex align-items-md-center">
												<img class="img-fluid me-4 me-md-3 me-lg-4"
													src="img/gallery/user-2.png" width="100" alt="" />
												<div class="w-lg-50 my-3">
													<h5 class="mb-0 fw-bold">Viezh Robert</h5>
													<p class="fw-normal mb-0">UI/UX Designer</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="position-relative mt-sm-n5">
								<a class="carousel-control-prev carousel-icon z-index-2"
									href="#carouselExampleDark" role="button" data-bs-slide="prev"><span
									class="carousel-control-prev-icon" aria-hidden="true"></span><span
									class="visually-hidden">Previous</span></a><a
									class="carousel-control-next carousel-icon z-index-2"
									href="#carouselExampleDark" role="button" data-bs-slide="next"><span
									class="carousel-control-next-icon" aria-hidden="true"></span><span
									class="visually-hidden">Next</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>


		<!-- ============================================-->
		<!-- <section> begin ============================-->
		<section class="py-8" id="faq">

			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-8 col-lg-6 text-center mb-3">
						<h6 class="fw-bold fs-4 display-3 lh-sm mb-3">궁금하신 점이 있나요?</h6>
						<p class="mb-5">The rise of mobile devices transforms the way
							we consume information entirely and the world's most elevant
							channels such as Facebook.</p>
					</div>
				</div>
				<div class="row flex-center">
					<div class="col-lg-9">
						<div class="accordion" id="accordionExample">
							<div class="accordion-item mb-2">
								<h2 class="accordion-header" id="heading1">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapse1"
										aria-expanded="true" aria-controls="collapse1">
										<span class="mb-0 fw-bold text-start fs-1 text-1000">사회적 거리두기로 인한 환불 관련</span>
									</button>
								</h2>
								<div class="accordion-collapse collapse show" id="collapse1"
									aria-labelledby="heading1" data-bs-parent="#accordionExample">
									<div class="accordion-body bg-100">네이버(주)는 통신판매의 당사자가 아니며, 환불 기준은 업체에서 직접 정한 규정으로 관리됩니다.



그렇기 때문에 사회적 거리두기 정부지침에 따른 환불도 동일하게 업체의 규정대로 처리될 수 있는데요.



네이버는 업체가 판매하는 것에 대해 임의로 환불할 수 없는 점 양해를 부탁드리며,

사회적 거리두기로 인한 환불 협의가 필요할 경우 예약한 업체로 문의해 주시기 바랍니다.



예약한 업체의 연락처는 예약 상세 내역의 '오시는길' 또는 '판매자연락처'에서 확인할 수 있습니다.



아울러, 네이버페이로 결제한 예약 건에 적용된 업체의 취소 수수료 규정 또한

예약 상세 내역의 '취소/환불 규정 안내'에서 확인이 가능합니다.

※ 페이 미결제 건은 '취소/환불 규정 안내' 항목 없으나

    업체의 규정에 따라 취소 시 취소 수수료가 발생할 수 있는 점 참고해 주세요.</div>
								</div>
							</div>
							<div class="accordion-item mb-2">
								<h2 class="accordion-header" id="heading2">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapse2"
										aria-expanded="true" aria-controls="collapse2">
										<span class="mb-0 fw-bold text-start fs-1 text-1000">예약/주문/간편주문 내역을 확인하고 싶어요</span>
									</button>
								</h2>
								<div class="accordion-collapse collapse" id="collapse2"
									aria-labelledby="heading2" data-bs-parent="#accordionExample">
									<div class="accordion-body bg-100">아래의 링크를 통해 예약/네이버 주문/간편주문 내역을 확인할 수 있습니다.

예약한 네이버 아이디로 로그인해 주세요.



[예약/주문 내역 확인 방법]



1. '네이버 my플레이스' 또는 '네이버 마이플레이스' 검색 후 접속



2.예약·주문 탭 클릭 > 예약 또는 주문 클릭('주문' 클릭 시 네이버 주문, 간편주문 확인 가능)



3-1. 오늘(확정)/0일전(확정)/예약확인중(신청)으로 확인되는 건 클릭 → 예약 내역으로 이동



3-2. 또는 페이지 중간의 '방문 00', '예약취소 00' 상태값 클릭 >

확인하고자 하는 예약 건 클릭 → 예약 내역으로 이동</div>
								</div>
							</div>
							<div class="accordion-item mb-2">
								<h2 class="accordion-header" id="heading3">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapse3"
										aria-expanded="true" aria-controls="collapse3">
										<span class="mb-0 fw-bold text-start fs-1 text-1000">예약/주문 취소 방법</span>
									</button>
								</h2>
								<div class="accordion-collapse collapse" id="collapse3"
									aria-labelledby="heading3" data-bs-parent="#accordionExample">
									<div class="accordion-body bg-100">취소할 예약/주문 건의 결제 상태를 아래에서 선택해 주세요.
네이버페이로 결제한 예약 건은 업체의 환불 규정에 따라 취소 수수료가 발생될 수 있습니다.

취소 전 예약 상세 내역의 '취소/환불 규정 안내'에서

예약한 업체의 취소 수수료를 확인할 수 있으니 참고해 주세요.

(페이 미결제 건은 '취소/환불 규정 안내' 항목 없음)



■ 예약 상세 내역 접속 방법

MY플레이스 > 예약·주문 > 예약 내역의 상품 이름 클릭</div>
								</div>
							</div>
							<div class="accordion-item mb-2">
								<h2 class="accordion-header" id="heading4">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapse4"
										aria-expanded="true" aria-controls="collapse4">
										<span class="mb-0 fw-bold text-start fs-1 text-1000">부분 취소</span>
									</button>
								</h2>
								<div class="accordion-collapse collapse" id="collapse4"
									aria-labelledby="heading4" data-bs-parent="#accordionExample">
									<div class="accordion-body bg-100">사업주가 부분 취소 기능을 사용하는 경우에만 부분 취소가 가능합니다.


사업주가 부분 취소 기능을 사용하지 않는 경우 예약 내역는 예약취소 버튼만 노출됩니다.



※ 무통장결제 예약 건은 부분 취소 불가

※ 좌석을 선택한 뒤 예약한 건은 부분 취소 불가

※ 사업자가 '숙박형'과 '시작-종료 시간선택형'으로 예약을 받을 경우,

    메인 예약 내역에 대해 부분 취소가 불가(예, 2박 3일 중 1박만 취소 불가)하며,

    옵션(인원추가 옵션, 마이크 대여 옵션 등)만 부분 취소가 가능합니다.</div>
								</div>
							</div>
							<div class="accordion-item mb-2">
								<h2 class="accordion-header" id="heading5">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapse5"
										aria-expanded="true" aria-controls="collapse5">
										<span class="mb-0 fw-bold text-start fs-1 text-1000">네이버페이 결제 예약 건 환불 소요 기간</span>
									</button>
								</h2>
								<div class="accordion-collapse collapse" id="collapse5"
									aria-labelledby="heading5" data-bs-parent="#accordionExample">
									<div class="accordion-body bg-100">네이버페이 결제수단에 따라 환불 소요 기간이 달라집니다. (영업일 기준)


1) 신용카드: 3일~5일 이내 카드 승인 취소
2) 체크카드: 2일 이내 카드 승인 취소   
3) 계좌이체: 2일~3일

4) 무통장 입금: 본인 계좌 2일

                        환불정산액 즉시 
5) 페이 포인트: 즉시



추가로, 취소된 예약 건의 환불 소요 기간은 예약 상세 내역에서도 확인이 가능합니다. </div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end of .container-->

		</section>
		<!-- <section> close ============================-->
		<!-- ============================================-->



<%@include file="footer.jsp" %>
</body>
</html>