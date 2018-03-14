<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
 <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="resources/js/dist/circle-progress.js"></script>
<style>
.w3-container {
	width: 80%;
	margin: 30px auto;
	border: 2px solid #cccccc
}
</style>
</head>
<body>
	<div class="w3-container w3-round" style="margin-top:68px">


		<div id="carousel" class="carousel slide" data-ride="carousel" data-interval="3000"
			style="width: 100%; height: 500px">
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
				<div class="item">
					<img src="resources/imgs/12.JPG" style="width: 100%; height: 500px">
				</div>
				<div class="item">
					<img src="resources/imgs/12.JPG" style="width: 100%; height: 500px">
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


		<div class="w3-display-container" style="height: 100px">
			<div class="w3-display-left">
				<h1>업체/관광지명</h1>
				<h4>
					<font>주소</font>
				</h4>
			</div>
			<div class="w3-display-right" style="vertical-align:top;" align="center"><img src="resources/imgs/member_back.jpg" class="w3-round" style="width:60px;height:60px;margin-right:30px;margin-top:20px"/><br/>
			<font color="gray" style="width:100px;font-size:15px;margin-right:30px">사업자</font>
			</div>
		</div>
		<hr />
		해당 업체/관광지에 대한 자세한 내용 row 는 4줄 , 4줄 이상은 설명 더보기 클릭시 표시되야함 (ajax , jquery
		사용)
		<div align="center">
			<input type="button" class="w3-border w3-round w3-button"
				style="width: 100%" value="설명 더 보기" />
		</div>
		<hr />
		<h3>
			<b>예약인원</b>
		</h3>
		4명
		<hr />
		<h3>
			<b>이용규칙</b>
		</h3>
		설명과는 별개로 관광지 or 업체에 대한 이용규칙 ex)반려동물 가능 , 외부음식 반입 가능
		<hr />
		<h3>
			<b>관광지 개장 or 업체 개장 시간</b>
		</h3>
		해당 관광지나 업체의 시간 테이블 정보 받아옴
		<hr />
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


		<div class="w3-display-container" style="height: 100px;vertical-align:middle">
			<div class="w3-display-left form-inline" style="vertical-align:middle">
				<h3>
					<b>후기 n개</b>
				</h3>
				<img src="resources/imgs/star-5.PNG"
					style="width: 80px; height: 20px" />
			</div>
			<div class="w3-display-right">
				<input type="text" class="w3-border w3-round w3-input"
					style="width: 300px" placeholder="사용자로 후기 검색" />
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 form-inline">
				<b>가격</b> <img src="resources/imgs/star-5.PNG"
					style="width: 100px; height: 25px;" />
				<p style="font-color: #cccccc; font-size: 12px; margin-top: 10px">해당
					지역 평균(5.00)</p>
			</div>
			<div class="col-md-6 form-inline">
				<b>시설</b> <img src="resources/imgs/star-5.PNG"
					style="width: 100px; height: 25px" />
				<p style="font-color: #cccccc; font-size: 12px; margin-top: 10px">해당
					지역 평균(5.00)</p>
			</div>
		</div>
		<hr />
		<div class="row ">
			<c:forEach var="i" begin="1" end="6">
				<div class="col-md-6">
					<div class="thumbnail" style="padding:10px">
					<div class="row">
					<div class="col-md-8">
						<b>사용자 이름 <img src="resources/imgs/star-5.PNG"
							style="width: 100px; height: 25px" /></b><br /> <font
							style="font-size: 12px">2018.01.01</font><br />
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
						<p>
							사용자 후기 내용 ,row는 4줄 = 4줄이상은 ...<a href="#">더보기</a>
						</p>
					</div>
				</div>
			</c:forEach>
		</div>
		<input type="button" class="form-control w3-border w3-round w3-button"
			value="n개의 댓글 더 보기" />
		<hr />
		<div style="width: 100%; margin: 20px auto">
			<div align="center">
				<a href="user_content_pay.do"><button  class="w3-button w3-round w3-border">예약하기</button></a>
				<a href="map_main.do"><button  class="w3-button w3-round w3-border">뒤로가기</button></a>
			</div>
		</div>
	</div>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
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
	</script>

	<jsp:include page="footer.jsp"></jsp:include>