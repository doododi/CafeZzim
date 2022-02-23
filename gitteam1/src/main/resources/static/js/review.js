const drawStar = (target) => {
	document.querySelector(`.star span`).style.width = `${target.value * 20}%`;
}

const frm_review = document.frm_review;
const reviewSaveBtn = document.getElementById("reviewSaveBtn");
const reviewCancelBtn = document.getElementById("reviewCancelBtn");

reviewSaveBtn.addEventListener("click",function(){
	frm_review.submit();
});

reviewCancelBtn.addEventListener("click",function(){
	window.history.back();
});