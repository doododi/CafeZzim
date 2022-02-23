<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>리뷰작성 | CafeZzim</title>
<%@include file="../common.jsp" %>
<link rel="stylesheet" href="css/review.css">
</head>


<body>
<%@include file="../header.jsp" %>

<!-- ----------------------------------------------------------------------- -->
<section class="pt-8 pb-2" id="kind">
	<div class="container">
		<h3 class="mb-4">My page</h3>

		<!---------------------- 마이페이지 메뉴바 ------------------------------------------>
		<div class="d-flex justify-content-between mb-1 border-0">
			<input type="button" class="form-control" value="회원 정보 관리">
			<input type="button" class="form-control btn-primary" value="예약 관리">
			<input type="button" class="form-control" value="카페 관리">
		</div>
	</div>
</section>

<section class="pt-4 pb-6">

	<div class="container">
		<div class="text-center">
			<h5 class="">${vo.cname} 에서의 시간은 어땠나요?</h5>
			<p>날짜: ${vo.rdate } ${vo.rtime }</p>
		</div>
		
		<form name="frm_review" action="writeReview" method="post" enctype="multipart/form-data">
			<input type="hidden" name="cid" value="${vo.cid }">
			<input type="hidden" name="mid" value="${vo.mid }">
			<div class="text-center mb-4">
				<span class="star">
				  ★★★★★
				  <span>★★★★★</span>
				  <input type="range" name="score" oninput="drawStar(this)" value="1" step="1" min="0" max="5">
				</span>
			</div>
			<div class="input-group mb-3">
         <span class="input-group-text">내용</span>
         <textarea name="content" class="form-control" aria-label="With textarea"></textarea>
       </div>
       <div class="mb-5">
         <label class="form-label" for="customFile">사진 업로드</label>
         <input type="file" name="file" class="form-control" id="customFile">
       </div>
		</form>
		
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
    </ul>
		
		
		<div class="row">
			<div class="col-7"><button class="w-100 btn btn-lg btn-primary" id="reviewSaveBtn">후기 작성 완료</button></div>
			<div class="col-5"><button class="w-100 btn btn-lg btn-light" id="reviewCancelBtn">후기 작성 취소</button></div>
		</div>
		
	</div>

</section>

<%@include file="../footer.jsp" %>
<script type="text/javascript" src="js/review.js"></script>
</body>
</html>