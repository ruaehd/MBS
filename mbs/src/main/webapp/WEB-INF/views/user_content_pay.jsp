<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내용</title>
<link rel="stylesheet" type="text/css" href="resources/css/w3.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/sidebar.css" />
<style>
.w3-container {
	width: 80%;
	margin: 30px auto;
	padding: 30px;
	border: 2px solid #cccccc
}

.content-header {
	background-image: url("resources/imgs/js.png") !important;
	width: 100%;
	height: 100%;
	border: 0
}
</style>
</head>
<body>
	<div class="w3-container w3-round">
		<h1><b>예약하기</b></h1>
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
		</div>
	</div>
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>