/**
 * 검색 결과 페이지 스크립트
 * 2022.01.12 김성겸 작성
 */
let startNo = 10;
let listSize = 10;

const srchResult = document.getElementsByClassName("srchResults")[0];

// 스크롤이 목록의 끝에 도달 했을때 작동 (모바일에서 작동 pc에서는 타이밍 수정전까지는 작동안할듯)
ScrollTrigger.create({
    trigger: srchResult,
    start: "top 50%",
    end: "bottom 50%",
		markers:true, // 동작 타이밍 확인 용 마커, 필요없으면 삭제하면됨
    onUpdate: (self) => {
        let progress = self.progress.toFixed(2);
        if (progress >= 0.9 && self.direction === 1) {
						getSearchList();
            ScrollTrigger.refresh();
        }
    },
});

function getSearchList(){
	var str = "";
	$.ajax({
		// 요청 및 데이터를 Controller로 보낼 주소
		url: 'searchJson',
		method: 'GET',
		contentType : "application/json; charset=utf-8",
		// 보낼 정보 - 검색어,날짜,시작번호, 불러올 갯수
		data:{findStr : $("#searchInput").val(),date:$("#datePicker").val(), startNo : startNo, listSize:listSize},
		dataType : 'json',
		success: function(data) {
			// text 문서를 json 형식으로 파싱
			areaArr = JSON.stringify(data);
			areaArr = JSON.parse(areaArr);
			
			// 가져온 배열이 있으면 실행 (불록온 목록이 있으면)
			if(areaArr.length){
				areaArr.forEach((el)=>{
					str += '<div class="srchResult-item col-xl-6" data-lat="'+el.lat+'" data-lng="'+el.lng+'">'
					     + 	'<a href="view?id='+el.cid+'&date'+ $("#datePicker").val() + '" class="search-item card shadow-lg mb-4 border-0">'
               + 		'<div class="d-flex">'
               + 			'<div class="search-item-img">'
               + 				'<div class="img-wrap">'
               + 					'<img src="../img/gallery/'+el.thumb+'" class="img-fluid" alt="'+el.name+'">'
               + 				'</div>'
               + 			'</div>'
               + 			'<div class="search-item-desc py-3 px-3">'
               + 				'<p class="fw-medium fz-14">'+el.name+'</p>'
               + 				'<p class="fz-13">'+el.address+'</p>'
               + 				'<p class="fz-12"><i class="fas fa-star"></i> '+el.rating+' ('+el.rcnt+')</p>'
               + 			'</div>'
               + 		'</div>'
               + 	'</a>'
               + '</div>'
				});
				// html형식으로 추가
				srchResult.innerHTML += str;
				// 추가한 갯수만큼 시작 번호를 증가
				startNo += listSize;
			}
		}
	});
}


const sortChoose = document.getElementById("sort-choose");
let latitude = 37.481269577088455;
let longitude = 126.95272272692208;

sortChoose.addEventListener("change",sortFunc);

function sortFunc(){
	let val = sortChoose.options[sortChoose.selectedIndex].value;
	let frm = document.frm_search;
	
	getMyLocation();
	
	
	frm.sortBy.value = val;
	frm.centerLat.value = parseFloat(latitude);
	frm.centerLng.value = parseFloat(longitude);
	frm.submit();
}

// 정렬

// Geolocation API에 액세스할 수 있는지를 확인
function getMyLocation() {
     // navigator.geolocation 없다면 null을 반환하고 조건식의 결과는 false
    if (navigator.geolocation) {
        //getCurrentPosition(successhandler, errorHandler, option)
        navigator.geolocation.getCurrentPosition(
            setLocation, 
            displayError);
    } else {
        alert("내 위치 정보제공 설정이 꺼져있거나, 지원하지 않는 브라우져 입니다." );
    }
}
function setLocation(position) {

    latitude = position.coords.latitude;
    longitude = position.coords.longitude;

}

function displayError(error) {
    var errorTypes = {
        0: "알려지지 않은 에러",
        1: "사용자가 권한 거부",
        2: "위치를 찾을 수 없음",
        3: "요청 응답 시간 초과"
    };
    var errorMessage = errorTypes[error.code];
    if (error.code == 0 || error.code == 2) {
        errorMessage = errorMessage + " " + error.message;
    }
    console.log(errorMessage);
}


















