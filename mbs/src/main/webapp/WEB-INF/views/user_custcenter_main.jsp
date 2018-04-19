<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<div style="margin-top:68px;">
  <div class="container" style="margin:0px auto">
  	<h2>고객센터</h2>
  	<p>고객님의 소중한 의견 하나하나까지 귀 기울이겠습니다.</p>
  	<hr/>
  	<div class="btn-group btn-group-justified" role="group">
  	<div class="btn-group" role="group">
		<a href="notice.do"><button type="button" class="btn btn-default" style="height:200px">
		<img src="resources/imgs/notice.png" style="width:50px; height:50px"/>
		<h2>공지</h2>
		</button>
		</a>
		</div>
		
	<div class="btn-group" role="group">
		<a href="event.do"><button type="button" class="btn btn-default" style="height:200px">
		<img src="resources/imgs/event.png" style="width:50px; height:50px"/>
		<h2>이벤트</h2>
		</button>
		</a>
		</div>
		
			<div class="btn-group" role="group">
		<a href="qna.do"><button type="button" class="btn btn-default" style="height:200px">
		<img src="resources/imgs/question.png" style="width:50px; height:50px"/>
		<h2>1:1문의</h2>
		</button>
		</a>
		</div>
		
			<div class="btn-group" role="group">
		<a href="fna.do"><button type="button" class="btn btn-default" style="height:200px">
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
				<input type="text" class="w3-input w3-border w3-round" style="width:400px" placeholder="궁금하신 내용을 입력하세요."/>
			</div>
			<div class="form-group">
				<input type="submit" class="w3-button w3-black w3-round " value="검색"/>
			</div>
		</div>
	</div>
	<div class="container" style="margin:0px auto">
	<table class="w3-table w3-bordered" style="width:100%">
		<tr class="content-head">
			<td style="width:10%; vertical-align:middle"><img src="resources/imgs/many-question.png" style="width:20px; height:20px"/></td>
			<td width="10%"><h4>예약</h4></td>
			<td style="width:80%;vertical-align:middle">예약은 어떻게 하는건가요 ?</td>
		</tr>
		<tr class="content-body w3-light-gray">
			<td colspan="2"></td>
			<td>예약은 컨텐츠 진입 후 예약하기 버튼으로 하시면 됩니다.</td>
		</tr>
		<tr class="content-head">
			<td style="width:10%; vertical-align:middle"><img src="resources/imgs/many-question.png" style="width:20px; height:20px"/></td>
			<td width="10%"><h4>결제</h4></td>
			<td style="width:80%;vertical-align:middle">결제가 안될때는 어떻게 하나요?</td>
		</tr>
		<tr class="content-body w3-light-gray">
			<td colspan="2"></td>
			<td>결제가 안될 시에는 홈페이지에서 제공하는 결제방법을 확인하시고 안되신다면 1:1문의로 도와드리겠습니다.</td>
		</tr>
		<tr class="content-head">
			<td style="width:10%; vertical-align:middle"><img src="resources/imgs/many-question.png" style="width:20px; height:20px"/></td>
			<td width="10%"><h4>결제</h4></td>
			<td style="width:80%;vertical-align:middle">결제 수단에는 어떤게 있나요 ?</td>
		</tr>
		<tr class="content-body w3-light-gray">
			<td colspan="2"></td>
			<td>결제 수단에는 카드,문화상품권,핸드폰결제,무통장 입금 이 있습니다.</td>
		</tr>
		<tr class="content-head">
			<td style="width:10%; vertical-align:middle"><img src="resources/imgs/many-question.png" style="width:20px; height:20px"/></td>
			<td width="10%"><h4>환불</h4></td>
			<td style="width:80%;vertical-align:middle">환불 과정이 어떻게 되나요?</td>
		</tr>
		<tr class="content-body w3-light-gray">
			<td colspan="2"></td>
			<td>환불은 3일이전으로 예약취소 할 경우 바로 환불이 되고 3일 이내일 경우 하루 30%씩 차감되어 자동으로 환불됩니다</td>
		</tr>
		<tr class="content-head">
			<td style="width:10%; vertical-align:middle"><img src="resources/imgs/many-question.png" style="width:20px; height:20px"/></td>
			<td width="10%"><h4>결제</h4></td>
			<td style="width:80%;vertical-align:middle">온라인 결제를 했는데 정확한 가맹점명은 어떻게 확인하나요 ?</td>
		</tr>
		<tr class="content-body w3-light-gray">
			<td colspan="2"></td>
			<td>결제를 진행 한 뒤 가맹점 명이 생각이 안나실때엔 <a href="user_main.do">마이페이지</a>의 현재 예약중인 항목을 확인해주세요. </td>
		</tr>
		<tr class="content-head">
			<td style="width:10%; vertical-align:middle"><img src="resources/imgs/many-question.png" style="width:20px; height:20px"/></td>
			<td width="10%"><h4>환불</h4></td>
			<td style="width:80%;vertical-align:middle">예약 후 언제까지 취소해야 환불 받을 수 있나요 ?</td>
		</tr>
		<tr class="content-body w3-light-gray">
			<td colspan="2"></td>
			<td>예약취소는 예약 1일전 까지 가능합니다.</td>
		</tr>
		<tr class="content-head">
			<td style="width:10%; vertical-align:middle"><img src="resources/imgs/many-question.png" style="width:20px; height:20px"/></td>
			<td width="10%"><h4>리뷰</h4></td>
			<td style="width:80%;vertical-align:middle">글을 보는 도중에 부적절한 리뷰를 봤습니다. 삭제요청은 어떻게 하나요 ?</td>
		</tr>
		<tr class="content-body w3-light-gray">
			<td colspan="2"></td>
			<td>1:1문의로 연락주시면 도와드리겠습니다.</td>
		</tr>
		<tr class="content-head">
			<td style="width:10%; vertical-align:middle"><img src="resources/imgs/many-question.png" style="width:20px; height:20px"/></td>
			<td width="10%"><h4>리뷰</h4></td>
			<td style="width:80%;vertical-align:middle">해당 리뷰가 마음에듭니다. 추천을 하고싶은데 어떻게 하나요 ?</td>
		</tr>
		<tr class="content-body w3-light-gray">
			<td colspan="2"></td>
			<td>해당 리뷰 오른편 추천하기 버튼으로 가능합니다.</td>
		</tr>
	</table>
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
<script>
	$(function(){
		$('.content-body').hide();
		$('.content-head').click(function(){
			var ch = $(this).index('.content-head');
			$('.content-body').eq(ch).toggle(100);
		});
	});
</script>
<jsp:include page="footer.jsp"></jsp:include>