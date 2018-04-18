<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<div style="margin-top:68px">
	<div class="container" style="width:80%; margin:0px auto">
		<h1><b>이벤트</b></h1>
		<div class="form-inline" style="width: 100%">
			<div class="form-group" style="width: 90%">지금 참여할 수 있는 이벤트를 놓치지 마세요.
			</div>
			<div class="form-group" align="right">
				<a href="user_custcenter_main.do">고객센터</a>
			</div>
		</div>
		<hr/>
		<div id="carousel" class="carousel slide" data-ride="carousel" data-interval="2000"
			style="width: 100%; height:400px">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel" data-slide-to="0" class="active"></li>
				<li data-target="#carousel" data-slide-to="1"></li>
				<li data-target="#carousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="resources/imgs/event-1.jpg" style="width: 100%; height: 400px">
				</div>
				<div class="item">
					<img src="resources/imgs/event-3.jpg" style="width: 100%; height: 400px">
				</div>
				<div class="item">
					<img src="resources/imgs/event-4.jpg" style="width: 100%; height: 400px">
				</div>
			</div>

			<!-- Controls -->
			<div id="mouseup">
			<a class="left carousel-control" href="#carousel"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				
			</a> <a class="right carousel-control" href="#carousel"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				
			</a>
			</div>
			</div>
			<hr/>
			<div class="btn-group" style="margin-top:20px">
				<div class="btn-group" role="group">
					<button class="w3-button w3-round w3-border w3-blue w3-hover-blue select_category">진행중 이벤트</button>
				</div>
				<div class="btn-group" style="margin-left:20px" role="group">
					<button class="w3-button w3-round w3-border w3-white w3-hover-white select_category">종료된 이벤트</button>
				</div>
				</div>
				
				<div style="margin-top:10px;margin-bottom:10px">
				<br/>
				 총 4건의 진행중인 이벤트가 있습니다.
				</div>
				<div class="row" >
					<div class="col-md-6" style="margin-bottom:30px">
						<a href="#"><img src="resources/imgs/event-1.jpg" style="width:100%; height:150px"></a>
					</div>
					<div class="col-md-6" style="margin-bottom:30px">
						<a href="#"><img src="resources/imgs/event-2.jpg" style="width:100%; height:150px"></a>
					</div>
					<div class="col-md-6" style="margin-bottom:30px">
						<a href="#"><img src="resources/imgs/event-3.jpg" style="width:100%; height:150px"></a>
					</div>
					<div class="col-md-6" style="margin-bottom:30px">
						<a href="#"><img src="resources/imgs/event-4.jpg" style="width:100%; height:150px"></a>
					</div>
				</div>
			
		
	</div>
</div>
<script>
	jQuery(function($){
	$('#mouseup').hide();
	$('#carousel').mouseover(function(){
		$('#mouseup').show();
	});
	$('#carousel').mouseleave(function(){
		$('#mouseup').hide();
	});
});
</script>
<jsp:include page="footer.jsp"></jsp:include>