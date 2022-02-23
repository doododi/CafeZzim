/**
 * 
 */

function qa(){};

qa.page = function(nowPage){
	let frm = document.frmBoard;
	
	frm.nowPage.value = nowPage;
	frm.action = "qa";
	frm.submit();
}

$(function(){
	$("#btnQaSearch").click(function(){
		let frm = document.frmBoard;
		
		frm.nowPage.value = 1;
		frm.action = "qa";
		frm.submit();
	})
	
	$("#btnInsertSave").click(function(){
		let frm = document.frmBoard;
		let subject = $("#subject").val();
		let content = $("#content").val();
		let secret = $("#secret").is(":checked");
		frm.isSecret.value = secret;
		
		if(!subject){
			alert("제목을 입력하세요.");
			return;
		} else if(!content){
			alert("내용을 입력하세요.");
			return;
		}
		
		frm.action = "qa_insert_check";
		frm.submit();
		alert("질문이 등록되었습니다.");
	})
	
	$("#btnModifySave").click(function(){
		let frm = document.frmBoard;
		let subject = $("#subject").val();
		let content = $("#content").val();
		
		if(!subject){
			alert("제목을 입력하세요.");
			return;
		} else if(!content){
			alert("내용을 입력하세요.");
			return;
		}
		
		frm.action = "qa_modify_check";
		frm.submit();
		alert("질문이 수정되었습니다.");
	})
	
	$("#btnRepl").click(function(){
		let frm = document.frmBoard;
		frm.action = "qa_repl";
		frm.submit();
	})
	
	$("#btnQaReplSave").click(function(){
		let frm = document.frmBoard;
		let subject = $("#subject").val();
		let content = $("#content").val();
		
		if(!subject){
			alert("제목을 입력하세요.");
			return;
		} else if(!content){
			alert("내용을 입력하세요.");
			return;
		}
		
		frm.action = "qa_repl_save";
		frm.submit();
	})
	
	$("#btnDelete").click(function(){
		let frm = document.frmBoard;
		let result = confirm("삭제하시겠습니까?");
		
		if(result){
			frm.action = "qa_delete";
			frm.submit();
		}
	})
	
	$("#btnDeleteRepl").click(function(){
		let frm = document.frmBoard;
		let result = confirm("삭제하시겠습니까?");
		
		if(result){
			frm.action = "qa_delete_repl";
			frm.submit();
		}
	})
	
	$("#btnDeleteFile").click(function(){
		let checkBoxArr = [];
		let checkFile = $("input:checkbox[name='origin_file']:checked");

		if(checkFile.length === 0){
			alert("삭제할 항목을 선택해주세요.");
			return;
		}
		
		checkFile.each(function(){
			checkBoxArr.push($(this).val());
			$(this).closest("div").remove();
		});
		
			console.log(checkBoxArr);
		
		let result = confirm("삭제하시겠습니까?");
		
		if(result){
			$.ajax({
				type : "POST",
				url : "qa_modify_file",
				traditional : true,
				dataType : "json",
				data : {checkBoxArr : checkBoxArr},
			});
		}
	})
})