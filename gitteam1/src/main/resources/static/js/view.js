/**
 * 상세페이지 스크립트
 * 2022.01.19 김성겸 작성
 */


const btnZzim = document.getElementById("btnToggleZzim");

btnZzim.addEventListener("click",handleZzim);
function handleZzim(e){
	const btnToggleHeart = document.getElementById("btnToggleHeart");
	if(btnToggleHeart.classList.contains("far")){
		// 찜하기 전
		if($("#mid").val() != "" || $("#mid").val() == null){
			$.post("zzimIns", {mid:$("#mid").val(),cid:$("#cid").val()},successIns);
		}
		
		
	} else if(btnToggleHeart.classList.contains("fas")){
		// 찜하기 후
		$.post("zzimDel", {mid:$("#mid").val(),cid:$("#cid").val()},successDel);
	}
}

function successIns(data, textStatus){
	console.log("success insert");
	btnToggleHeart.classList.remove("far");
	btnToggleHeart.classList.add("fas");
}

function successDel(data, textStatus){
	console.log("success delete");
	btnToggleHeart.classList.remove("fas");
	btnToggleHeart.classList.add("far");
}