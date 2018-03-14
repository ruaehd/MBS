<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<style>
 .search_panel{
       		z-index:5;
       		position:absolute;
       		top:0px;
       		left:80px
       }
 .map_background{
        		background-image: url("resources/imgs/b1.jpg") !important;
        		height: 88vh !important;
        	}
</style>
	<div class="map_background">
		<div class="row" style="margin-top:68px;">
		
		 <div class="col-md-9">
		<div id="map_kakao" class="form-control map" style="width:100%;height:88vh;left:0;margin-left:0;margin-right:0"></div>
		</div>
		<div class="col-md-3 w3-light-gray w3-border" style="height:88vh;overflow:auto;width:100%">
		<div align="center">
			<input type="button" id="button-search-light-panel"class="btn btn-default" value="검색옵션 열기"/>
		</div>
			<div id="search-light-panel" class="" style="font-size:12px;margin-top:20px">
				<div class="form-inline" style="margin-bottom:10px;vertical-align:middle">
			<div class="form-group" style="width:30%;margin-top:5px">
				<p>종류</p>
			</div>
			<div class="form-group " style="width:30%;">
				<input type="button" class="w3-button w3-border w3-white w3-hover-white w3-round select_category" value="관광지"/>
			</div>
			<div class="form-group" style="width:30%;">
				<input type="button" class="w3-button w3-border w3-white w3-hover-white w3-round select_category" value="음식점"/>
			</div>
		</div>
		<div class="form-inline" style="margin-bottom: 10px;">
			<div class="form-group" style="width:20%">주소</div>
			<div class="form-group" style="width:75%">
				<input type="text" class="w3-border w3-input w3-round" style="width:100%"
					placeholder="주소를 입력해주세요" />
			</div>
		</div>
		<div class="form-inline" style="margin-bottom: 10px">
			<div class="form-group" style="width:20%">예약일</div>
			<div class="form-group" style="width:75%">
				<input type="text" class="w3-border w3-input w3-round" style="width:100%" id="datepicker" />
			</div>
		</div>
		<div class="form-inline" style="margin-bottom:20px">
			<div class="form-group" style="width:20%">가격</div>
			<div class="form-group" style="width:75%">
			<input type="text" id="amount" readonly class="w3-border w3-input w3-round">
			</div>
			</div>
		
	<div id="slider-range" style="margin-bottom:10px; width:100%;"></div>
	<input type="submit" id="search_panel_button" style="width:100%" class="btn btn-default" value="검색"/>
	</div>
	
	
			
			<div  style="width:100%;padding:20px;" align="center">
				<c:forEach begin="1" end="5">
				<div style="width:100%">
					<div style="width:80%; height:150px" >
						<a href="user_content.do"><img src="resources/imgs/12.JPG" style="width:100%; height:100%"/></a>
					</div>
						<div align="center">
							<h4><b>음식점</b></h4>
							<p style="font-size:12px">부산광역시 가나다</p>
							<p style="font-size:12px">1인 8,600원</p>
						</div>
					</div>
					</c:forEach>
				</div>
				</div>
				</div>
				</div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66e7156b3899e012effaa62fd20217d4"></script>
		<script>
		/* 카카오 지도 api */
		var container = document.getElementById('map_kakao');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
		var map = new daum.maps.Map(container, options);
		</script>
		<script>
		/* 가격 슬라이드  */
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
			jQuery( "#amount" ).val($( "#slider-range" ).slider( "values", 0 ) + "원  - "
					 + $( "#slider-range" ).slider( "values", 1 )+"원");
			
		});
		</script>
		<script>
		$(function(){
			$('#datepicker').datepicker({
				dateFormat:"yy-mm-dd",
				changeMonth: true,
				changeYear: true,
				dayNamesMin:['일','월','화','수','목','금','토'],
				showMonthAfterYear:true
			});
			
			$('.select_category').click(function(){
				var sci = $(this).index('.select_category');
				
				if($('.select_category').eq(sci).hasClass('w3-white')){
				$('.select_category').eq(sci).removeClass('w3-white');
				$('.select_category').eq(sci).removeClass('w3-hover-white');
				$('.select_category').eq(sci).addClass('w3-blue');
				$('.select_category').eq(sci).addClass('w3-hover-blue');
				}
				else if($('.select_category').eq(sci).hasClass('w3-blue')){
					$('.select_category').eq(sci).removeClass('w3-blue');
					$('.select_category').eq(sci).removeClass('w3-hover-blue');
					$('.select_category').eq(sci).addClass('w3-white');
					$('.select_category').eq(sci).addClass('w3-hover-white');
				}
			});
			$('#search-light-panel').hide();
			$('#button-search-light-panel').click(function(){
				$('#search-light-panel').slideToggle(300);
				var se = $(this).val();
				if(se == '검색옵션 닫기'){
					$(this).val('검색옵션 열기')
				}
				if(se == '검색옵션 열기'){
					$(this).val('검색옵션 닫기')
				}
			})
		});
		</script>
		<jsp:include page="footer.jsp"></jsp:include>
		