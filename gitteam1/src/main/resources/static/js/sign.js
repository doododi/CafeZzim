/**
 * 
 */

$(function(){
	$("#btnSignIn").click(function(){
		let member_id = $("#member_id").val();
		let password = $("#password").val();

		if(!member_id){
			return;
		} else if(!password){
			return;
		}
		document.frmSignIn.action = "signInCheck";
		document.frmSignIn.submit();
	});
	
	// enter키로 로그인
	$("#password").on("keypress", function(e){
		if(e.keyCode == "13"){
			$("#btnSignIn").click();
		}
	});
	
	$("#btnSearchId").click(function(){
		let member_name = $("#member_name").val();
		let member_phone = $("#member_phone").val();
		
		if(!member_name){
			alert("이름을 입력해주세요.");
			return;
		} else if(!member_phone){
			alert("전화번호를 '-' 없이 입력해주세요.");
			return;
		}

		document.frmSearchId.action = "searchIdCheck";
		document.frmSearchId.submit();
	});
	
	// enter키로 아이디 찾기
	$("#member_phone").on("keypress", function(e){
		if(e.keyCode == "13"){
			$("#btnSearchId").click();
		}
	});

	$("#btnMoveSearchPw").click(function(){
		document.frmSearchIdCheck.action = "searchPw";
		document.frmSearchIdCheck.submit();
	});

	$("#btnMoveSignIn").click(function(){
		document.frmSearchIdCheck.action = "signIn";
		document.frmSearchIdCheck.submit();
	});

	$("#btnSearchPw").click(function(){
		let member_id = $("#member_id").val();
		let member_name = $("#member_name").val();
		let member_email = $("#member_email").val();

		if(!member_id){
			return;
		} else if(!member_name){
			return;
		} else if(!member_email){
			return;
		}

		let regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(member_email.match(regEmail) == null){
			alert("올바른 이메일 형식이 아닙니다.");
			return;
		}

		$.ajax({
			url : "sendTempPw",
			type : "POST",
			data : {
				member_id : member_id,
				member_name : member_name,
				member_email : member_email,
			},
			success : function(notice){
				if(notice == "임시 비밀번호가 발급되었습니다."){
					alert(notice);
					location.replace("signIn");
				} else {
					alert("정보가 올바르지 않습니다.");
					$("#member_id").focus();
				}
			}
		})
	});
	
	// enter키로 비밀번호 찾기
	$("#member_email").on("keypress", function(e){
		if(e.keyCode == "13"){
			$("#btnSearchPw").click();
		}
	});	
})