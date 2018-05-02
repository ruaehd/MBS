<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>예약통계</title>
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
				<div class="title">예약통계</div>
				<div class="row">
					<div class="col-md-4" align="center" style="margin: 150px auto">
						<div id="titletext">
							
							<h2>
								<b id="resercount">현재 ${nowcount}개의 예약이 진행중입니다</b>
							</h2>
							<h2 style="margin-top: 150px">
							<b id="resernowcount">현재까지 ${allcount}개의 예약이 완료되었습니다</b>
							<canvas id="linecanvas"></canvas>
							</h2>
							<div id="text"></div>
						</div>
					</div>
					<div class="col-md-8" style="margin: 0px auto">
						<div class="form-horizontal form-inline">
							<div class="form-group form-group-lg" style="width: 100%"
								align="center">
								<input type="text" style="width: 80%" class="form-control" id="searchval" placeholder="예약 통계 조회를 위한 업체명을 입력해주세요" />
								<button type="button" class="form-control" id="search_btn">검색</button>
								<div style="overflow: auto; height: 800px">
								<table class="table table-striped" id="table">
								</table>
								</div>
							</div>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="resources/js/Chart.bundle.js"></script>
<script>
	$(function(){
		$('#linecanvas').hide();
		var ctx = document.getElementById('linecanvas').getContext('2d');
		
		function func1() {
			weekdatelist = [];
			weekdata = [];
			if($('#searchval').val() == ""){
				$('#table').empty();
				$('#canvas').hide();
				$('#linecanvas').hide();
				$('#resercount').text("현재 ${nowcount}개의 예약이 진행중입니다");
				$('#resernowcount').text("현재까지 ${allcount}개의 예약이 완료되었습니다");
				$('#text').text("");
				return null;
			}
			if($('#searchval').val() != null){
			var name = $('#searchval').val();
			console.log(name);
			$.post('ajax_weekreservation.do',{'name':name},function(wvo){
				var weekdatelist = new Array;
				var weekdata = new Array;
				
				for (var i=7;i>0;i--) {
					weekdatelist.push(moment().subtract(i, 'days').format('YYYY-MM-DD'));
				}
				weekdata = [wvo.day_7,wvo.day_6,wvo.day_5,wvo.day_4,wvo.day_3,wvo.day_2,wvo.day_1];
				var config1 = {
						type: 'line',
						data: {
							labels: weekdatelist,
							datasets: [{
								label: '인원',
								backgroundColor: 'rgba(000, 102, 153, 0.6)',
								borderColor: 'rgba(000, 102, 153, 0.6)',
								data: weekdata,
								fill: false
								
							}]
						},
						options: {
							responsive: true,
							title: {
								display: true,
								text: '일주일간 예약자 현황'
							},
							tooltips: {
								mode: 'index',
								intersect: false,
							},
							hover: {
								mode: 'nearest',
								intersect: true
							}
						}
					};
				console.log(wvo);
				
				if(wvo.day_1 == 0 && wvo.day_2 == 0&& wvo.day_3 == 0 && wvo.day_4 == 0&& wvo.day_5 == 0 && wvo.day_6 == 0 &&wvo.day_7 == 0){
					$('#resercount').text("입력하신 검색어에 대한 정보가");
					$('#resernowcount').text("존재하지 않습니다");
					$('#linecanvas').hide();
					return null;
				};
					$('#linecanvas').show();	
					window.myLine = new Chart(ctx, config1);	
			});
			}
		}
		function func() {
			if($('#searchval').val() == ""){
				$('#table').empty();
				$('#linecanvas').hide();
				$('#resercount').text("현재 ${nowcount}개의 예약이 진행중입니다");
				$('#resernowcount').text("현재까지 ${allcount}개의 예약이 완료되었습니다");
				$('#text').text("");
				return null;
			}
			if($('#searchval').val() != null){
			var name = $('#searchval').val();
			$.post('ajax_searchreservation.do',{'name':name},function(list){
				var soon = 0;
				var already = 0;
				var fail = 0;
				$('#text').text("");
				$('#table').empty();
				if(list.length != 0){
				$('#table').append('<tr align="center">'+
						'<td>예약번호</td>'+
						'<td>예약구분</td>'+
						'<td>업체명</td>'+
						'<td>예약일자</td>'+
						'<td>예약인원</td>'+
						'<td>예약자</td>'+
						'<td>예약자 이메일</td>'+
						'<td>예약한 날짜</td>');
				for(var i=0;i<list.length;i++){
					var code = list[i].rsv_code;
					var codecontent = null;
						if(code == 1){
							codecontent ='<td><font color="green">이용예정</font></td>';
							soon += 1;
							}
						if(code == 2){ 
							codecontent ='<td><font color="blue">이용완료</font></td>';
							already += 1;
							}
						if(code == 3){
							codecontent ='<td><font color="red">예약취소</font></td>';
							fail += 1;
							}
					$('#table').append('<tr>'+
							'<td>'+list[i].rsv_no+'</td>'+
							codecontent+
							'<td>'+list[i].str_name+'</td>'+
							'<td>'+list[i].rsv_day+'</td>'+
							'<td>'+list[i].rsv_personnel+'</td>'+
							'<td>'+list[i].rsv_sub_id+'</td>'+
							'<td>'+list[i].rsv_sub_email+'</td>'+
							'<td>'+list[i].rsv_date+'</td>');
				}
				$('#text').append('<br/><h4><b>총 예약 통계</b><br/><br/><font color="green">이용예정 :</font>'+soon+',<font color="blue">이용완료 :</font>'+already+
						',<font color="red">예약취소 :</font>'+fail+'</h4>');
				$('#resercount').text("");
				$('#resernowcount').text("");
				window.myBar = new Chart(ctx1, config);
				$('#canvas').show();
				};
				if(list.length == 0){
					$('#resercount').text("입력하신 검색어에 대한 정보가");
					$('#resernowcount').text("존재하지 않습니다");
					$('#linecanvas').hide();
					$('#text').text("");
				};
			});
			return null;
			}
			
		}
		$('#search_btn').click(function(){
			func();
			func1();
		});
		$('#searchval').keydown(function(key){
			if (key.keyCode == 13) {
				func();
				func1();
			}
		});
		
		var rlist = new Array();
		<c:forEach items="${rlist}" var="vo">
			var json = new Object();
			json.reservation="${vo.reservation}";
			json.count="${vo.count}";
			rlist.push(json);
		</c:forEach>
		
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
				for(var i=0;i<rlist.length;i++){
					
				//만약 30번의 배열중 12번도는 배열의 값과 일치할경우
				if(datelist[j] == rlist[i].reservation){
					//monthdata 배열에 카운트 추가
					val += rlist[i].count;
					var moco = 0;
					moco += parseInt(monthcount) + parseInt(rlist[i].count);
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
							label: '한달 간 총 예약수',
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
	});
</script>

</body>
</html>