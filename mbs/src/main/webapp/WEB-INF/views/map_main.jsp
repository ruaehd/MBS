<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/css/w3.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:350px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
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
</style>
	<div class="map_wrap" style="margin-top:58px">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	
    <div id="menu_wrap" class="bg_white">
        <div class="option">
			<div>
				<form onsubmit="searchPlaces(); return false;">
				<input type="button" id="search_button" class="form-control" value="검색옵션 열기"/>
				<div id="search_panel">
					<div class="form-inline" align="center" >
						<input type="button" style="width:50%;height:30px"
							class="select_category w3-button w3-round w3-white w3-border"
							value="관광지" id="travel"/> 
							<input type="button" style="width:50%;height:30px"
							class="select_category w3-button w3-round w3-white w3-border"
							value="음식점" id="food"/>
					</div>
					주소 <input type="text" class="form-control" placeholder="주소를 입력하세요" size="15" id="addr"/>
					<div class="row">
						<div class="col-md-6">
					예약일 <input type="text" class="form-control w3-white" placeholder="예약일을 선택해주세요" readonly size="15" id="datepicker"/>
					</div>
					<!-- 키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> -->
					<div class="col-md-6">
						<div align="center">가격</div>
							<div align="center">
								<input type="text" id="amount" readonly class="w3-border-bottom w3-round form-control">
							</div>
						</div>
					</div>
					
					<div id="slider-range" style="margin:10px 0px; width: 100%;"></div>
					<input type="button" class="form-control" id="search_submit" value="검색하기"/>
					
					</div>
				</form>
				<div id="content"></div>
				</div>
			</div>
		</div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66e7156b3899e012effaa62fd20217d4&libraries=services"></script>
    <script type="text/javascript" src="resources/js/jquery.form.min.js"></script>
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
			jQuery( "#amount" ).val($( "#slider-range" ).slider( "values", 0 ) + "원  ~ "
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
			$('#search_panel').hide();
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
			//search ajax * 진행중
			$('#search_submit').click(function(){
				  $('#content').empty();
				var tr = 0;
				var fo = 0;
				if($('#travel').hasClass('w3-blue')){
					tr = 1;
					
				}
				if($('#food').hasClass('w3-blue')){
					fo = 2;
					
				}
				var addr = $('#addr').val();
				
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
				// 지도 위에 표시되고 있는 마커를 모두 제거합니다
				function removeMarker() {
				    for ( var i = 0; i < markers.length; i++ ) {
				        markers[i].setMap(null);
				    }   
				    markers = [];
				}
				// 지도에 표시되고 있는 마커를 제거합니다
			    removeMarker();
				console.log(tr);
				console.log(fo);
				$.ajaxSettings.traditional = true;
				$.post("ajax_main_search.do",	{"tr":tr,"fo":fo,"addr":addr,"date":date,"ps":ps,"pe":pe},function(datalist){
						for(i=0;i<datalist.length;i++){
					        var placePosition = new daum.maps.LatLng(datalist[i].lat,datalist[i].lng),
					            marker = addMarker(placePosition, i);
					        	marker.setClickable(true);
					            var infowindow = new daum.maps.InfoWindow({
					                position: placePosition,
					                content: '<div align="center" style="width:150px"><h4 style="margin:10px 0px"><b>'+ datalist[i].name +'</b></h4>' +
					                		 '<a href="user_content.do?no='+datalist[i].number+'"><img class="'+datalist[i].number+'" src="getBlobImg.do?no='+ datalist[i].number + '" align="left" style="width:148px;height:100px;z-index:1;"/></a>' + 
					                		 '</div>',
					                removable : false
					            });
					            //해당 리스트에 마우스 over , leave 시 해당 정보에 대한 마커의 infowindow.open(); 과 클릭시 user_content.do?no=# 으로 이동
					            $('#content').append(
					            	'<div class="w3-border w3-white list'+i+'" style="width:100%; height:70px;margin-top:10px">'+
					            		'<div class="w3-row">'+
					            			'<div class="w3-quarter">'+
					            					'<img class="'+datalist[i].number+'" src="getBlobImg.do?no='+ datalist[i].number +'" align="left" style="width:100%;height:70px;z-index:1;"/>'+
					            			'</div>'+
					            			'<div class="w3-rest" style="padding:10px" align="left">'+
					            						'<div style="font-size:15px">'+datalist[i].name+'</div>'+
					            						'<div style="color:gray">'+datalist[i].address+'</div>'+
					            			'</div>'+
					            		'</div>'+
					            	'</div>'	
					            				
					            );

					        daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					        daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					        
					        function makeOutListener(infowindow) {
						        return function() {
						            infowindow.close();
						        };
						    };
						}
						
						function makeOverListener(map, marker, infowindow) {
					        return function() {
					            infowindow.open(map, marker);
					        };
					    }
				},'json');
				
				    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
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

			// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
			function displayPagination(pagination) {
			    var paginationEl = document.getElementById('pagination'),
			        fragment = document.createDocumentFragment(),
			        i; 

			    // 기존에 추가된 페이지번호를 삭제합니다
			    while (paginationEl.hasChildNodes()) {
			        paginationEl.removeChild (paginationEl.lastChild);
			    }

			    for (i=1; i<=pagination.last; i++) {
			        var el = document.createElement('a');
			        el.href = "#";
			        el.innerHTML = i;

			        if (i===pagination.current) {
			            el.className = 'on';
			        } else {
			            el.onclick = (function(i) {
			                return function() {
			                    pagination.gotoPage(i);
			                }
			            })(i);
			        }

			        fragment.appendChild(el);
			    }
			    paginationEl.appendChild(fragment);
			}

			// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
			// 인포윈도우에 장소명을 표시합니다
			function displayInfowindow(marker, title) {
			    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

			    infowindow.setContent(content);
			    infowindow.open(map, marker);
			}

			 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
			function removeAllChildNods(el) {   
			    while (el.hasChildNodes()) {
			        el.removeChild (el.lastChild);
			    }
			}
		});
</script>

		<jsp:include page="footer.jsp"></jsp:include>
		