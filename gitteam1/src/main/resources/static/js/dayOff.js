/**
 * 
 */

function show_select(){
	$("#select-time").show();
};

function hide_select(){
	$("#select-time").hide();
}

function toggle_time(){
	if($("#select-time").css("display") == "block"){
		$("#plus-time").hide();
		$("#minus-time").show();
	} else {
		$("#plus-time").show();
		$("#minus-time").hide();
	}
} 

function show_choose(){
	$("#choose-table").show();
}

function hide_choose(){
	$("#choose-table").hide();
}

function toggle_table(){
	if($("#choose-table").css("display") == "block"){
		$("#plus-table").hide();
		$("#minus-table").show();
	} else {
		$("#plus-table").show();
		$("#minus-table").hide();
	}
}

$(function(){
	$("#dayOff-apply").click(function(){
		alert("요청하신 영업 일시 중지가 적용되었습니다.");	
	})
})