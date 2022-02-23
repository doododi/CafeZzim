/**
 * 
 */

let frm = document.frm;
let x = frm.valX.value;
let y = frm.valY.value;

function sumTest(){
	var b = false;
	if(x != "" && y != ""){
		b=true;
	}else{
		alert("값을 모두 입력해주세요");
	}
	return b;
}