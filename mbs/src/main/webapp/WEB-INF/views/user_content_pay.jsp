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
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap-material-datetimepicker.css" />
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
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
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="container" style="margin-top: 100px">
			<div class="row">
				<div class="col-md-6">
					
					<div id="carousel" class="carousel slide" data-ride="carousel" data-interval="3000" style="width: 100%; height: 500px; margin-bottom:10px">
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
					
					<div>
						<input id="fromDate" type="text"> 
						<input id="toDate" type="text">
					</div>
					
					
					
				</div>
				<div class="col-md-6">
				
				</div>
			</div>
			
			
			
			
			<!-- <h1><b>예약하기</b></h1>
			<hr/>
			<h3>해당 항목을 확인하세요</h3>
				<p>날짜</p>
				<p>시간</p>
				<p>인원</p>
			<h3>해당 음식점 이용규칙을 확인하세요</h3>
			<div style="margin-top:30px">
				<p>흡연금지</p><hr/>
				<p>반려동물 출입금지</p><hr/>
				<p>유아에게 적합하지 않음</p><hr/>
			</div>
			<input type="button" class="form-control w3-button w3-round" value="더 궁금하신 사항이 있을경우 직접 물어보세요!"/>
			<div style="width: 100%; margin: 20px auto">
				<div align="right">
				<hr/>
					<a href="#"><button  class="w3-button w3-round w3-border" >결제하기</button></a> 
					<a href="user_content.do"><button  class="w3-button w3-round w3-border">뒤로가기</button></a> 
				</div>
			</div> -->		
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
	
	</div>
	
	<script>
		$(function() {
			
		});
	</script>

</body>
</html>