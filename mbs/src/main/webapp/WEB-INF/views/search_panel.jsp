<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	
<script>
		jQuery(function($) {
			$( "#slider-range" ).slider({
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
			$('#datepicker').datepicker({
				dateFormat:"yy-mm-dd",
				changeMonth: true,
				changeYear: true,
				dayNamesMin:['일','월','화','수','목','금','토'],
				showMonthAfterYear:true
			});
			
		});
</script>
<div style="margin-top:68px" id="search_panel" class="search_panel" style="margin:0px auto">
<div style="margin:0px auto; width: 80%;" class="w3-round w3-border w3-white">
	<div class="container" style="padding:10px">
		<div class="form-inline" style="margin-bottom: 10px">
			<div class="form-group" style="width: 100px;vertical-align:middle;">
				<p>종류</p>
			</div>
			<div class="form-group" style="width: 100px;">
				관광지<input type="checkbox" />
			</div>
			<div class="form-group" style="width: 100px;">
				음식점<input type="checkbox"/>
			</div>
		</div>
		<div class="form-inline" style="margin-bottom: 10px">
			<div class="form-group" style="width: 100px;">주소</div>
			<div class="form-group">
				<input type="text" class="w3-border w3-input w3-round" style="width:668px"
					placeholder="주소를 입력해주세요" />
			</div>
		</div>
		<div class="form-inline" style="margin-bottom: 10px">
			<div class="form-group" style="width: 100px">예약일</div>
			<div class="form-group">
				<input type="text" class="w3-border w3-input w3-round" style="width: 100px" id="datepicker" />
			</div>
		</div>
		<!-- if(주소가 web_main 일때만 표시) -->
		<div class="form-inline" style="margin-bottom: 10px">
			<div class="form-group" style="width: 100px">검색범위</div>
				<div class="form-group">
				<select class="w3-input w3-border w3-round">
					<option>1km</option>
					<option>5km</option>
					<option>10km</option>
					<option>20km</option>
					<option>50km</option>
					<option>100km</option>
				</select>
			</div>
		</div>
		
		<p>
			<label for="amount">가격:</label>
			<input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
		</p>
		
	<div id="slider-range" style="margin-bottom:10px; width:80%"></div>
	</div>
	<input type="submit" id="search_panel_button" style="width:100%" class="btn btn-default" value="검색"/>
	</div>
</div>