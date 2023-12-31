<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<meta charset="utf-8">
<head>

</head>
<body>
	<div style="width: 60%">
		<div>
			<canvas id="canvas" height="450" width="600"></canvas>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
	<script>
		var chartLabels = [];
		var chartData = [];
		$.getJSON("http://localhost:5050/incomeList", function(data) {
			$.each(data, function(inx, obj) {
				chartLabels.push(obj.monthly_res);
				chartData.push(obj.mr_cnt);
			});
			createChart();
			console.log("create Chart")
		});
		var lineChartData = {
			labels : chartLabels,
			datasets : [
			{
				label : "Date Income",
				fillColor : "rbga(151,187,205,0.2)",
				strokeColor : "rbga(151,187,205,1)",
				pointColor : "rbga(151,187,205,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rbga(151,187,205,1)",
				data : chartData
			}
			]
		}
		function createChart() {
			var ctx = document.getElementById("canvas").getContext("2d");
			LineChartDemo = Chart.Line(ctx, {
				data : lineChartData,
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			})
		}
	</script>



</body>

</html>