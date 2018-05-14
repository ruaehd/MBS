<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
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
					<div class="w3-display-container" style="width:100%; height:200px">
						<div class="w3-display-middle" align="center">
							<h1>1:1문의</h1>
							궁금하신 점을 물어보시거나 개선해야 할 점을 알려주시면 <br/>성심성의껏 답변해드립니다.
						</div>
					</div>
					<form:form action="qna.do" method="post" modelAttribute="vo" enctype="multipart/form-data">
					<div class="w3-round" style="border:2px solid #cccccc;padding:30px">
					<div class="form-inline" style="margin-bottom:20px">
						<div class="form-group">
							<div  style="width:100px">유형</div>
							
						</div>
						<div class="form-group">
							<form:select class="w3-select w3-border w3-round" style="width:100px" id="sel1" path="qst_code">
								<option>예약</option>
								<option>결재</option>
								<option>환불</option>
								<option>리뷰</option>
								<option>서비스</option>
								<option>기타</option>
							</form:select>
						</div></div>
						<div class="form-inline">
							<div class="form-group">
							<div style="width:100px">제목</div>	
						</div>
						<div class="form-group">
							<form:input type="text" class="w3-input w3-border w3-round" placeholder="제목을 입력해주세요" path="qst_title" style="width:800px"/>
						</div>
						</div>
						
						<hr/>
						<div class="form-inline">
							<div class="form-group">
							<div  style="width:100px">글내용</div>
							</div>
						
						<div class="form-group">
							<form:textarea rows="8" class="w3-input w3-border w3-round" path="qst_content" style="resize:none;width:800px"></form:textarea>
						</div>
						</div>
						<hr/>
						<div class="form-inline">
							<div class="form-group">
							<div style="width:100px">파일첨부</div>
							</div>
						
						<div class="form-group">
							<input type="file" name="qst_img1" class="w3-input w3-round w3-border" style="width:600px" />
						</div>
						</div>
						<form:input type="hidden" path="mb_id" value="mjy" />
						<hr/>
						<div align="center">
							<input type="submit" class="w3-button w3-round w3-border" value="보내기"/>
							<a href="user_custcenter_main.do"><button class="w3-button w3-round w3-border">뒤로가기</button></a>
						</div>
						
					</div>
					</form:form>
				</div>
			</div>
		</div>
		<jsp:include page="v1_footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script>
		$(function() {
			
		});
	</script>
</body>
</html>
