<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>Google Nexus Website Menu</title>
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" type="text/css" href="resources/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/component.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/w3.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/jquery-ui.min.css" />
	<style>
		.container{
			z-index:2;
		}
		.gn-menu-main{
			z-index:10;
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="v1_header.jsp"></jsp:include>
		
		<div class="container" style="margin-top:100px; padding:10px">
			<div class="row">
				<div class="col-md-6" style="padding:20px">
					<div id="carousel" class="carousel slide" data-ride="carousel" data-interval="3000" style="margin-bottom:20px">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel" data-slide-to="0" class="active"></li>
							<li data-target="#carousel" data-slide-to="1"></li>
							<li data-target="#carousel" data-slide-to="2"></li>
						</ol>
						
						<!-- Wrapper for slides -->
						<div class="carousel-inner" id="back_imgs">
							<div class="item active">
								<img src="resources/imgs/12.JPG">
							</div>
							<div class="item">
								<img src="resources/imgs/12.JPG">
							</div>
							<div class="item">
								<img src="resources/imgs/12.JPG">
							</div>
						</div>
						
						<!-- Controls -->
						<div id="mouseup">
							<a class="left carousel-control" href="#carousel" role="button" data-slide="prev"> 
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							</a> 
							<a class="right carousel-control" href="#carousel" role="button" data-slide="next"> 
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							</a>
						</div>
					</div>
					
					<div id="select" style="margin-bottom:20px">
						<div class="form-inline" style="margin-bottom:10px">
							<label style="width:100px">날짜</label>
							<input type="text" class="form-control" name="date" id="date1"/>
						</div>
						<div class="form-inline" style="margin-bottom:10px">
							<label style="width:100px">시간</label>
							<select class="form-control" name="" id="">
								<option>1</option>
							</select>
						</div>
						<div class="form-inline" style="margin-bottom:10px">
							<label style="width:100px">인원</label>
							<select class="form-control" name="" id="">
								<option>1</option>
							</select>
						</div>
					</div>
				</div>
				
				<div class="col-md-6" style="padding:20px">
					<div id="map" style="width:100%;height:350px;margin-bottom:20px"></div>
					
					<div id="info" style="margin-bottom:20px">
						<h3>예약자 정보</h3>
						<hr />
						<div>
							<div class="form-inline" style="margin-bottom:10px">
								<label style="width:100px">이름</label>
								<input type="text" class="form-control" name="" id="" />
							</div>
							<div class="form-inline" style="margin-bottom:10px">
								<label style="width:100px">연락처</label>
								<input type="text" class="form-control" name="" id="" />
							</div>
							<div class="form-inline" style="margin-bottom:10px">
								<label style="width:100px">이메일</label>
								<input type="text" class="form-control" name="" id="" />
							</div>
							<div class="form-inline" style="margin-bottom:10px">
								<label style="width:100px">요청사항</label>
								<textarea class="form-control" rows="2" name="" id="" style="resize:none"></textarea>
							</div>
						</div>
					</div>
					
					<div id="stroe_info" style="margin-bottom:20px">
						<h3>판매자 정보</h3>
						<hr />
						<div>
							<div class="form-inline" style="margin-bottom:10px">
								<label style="width:100px">상호</label>
								${vo.str_name}
							</div>
							<div class="form-inline" style="margin-bottom:10px">
								<label style="width:100px">대표자명</label>
								<input type="text" class="form-control" name="" id="" />
							</div>
							<div class="form-inline" style="margin-bottom:10px">
								<label style="width:100px">소재지</label>
								${vo.str_address}
							</div>
							<div class="form-inline" style="margin-bottom:10px">
								<label style="width:100px">연락처</label>
								${vo.str_tel}
							</div>
						</div>
					</div>
					
					<div style="margin-bottom:10px">
						<input type="submit" class="btn btn-success" value="예약하기"	/>
						<a href="usr_content.do" class="btn btn-info">뒤로가기</a>
					</div>	
				</div>
			</div>
		</div>
		
		<jsp:include page="v1_footer.jsp"></jsp:include>
	
	</div>
	
	
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script src="resources/js/datepicker-ko.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66e7156b3899e012effaa62fd20217d4&libraries=services"></script>
	<script>
		$(function() {
			$("#date1").datepicker();
			
			var mapContainer = document.getElementById('map'),
		    mapOption = {
		        center: new daum.maps.LatLng(33.450701, 126.570667),
		        level: 3
		    };  
	
		var map = new daum.maps.Map(mapContainer, mapOption); 
		var geocoder = new daum.maps.services.Geocoder();
		
		geocoder.addressSearch('${vo.str_address}', function(result, status) {
		
		     if (status === daum.maps.services.Status.OK) {
		
		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="text-align:center;padding:6px 0;">${vo.str_name}</div>'
		        });
		        infowindow.open(map, marker);
		
		        map.setCenter(coords);
		    } 
		});
		});
	</script>

</body>
</html>