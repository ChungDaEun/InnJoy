<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header/adm_header.jsp"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<meta charset="utf-8">
<head>
<style type="text/css">
.card {
	margin-top: 20px;
}

.chartdiv {
	
}
</style>
</head>
<body>
	<div class="container" class="container-fluid px-4">
		<div class="card mb-4">
			<div class="card-body">관리자 페이지 입니다. 예약차트 확인부터 회원 및 공지사항 관리가
				쉬워집니다.^^</div>
		</div>
		<div>
			<div class="chartdiv">
				<canvas id="monthlychart"></canvas>
			</div>
			<div class="chartdiv">
				<canvas id="prodchart"></canvas>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
	<script>
		var mchartLabels = [];
		var mchartData = [];
		$.getJSON("${path}/monthlyRList", function(data) {
			$.each(data, function(inx, obj) {
				mchartLabels.push(obj.monthly_res + "월");
				mchartData.push(obj.mr_cnt);
			});
			createmChart();
			console.log("create mChart")
		});
		var mrLineChartData = {
			labels : mchartLabels,
			datasets : [ {
				label : "월별 예약건수",
				borderColor : "rgba(151,187,205,1)",
				borderWidth : 1,
				data : mchartData
			} ]
		}
		function createmChart() {
			var ctx = document.getElementById("monthlychart").getContext("2d");
			LineChartDemo = new Chart(ctx, {
				type : 'line',
				data : mrLineChartData,
				options : {
					title : {
						display : true,
						text : 'Innjoy 월별 예약 추이',
						fontSize : 20
					},
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true,
								stepSize : 1
							}
						} ]
					}
				}
			})
		}
	</script>

	<script>
		var pchartLabels = [];
		var pchartData = [];
		$.getJSON("${path}/prodRList", function(data) {
			$.each(data, function(inx, obj) {
				pchartLabels.push(obj.prod);
				pchartData.push(obj.prodr_cnt);
			});
			createpChart();
			console.log("create pChart")
		});
		var pBarChartData = {
			labels : pchartLabels,
			datasets : [ {
				label : "숙소별 예약건수",
				backgroundColor : "rgba(151,187,205,0.2)",
				borderColor : "rgba(151,187,205,1)",
				borderWidth : 1,
				data : pchartData
			} ]
		}
		function createpChart() {
			var ctx = document.getElementById("prodchart").getContext("2d");
			BarChartDemo = Chart.Bar(ctx, {
				data : pBarChartData,
				options : {
					title : {
						display : true,
						text : 'Innjoy 숙소별 예약현황',
						fontSize : 20
					},
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true,
								stepSize : 1
							}
						} ]
					}
				}
			})
		}
	</script>
	<%@ include file="../header/footer.jsp"%>
</body>
</html>