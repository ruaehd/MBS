<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>회원통계</title>
</head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
   .title{
      margin-top:50px;
      margin-bottom:20px;
      font-size:50px
   }
</style>

<body>
   <div class="row">
      <jsp:include page="v1_admin_header.jsp"></jsp:include>
      <div class="container-fluid">
        <div class="side-body">
        <div class="title"> 회원통계 </div>
        	<div class="row">
        		<div class="col-md-6" style="margin:0px auto">
					<canvas id="canvas"></canvas>
				</div>
				<div class="col-md-6" style="margin:0px auto">
					<div id="canvas-holder" style="width:100%">
						<canvas id="chart-area"></canvas>
					</div>
				</div>
				<div class="col-md-12">
					<div id="month-canvas-holder" style="width:100%">
						<canvas id="month-canvas"></canvas>
					</div>
				</div>
			</div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="resources/js/Chart.bundle.js"></script>
<script>
	$(function(){
		var MONTHS = ['10대', '20대', '30대', '40대', '50대','60대','70대','80대','90대이상'];
		var config = {
			type: 'bar',
			data: {
				labels: ['10대', '20대', '30대', '40대', '50대','60대','70대','80대','90대이상'],
				datasets: [{
					label: '여성',
					backgroundColor: 'rgba(255, 99, 132, 0.4)',
					borderColor: 'rgba(255, 99, 132, 0.4)',
					data: [
						'56',
						'32',
						'11',
						'17',
						'65',
						'35',
						'23',
						'19',
						'4'
					]
				}, {
					label: '남성',
					backgroundColor: 'rgba(54, 162, 235, 0.4)',
					borderColor: 'rgba(54, 162, 235, 0.4)',
					data: [
						'32',
						'67',
						'56',
						'42',
						'32',
						'28',
						'18',
						'13',
						'6'
					]
				}]
			},
			options: {
				responsive: true,
				title: {
					display: true,
					text: '연령층 통계'
				},
				tooltips: {
					mode: 'index',
					intersect: false,
				},
				hover: {
					mode: 'nearest',
					intersect: true
				},
				scales: {
					xAxes: [{
						display: true,
						scaleLabel: {
							display: true,
							labelString: '연령대'
						}
					}],
					yAxes: [{
						display: true,
						scaleLabel: {
							display: true,
							labelString: '명'
						}
					}]
				}
			}
		};
		window.onload = function() {
			//convas
			var ctx = document.getElementById('chart-area').getContext('2d');
			//설정
			var myPieChart = new Chart(ctx,{
			    type: 'pie',
			    data: {
			    	 labels: ["여성", "남성"],
			    datasets: [{
			    	label: '# of Votes',
			    	data : [56,47],
			    	backgroundColor: ['rgba(255, 99, 132, 0.4)',
		                'rgba(54, 162, 235, 0.4)']
			    	}],
			    	borderColor: [
		                'rgba(255,99,132,1)',
		                'rgba(54, 162, 235, 1)'
		                ],
			    },
			    options: {
			    	title: {
						display: true,
						text: '성비 통계'
					}
			    }
			});
			//연령층
			var ctx1 = document.getElementById('canvas').getContext('2d');
			window.myBar = new Chart(ctx1, config);
			
			//한달 통계
			var ctx2 = document.getElementById('month-canvas').getContext('2d');
			ctx2.canvas.width = 1000;
			ctx2.canvas.height = 300;
			moment.locale('ko');
			moment();
			var datelist = new Array;
			datelist = [];
			for (var i=30;i>0;i--) {
				datelist.push(moment().subtract(i, 'days').format('YYYY MM DD'));
			}
			console.log(datelist);
			var cfg = {
					type: 'bar',
					data: {
						labels: datelist,
						datasets: [{
							label: '한달 간 가입회원 수',
							data: [0,30,20,60,50,80,120,90,40,40,30,20,60,50,80,120,90,40,40,30,20,60,50,80,120,90,40,120,90,40],
							backgroundColor: 'rgba(132, 132, 132, 0.4)',
							type: 'line',
							pointRadius: 0,
							fill: true,
							lineTension: 0,
							borderWidth: 1
						}]
					}
				};
			var Month_chart = new Chart(ctx2, cfg);
		
		};
	});
</script>

</body>
</html>