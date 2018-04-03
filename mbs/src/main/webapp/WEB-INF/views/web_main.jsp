<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66e7156b3899e012effaa62fd20217d4&libraries=services"></script>
<script>
	jQuery(function($) {
			$ ("#slider-range").slider({
				range: true,
				min: 0,
				max: 500000,
				values: [ 0, 200000 ],
				slide: function( event, ui ) {
					$( "#amount" ).val(  ui.values[ 0 ] + "원  ~ " + ui.values[ 1 ] + "원");
				}
			});
			jQuery( "#amount" ).val($( "#slider-range" ).slider( "values", 0 ) + "원  ~ "
					 + $( "#slider-range" ).slider( "values", 1 )+"원");
		$('#datepicker').datepicker({
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			changeYear : true,
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			showMonthAfterYear : true
		});
	});
</script>
<script>
 $(function(){
	 $('.select_category').click(function() {
			var sci = $(this).index('.select_category');

			if ($('.select_category').eq(sci).hasClass('w3-white')) {
				$('.select_category').eq(sci).removeClass('w3-white');
				$('.select_category').eq(sci).removeClass('w3-hover-white');
				$('.select_category').eq(sci).addClass('w3-blue');
				$('.select_category').eq(sci).addClass('w3-hover-blue');
			} else if ($('.select_category').eq(sci).hasClass('w3-blue')) {
				$('.select_category').eq(sci).removeClass('w3-blue');
				$('.select_category').eq(sci).removeClass('w3-hover-blue');
				$('.select_category').eq(sci).addClass('w3-white');
				$('.select_category').eq(sci).addClass('w3-hover-white');
			}
		});
		$('#search_panel_button').click(function(){
			$('#joincontent').empty();
			$('#contentlist').empty();
				var tr = 0;
				var fo = 0;
			if($('#travel').hasClass('w3-blue')){
				tr = 1;
			}
			if($('#food').hasClass('w3-blue')){
				fo = 2;
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
			var lng = 0;
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(addr, function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			     if (status === daum.maps.services.Status.OK) {
			        var lat = result[0].x;
					var lng = result[0].y;
					console.log(lng);
					console.log(lat);
					console.log(tr);
					console.log(fo);
					$.ajaxSettings.traditional = true;
					$.post("ajax_web_main_search.do",	{"tr":tr,"fo":fo,"addr":addr,"date":date,"ps":ps,"pe":pe,"lat":lat,"lng":lng,"ra":ra},function(datalist){
							
							for(var i=0;i<datalist.length;i++){
								var cate = 0;
								if(datalist[i].category == 1){
									cate = '관광지';
								}
								else if(datalist[i].category == 2){
									cate = '음식점';
								}
								console.log(cate);
								//============================리스트 내용 수정 중 ============================
								$('#contentlist').append(
									'<div class="w3-round w3-white">' +
										'<h4>'+datalist[i].name+'</h4>'+
										'<span color="gray">'+datalist[i].address+'</span>'+
										'<div class="row"  style="padding:10px">'+
											'<div class="col-md-4">'+
												'<img class="'+datalist[i].number+'"src="getBlobImg.do?no='+ datalist[i].number +'" align="left" style="width:100%;height:150px;z-index:1;"/>'+
											'</div>'+
											'<div class="col-md-8">'+
												'<div class="w3-green w3-round" style="margin-bottom:10px">'+cate+'</div>'+
												'<div><h4><b><span style="width:200px">대표메뉴 :</span>'+datalist[i].menu+''+datalist[i].menu_price+'원</b></h4></div>'+
												'<div><span style="width:200px">예약가능시간 :</span><p>'+datalist[i].starttime+' ~ '+datalist[i].endtime+'</p></div>'+
												'<div><span style="width:200px">전화번호 :</span><p>'+datalist[i].tel+'</p></div>'+
												
											'</div>'+
										'</div>'+
									'</div>'
									);
								}
					},'json');
			        // 결과값으로 받은 위치를 마커로 표시합니다
			     }
			});
			if(lng != 0){
				console.log(lng);
				
			};
			
		}); 
 });
</script>
<style>
body{
	background-color:#eeeeee
}
</style>
<div style="margin: 68px auto; width: 80%" class="row">
	<div class="col-md-4">
		<div class="w3-round w3-white" style="padding:10px">
		<div align="center">
			<h4 style="margin-top:20px">검색</h4>
			<hr />
		</div>
		<div class="container">
			<div class="form-inline" style="margin-bottom: 20px">
				<div class="form-group"
					style="width: 100px; vertical-align: middle;" align="center">
					카테고리</div>
				<div class="form-inline" align="center">
					<input type="button" style="width: 50%; height: 30px;"
						class="select_category w3-button w3-round w3-white w3-border"
						value="관광지" id="travel" /> <input type="button"
						style="width: 50%; height: 30px"
						class="select_category w3-button w3-round w3-white w3-border"
						value="음식점" id="food" />
				</div>
			</div>
			<div class="form-inline" style="margin-bottom: 20px">
				<div class="form-group" style="width: 100px;" align="center">주소</div>
				<div class="form-group" style="width: 80%">
					<input type="text" id="sample4_roadAddress"
						onclick="sample4_execDaumPostcode()" style="width: 20%; border: 0"
						value="" placeholder="주소를 입력해주세요" readonly />
				</div>
			</div>
			<div class="form-inline" style="margin-bottom: 20px">
				<div class="form-group" style="width: 100px" align="center">예약일</div>
				<div class="form-group" style="width:80%">
					<input type="text" style="width: 20%; border: 0;" id="datepicker"
						placeholder="예약일을 정해주세요" />
				</div>
			</div>
			<div class="form-inline" style="margin-bottom: 20px">
				<!-- if(주소가 web_main 일때만 표시) -->
				<div class="form-group" style="width: 100px" align="center">검색범위</div>
				<div class="form-group">
					<select style="border: 0;" id="range">
						<option>1km</option>
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
					<div class="form-group" style="width: 100px" align="center">가격</div>
				</div>
				<div class="form-group">
					<input type="text" id="amount" readonly
						style="border: 0; width: 150px">
				</div>
				</div>
			
			<div id="slider-range" style="margin-bottom: 10px; width: 25%"></div>
		</div>
		<div align="center">
			<input type="button" id="search_panel_button"
				style="width: 80%; margin: 10px 0;" class="btn btn-default"
				value="검색" />
		</div>
		</div>
		</div>
	<div class="col-md-offset-1 col-md-7">
	<div id="contentlist"></div>
	<div id="joincontent">
		<div  class="w3-round w3-white " align="center" style="height:22vh;padding:10px">
		<h3>입력하신 주소를 기준으로<br/><br/>검색범위만큼 검색합니다</h3>
		</div>
	</div>
	
	</div>
</div>

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

<jsp:include page="footer.jsp"></jsp:include>