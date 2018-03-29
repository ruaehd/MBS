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
			
		<div style="padding:20px; width:600px">
			<h3>후기 작성</h3>
			<hr />
			<div class="form-inline">
				<label style="width:100px">예약 업소</label>
				${vo.str_name}
			</div>
			<div class="form-inline">
				<label style="width:100px">예약 일시</label>
				${vo.rsv_day}
			</div>
			<div class="form-inline">
				<label style="width:100px">예약 평가</label>
				별별별
			</div>
			<div class="form-inline">
				<label style="width:100px">만족도 평가</label>
				<input type="radio" />
			</div>
			<div class="form-inline">
				<label style="width:100px">예약 후기</label>
				<textarea rows="6" style="resize:none; width:300px"></textarea>
			</div>
			<hr />
			<div class="form-inline" align="center">
				<input type="submit" class="btn btn-success" value="후기 작성"/>
				<input type="button" class="btn btn-danger" value="작성 취소"/>
			</div>
		</div>
		
	
	</div>
	
	
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66e7156b3899e012effaa62fd20217d4&libraries=services"></script>
	<script>
		$(function() {
			
		});
	</script>

</body>
</html>