<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
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
		.star_rating {
			font-size:0; letter-spacing:-4px;
		}
		.star_rating p {
		    font-size:20px;
		    letter-spacing:0;
		    display:inline-block;
		    margin-left:5px;
		    color:#ccc;
		    text-decoration:none;
		}
		.star_rating p:first-child {
			margin-left:0;
		}
		.star_rating p.on {
			color:#EDD200;
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
							<img src="get_blob_img.do?str_number=${vo.str_number}&idx=1" style="width: 100%; height: 500px"/>
						</div>
						<c:forEach var="i" begin="2" end="${cnt}">
							<div class="item">
								<img src="get_blob_img.do?str_number=${vo.str_number}&idx=${i}" style="width: 100%; height: 500px"/>
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
							<c:if test="${sessionScope._gr > 1 || sessionScope._id == vo.mb_id}">
								<a href="usr_content_pay.do?str_number=${vo.str_number}" class="btn btn-info disabled">예약하기</a>
							</c:if>
							<c:if test="${sessionScope._gr == 1 && sessionScope._id != vo.mb_id}">
								<a href="usr_content_pay.do?str_number=${vo.str_number}" class="btn btn-info">예약하기</a>
							</c:if>
							<a href="#commnet" class="btn btn-primary">후기보기</a>
							<a href="#map" class="btn btn-success">지도보기</a>
							<a href="#" class="btn btn-danger">뒤로가기</a>
						</div>
					</div>
				</div>
				<hr />
			
				<div id="store_info">
					<div class="form-inline">
						<label>전화번호</label>
						${vo.str_tel}
					</div>
					<div class="form-inline">
						<label>주소</label>
						${vo.str_address}
					</div>
					<div class="form-inline">
						<label>운영시간</label>
						${vo.str_begintime}시
						 ~ 
						${vo.str_endtime}시
					</div>
					<div class="form-inline">
						<label>메뉴</label>
						<div class="form-group">
							<c:forEach var="vo1" items="${mlist}" varStatus="i">
								<div id="menu_detail" class="form-inline">
									<label>${vo1.mn_name}</label>
									${vo1.mn_price}
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="form-inline">
						<label>소개</label>
						소개글
					</div>
				</div>
		
				<hr />
		
				<div id="commnet">
					<div  class="w3-display-container" style="height: 100px;vertical-align:middle">
						<div class="w3-display-left form-inline" style="vertical-align:middle">
							<h3>
								<b>후기 ${recnt}개</b>
							</h3>
								<div style="display:inline-block" class="star_rating">
									<c:forEach begin="1" end="${avg}">
								    	<p class="on">★</p>
								    </c:forEach>
								    <c:forEach begin="1" end="${5-avg}">
									    <p>★</p>
								    </c:forEach>
								</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4" align="center">
							<h4>맛</h4>
							<div id="circle1"><fmt:formatNumber value="${taste*100}" pattern=""/>%</div>
							</div>
						<div class="col-md-4" align="center">
						<h4>서비스</h4>
							<div id="circle2"><fmt:formatNumber value="${service*100}" pattern=""/>%</div>
							</div>
						<div class="col-md-4" align="center">
						<h4>가격</h4>
							<div id="circle3"><fmt:formatNumber value="${price*100}" pattern=""/>%</div>
						</div>
					</div>
					
					<hr />
					<div class="row ">
						<c:if test="${recnt!=0}">
							<div id="review" class="form-inline"></div>
						</c:if>
						<c:if test="${recnt==0}">
							<div style="text-align:center; vertical-align:middle;">
								<h3>작성된 후기가 없습니다</h3>
							</div>
						</c:if>
						<div align="center">
							<ul id="pagination" class="pagination"></ul>
						</div>
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
	<script type="text/javascript" src="resources/js/jquery.twbsPagination.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66e7156b3899e012effaa62fd20217d4&libraries=services"></script>
	<script>
	
	$(function() {
		$('.carousel').carousel({
			interval : 2000
		});
		
	
		$('#circle1').circleProgress({
		    value: '${taste}'
		  }).on('circle-animation-progress', function(event, progress) {
		    $(this).find('strong').html(Math.round(100 * progress) + '<i>%</i>');
		  });
		$('#circle2').circleProgress({
		    value: '${service}'
		  }).on('circle-animation-progress', function(event, progress) {
		    $(this).find('strong').html(Math.round(100 * progress) + '<i>%</i>');
		  });
		$('#circle3').circleProgress({
		    value: '${price}'
		  }).on('circle-animation-progress', function(event, progress) {
		    $(this).find('strong').html(Math.round(100 * progress) + '<i>%</i>');
		  });
	
	
	
		
		$('#pagination').twbsPagination({
			totalPages:${totPage},
			visiblePage:10,
			onPageClick: function (event, page) {
				$.get('ajax_reviewlist.do?page='+page+'&str_number='+${param.str_number}, function(data){
					$('#review').empty();
					
					var len = data.length;
					for(var i=0; i<len; i++){
						
						var str = '';
						var str1 = '';
						
						for(var j=0; j<data[i].rsv_cmt_point; j++){
							str = str+'<p class="on">★</p>';
						}
						for(var k=0; k<5-data[i].rsv_cmt_point; k++){
							str1 = str1+'<p>★</p>';
						}
						
						$('#review').append(
							'<div class="review" style="margin-bottom:10px; border:1px solid #ccc">'
								+ '<div style="display:inline-block; margin-right:10px" class="star_rating">'
									+ str
									+ str1
								+ '</div>'
								+ '<code style="color:#353535; background-color:#EAEAEA; margin-right:5px">'+data[i].rsv_cmt_taste+'</code>'
								+ '<code style="color:#353535; background-color:#EAEAEA; margin-right:5px">'+data[i].rsv_cmt_service+'</code>'
								+ '<code style="color:#353535; background-color:#EAEAEA; margin-right:5px">'+data[i].rsv_cmt_price+'</code>'
								
								+ '<label>작성자</label>'+data[i].rsv_cmt_writer+''
								+ '<label>사용일</label>'+data[i].rsv_day+''
							+ '<div>'+data[i].rsv_cmt_content+'</div>'
						+ '</div>'
						);
					}
				}, 'json');
			}
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