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
			<h3>예약 정보</h3>
			<hr />
			<table class="table">
				<tr>
					<th>예약번호</th>
					<td>${vo.rsv_no}</td>
					<th>업체명</th>
					<td>${vo.str_name}</td>
				</tr>
				<tr>
					<th>업체 번호</th>
					<td>${vo.str_tel}</td>
					<th>업체 주소</th>
					<td>${vo.str_address}</td>
				</tr>
				<tr>
					<th>예약 일자</th>
					<td>${vo.rsv_day}</td>
					<th>예약 인원</th>
					<td>${vo.rsv_personnel}</td>
				</tr>
				<tr>
					<th>예약자 이름</th>
					<td>${vo.rsv_sub_name}</td>
					<th>예약자 번호</th>
					<td>${vo.rsv_sub_tel}</td>
				</tr>
				<tr>
					<th>예약자 이메일</th>
					<td>${vo.rsv_sub_email}</td>
					<th>예약자 요청사항</th>
					<td>${vo.rsv_sub_request}</td>
				</tr>
				<tr>
					<th>예약 시간</th>
					<td>${vo.rsv_time}</td>
				</tr>
			</table>
			<hr />
		</div>
		
		<jsp:include page="v1_footer.jsp"></jsp:include>
	
	</div>
	
	
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			
		});
	</script>

</body>
</html>