<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
			<div id="summary" class="form-inline" style="margin-bottom:10px; height:136px">
				<div id="usr_info" class="form-group" style="width:30%">
					사용자 aaa님
				</div>
				<div id="summary_board" class="form-group" style="width:60%">
					<div id="total" class="form-group" style="width:20%; text-align:center">
						<a href="usr_rsv_list.do">전체</a><br />
						<h3>${tot}</h3>
					</div>
					<div id="expect" class="form-group" style="width:20%; text-align:center">
						<a href="usr_rsv_list.do?rsv_code=1">이용예정</a><br />
						<h3>${exp}</h3>
					</div>
					<div id="complite" class="form-group" style="width:20%; text-align:center">
						<a href="usr_rsv_list.do?rsv_code=2">이용완료</a><br />
						<h3>${com}</h3>
					</div>
					<div id="cancel" class="form-group" style="width:20%; text-align:center">
						<a href="usr_rsv_list.do?rsv_code=3">취소환불</a><br />
						<h3>${can}</h3>
					</div>
				</div>
			</div>
			
			<div id="resrv_list" style="margin-bottom:10px; height:430px">
				<h3>예약 리스트</h3>
				<hr />
				<c:if test="${fn:length(rlist) eq 0 }">
					<div style="padding:100px">
						<h3>예약정보가 없습니다</h3>
					</div>
				</c:if>
				<c:if test="${fn:length(rlist) ne 0 }">
					<table class="table">
						<tr>
							<th>상태</th>
							<th>상호명</th>
							<th>예약일</th>
						</tr>
						<c:forEach var="tmp" items="${rlist}">
							<tr>
								<td>${tmp.rsv_code_chk}</td>
								<td><a href="usr_rsv_content.do?rsv_no=${tmp.rsv_no}">${tmp.str_name}</a></td>
								<td>예약일</td>
							</tr>
						</c:forEach>
					</table>
					<!-- <hr />
					<div align="center">
						<ul id="pagination" class="pagination"></ul>
					</div> -->
				</c:if>
			</div>
		</div>
		
		<jsp:include page="v1_footer.jsp"></jsp:include>
	
	</div>
	
	
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.twbsPagination.min.js"></script>
	<script>
		$(function() {
		/* 	$('#pagination').twbsPagination({
				totalPages:10,
				visiblePage:10,
				href:'?rsv_code=${param.rsv_code}&page={{number}}'
			}) */
		});
	</script>

</body>
</html>