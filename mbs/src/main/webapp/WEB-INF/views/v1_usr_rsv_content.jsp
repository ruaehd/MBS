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
								<img src="get_blob_img.do?idx=1" style="width: 100%; height: 350px"/>
							</div>
							<c:forEach var="i" begin="2" end="${cnt}">
								<div class="item">
									<img src="get_blob_img.do?idx=${i}" style="width: 100%; height: 350px"/>
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
					
					<div id="select" style="margin-bottom:20px">
						<h3>예약 정보</h3>
						<hr />
						<div class="form-inline" style="margin-bottom:10px">
							<label style="width:100px">날짜</label>
							${vo.rsv_day}
						</div>
						<div class="form-inline" style="margin-bottom:10px">
							<label style="width:100px">시간</label>
							${vo.rsv_time}
						</div>
						<div class="form-inline" style="margin-bottom:10px">
							<label style="width:100px">인원</label>
							${vo.rsv_personnel}
						</div>
					</div>
					
					<%-- <div id="menu" style="margin-bottom:20px">
						<h3>메뉴선택</h3>
						<hr />
						<div id="menu_detail" class="form-inline" style="margin-bottom:10px">
							<div>
								<c:forEach var="vo1" items="${mlist}" varStatus="i">
									<div class="form-inline">
										<label style="width:100px">${vo1.mn_name}</label>
										<label id="price_${i.index}">${vo1.mn_price}</label>
										<input type="button" class="btn btn-default menu_m" value="-" />
										<input type="text" class="form-control menu_cnt" style="width:50px; text-align:right" value="0" />
										<input type="button" class="btn btn-default menu_p" value="+" />
										<label id="sum_${i.index}" class="sum"></label>
									</div>
								</c:forEach>
							</div>
							<hr />
							<div style="text-align:right"class="form-inline">
								<label>합계</label>
								<label id="total">0원</label>
							</div>
						</div>
					</div> --%>
				</div>
				
				<div class="col-md-6" style="padding:20px">
					<div id="map" style="width:100%;height:350px;margin-bottom:20px"></div>
					
					<div id="info" style="margin-bottom:20px">
						<h3>예약자 정보</h3>
						<hr />
						<div>
							<div class="form-inline" style="margin-bottom:10px">
								<label style="width:100px">이름</label>
								${vo.rsv_sub_name}
							</div>
							<div class="form-inline" style="margin-bottom:10px">
								<label style="width:100px">전화번호</label>
								${vo.rsv_sub_tel}
							</div>
							<div class="form-inline" style="margin-bottom:10px">
								<label style="width:100px">이메일주소</label>
								${vo.rsv_sub_email}
							</div>
							<div class="form-inline" style="margin-bottom:10px">
								<label style="width:100px">요청사항</label>
								<textarea class="form-control" rows="2" style="resize:none">${vo.rsv_sub_request}</textarea>
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
						<c:choose>
							<c:when test="${vo.rsv_code == 1}">
								<a href="usr_rsv_edit.do?rsv_no=${vo.rsv_no}&str_num=${vo.str_number}" class="btn btn-success">예약 변경</a>
								<a href="usr_rsv_cancel.do?rsv_no=${vo.rsv_no}" class="btn btn-danger">예약 취소</a>
							</c:when>
							<c:when test="${vo.rsv_code == 2}">
								<c:if test="${chk != 0}">
									<input type="button" class="btn btn-info" value="후기 수정" onClick="editReview()" />
									<input type="button" class="btn btn-indgo" value="한줄평 수정" onClick="editComment()" />
								</c:if>
								<c:if test="${chk == 0}">
									<input type="button" class="btn btn-info" value="후기 작성" onClick="writeReview()" />
									<input type="button" class="btn btn-indgo" value="한줄평 작성" onClick="writeComment()" />	
								</c:if>
								
							</c:when>
							<c:when test="${vo.rsv_code == 3}">
								<a href="usr_rsv_edit.do?rsv_no=${vo.rsv_no}&str_num=${vo.str_number}" class="btn btn-info">다시 예약 하기</a>
							</c:when>
						</c:choose>
						<a href="usr_rsv_list.do" class="btn btn-primary">목록</a>
					</div>
					
				</div>
			</div>
		</div>
		
		<jsp:include page="v1_footer.jsp"></jsp:include>
	
	</div>
	
	
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66e7156b3899e012effaa62fd20217d4&libraries=services"></script>
	<script>
		function writeReview() {
			window.open('usr_rsv_review.do?rsv_no=${param.rsv_no}','후기작성','width=600, height=800, left=650, top=100');
		}
		function writeComment() {
			window.open('usr_rsv_comment.do?rsv_no=${param.rsv_no}','한줄평 작성','width=600, height=400, left=650, top=300');
		}
		function editReview() {
			window.open('usr_rsv_review_edit.do?rsv_no=${param.rsv_no}','후기수정','width=600, height=800, left=650, top=100');
		}
		function editComment() {
			window.open('usr_rsv_comment_edit.do?rsv_no=${param.rsv_no}','한줄평 수정','width=600, height=400, left=650, top=300');
		}
		
		$(function() {
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