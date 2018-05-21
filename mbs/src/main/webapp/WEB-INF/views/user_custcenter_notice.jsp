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
	<div class="wrapper">
		<jsp:include page="v1_header.jsp"></jsp:include>
		<div id="main">
			<div style="margin-top:68px">
				<div class="container" style="width:60%; margin:0px auto">
					<div class="w3-display-container" style="width:100%; height:300px">
						<div class="w3-display-middle">
							<h1>공지사항</h1>
						</div>
						<div class="w3-display-bottomright" style="margin-right:10px">
							<a href="service_main.do">고객센터</a>
						</div>
					</div>
					<table class="w3-table w3-bordered" style="margin-top:20px">
						<c:forEach var="vo" items="${list}">			
							<tr style="height:50px;padding:10px;">
								<td style="width:90%;vertical-align:middle"><a href="notice_content.do?ntc_no=${vo.ntc_no}">${vo.ntc_title}</a></td>
								<td style="vertical-align:middle">${vo.ntc_date}</td>
							</tr>
						</c:forEach>
					</table>
					<div align="center">
					<ul id="pagination" class="pagination"></ul>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="v1_footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/jquery.twbsPagination-1.3.1.js"></script>
	<script>
		$(function() {
			$('#pagination').twbsPagination({
				totalPages		: '${totPage}',
				visiblePages	: 10,
				href : '?page={{number}}'
			});
			
		});
	</script>
</body>
</html>
		
