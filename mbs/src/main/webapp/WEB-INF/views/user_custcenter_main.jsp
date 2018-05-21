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
			<div style="margin-top:68px;">
			  	<div class="container" style="margin:0px auto">
				  	<h2>고객센터</h2>
				  	<p>고객님의 소중한 의견 하나하나까지 귀 기울이겠습니다.</p>
				  	<hr/>
				  	<div class="btn-group btn-group-justified" role="group">
					  	<div class="btn-group" role="group">
							<a href="notice.do">
								<button type="button" class="btn btn-default" style="height:200px">
									<img src="resources/imgs/notice.png" style="width:50px; height:50px"/>
									<h2>공지</h2>
								</button>
							</a>
						</div>
						<div class="btn-group" role="group">
							<a href="event.do">
								<button type="button" class="btn btn-default" style="height:200px">
								<img src="resources/imgs/event.png" style="width:50px; height:50px"/>
								<h2>이벤트</h2>
								</button>
							</a>
						</div>
							
						<div class="btn-group" role="group">
							<a href="qna.do">
								<button type="button" class="btn btn-default" style="height:200px">
								<img src="resources/imgs/question.png" style="width:50px; height:50px"/>
								<h2>1:1문의</h2>
								</button>
							</a>
						</div>
							
						<div class="btn-group" role="group">
							<a href="fna.do">
								<button type="button" class="btn btn-default" style="height:200px">
								<img src="resources/imgs/many-question.png" style="width:50px; height:50px"/>
								<h2>자주하는질문</h2>
								</button>
							</a>
						</div>
					</div>
					<hr/>
				</div>
				
				<div class="w3-gray" style="width:100%;height:100px;padding:10px;text-align:center;vertical-align:middle;display:tabel-cell">
					<div style="display:inline-block;margin-top:17px" class="form-inline">
						<div class="form-group" style="margin-right:10px">
							<h4><b>자주하는질문</b></h4>
						</div>
						<div class="form-group" style="margin-right:10px">
							<input type="text" class="w3-input w3-border w3-round" style="width:400px" placeholder="궁금하신 내용을 입력하세요." id="search_text" />
						</div>
						<div class="form-group">
							<input type="submit" class="w3-button w3-black w3-round " value="검색" id="search_btn"/>
						</div>
					</div>
				</div>
				<div class="container" style="margin:0px auto">
					<c:forEach var="vo" items="${list1}">
						<table class="w3-table w3-bordered" style="width:100%">
							<tr class="content-head">
								<td style="width:10%; vertical-align:middle"><img src="resources/imgs/many-question.png" style="width:20px; height:20px"/></td>
								<td width="10%"><h4>
								<c:if test="${vo.fna_code == 1}">예약</c:if>
								<c:if test="${vo.fna_code == 2}">결재</c:if>
								<c:if test="${vo.fna_code == 3}">환불</c:if>
								<c:if test="${vo.fna_code == 4}">리뷰</c:if>
								<c:if test="${vo.fna_code == 5}">회원</c:if>
								<c:if test="${vo.fna_code == 6}">서비스</c:if> 
								</h4></td>
								<td style="width:80%;vertical-align:middle">${vo.fna_title}</td>
							</tr>
							<tr class="content-body w3-light-gray">
								<td colspan="2"></td>
								<td>${vo.fna_content}</td>
							</tr>
						</table>
					</c:forEach>
					<div class="row" style="margin-top:20px;border-top:2px solid #cccccc">
						<div class="col-md-6">
							<table class="w3-table w3-bordered" style="margin:25px 0px">
								<tr style="border-bottom:1px solid #cccccc; width:40%">
									<th>공지사항</th>
									<th style="width:30px" align="right"><a href="notice.do">+</a></th>
								</tr>
								<c:forEach var="vo" items="${list}">
									<tr>
										<td colspan="2"><a href="notice_content.do?ntc_no=${vo.ntc_no}">${vo.ntc_title}</a></td>
									</tr>
								</c:forEach>
							</table>
						</div>
						
						<div class="col-md-6">
							<div style="width:100%;margin-top:25px; height:200px;border:1px solid #cccccc;" align="center">
								<div style="margin-top:50px">
									<h4><b>1:1 문의를 도와드립니다</b></h4>
									<div style="width:60%">
										<p>서비스와 질문유형을 선택하시면 보다 정확한 도움말 확인 및 1:1문의를 접수하실 수 있습니다.</p>
									</div>
									<a href="qna.do"><input type="button" class="w3-button w3-black w3-round" value="문의하기"/></a>
								</div>
							</div>
						</div>
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
			
			
			$('.content-body').hide();
			$('.content-head').click(function(){
				$('.content-body').hide();
				var ch = $(this).index('.content-head');
				$('.content-body').eq(ch).toggle(100);
			});
		});
	</script>
</body>
</html>
