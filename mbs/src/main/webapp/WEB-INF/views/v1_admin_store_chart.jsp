<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>업체통계</title>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   	<link rel="stylesheet" href="resources/css/bootstrap.css" />
	<link rel="stylesheet" href="resources/css/v1_adminside.css" />
	<link rel="stylesheet" href="resources/css/w3.css" />
	<style>
	   .title{
	      margin-top:50px;
	      margin-bottom:20px;
	      font-size:50px
	   }
	</style>
</head>


<body>
	<div class="row">
		<jsp:include page="v1_admin_header.jsp"></jsp:include>
		<div class="container-fluid">
			<div class="side-body">
				<div class="title">업체통계</div>
				<div class="row">
					<div class="col-md-6" align="center" style="margin: 150px auto">
						<h1 style="margin-top: 50px">
							<b>업체  ${count} 개의 평균 별점은 ${point}점 입니다</b>
						</h1>
						<h1 style="margin-top: 150px">
							<b>메뉴 <font class="allcount"></font> 개의 총 평균가는 ${avg} 원 입니다</b>
						</h1>
					</div>
					<div class="col-md-6" style="margin: 0px auto">
						<canvas id="canvas"></canvas>
					</div>
					<div class="col-md-6" style="margin: 0px auto">
						<div id="canvas-holder" style="width: 100%">
							<canvas id="chart-area"></canvas>
						</div>
					</div>
					<div class="col-md-12">
						<div id="month-canvas-holder" style="width: 100%">
							<canvas id="month-canvas"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="resources/js/Chart.bundle.js"></script>

<script>
	$(function(){
		var travalcount = 0;
		var foodcount = 0;
		travalcount = ${vo1.price_0}+${vo1.price_1}+${vo1.price_2}+${vo1.price_3}+${vo1.price_4}+${vo1.price_5}+${vo1.price_6}+${vo1.price_7};
		foodcount = ${vo2.price_0}+${vo2.price_1}+${vo2.price_2}+${vo2.price_3}+${vo2.price_4}+${vo2.price_5}+${vo2.price_6}+${vo2.price_7};
		$('.allcount').text(travalcount+foodcount);
		var config = {
			type: 'bar',
			data: {
				labels: ['~5000', '5000~15000', '15000~25000', '25000~35000', '35000~45000','45000~55000','55000~70000','70000~'],
				datasets: [{
					label: '관광지',
					backgroundColor: 'rgba(102, 204, 051, 0.4)',
					borderColor: 'rgba(102, 204, 051, 0.4)',
					data: [
						${vo1.price_0},
						${vo1.price_1},
						${vo1.price_2},
						${vo1.price_3},
						${vo1.price_4},
						${vo1.price_5},
						${vo1.price_6},
						${vo1.price_7}
					]
				}, {
					label: '업체',
					backgroundColor: 'rgba(000, 204, 204, 0.4)',
					borderColor: 'rgba(000, 204, 204, 0.4)',
					data: [
						${vo2.price_0},
						${vo2.price_1},
						${vo2.price_2},
						${vo2.price_3},
						${vo2.price_4},
						${vo2.price_5},
						${vo2.price_6},
						${vo2.price_7}
					]
				}]
			},
			options: {
				responsive: true,
				title: {
					display: true,
					text: '가격대 통계'
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
							labelString: '가격대'
						}
					}],
					yAxes: [{
						display: true,
						scaleLabel: {
							display: true,
							labelString: '개'
						}
					}]
				}
			}
		};
		window.onload = function() {
			var slist = new Array();
			<c:forEach items="${slist}" var="vo">
				var json = new Object();
				json.store="${vo.store}";
				json.count="${vo.count}";
				slist.push(json);
			</c:forEach>
			//convas
			var ctx = document.getElementById('chart-area').getContext('2d');
			//설정
			var myPieChart = new Chart(ctx,{
			    type: 'pie',
			    data: {
			    	 labels: ["관광지", "업체"],
			    datasets: [{
			    	label: '# of Votes',
			    	data : ["${traval}","${food}"],
			    	backgroundColor: ['rgba(102, 204, 051, 0.4)','rgba(000, 204, 204, 0.4)']
			    	}],
			    	borderColor: ['rgba(102, 204, 051, 1)','rgba(102, 204, 051, 1)'],
			    },
			    options: {
			    	title: {
						display: true,
						text: '비율 통계'
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
			var monthdata = new Array;
			monthdata = [];
			var monthcount = 0;
			for (var i=30;i>0;i--) {
				datelist.push(moment().subtract(i, 'days').format('YYYY-MM-DD'));
			}
			//각각의 한번마다 30번씩 배열 돌림
			for (var j=datelist.length-1;j>-1;j--) {
				var val = 0;
				for(var i=0;i<slist.length;i++){
					
				//만약 30번의 배열중 12번도는 배열의 값과 일치할경우
				if(datelist[j] == slist[i].store){
					//monthdata 배열에 카운트 추가
					val += slist[i].count;
					var moco = 0;
					moco += parseInt(monthcount) + parseInt(slist[i].count);
					monthcount = moco;
				}
			}
				monthdata.push(val);
		};
			var cfg = {
					type: 'bar',
					data: {
						labels: datelist,
						datasets: [{
							label: '한달 간 생성 업체 수',
							data: monthdata,
							backgroundColor: 'rgba(132, 132, 132, 0.4)',
							type: 'line',
							pointRadius: 5,
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