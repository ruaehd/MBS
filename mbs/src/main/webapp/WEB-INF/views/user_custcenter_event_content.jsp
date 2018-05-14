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
							<a href="user_custcenter_main.do">고객센터</a>
						</div>
					</div>
					<hr/>
					<div class="col-md-6" style="margin-bottom:30px">
						<a href="#"><img src="eventImgContent.do?evt_no=${param.evt_no}" style="width:205%; height:1500px"></a>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="v1_footer.jsp"></jsp:include>
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
</body>
</html>