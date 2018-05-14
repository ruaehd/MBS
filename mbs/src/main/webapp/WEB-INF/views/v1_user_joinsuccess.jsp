<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
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
		<div id="main">
			<div class="container" style="margin-top: 150px; min-height: 300px">
				<div class="row form-group">
					<div align="center" style="margin-bottom: 50px">
						<h1 style="font-size: 56px">
							<b>회웝가입을 축하드립니다 !</b>
						</h1>
						<br />
						<h2>
							해당 아이디를 바로 사용하실수도
							<br />사업자로 전환하여 업체를 등록하실수도 있습니다 !
						</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-offset-1 col-md-5">
					<a href="user_login.do" style="text-decoration:none"><button type="button" class="btn btn-info btn-lg btn-block" style="height:50vh"><h1>바로 둘러보기</h1></button></a>
				</div>
				<div class="col-md-5">
					<a href="biz_join.do" style="text-decoration:none"><button type="button" class="btn btn-primary btn-lg btn-block" style="height:50vh"><h1>사업체 등록하기</h1></button></a>
				</div>
		 	</div>
		</div>
		<jsp:include page="v1_footer.jsp"></jsp:include>
	</div>
	
   	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
 	<script src="resources/js/jquery-3.2.1.min.js"></script>
   	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
