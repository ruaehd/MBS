<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원통계</title>
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
				<div class="title">회원통계</div>
				<div class="row">
					<div class="col-md-6" align="center" style="margin: 150px auto">
						<h1 style="margin-top: 50px">
							<b>총 회원수는 ${mcount}명 입니다</b>
						</h1>
						<h1 style="margin-top: 150px">
							<b>한달간 가입한 회원수는 <font id="monthcount"></font>명 입니다
							</b>
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
			var config = {
				type: 'bar',
				data: {
					labels: ['10대이하', '20대', '30대', '40대', '50대','60대','70대','80대','90대이상'],
					datasets: [{
						label: '여성',
						backgroundColor: 'rgba(255, 99, 132, 0.6)',
						borderColor: 'rgba(255, 99, 132, 0.6)',
						data: [
							${wvo.age_10},
							${wvo.age_20},
							${wvo.age_30},
							${wvo.age_40},
							${wvo.age_50},
							${wvo.age_60},
							${wvo.age_70},
							${wvo.age_80},
							${wvo.age_90}
						]
					}, {
						label: '남성',
						backgroundColor: 'rgba(54, 162, 235, 0.6)',
						borderColor: 'rgba(54, 162, 235, 0.6)',
						data: [
							${mvo.age_10},
							${mvo.age_20},
							${mvo.age_30},
							${mvo.age_40},
							${mvo.age_50},
							${mvo.age_60},
							${mvo.age_70},
							${mvo.age_80},
							${mvo.age_90}
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
				var mlist = new Array();
				<c:forEach items="${mlist}" var="vo">
					var json = new Object();
					json.member="${vo.member}";
					json.count="${vo.count}";
					mlist.push(json);
				</c:forEach>
				console.log(mlist);
				console.log(mlist.length);
				
				var manp = ${mvo.age_10}+${mvo.age_20}+${mvo.age_30}+${mvo.age_40}+${mvo.age_50}+${mvo.age_60}+${mvo.age_70}+${mvo.age_80}+${mvo.age_90};
				var womanp = ${wvo.age_10}+${wvo.age_20}+${wvo.age_30}+${wvo.age_40}+${wvo.age_50}+${wvo.age_60}+${wvo.age_70}+${wvo.age_80}+${wvo.age_90};
				//convas
				var ctx = document.getElementById('chart-area').getContext('2d');
				//설정
				var myPieChart = new Chart(ctx,{
				    type: 'pie',
				    data: {
				    	 labels: ["여성", "남성"],
				    datasets: [{
				    	label: '# of Votes',
				    	data : [womanp,manp],
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
				var monthdata = new Array;
				monthdata = [];
				var monthcount = 0;
				for (var i=30;i>0;i--) {
					datelist.push(moment().subtract(i, 'days').format('YYYY-MM-DD'));
				}
					//각각의 한번마다 30번씩 배열 돌림
					for (var j=datelist.length-1;j>-1;j--) {
						var val = 0;
						for(var i=0;i<mlist.length;i++){
							
						//만약 30번의 배열중 12번도는 배열의 값과 일치할경우
						if(datelist[j] == mlist[i].member){
							//monthdata 배열에 카운트 추가
							val += mlist[i].count;
							var moco = 0;
							moco += parseInt(monthcount) + parseInt(mlist[i].count);
							monthcount = moco;
						}
					}
						monthdata.push(val);
				};
					$('#monthcount').text(monthcount);
				
				var cfg = {
						type: 'bar',
						data: {
							labels: datelist,
							datasets: [{
								label: '한달 간 가입회원 수',
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