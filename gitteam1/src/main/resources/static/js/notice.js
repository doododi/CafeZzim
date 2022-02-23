/**
 * 
 */

function notice(){};
notice.page = function(nowPage){
	let frm = document.frmBoard;
	
	frm.nowPage.value = nowPage;
	frm.action = "notice";
	frm.submit();
}

$(function(){	
	$("#btnNoticeSearch").click(function(){
		let frm = document.frmBoard;
		
		frm.nowPage.value = 1;
		frm.action = "notice";
		frm.submit();
	})
	
	$("#btnInsertSave").click(function(){
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
		
		frm.action = "notice_insert_check";
		frm.submit();
		alert("공지사항이 등록되었습니다.");
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
		
		frm.action = "notice_modify_check";
		frm.submit();
		alert("공지사항이 수정되었습니다.");
	})
	
	$("#btnDelete").click(function(){
		let frm = document.frmBoard;
		let result = confirm("삭제하시겠습니까?");
		
		if(result){
			frm.action = "notice_delete";
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
		
		let result = confirm("삭제하시겠습니까?");
		
		if(result){
			$.ajax({
				type : "POST",
				url : "notice_modify_file",
				traditional : true,
				dataType : "JSON",
				data : {checkBoxArr : checkBoxArr},
			});
		}
	})
})