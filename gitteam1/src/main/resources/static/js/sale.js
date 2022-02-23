/**
 * 
 */
$(function(){
	var context = document.getElementById('myChart').getContext('2d');
	let timeList = [];
	let posList = [];
	$.ajax({
    type:"POST",
		url:"chart",
		success: function(data) {
			// 그래프로 나타낼 자료 리스트에 담기
			for (let i = 0; i < data.length; i++) {
				timeList.push(data[i].pdate);
				posList.push(data[i].sales);
			}
			var myChart = new Chart(context, {
				type: 'bar', // 차트의 형태
				data: { // 차트에 들어갈 데이터
					labels: timeList,
					datasets: [
						{ //데이터
							label: '월 매출', //차트 제목
							fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data: posList,
							backgroundColor: [
								//색상
								'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
							],
							borderColor: [
								//경계선 색상
								'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
							],
							borderWidth: 1 //경계선 굵기
						}
					]
				},
				options: {
					scales: {
						yAxes: [
							{
								ticks: {
									min:0,
									max:120000,
									stepSize:20000,
									beginAtZero: true
								}
							}
						]
					}
				}
			});//chart end
		},
		error:function(){
			alert("실패");
		}
	});/*ajax end */
	
	var $frm = $("#frm_select")[0];
	$("#btnYear").click(function(){
		$frm.action = "selectYear";
		$frm.submit();	
	})
})