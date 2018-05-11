<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
</head>
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
<body>

	<div class="container" style="margin-top: 68px">
		<div align="center" style="width: 100%; margin-bottom: 20px">
			<div style="margin: 80px 0px;">
				<h1>자주하는 질문</h1>
					<input type="text" class="w3-input w3-round" placeholder="찾고자 하는 단어 또는 문장을 입력하세요" style="width: 400px; margin-top: 50px" id="search_text"/>
			</div>
			<div align="right" style="margin-right:100px">
				<a href="service_main.do">고객센터</a>
			</div>
		</div>
		<div class="form-inline">
			<div class="form-group" style="width: 100%">
				<button
					class="w3-button w3-white w3-hover-white faq_button faq_title">
					<h4>예약</h4>
				</button>
				<button
					class="w3-button w3-white w3-hover-white faq_button faq_title">
					<h4>결재</h4>
				</button>
				<button
					class="w3-button w3-white w3-hover-white faq_button faq_title">
					<h4>환불</h4>
				</button>
				<button
					class="w3-button w3-white w3-hover-white faq_button faq_title">
					<h4>리뷰</h4>
				</button>
				<button
					class="w3-button w3-white w3-hover-white faq_button faq_title">
					<h4>회원</h4>
				</button>
				<button
					class="w3-button w3-white w3-hover-white faq_button faq_title">
					<h4>서비스</h4>
				</button>
			</div>
		</div>
		<div class="row" style="margin-top: 20px;height:400px">
			<div class="col-md-4" align="center">
				<c:if test="${param.code == '1'}"><h3>예약</h3></c:if>
				<c:if test="${param.code == '2'}"><h3>결재</h3></c:if>
				<c:if test="${param.code == '3'}"><h3>환불</h3></c:if>
				<c:if test="${param.code == '4'}"><h3>리뷰</h3></c:if>
				<c:if test="${param.code == '5'}"><h3>회원</h3></c:if>
				<c:if test="${param.code == '6'}"><h3>서비스</h3></c:if>
			</div>

			<div class="col-md-8">
				<table class="w3-table w3-bordered" style="width: 88%">
				<c:forEach var="vo" items="${list}">
					<tbody class="content">
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">${vo.fna_title}</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">${vo.fna_content}</td>
						</tr>
					</tbody>
				</c:forEach>
				</table>
			</div>
		</div>
		<div>
				
		</div>
	</div>
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
	<jsp:include page="footer.jsp"></jsp:include>