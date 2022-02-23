<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main class="main" id="top">
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
	data-navbar-on-scroll="data-navbar-on-scroll">
	<div class="container">
		<a class="navbar-brand d-flex align-items-center fw-bold fs-2"
			href="/">
			<div class="text-warning">Cafe</div>
			<div class="text-1000">Zzim</div>
		</a>
		<button class="navbar-toggler collapsed" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div
			class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0"
			id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto pt-2 pt-lg-0">
				<li class="nav-item" data-anchor="data-anchor"><a
					class="nav-link fw-medium active" aria-current="page" href="/">Home</a></li>
				<li class="nav-item" data-anchor="data-anchor"><a
					class="nav-link fw-medium" href="#location">지역별 검색</a></li>
				<li class="nav-item" data-anchor="data-anchor"><a
					class="nav-link fw-medium" href="#faq">FAQ</a></li>
					<li class="nav-item"><a class="nav-link fw-medium" href="notice">Notice</a></li>
					<li class="nav-item"><a class="nav-link fw-medium" href="qa">Q&amp;A</a></li>
				<c:if test="${empty sessionScope.member_id}">
					<li class="nav-item"><a class="nav-link fw-medium" href="signIn">로그인</a></li>
					<li class="nav-item"><a class="nav-link fw-medium" href="signUp">회원가입</a></li>
				</c:if>
			</ul>
			
			<c:choose>
			<c:when test="${not empty sessionScope.member_id}">
				<div class="d-flex align-items-center">
	        <div class="flex-shrink-0 dropdown">
	          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
							  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
							</svg>
	          </a>
	          <c:if test="${sessionScope.grade eq 'customer'}">
		          <ul class="dropdown-menu text-small mr-5" aria-labelledby="dropdownUser2">
		          	<li><p class="dropdown-header">${sessionScope.name}님 반갑습니다.</p></li>
		            <li><a class="dropdown-item" href="mypage_member">마이페이지</a></li>
		            <li><hr class="dropdown-divider"></li>
		            <li><a class="dropdown-item" href="signOut">로그아웃</a></li>
		          </ul>
	          </c:if>
	          
 	          <c:if test="${sessionScope.grade eq 'cafehost'}">
		          <ul class="dropdown-menu text-small mr-5" aria-labelledby="dropdownUser2">
			          <li><p class="dropdown-header">${sessionScope.name}님 반갑습니다.</p></li>
		            <li><a class="dropdown-item" href="mypageBookingList?id=${sessionScope.member_id}">마이페이지</a></li>
		            <li><hr class="dropdown-divider"></li>
		            <li><a class="dropdown-item" href="signOut">로그아웃</a></li>
		          </ul>
	          </c:if>

 	          <c:if test="${sessionScope.grade eq 'master'}">
		          <ul class="dropdown-menu text-small mr-5" aria-labelledby="dropdownUser2">
		          	<li><p class="dropdown-header">${sessionScope.name}님 반갑습니다.</p></li>
		            <li><a class="dropdown-item" href="mypage_admin">관리페이지</a></li>
		            <li><a class="dropdown-item" href="salesStatus">매출현황</a></li>
		            <li><hr class="dropdown-divider"></li>
		            <li><a class="dropdown-item" href="signOut">로그아웃</a></li>
		          </ul>
	          </c:if>	          
	        </div>
	      </div>
			</c:when>			
			</c:choose>
			
		</div>
	</div>
</nav>