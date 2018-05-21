<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>예약정보</title>
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<h3>예약정보</h3>
		<hr/>
		<table class="table">
			<tr>
				<th>사용예정일</th>
				<td>${vo.rsv_day}</td>
				<th>인원</th>
				<td>${vo.rsv_personnel}</td>			
			</tr>
			<tr>
				<th>예약자명</th>
				<td>${vo.rsv_sub_name}</td>
				<th>연락처</th>
				<td>${vo.rsv_sub_tel}</td>		
			</tr>
			<tr>
				<th>메뉴</th>
				<td colspan="3">
					<div>
						<c:forEach var="tmp" items="${rmlist}">
							<strong>${tmp.rsv_mn_name} * ${tmp.rsv_mn_cnt} </strong><br />
						</c:forEach>
					</div>
				</td>			
			</tr>
			<tr>
				<th>요구사항</th>
				<td>${vo.rsv_sub_request}</td>			
			</tr>
		</table>
		<hr />
		<div align="center">
			<input type="button" class="btn btn-success" id="btn_exit" value="닫기"/>
		</div>
	</div>
	
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script>
	$(function() {
		$('#btn_exit').click(function() {
			close();
		});
	});
	</script>

</body>
</html>