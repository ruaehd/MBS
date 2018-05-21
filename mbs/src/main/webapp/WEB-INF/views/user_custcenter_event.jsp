<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	</head>
<body>
	<div id="wrapper">
		<jsp:include page="v1_header.jsp"></jsp:include>
		<div id="main">
			<div style="margin-top:68px">
				<div class="container" style="width:80%; margin:0px auto">
					<h1><b>이벤트</b></h1>
					<div class="form-inline" style="width: 100%">
						<div class="form-group" style="width: 90%">지금 참여할 수 있는 이벤트를 놓치지 마세요.</div>
						<div class="form-group" align="right">
							<a href="service_main.do">고객센터</a>
						</div>
					</div>
					<hr/>
					<div id="carousel" class="carousel slide" data-ride="carousel" data-interval="2000" style="width: 100%; height:400px">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel" data-slide-to="0" class="active"></li>
							<li data-target="#carousel" data-slide-to="1"></li>
							<li data-target="#carousel" data-slide-to="2"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<c:forEach begin="0" end="2" var="i">
								<c:if test="${i==0}">
									<div class="item active">
									<a href="event_content.do?evt_no=${list_begin[i].evt_no}"><img src="eventImgList.do?evt_no=${list_begin[i].evt_no}" style="width: 100%; height: 400px"></a>
									</div>
								</c:if>
								<c:if test="${i!=0}">
									<div class="item">
									<a href="event_content.do?evt_no=${list_begin[i].evt_no}"><img src="eventImgList.do?evt_no=${list_begin[i].evt_no}" style="width: 100%; height: 400px"></a>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<!-- Controls -->
						<div id="mouseup">
							<a class="left carousel-control" href="#carousel"role="button" data-slide="prev"> 
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							</a> 
							<a class="right carousel-control" href="#carousel" role="button" data-slide="next"> 
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							</a>
						</div>
					</div>
					<hr/>
					<div class="btn-group" style="margin-top:20px">
						<div class="btn-group" role="group">
							<button class="w3-button w3-round w3-border w3-blue w3-hover-blue select_category" id="now">진행중 이벤트</button>
						</div>
						<div class="btn-group" style="margin-left:20px" role="group">
							<button class="w3-button w3-round w3-border w3-white w3-hover-white select_category" id="end">종료된 이벤트</button>
						</div>
					</div>
							
					<div style="margin-top:10px;margin-bottom:10px"> 
						<br/>
						<div id="count">총 ${eventbegin}건의 진행중인 이벤트가 있습니다.</div>
					</div>
					<div class="row1" style="display:block">
						<c:forEach var="vo" items="${list_begin}">
							<div class="col-md-6" style="margin-bottom:30px">
								<a href="event_content.do?evt_no=${vo.evt_no}"><img id="now_img" src="eventImgList.do?evt_no=${vo.evt_no}" style="width:100%; height:150px"></a>
							</div>
						</c:forEach>
					</div>
					<div class="row2" style="display:none">
						<c:forEach var="vo" items="${list_end}">
							<div class="col-md-6" style="margin-bottom:30px">
								<a href="event_content.do?evt_no=${vo.evt_no}"><img id="now_img" src="eventImgList.do?evt_no=${vo.evt_no}" style="width:100%; height:150px"></a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="v1_footer.jsp"></jsp:include>
	</div>
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			$('#now').click(function(){
				$('#end').attr('class', 'w3-button w3-round w3-border w3-white w3-hover-white select_category');
				$('#now').attr('class', 'w3-button w3-round w3-border w3-blue w3-hover-blue select_category');
				$('#count').text('\n총 ${eventbegin}건의 종료된 이벤트가 있습니다.');
				$('.row1').attr('style', 'display:block');
				$('.row2').attr('style', 'display:none');
				
			});
			$('#end').click(function(){
				$('#now').attr('class', 'w3-button w3-round w3-border w3-white w3-hover-white select_category');
				$('#end').attr('class', 'w3-button w3-round w3-border w3-blue w3-hover-blue select_category');
				$('#count').text('\n총 ${eventend}건의 종료된 이벤트가 있습니다.');
				$('.row1').attr('style', 'display:none');
				$('.row2').attr('style', 'display:block');
				
			});
		
		});
		jQuery(function($){
		$('#mouseup').hide();
		$('#carousel').mouseover(function(){
			$('#mouseup').show();
		});
		$('#carousel').mouseleave(function(){
			$('#mouseup').hi	de();
		});
	});
	</script>
</body>
</html>
