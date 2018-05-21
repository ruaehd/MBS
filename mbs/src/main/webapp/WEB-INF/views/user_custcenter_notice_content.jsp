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
					<div class="w3-display-container" style="width:100%; height:200px">
						<div class="w3-display-middle">
							<h1>공지사항</h1>
						</div>
					</div>
					<div class="form-inline">
						<div class="form-group" style="width:90%">
							<h4><b>${vo.ntc_title}</b></h4>
						</div>
						<div class="form-group">
							${vo.ntc_date}
						</div>
					</div>
					<hr/>
					<div style="font-size:12px">
					${vo.ntc_content}
					</div>
					<table class="w3-table w3-bordered" style="width:100%;border-top:1px solid #cccccc;border-bottom:1px solid #cccccc;margin-top:20px">
						<tr>
							<td style="width:10%;font-size:12px;vertical-align:middle">이전글</td>
							<td style="vertical-align:middle"><a href="notice_content.do?ntc_no=${pno}">${pvo.ntc_title}</a></td>
						</tr>
						<tr>
							<td style="width:10%;font-size:12px;vertical-align:middle">다음글</td>
							<td style="vertical-align:middle"><a href="notice_content.do?ntc_no=${nno}">${nvo.ntc_title}</a></td>
						</tr>
						
					</table>
					<div align="right" style="margin-top:20px">
						<c:if test="${pno == 0}">
						<a href="#"><input type="button" class="w3-button w3-round-xlarge w3-border" style="width:100px" value="이전글" disabled/></a>
						</c:if>
						<c:if test="${pno != 0}">
						<a href="notice_content.do?ntc_no=${pno}"><input type="button" class="w3-button w3-round-xlarge w3-border" style="width:100px" value="이전글"/></a>
						</c:if>
						<c:if test="${nno != 0}">
						<a href="notice_content.do?ntc_no=${nno}"><input type="button" class="w3-button w3-round-xlarge w3-border" style="width:100px" value="다음글"/></a>
						</c:if>
						<c:if test="${nno == 0}">
						<a href="#"><input type="button" class="w3-button w3-round-xlarge w3-border" style="width:100px" value="다음글" disabled/></a>
						</c:if>
						<a href="notice.do"><input type="button" class="w3-button w3-round-xlarge w3-border" style="width:100px" value="목록"/></a>
					</div>
				</div>
			</div>
		</div>	
		<jsp:include page="v1_footer.jsp"></jsp:include>
	</div>
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script>
		$(function(){

		});
	</script>
</body>
</html>
