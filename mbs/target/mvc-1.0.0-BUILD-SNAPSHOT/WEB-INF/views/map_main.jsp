<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
	<link rel="stylesheet" href="resources/css/daterangepicker.css" />
	<style>
		.map_wrap, .map_wrap * {margin:0;padding:0;}
		.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
		.map_wrap {position:relative;width:100%;height:70vh;}
		#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:350px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;overflow-x:hidden;}
		.bg_white {background:#fff;}
		#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
		#menu_wrap .option{text-align: center;}
		#menu_wrap .option p {margin:10px 0;}  
		#menu_wrap .option button {margin-left:5px;}
		#placesList li {list-style: none;}
		#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
		#placesList .item span {display: block;margin-top:4px;}
		#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		#placesList .item .info{padding:10px 0 10px 55px;}
		#placesList .info .gray {color:#8a8a8a;}
		#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
		#placesList .info .tel {color:#009900;}
		#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
		#placesList .item .marker_1 {background-position: 0 -10px;}
		#placesList .item .marker_2 {background-position: 0 -56px;}
		#placesList .item .marker_3 {background-position: 0 -102px}
		#placesList .item .marker_4 {background-position: 0 -148px;}
		#placesList .item .marker_5 {background-position: 0 -194px;}
		#placesList .item .marker_6 {background-position: 0 -240px;}
		#placesList .item .marker_7 {background-position: 0 -286px;}
		#placesList .item .marker_8 {background-position: 0 -332px;}
		#placesList .item .marker_9 {background-position: 0 -378px;}
		#placesList .item .marker_10 {background-position: 0 -423px;}
		#placesList .item .marker_11 {background-position: 0 -470px;}
		#placesList .item .marker_12 {background-position: 0 -516px;}
		#placesList .item .marker_13 {background-position: 0 -562px;}
		#placesList .item .marker_14 {background-position: 0 -608px;}
		#placesList .item .marker_15 {background-position: 0 -654px;}
		#pagination {margin:10px auto;text-align: center;}
		#pagination a {display:inline-block;margin-right:10px;}
		#pagination .on {font-weight: bold; cursor: default;color:#777;}
		li{list-style-type:none;}
	</style>
</head>
<body>	
	<div class="map_wrap" style="margin-top:58px">
	   	<jsp:include page="v1_header.jsp"></jsp:include>
	   	<div id="main">
		    <div id="map" style="width:100%;height:93vh;position:relative;"></div>
		
		    <div id="menu_wrap" class="bg_white">
		        <div class="option">
					<div>
						<form onsubmit="searchPlaces(); return false;">
							<input type="button" id="search_button" class="form-control" value="검색옵션 열기"/>
							<div id="search_panel">
								<div class="row" align="center" style="margin-top:10px;" >
									<div class="col-md-6">
										<input type="button" class="select_category form-control w3-button w3-round w3-border w3-pale-green w3-hover-green" value="관광지" id="travel"/>
									</div>
									<div class="col-md-6"> 
										<input type="button" class="select_category form-control w3-button w3-round w3-border w3-pale-blue w3-hover-blue" value="음식점" id="food"/>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-6">
										예약일 <input type="text" class="form-control w3-white" value="" placeholder="예약일을 선택해주세요" readonly size="15"  id="datepicker"/>
									</div>
									<div class="col-md-6">
										<div align="center">가격</div>
										<div align="center">
											<input type="text" id="amount" readonly class="w3-border-bottom w3-round form-control w3-white">
										</div>
									</div>
								</div>
								
								<div id="slider-range" style="margin:10px 0px 10px 5%; width: 90%;"></div>
								<input type="button" class="form-control" id="search_submit" value="이 조건으로 검색하기"/>
								
							</div>
						</form>
						<div id="content"></div>
					</div>
				</div>
			</div>
		    <hr>
		    <ul id="placesList" ></ul>
		    <div id="pagination"></div>
	    </div>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66e7156b3899e012effaa62fd20217d4&libraries=services"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script type="text/javascript" src="resources/js/moment.js"></script>
	<script type="text/javascript" src="resources/js/daterangepicker.js"></script>
    <script>
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
		/* 가격 슬라이드  */
		jQuery(function($) {
			$ ("#slider-range").slider({
				range: true,
				min: 0,
				max: 100000,
				values: [ 0, 100000 ],
				slide: function( event, ui ) {
					$( "#amount" ).val(  ui.values[ 0 ] + "원  ~ " + ui.values[ 1 ] + "원");
				}
			});
			jQuery( "#amount" ).val($( "#slider-range" ).slider( "values", 0 ) + "원  ~ "
					 + $( "#slider-range" ).slider( "values", 1 )+"원");
			
		});
		$(function(){
			// 처음 접속시 모든 정보들을 화면 크기에 맞춰 불러옴 so = south, we = west , no = north , ea = east 
			$.post("ajax_main_join.do",	{"so":35.20484801698,"we":129.06638522570043,"no":35.20998700540691,"ea":129.07414659996573},function(datalist){
				//content id 를 listEl 에 element 방식으로 저장 = listEl 에 itemEl을 추가하는  방식
				var listEl = document.getElementById('content'),
				fragment = document.createDocumentFragment(),
				bounds = new daum.maps.LatLngBounds();
				//결과값의 길이만큼 반복문 생성
				for(i=0;i<datalist.length;i++){
					//placePosition = 마커의 위치를 지정하는 변수 , 결과값의 위도,경도 값 저장
			        var placePosition = new daum.maps.LatLng(datalist[i].lat,datalist[i].lng),
			        //마커에 1,2 형식으로 숫자 띄우고 위치 지정
			            marker = addMarker(placePosition, i);
			        	itemEl = getListItem(i,datalist[i]);//검색 결과 항목 Element생성
			        	//결과값 목록에 마우스 온오버 이벤트 지정
			            (function(marker, datalist) {
			                daum.maps.event.addListener(marker, 'mouseover', function() {
			                    displayInfowindow(marker, datalist);
			                });
			                daum.maps.event.addListener(marker, 'mouseout', function() {
			                    infowindow.close();
			                });
			                itemEl.onmouseover =  function () {
			                    displayInfowindow(marker, datalist);
			                };
			                itemEl.onmouseout =  function () {
			                    infowindow.close();
			                };
			            })(marker, datalist[i]);
			        	// itemEl 리턴
			            fragment.appendChild(itemEl);
					};
					//listEl 리턴
					listEl.appendChild(fragment);
			//실질적으로 목록에 들어가는 div , append 함수와 동일하게 적용됨
			 function getListItem(index,datalist){
				 var el = document.createElement('li'),
				    itemStr =
				    	'<a href="usr_content.do?str_number='+datalist.number+'"><div class="w3-border w3-white" style="width:100%; height:100px;padding:5px;margin-top:10px">'+
		            		'<div class="row">'+
		            		'<div class="col-md-4">'+
		            			'<img class="'+datalist.number+'" src="getBlobImg.do?no='+ datalist.number +'" align="left" style="width:100%;height:90px;z-index:1;"/>'+
		            			'</div>'+
		            			'<div class="col-md-8" style="padding:10px">'+
		            			'<div style="font-size:15px"><font style="font-size:15px;font-family:"Malgun Gothic","dotum","돋움"">'+datalist.name+'</font></div>'+
		            						'<div style="color:gray">'+datalist.address+'</div>'+
		            			'</div>'+
		            		'</div>'+
		            	'</div></a>';
		            				
		            el.innerHTML = itemStr;
		            el.className = 'item';
		            return el;
			}
			//마커에 들어가는 인포윈도우 함수
			function displayInfowindow(marker, datalist){
				var content = '<div align="center" style="width:150px">'+
       		 '<a href="user_content.do?no='+datalist.number+'"><img class="'+datalist.number+'" src="getBlobImg.do?no='+ datalist.number + '" align="left" style="width:148px;height:100px;z-index:1;margin-top:0;margin-bottom:10px"/></a>' +
    		 '<p style="margin-bottom:10px"><b>'+ datalist.name +'</b></p>' +
    		 '</div>';
    		 infowindow.setContent(content);
    		 infowindow.open(map,marker);
			}
			});
			
			
			
			//카테고리 버튼을 눌렀을시 색 추가 , 기본색 삭제 
			 $('#travel').click(function(){
					if($(this).hasClass('w3-white')){
						$(this).removeClass('w3-white w3-hover-white');
						$(this).addClass('w3-pale-green w3-hover-green');
					}
					else if($(this).hasClass('w3-pale-green')){
						$(this).removeClass('w3-pale-green w3-hover-green');
						$(this).addClass('w3-white w3-hover-white');
					}
				 });
				 $('#food').click(function(){
						if($(this).hasClass('w3-white')){
							$(this).removeClass('w3-white w3-hover-white');
							$(this).addClass('w3-pale-blue w3-hover-blue');
						}
						else if($(this).hasClass('w3-pale-blue')){
							$(this).removeClass('w3-pale-blue w3-hover-blue');
							$(this).addClass('w3-white w3-hover-whiter');
						}
					 });
				 
				 //초기 접속시 검색패널 숨기기
			$('#search_panel').hide();
				 //검색버튼이 클릭되었을시에 검색 조건 변수 지정 후 새로 검색
			$('#search_button').click(function(){
				$('#search_panel').slideToggle(300);
				var se = $('#search_button').val();
				if(se == '검색옵션 닫기'){
					$(this).val('검색옵션 열기')
				}
				if(se == '검색옵션 열기'){
					$(this).val('검색옵션 닫기')
				}
			});
			var of = 0;
			
			//"해당 조건으로 검색하기" 버튼 클릭시 해당 조건에 따라 한번 불러옴
			$('#search_submit').click(function(){
				$('#search_panel').slideToggle(300);
				$('#search_button').val('검색옵션 열기');
				of = 1
				
				var tr = 0;
				var fo = 0;
				if($('#travel').hasClass('w3-pale-green')){
					tr = 1;
				}
				if($('#food').hasClass('w3-pale-blue')){
					fo = 2;
				}
				var date = $('#datepicker').val();
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
				 if ($('#travel').hasClass('w3-white') &&  $('#food').hasClass('w3-white') && date == "" && ps == "0" && pe == "200000"){
						of = 0
						alert("검색옵션을 설정해주세요 !");
					}
				 else if ($('#travel').hasClass('w3-pale-green') &&  $('#food').hasClass('w3-pale-blue') && date == ""  && ps == "0" && pe == "200000"){
					 of = 0
						
				 }
				 else{
					 $('#content').empty();
				
				// 지도 위에 표시되고 있는 마커를 모두 제거합니다
				function removeMarker() {
				    for ( var i = 0; i < markers.length; i++ ) {
				        markers[i].setMap(null);
				    }   
				    markers = [];
				}
				// 지도에 표시되고 있는 마커를 제거합니다
			    removeMarker();
			   
				
			    $('#content').append('<div align="center">'+
						 '<font color="red">검색옵션이 설정되어있습니다.</font>'+
						 '</div>');
			    
			    //검색을 했을시 실실적으로 동작하는 ajax 내용추가는 위와 동일 ,
				$.ajaxSettings.traditional = true;
				$.post("ajax_main_search.do",	{"tr":tr,"fo":fo,"date":date,"ps":ps,"pe":pe},function(datalist){
					var listEl = document.getElementById('content'),
					fragment = document.createDocumentFragment(),
					bounds = new daum.maps.LatLngBounds();
					for(i=0;i<datalist.length;i++){
				        var placePosition = new daum.maps.LatLng(datalist[i].lat,datalist[i].lng),
				            marker = addMarker(placePosition, i);
				        	itemEl = getListItem(i,datalist[i]);//검색 결과 항목 Element생성
				        	
				            (function(marker, datalist) {
				                daum.maps.event.addListener(marker, 'mouseover', function() {
				                    displayInfowindow(marker, datalist);
				                });
				                daum.maps.event.addListener(marker, 'mouseout', function() {
				                    infowindow.close();
				                });
				                itemEl.onmouseover =  function () {
				                    displayInfowindow(marker, datalist);
				                };
				                itemEl.onmouseout =  function () {
				                    infowindow.close();
				                };
				            })(marker, datalist[i]);
				            fragment.appendChild(itemEl);
						};
						listEl.appendChild(fragment);
				
				 function getListItem(index,datalist){
					 var el = document.createElement('li'),
					    itemStr =
					    	'<div class="w3-border w3-white" style="width:100%; height:100px;padding:5px;margin-top:10px">'+
			            		'<div class="row">'+
			            			'<div class="col-md-4">'+
			            					'<img class="'+datalist.number+'" src="getBlobImg.do?no='+ datalist.number +'" align="left" style="width:100%;height:90px;z-index:1;"/>'+
			            			'</div>'+
			            			'<div class="col-md-8" style="padding:10px">'+
			            			'<div style="font-size:15px"><a href="usr_content.do?str_number='+datalist.number+'"><font style="font-size:15px;font-family:"Malgun Gothic","dotum","돋움"">'+datalist.name+'</font></a></div>'+
			            						'<div style="color:gray">'+datalist.address+'</div>'+
			            			'</div>'+
			            		'</div>'+
			            	'</div>';
			            				
			            el.innerHTML = itemStr;
			            el.className = 'item';
			            return el;
				}
				function displayInfowindow(marker, datalist){
					var content = '<div align="center" style="width:150px">'+
	       		 '<a href="user_content.do?no='+datalist.number+'"><img class="'+datalist.number+'" src="getBlobImg.do?no='+ datalist.number + '" align="left" style="width:148px;height:100px;z-index:1;margin-top:0;margin-bottom:10px"/></a>' +
	    		 '<p style="margin-bottom:10px"><b>'+ datalist.name +'</b></p>' +
	    		 '</div>';
	    		 infowindow.setContent(content);
	    		 infowindow.open(map,marker);
				}
				},'json');
				};
			});
			
			
			
			
			// 마커를 담을 배열입니다
			var markers = [];
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new daum.maps.LatLng(35.207388, 129.07027330000005), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 
			// 장소 검색 객체를 생성합니다
			var ps = new daum.maps.services.Places();  
			// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
			var infowindow = new daum.maps.InfoWindow({zIndex:1});
			
			
			// 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
			daum.maps.event.addListener(map, 'dragend', function() { 
				infowindow.close();
				$('#content').empty();
			    // 지도 영역정보를 얻어옵니다 
			    var bounds = map.getBounds();
			    
			    // 영역정보의 남서쪽 정보를 얻어옵니다 
			    var swLatlng = bounds.getSouthWest();
			    var swlalg = swLatlng.toString().substring(1,swLatlng.toString().length-1);
			    var sw = swlalg.toString().split(", ");
			    var so = sw[0];
			    var we = sw[1];
			    // 영역정보의 북동쪽 정보를 얻어옵니다 
			    var neLatlng = bounds.getNorthEast();
			    var nelalg = neLatlng.toString().substring(1,neLatlng.toString().length-1);
			    var ne = nelalg.toString().split(", ");
			    var no = ne[0];
			    var ea = ne[1];
			    function removeMarker() {
				    for ( var i = 0; i < markers.length; i++ ) {
				        markers[i].setMap(null);
				    }   
				    markers = [];
				}
			    removeMarker();
			    
			    //검색조건이 명시되어 있을경우 검색 옵션을 읽어 조건검색
			    if(of == 1){
					$('#content').empty();
					
					 $('#content').append('<div align="center">'+
							 '<font color="red">검색옵션이 설정되어있습니다.</font>'+
							 '</div>');
					var tr = 0;
					var fo = 0;
					if($('#travel').hasClass('w3-pale-green')){
						tr = 1;
					}
					if($('#food').hasClass('w3-pale-blue')){
						fo = 2;
					}
					var date = $('#datepicker').val();
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
					//마우스 드래그 시에 검색옵션이 설정되어있을경우 검색옵션 + 화면에 맟춘 위도경도 범위 넘겨주어 ajax 실행
					$.ajaxSettings.traditional = true;
					$.post("ajax_main_dragsearch.do",	{"tr":tr,"fo":fo,"date":date,"ps":ps,"pe":pe,"so":so,"we":we,"no":no,"ea":ea},function(datalist){
						var listEl = document.getElementById('content'),
						fragment = document.createDocumentFragment(),
						bounds = new daum.maps.LatLngBounds();
						for(i=0;i<datalist.length;i++){
					        var placePosition = new daum.maps.LatLng(datalist[i].lat,datalist[i].lng),
					            marker = addMarker(placePosition, i);
					        	itemEl = getListItem(i,datalist[i]);//검색 결과 항목 Element생성
					        	
					            (function(marker, datalist) {
					                daum.maps.event.addListener(marker, 'mouseover', function() {
					                    displayInfowindow(marker, datalist);
					                });
					                daum.maps.event.addListener(marker, 'mouseout', function() {
					                    infowindow.close();
					                });
					                itemEl.onmouseover =  function () {
					                    displayInfowindow(marker, datalist);
					                };
					                itemEl.onmouseout =  function () {
					                    infowindow.close();
					                };
					            })(marker, datalist[i]);
					            fragment.appendChild(itemEl);
							};
							listEl.appendChild(fragment);
					
					 function getListItem(index,datalist){
						 var el = document.createElement('li'),
						    itemStr =
						    	'<div class="w3-border w3-white" style="width:100%; height:100px;padding:5px;margin-top:10px">'+
				            		'<div class="row">'+
				            			'<div class="col-md-4">'+
				            					'<img class="'+datalist.number+'" src="getBlobImg.do?no='+ datalist.number +'" align="left" style="width:100%;height:90px;z-index:1;"/>'+
				            			'</div>'+
				            			'<div class="col-md-8" style="padding:10px">'+
				            			'<div style="font-size:15px"><a href="usr_content.do?str_number='+datalist.number+'"><font style="font-size:15px;font-family:"Malgun Gothic","dotum","돋움"">'+datalist.name+'</font></a></div>'+
				            						'<div style="color:gray">'+datalist.address+'</div>'+
				            			'</div>'+
				            		'</div>'+
				            	'</div>';
				            				
				            el.innerHTML = itemStr;
				            el.className = 'item';
				            return el;
					}
					function displayInfowindow(marker, datalist){
						var content = '<div align="center" style="width:150px">'+
		       		 '<a href="user_content.do?no='+datalist.number+'"><img class="'+datalist.number+'" src="getBlobImg.do?no='+ datalist.number + '" align="left" style="width:148px;height:100px;z-index:1;margin-top:0;margin-bottom:10px"/></a>' +
		    		 '<p style="margin-bottom:10px"><b>'+ datalist.name +'</b></p>' +
		    		 '</div>';
		    		 infowindow.setContent(content);
		    		 infowindow.open(map,marker);
					}
					},'json');
			    }
			    
			    //검색조건이 명시되어 있지 않을경우 모든 정보들을 화면에 맞춰 표시함
			    else{
			    	 
				    $.post("ajax_main_join.do",	{"so":so,"we":we,"no":no,"ea":ea},function(datalist){
				    	var listEl = document.getElementById('content'),
						fragment = document.createDocumentFragment(),
						bounds = new daum.maps.LatLngBounds();
						for(i=0;i<datalist.length;i++){
					        var placePosition = new daum.maps.LatLng(datalist[i].lat,datalist[i].lng),
					            marker = addMarker(placePosition, i);
					        	itemEl = getListItem(i,datalist[i]);//검색 결과 항목 Element생성
					        	
					            (function(marker, datalist) {
					                daum.maps.event.addListener(marker, 'mouseover', function() {
					                    displayInfowindow(marker, datalist);
					                });
					                daum.maps.event.addListener(marker, 'mouseout', function() {
					                    infowindow.close();
					                });
					                itemEl.onmouseover =  function () {
					                    displayInfowindow(marker, datalist);
					                };
					                itemEl.onmouseout =  function () {
					                    infowindow.close();
					                };
					            })(marker, datalist[i]);
					            fragment.appendChild(itemEl);
							};
							listEl.appendChild(fragment);
					
					 function getListItem(index,datalist){
						 var el = document.createElement('li'),
						    itemStr =
						    	'<div class="w3-border w3-white" style="width:100%; height:100px;padding:5px;margin-top:10px">'+
				            		'<div class="row">'+
				            			'<div class="col-md-4">'+
				            					'<img class="'+datalist.number+'" src="getBlobImg.do?no='+ datalist.number +'" align="left" style="width:100%;height:90px;z-index:1;"/>'+
				            			'</div>'+
				            			'<div class="col-md-8" style="padding:10px">'+
				            			'<div style="font-size:15px"><a href="usr_content.do?str_number='+datalist.number+'"><font style="font-size:15px;font-family:"Malgun Gothic","dotum","돋움"">'+datalist.name+'</font></a></div>'+
				            						'<div style="color:gray">'+datalist.address+'</div>'+
				            			'</div>'+
				            		'</div>'+
				            	'</div>';
				            				
				            el.innerHTML = itemStr;
				            el.className = 'item';
				            return el;
					}
					function displayInfowindow(marker, datalist){
						var content = '<div align="center" style="width:150px">'+
		       		 '<a href="user_content.do?no='+datalist.number+'"><img class="'+datalist.number+'" src="getBlobImg.do?no='+ datalist.number + '" align="left" style="width:148px;height:100px;z-index:1;margin-top:0;margin-bottom:10px"/></a>' +
		    		 '<p style="margin-bottom:10px"><b>'+ datalist.name +'</b></p>' +
		    		 '</div>';
		    		 infowindow.setContent(content);
		    		 infowindow.open(map,marker);
					}
					});
			    }
			   
			});
			// 검색결과 항목을 Element로 반환하는 함수입니다
			
			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, idx, title) {
			    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
			        imgOptions =  {
			            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
			            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			        },
			        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
			            marker = new daum.maps.Marker({
			            position: position, // 마커의 위치
			            image: markerImage 
			        });
			    marker.setMap(map); // 지도 위에 마커를 표출합니다
			    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
			    return marker;
			}
			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
			    for ( var i = 0; i < markers.length; i++ ) {
			        markers[i].setMap(null);
			    }   
			    markers = [];
			}
			 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
			function removeAllChildNods(el) {   
			    while (el.hasChildNodes()) {
			        el.removeChild (el.lastChild);
			    }
			}
		});
	</script>
</body>
</html>