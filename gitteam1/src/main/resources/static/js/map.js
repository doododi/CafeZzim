/**
 * 지도에서 보기 부분 스크립트
 * 2022.01.12 김성겸 작성
 */
var areaArr = new Array();  // 지역을 담는 배열 ( 지역명/위도경도 )
console.log($("#findStr").val())

$.ajax({
	url: 'mapJson',
	method: 'GET',
	data:{findStr : $("#findStr").val()},
	dataType : 'json',
	success: function(data) {
		areaArr = JSON.stringify(data);
		areaArr = JSON.parse(areaArr);
		initMap();
	}
});


function initMap() {



	let markers = new Array(); // 마커 정보를 담는 배열
	let infoWindows = new Array(); // 정보창을 담는 배열

	var map = new naver.maps.Map('map', {
		center: new naver.maps.LatLng(areaArr[0].lat, areaArr[0].lng), //지도 시작 지점
		zoom: 16
	});




	for (var i = 0; i < areaArr.length; i++) {
		// 지역을 담은 배열의 길이만큼 for문으로 마커와 정보창을 채워주자 !

		var marker = new naver.maps.Marker({
			map: map,
			title: areaArr[i].location, // 지역구 이름 
			position: new naver.maps.LatLng(areaArr[i].lat, areaArr[i].lng) // 지역구의 위도 경도 넣기 
		});

		/* 정보창 */
		var infoWindow = new naver.maps.InfoWindow({
			content: '<div style="width:200px;padding:10px;">' +
								 '<a href="/view?id=' + areaArr[i].cid + '" class="d-flex">' +
										'<div class="map-info-img">' +
											'<img src="img/gallery/' + areaArr[i].thumb + '" width="50">' +
										'</div>' +
										'<div class="desc-area">' +
											'<b>' + areaArr[i].name + '</b><br>' +
											'<i class="fas fa-star"></i>' + areaArr[i].rating +
										'</div>' +
									'</a>' +
								'</div>'
		}); // 클릭했을 때 띄워줄 정보 HTML 작성

		markers.push(marker); // 생성한 마커를 배열에 담는다.
		infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
	}


	function getClickHandler(seq) {

		return function(e) {  // 마커를 클릭하는 부분
			var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다.
				infoWindow = infoWindows[seq]; // 클릭한 마커의 시퀀스로 찾는다

			if (infoWindow.getMap()) {
				infoWindow.close();
			} else {
				infoWindow.open(map, marker); // 표출
			}
		}
	}

	for (var i = 0, ii = markers.length; i < ii; i++) {
		console.log(markers[i], getClickHandler(i));
		naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
	}
}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}