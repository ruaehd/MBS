<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>Google Nexus Website Menu</title>
	<link rel="stylesheet" type="text/css" href="resources/css/component.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/w3.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css"/>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="resources/css/jquery-ui.min.css" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="resources/css/daterangepicker.css" />
	<style>
		.container{
			z-index:2;
		}
		.gn-menu-main{
			z-index:10;
		}
	</style>
</head>
<body style="background-image: url('resources/imgs/dust_scratches.png'); height: 100vh">
	<div class="wrapper">
		<jsp:include page="v1_header.jsp"></jsp:include>
		<div id="main">
			<div style="margin: 68px auto; width:80%; " class="row">
				<div class="col-md-4">
					<div class="w3-dark-gray w3-white w3-border-black w3-round-large" style="padding:10px">
						<div align="center">
							<h4 style="margin-top:20px">검색</h4>
							<hr />
						</div>
						<div>
							<div class="form-inline" style="margin-bottom: 20px">
								<div class="form-group" style="width: 70px; vertical-align: middle;" align="center">
									카테고리
								</div>
								<div class="form-group form-inline" align="center"> 
									<input type="button" 
										style="width: 80px; height: 30px; margin-right:20px;padding:5px" 
										class="select_category w3-button w3-round w3-pale-green w3-hover-green"
										value="관광지" id="travel" /> 
									
									<input type="button"
										style="width: 80px; height: 30px;padding:5px"
										class="select_category w3-button w3-round w3-pale-blue w3-hover-blue"
										value="음식점" id="food" />
								</div>
							</div>
							<div class="form-inline" style="margin-bottom: 20px">
								<div class="form-group" style="width: 70px;" align="center" >주소</div>
								<div class="form-group">
									<input type="text" id="sample4_roadAddress" class="w3-dark-gray" onclick="sample4_execDaumPostcode()"
										 style="width:300px; border: 0"
										value="부산시 강서구 가달1로 7 (생곡동)" placeholder="주소를 입력해주세요" readonly/>
								</div>
							</div>
							<div class="form-inline" style="margin-bottom: 20px">
								<div class="form-group" style="width: 70px" align="center">예약일</div>
								<div class="form-group">
									<input type="text" style=" border:0;" id="datepicker" class="w3-dark-gray"
										placeholder="예약일을 정해주세요" readonly/>
								</div>
							</div>
							<div class="form-inline" style="margin-bottom: 20px">
								<!-- if(주소가 web_main 일때만 표시) -->
								<div class="form-group" style="width: 70px" align="center">검색범위</div>
								<div class="form-group">
									<select style="border: 0;" id="range" class="w3-dark-gray">
										<option>5km</option>
										<option>10km</option>
										<option>20km</option>
										<option>50km</option>
										<option>100km</option>
									</select>
								</div>
							</div>
							<div class="form-inline" style="margin-bottom: 20px">
								<div class="form-group">
									<div class="form-group" style="width: 70px" align="center">가격</div>
								</div>
								<div class="form-group">
									<input type="text" id="amount" readonly class="w3-dark-gray"
										style="border: 0; width: 150px">
								</div>
								</div>
							
							<div id="slider-range" style="margin:10px 30px"></div>
						</div>
						<div align="center">
							<input type="button" id="search_panel_button" style="width: 80%; margin: 10px 0;" class="btn btn-default" value="검색" /> 
						</div>
					</div>
				</div>
				<div class="col-md-offset-1 col-md-7">
					<div id="joincontent" >
						<div  class="w3-border w3-white" align="center" style="height:50vh;padding:30px">
						<img src="resources/imgs/glass.png" style="width:25%; height:20vh;margin-bottom:10px"/>
						<h3>입력하신 주소를 기준으로<br/><br/>검색범위만큼 검색합니다</h3>
						</div>
					</div>
					<div id="contenthead"></div>
					<div id="contentlist" style="overflow-x:hidden;overflow-y:auto"></div> 
				</div>
			</div>
			<jsp:include page="v1_footer.jsp"></jsp:include>
		</div>
	</div>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66e7156b3899e012effaa62fd20217d4&libraries=services"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script type="text/javascript" src="resources/js/moment.js"></script>
	<script type="text/javascript" src="resources/js/daterangepicker.js"></script>
	<script>
		jQuery(function($) {
				$ ("#slider-range").slider({
					range: true,
					min: 0,
					max: 200000,
					values: [ 0, 200000 ],
					slide: function( event, ui ) {
						$( "#amount" ).val(  ui.values[ 0 ] + "원  ~ " + ui.values[ 1 ] + "원");
					}
				});
				jQuery( "#amount" ).val($( "#slider-range" ).slider( "values", 0 ) + "원  ~ "
						 + $( "#slider-range" ).slider( "values", 1 )+"원");
		});
	</script>
	<script>
	 $(function(){
		 $('#datepicker').daterangepicker({
	    		singleDatePicker: true,
	    	    showDropdowns: true,
	    	    locale: {
	            format: 'YYYY-MM-DD',
	            applyLabel: '적용',
	            cancelLabel: '취소',
	            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	            daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
	  				  }
	      });
		 $('#travel').click(function(){
			if($(this).hasClass('w3-white')){
				$(this).removeClass('w3-white w3-hover-white w3-border');
				$(this).addClass('w3-pale-green w3-hover-green');
			}
			else if($(this).hasClass('w3-pale-green')){
				$(this).removeClass('w3-pale-green w3-hover-green');
				$(this).addClass('w3-white w3-hover-white w3-border');
			}
		 });
		 $('#food').click(function(){
				if($(this).hasClass('w3-white')){
					$(this).removeClass('w3-white w3-hover-white w3-border');
					$(this).addClass('w3-pale-blue w3-hover-blue');
				}
				else if($(this).hasClass('w3-pale-blue')){
					$(this).removeClass('w3-pale-blue w3-hover-blue');
					$(this).addClass('w3-white w3-hover-white w3-border');
				}
			 });
			$('#search_panel_button').click(function(){
				$('#joincontent').empty();
				$('#contenthead').empty();
				$('#contentlist').empty();
					var tr = 0;
					var fo = 0;
				if($('#travel').hasClass('w3-pale-green')){
					tr = 2;
				}
				if($('#food').hasClass('w3-pale-blue')){
					fo = 1;
				}
				var addr = $('#sample4_roadAddress').val();
				
				var pr = $('#amount').val();
				var price = pr.split('원  ~ ',2);
				for(var i=0;i<=1;i++){
					if(i == 0){
						var ps = price[0];
					}
					if(i == 1){
						var pe = price[1];
						pe = pe.substring(0,pe.length-1);
					}
				}
				var date = $('#datepicker').val();
				var addr = $('#sample4_roadAddress').val();
				var ra = $('#range').val();
				ra = ra.substring(0,ra.length-2);
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new daum.maps.services.Geocoder();
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(addr, function(result, status) {
				    // 정상적으로 검색이 완료됐으면 
				     if (status === daum.maps.services.Status.OK) {
				        var lat = result[0].x;
						var lng = result[0].y;
						$.ajaxSettings.traditional = true;
						$.post("ajax_web_main_search.do",	{"tr":tr,"fo":fo,"addr":addr,"date":date,"ps":ps,"pe":pe,"lat":lat,"lng":lng,"ra":ra},function(datalist){
								if(datalist.length == 0 || datalist.length == null){
								$('#contentlist').append(
										'<div class="w3-white" align="center" style="height:22vh;padding:10px">'+
										'<h3>검색 결과가 존재하지 않습니다<br/><br/>검색 옵션을 확인해주세요</h3>'+
										'</div>'
										);
								}
								else{
								$('#contenthead').append(
										'<div class="w3-white w3-border" style="padding:10px;margin-bottom:20px;width:100%" align="center">' +
										'<font style="font-size:20px">'+addr+'</font>기준<br/><font style="font-size:20px">'+ra+'km</font> 내에 <br/>'+datalist.length+'개의 정보가 있습니다.</h4>'+
										'</div>'
										);
								for(var i=0;i<datalist.length;i++){
									var cate = 0;
									if(datalist[i].category == 1){
										cate = '음식점';
									}
									if(datalist[i].category == 2){
										cate = '관광지';
									}
									
									var st1 = datalist[i].starttime.substring(0,2);
									var et1 = datalist[i].endtime.substring(0,2);
									var dis = datalist[i].distance.substring(0,4);
									if(datalist[i].tel.length == 10){
										var tel1 = datalist[i].tel.substring(0,3);
										var tel2 = datalist[i].tel.substring(3,6);
										var tel3 = datalist[i].tel.substring(6,10);	
									}
									if(datalist[i].tel.length == 11){
										var tel1 = datalist[i].tel.substring(0,3);
										var tel2 = datalist[i].tel.substring(3,7);
										var tel3 = datalist[i].tel.substring(7,11);	
									}
									var element = document.getElementById("contentlist");
							         element.style.height = "80vh";
									$('#contentlist').append(
										'<div class="w3-border w3-white" style="padding:10px;margin-bottom:20px;width:100%">' +
											'<h4><b>'+datalist[i].name+'</b></h4>'+
										'<div class="row" style="width:100%">'+
											'<div class="col-md-10"><span color="gray" style="margin-bottom:10px">'+datalist[i].address+'</span></div>'+
											'<div class="col-md-2"><font color="gray" style="font-size:10px">약'+dis+'km</font></div>'+
										'</div>'+
											'<div class="row" >'+
												'<div class="col-md-4">'+
													'<img class="'+datalist[i].number+'"src="get_blob_img.do?str_number='+ datalist[i].number +'&idx=0" align="left" style="width:100%;height:170px;z-index:1;border:1px solid #cccccc"/>'+
													'<a href="usr_content.do?str_number='+datalist[i].number+'" style="width:100%"><button class="w3-button btn_con" style="width:100%">상세화면</button></a>'+								
													'</div>'+
												'<div class="col-md-8">'+
													'<div class="w3-round bar_con" style="margin-bottom:20px;padding:5px">'+cate+'</div>'+
													'<div class="menu_con"><div style="width:120px;float:left">대표메뉴 :</div>'+datalist[i].menu+' - '+datalist[i].menu_price+'<hr/></div>'+
													'<div style="width:120px;float:left">예약가능시간 :</div>'+st1+'시 ~ '+et1+'시<hr/>'+
													'<div style="width:120px;float:left">전화번호 :</div>'+tel1+tel2+tel3+
												'</div>'+
											'</div>'+
										'</div>'
										);
									if(datalist[i].category == 2){
										$('.menu_con').eq(i).empty();
									}
									if(datalist[i].category == 1){
										$('.btn_con').eq(i).addClass('w3-green w3-hover-green');
										$('.bar_con').eq(i).addClass('w3-green');
									}
									else if(datalist[i].category == 2){
										$('.btn_con').eq(i).addClass('w3-blue w3-hover-blue');
										$('.bar_con').eq(i).addClass('w3-blue');
									}
									}
								
								}
						},'json');
				     }
				});		
			}); 
	 });
	</script>

<script>
function sample4_execDaumPostcode() {
	$('#sample4_roadAddress').val("");
	new daum.Postcode(
			{
				oncomplete : function(data) {

					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					document.getElementById('sample4_roadAddress').value = fullRoadAddr;

					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					if (data.autoRoadAddress) {
						//예상되는 도로명 주소에 조합형 주소를 추가한다.
						var expRoadAddr = data.autoRoadAddress
								+ extraRoadAddr;
						document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
								+ expRoadAddr + ')';

					} else if (data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
								+ expJibunAddr + ')';

					} else {
						document.getElementById('guide').innerHTML = '';
					}
				}
			}).open();
}
</script>
</body>
</html>
