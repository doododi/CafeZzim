/**
 * 
 */
view = function(mid){
	$frm = $('#frm_member')[0];
	$frm.member_id.value = mid;
	$frm.action = "mypage_memberView";
	$frm.submit();
}
$(function(){
	var error = document.querySelectorAll(".invalid-feedback");
	var $frm = $("#frm_member")[0];
	var checkId = document.getElementById("checkId");
	var count = 0; //중복확인 횟수
	var ecount = 0; //중복이메일 확인 횟수
	var nameRegExp = /^[가-힣a-zA-Z]+$/;
	var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
	var phoneRegExp = /^[0-9]{9,11}$/;
	var emailRegExp = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	//회원이 회원정보수정
	$("#btnMemberModify").click(function(){
		if($frm.password.value==""){
			$frm.password.value=$frm.pwd.value;
			$frm.action = "memberModify";
			$frm.submit();
		}else{
			$frm.action = "memberModify";
			$frm.submit();
		}
	})
	//관리자가 회원정보수정
	$("#btnMasterModify").click(function(){
			$frm.action = "memberModify";
			$frm.submit();
	})
	//회원정보삭제
	$("#btnMemberDelete").click(function(){
		var chkConfirm = confirm("정말 탈퇴하시겠습니까?");
		if(chkConfirm){
			$frm.member_grade.value="leaver";
			$frm.action = "memberDelete";
			$frm.submit();
			alert("탈퇴가 정상적으로 처리되었습니다.");	
		}
	})
	//관리자가 회원정보삭제
	$("#btnMasterDelete").click(function(){
		var chkConfirm = confirm("정말 탈퇴하시겠습니까?");
		if(chkConfirm){
			$frm.member_grade.value="leaver";
			$frm.action = "masterDelete";
			$frm.submit();
		}
	})
	
	//중복 아이디 체크
	$("#btnIdCheck").click(function(){
		if(!$frm.member_id.value) return;
		count++;
		$.ajax({
			data: { "checkId": $("#member_id").val() },
			type: "POST",
			url: "idCheck",
			cache: false,
			success: function(data) {
				if(data == 1){
					alert("중복된 아이디입니다.");
					count = 0;
					$frm.member_id.value = "";
				}else if(data == 0){
					alert("사용 가능한 아이디입니다.");
				}		
			}
		})		
	});
	//중복 이메일 체크
	$("#btnEmail").click(function(){
		if(!$frm.member_email.value) return;
		ecount++;
		$.ajax({
			data: { "checkEmail": $("#member_email").val() },
			type: "POST",
			url: "emailCheck",
			cache: false,
			success: function(data) {
				if(data == 1){
					alert("중복된 이메일입니다.");
					ecount = 0;
					$frm.member_email.value = "";
				}else if(data == 0){
					alert("사용 가능한 이메일입니다.");
				}		
			}
		})		
	});
	//유효성체크
	$("#member_id").focusout(function(){
		if(!$frm.member_id.value){
			error[0].style.display = "block";
		}else{
			$frm.member_id.value=$frm.member_id.value.trim();
			error[0].style.display = "none";
		}
	});
	$("#password").focusout(function(){
		if(!pwPattern.test($frm.password.value)){
			error[1].style.display = "block";
		}else{
			error[1].style.display = "none";
			error[2].style.display = "block";
		}
	});
	$("#password_check").focusout(function(){
		if($frm.password.value!=$frm.password_check.value){
			error[2].style.display = "block";
		}else{
			error[2].style.display = "none";
		}
	});
	$("#member_name").focusout(function(){
		if(!$frm.member_name.value || !nameRegExp.test($frm.member_name.value)){
			error[3].style.display = "block";
		}else{
			$frm.member_name.value = $frm.member_name.value.trim();
			error[3].style.display = "none";
		}
	});
	$("#member_phone").focusout(function(){
		if(!$frm.member_phone.value || !phoneRegExp.test($frm.member_phone.value)){
			error[4].style.display = "block";
		}else{
			$frm.member_phone.value = $frm.member_phone.value.trim();
			error[4].style.display = "none";
		}
	});
	$("#member_email").focusout(function(){
		if (!emailRegExp.test($frm.member_email.value)){
			$frm.member_email.value = $frm.member_email.value.trim();
			error[5].style.display = "block";
		}else{
			$frm.member_email.value = $frm.member_email.value.trim();
			error[5].style.display = "none";
		}
	});
	$('#btnSignUp').click(function(){
	//회원가입 버튼 누를 때 중복확인 버튼 눌렀는지 체크
		if(count>=1 && ecount>=1){
			if(!$frm.member_id.value || !$frm.password.value || !$frm.password_check.value
			|| !$frm.member_name.value || !$frm.member_phone.value || !$frm.member_email.value){
				alert("빈 항목을 모두 채워주세요");
			}else{
				if(!pwPattern.test($frm.password.value) || !phoneRegExp.test($frm.member_phone.value) 
				|| !emailRegExp.test($frm.member_email.value)){
					alert("조건에 맞춰 작성해주세요.");
				}else{
					$frm.action = "join";
					$frm.submit();					
				}
			}
		}else{
			alert("아이디와 이메일 모두 중복확인를 눌러주세요.");
		}
	});
})