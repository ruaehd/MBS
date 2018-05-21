<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<style>
		.faq_button {
			width: 15%;
			height: 80px;
			border-bottom: 1px solid #cccccc;
			border-radius: 5px 5px 0px 0px;
			border-callapse: collapse;
			margin-left: 0;
			margin-right: 0;
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="v1_header.jsp"></jsp:include>
		<div id="main">
			<div class="container" style="margin-top: 68px">
				<div align="center" style="width: 100%; margin-bottom: 20px">
					<div style="margin: 80px 0px;">
						<h1>자주하는 질문</h1>
							<input type="text" class="w3-input w3-round" placeholder="찾고자 하는 단어 또는 문장을 입력하세요" style="width: 400px; margin-top: 50px; display:inline;" id="search_text"/>
							<input type="submit" class="w3-button w3-black w3-round " value="검색" id="search_btn"/>
					</div>
					<div align="right" style="margin-right:100px">
						<a href="service_main.do">고객센터</a>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="v1_footer.jsp"></jsp:include>
	</div>
	
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			var func = function(){
				var tx = encodeURIComponent($('#search_text').val());
				window.location.href="fna.do?text="+tx;
			};
			
			$('#search_btn').click(function(){
					func();
			});
	
			$('#search_text').keyup(function(event){
				if(event.which == 13){
					func();
				}
			});
			
/* 			$('.content').hide();
 */			$('.content-body').hide();
			$('.faq_button').mouseover(function() {
				$(this).css("border-top", "1px solid #cccccc");
				$(this).css("border-left", "1px solid #cccccc");
				$(this).css("border-right", "1px solid #cccccc");
				$(this).css("border-bottom", "0");
			});
			$('.faq_button').mouseleave(function() {
				$(this).css("border-top", "0");
				$(this).css("border-left", "0");
				$(this).css("border-right", "0");
				$(this).css("border-bottom", "1px solid #cccccc");
			});
			var idx = $(this).index();
			$('.faq_title').click(function() {
			/* 	$('.content').hide(100);  */
				var code = $(this).index('.faq_title');
				code = code+1;
				$('.content-body').hide();
				/* $('.content').eq(idc).toggle(300); */
				window.location.href="fna.do?code="+code;
			});
			
			$('.content-head').click(function(){
				$('.content-body').hide();
				var ch = $(this).index('.content-head');
				$('.content-body').eq(ch).toggle(200);
			});
		});
	</script>
</body>
</html>
	