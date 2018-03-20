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
	
	<style>
		.container{
			z-index:2;
		}
		.gn-menu-main{
			z-index:10;
		}
		#carousel{
			width: 100%; 
			height: 500px; 
			margin-bottom:10px;
		}
		#store_name{
			border:solid 1px #ccc;
			margin-bottom:10px;
		}
		#store_info{
			margin-bottom:10px;
		}
		#store_info .form-inline{
			margin-bottom:5px
		}
		#review{
			margin-bottom:10px;
		}
		.menu_detail{
			display: inline-block;
			width: auto;
			vertical-align: middle;
		}
		.form-inline > label{
			width:100px;
		}
	</style>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="v1_header.jsp"></jsp:include>
		<div id="main">
			<div class="container" style="margin-top:100px ">
				
				<div id="carousel" class="carousel slide" data-ride="carousel" data-interval="3000">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel" data-slide-to="0" class="active"></li>
						<li data-target="#carousel" data-slide-to="1"></li>
						<li data-target="#carousel" data-slide-to="2"></li>
					</ol>
					
					<!-- Wrapper for slides -->
					<div class="carousel-inner" id="back_imgs">
						<div class="item active">
							<img src="resources/imgs/12.JPG" style="width: 100%; height: 500px">
						</div>
						<c:forEach var="vo1" items="${ilist}">
							<div class="item">
								<img src="data:image/jpg;base64,<c:out value='${vo1.str_image_l}'/>" style="width: 100%; height: 500px"/>
								<!-- <img src="get_blob_img.do?str_number=1234567890" /> -->
								<!-- <img src="get_blob_img1.do?str_number=1234567890&idx=str_image" /> -->
							</div>
						</c:forEach>
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
				
				<div id="store_name">
					<div align="center" style="padding:0 300px 15px">
						<h1>${vo.str_name}</h1>
						<hr/>
						<div>
							<a href="usr_content_pay.do" class="btn btn-info">예약</a>
							<a href="#review" class="btn btn-primary">후기보기</a>
							<a href="#map" class="btn btn-success">지도보기</a>
							<a href="#" class="btn btn-danger">뒤로가기</a>
						</div>
					</div>
				</div>
				<hr />
			
				<div id="store_info">
					<div class="form-inline">
						<label>전화번호</label>
						<div>${vo.str_tel}</div>
					</div>
					<div class="form-inline">
						<label>주소</label>
						<div>${vo.str_address}</div>
					</div>
					<div class="form-inline">
						<label>운영시간</label>
						<div>${vo.str_begintime}</div>
						<div> ~ </div>
						<div>${vo.str_endtime}</div>
					</div>
					<div class="form-inline">
						<label>메뉴</label>
						<div>
							<c:forEach var="vo1" items="${mlist}" varStatus="i">
								<div class="menu_detail">
									<label>${vo1.mn_name}</label>
									<div>${vo1.mn_price}</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="form-inline">
						<label>소개</label>
						<div>소개글</div>
					</div>
				</div>
		
				<hr />
		
				<div id="review">
					<div  class="w3-display-container" style="height: 100px;vertical-align:middle">
						<div class="w3-display-left form-inline" style="vertical-align:middle">
							<h3>
								<b>후기 n개</b>
							</h3>
							<img src="resources/imgs/star-5.PNG" style="width: 80px; height: 20px" />
						</div>
						<div class="w3-display-right">
							<input type="text" class="w3-border w3-round w3-input" style="width: 300px" placeholder="사용자로 후기 검색" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4" align="center">
						<h4>가격</h4>
							<div id="circle1">40%</div>
							</div>
						<div class="col-md-4" align="center">
						<h4>서비스</h4>
							<div id="circle2">80%</div>
							</div>
						<div class="col-md-4" align="center">
						<h4>시설</h4>
							<div id="circle3">90%</div>
						</div>
					</div>
					
					<hr />
					<div class="row ">
						<c:forEach var="i" begin="1" end="6">
							<div class="col-md-6">
								<div class="thumbnail" style="padding:10px">
									<div class="row">
										<div class="col-md-8">
											<b>사용자 이름 <img src="resources/imgs/star-5.PNG"style="width: 100px; height: 25px" /></b><br /> 
											<font style="font-size: 12px">2018.01.01</font><br />
										</div>
										<div class="col-md-1" style="margin-left:28px" align="right">
											<img src="resources/imgs/best.png" style="height:40px;width:40px;margin-top:10px"/><br/>
										</div>
										<div class="col-md-2" align="right">
											<button class="w3-button w3-hover-white w3-white">
												<img src="resources/imgs/good.png" style="height:40px;width:40px"/><br/>
												<font style="font-size:12px">326</font>
											</button>
										</div>
									</div>
									<p>사용자 후기 내용 ,row는 4줄 = 4줄이상은 ...<a href="#">더보기</a></p>
								</div>
							</div>
						</c:forEach>
						<input type="button" class="form-control w3-border w3-round w3-button" value="n개의 댓글 더 보기" />
					</div>
				</div>
				
				<div id="map" style="width:100%;height:350px;"></div>
			</div>
		</div>
		
		<jsp:include page="v1_footer.jsp"></jsp:include>
	</div>
	
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/circle-progress.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66e7156b3899e012effaa62fd20217d4&libraries=services"></script>
	<script>
	
	$(function() {
		$('.carousel').carousel({
			interval : 2000
		});
	
		$('#circle1').circleProgress({
		    value: 0.4
		  }).on('circle-animation-progress', function(event, progress) {
		    $(this).find('strong').html(Math.round(100 * progress) + '<i>%</i>');
		  });
		$('#circle2').circleProgress({
		    value: 0.8
		  }).on('circle-animation-progress', function(event, progress) {
		    $(this).find('strong').html(Math.round(100 * progress) + '<i>%</i>');
		  });
		$('#circle3').circleProgress({
		    value: 0.9
		  }).on('circle-animation-progress', function(event, progress) {
		    $(this).find('strong').html(Math.round(100 * progress) + '<i>%</i>');
		  });
	
	
	
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