<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
								<img src="get_blob_img.do?str_number=${vo.str_number}&idx=0" style="width: 100%; height: 350px"/>
							</div>
							<c:if test="${cnt > 1}">
								<c:forEach var="i" begin="1" end="${cnt}">
									<div class="item">
										<img src="get_blob_img.do?str_number=${vo.str_number}&idx=${i}" style="width: 100%; height: 350px"/>
									</div>
								</c:forEach>
							</c:if>
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
							<label style="width:100px">인원</label>
							${vo.rsv_personnel}
						</div>
					</div>
					
					<div id="menu" style="margin-bottom:20px">
						<h3>메뉴선택</h3>
						<hr />
						<div id="menu_detail" class="form-inline" style="margin-bottom:10px">
							<div>
								<c:forEach var="tmp" items="${rmlist}" varStatus="i">
									<div class="form-inline">
										<label style="width:100px">${tmp.rsv_mn_name}</label>
										<label class="menu_cnt">${tmp.rsv_mn_cnt} 인분</label>
										<div style="display:inline-block; margin-left:200px" >	
											<label id="price_${i.index}">${tmp.rsv_mn_price}*${tmp.rsv_mn_cnt}</label> = 
											<label id="sum_${i.index}" class="sum"> ${tmp.rsv_mn_price*tmp.rsv_mn_cnt} </label>
										</div>
									</div>
								</c:forEach>
							</div>
							<hr />
							<div style="text-align:right"class="form-inline">
								<label>합계</label>
								<label id="total">0원</label>
							</div>
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
								<textarea class="form-control" rows="2" style="resize:none" readonly>${vo.rsv_sub_request}</textarea>
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
								${vo.mb_name}
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
						<input type="hidden" value="${vo.str_delete}" id="schk"/>
						<c:if test="${sessionScope._gr > 2}">
							<a href="admin_rsv_management.do?rsv_code=0" class="btn btn-primary">목록</a>
						</c:if>
						<c:if test="${sessionScope._gr < 3}">
							<c:choose>
								<c:when test="${vo.rsv_code == 1}">
									<a href="usr_rsv_edit.do?str_number=${vo.str_number}&rsv_no=${vo.rsv_no}" class="btn btn-success">예약 변경</a>
									<a href="usr_rsv_cancel.do?rsv_no=${vo.rsv_no}" class="btn btn-danger">예약 취소</a>
								</c:when>
								<c:when test="${vo.rsv_code == 2}">
									<c:if test="${chk != 0}">
										<input type="button" class="btn btn-success" value="후기 수정" onClick="editComment()" />
									</c:if>
									<c:if test="${chk == 0}">
										<input type="button" class="btn btn-success" value="후기 작성" onClick="writeComment()" />	
									</c:if>
									<a href="#"  class="btn btn-info new_rsv">추가 예약 하기</a>
								</c:when>
								<c:when test="${vo.rsv_code == 3}">
									<a href="#"  class="btn btn-info new_rsv">신규 예약 하기</a>
								</c:when>
							</c:choose>
							<a href="usr_rsv_list.do?rsv_code=0" class="btn btn-primary">목록</a>
						</c:if>
					</div>
					
				</div>
			</div>
		</div>
		
		<jsp:include page="v1_footer.jsp"></jsp:include>
	
	</div>
	
	
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66e7156b3899e012effaa62fd20217d4&libraries=services"></script>
	<script src="resources/js/sweetalert.min.js"></script>
	<script>
		function writeComment() {
			window.open('usr_rsv_comment.do?rsv_no=${param.rsv_no}','한줄평 작성','width=800, height=700, left=650, top=100');
		}
		function editComment() {
			window.open('usr_rsv_comment_edit.do?rsv_no=${param.rsv_no}','한줄평 수정','width=800, height=700, left=650, top=100');
		}
		
		$(function() {
			
			$('.new_rsv').click(function(){
				
				var chk = $('#schk').val();
				
				console.log("chk"+chk);
				
				if(chk == 0){
					swal({
					  title: "운영중단",
					  text: "운영이 중단된 업체입니다.",
					  icon: "warning",
					  button: "확인",
					});
				}
				if(chk == 1){
					window.location.href="usr_content_pay.do?str_number=${vo.str_number}";
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
			
			
			
			var len = $('.sum').length;
			var tot = 0;								
			for(var i=0; i<len; i++){
				tot += Number($('#sum_'+i).text());
			}

			$('#total').text(tot+'원');
			
		});
	</script>

</body>
</html>