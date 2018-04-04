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
				<input type="text" class="w3-input w3-round"
					placeholder="찾고자 하는 단어 또는 문장을 입력하세요"
					style="width: 500px; margin-top: 50px" />
			</div>
			<div align="right" style="margin-right:100px">
				<a href="user_custcenter_main.do">고객센터</a>
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
					<h4>결제</h4>
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
					<h4>회원정보</h4>
				</button>
				<button
					class="w3-button w3-white w3-hover-white faq_button faq_title">
					<h4>서비스</h4>
				</button>
			</div>
		</div>
		<div class="row" style="margin-top: 20px;height:400px">
			<div class="col-md-4" align="center">
				<h3 id="faq_bottom_title"></h3>
			</div>

			<div class="col-md-8">
				<table class="w3-table w3-bordered" style="width: 88%">
				<!-- 예약  -->
					<tbody class="content">
						<tr class="content-head">
							<td width="90%">예약은 어떻게 하는건가요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">예약은 컨텐츠 진입 후 예약하기 버튼으로 하시면 됩니다.</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">예약은 바로 되는건가요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2"  class="w3-light-gray">예약하기 버튼을 눌러 예약은 완료하였을 경우 예약이 완료됩니다.</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">예약취소가 가능할까요</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2"  class="w3-light-gray">예약취소는 예약일자 3일 이전까지  가능합니다<br/> 3일 이전이 지날경우 하루마다 수수료 30%가 제외된 가격이 환불됩니다.</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">예약은 약국에서 사는 약인가요?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2"  class="w3-light-gray">예약은 약국에서 판매하지 않고 일반적으로 '미리 약속함'이라는 뜻입니다<br/><a href="https://namu.wiki/w/예약" target="_blank">예약이란?-나무위키</a></td>
						</tr>
					</tbody>
					<!-- 결제  -->
					<tbody class="content">
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">결제는 어떻게 진행이 되나요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">결제는 컨텐츠 진입 후 예약하기 버튼을 눌러 정보를 확인 후에 결제하기 버튼으로 결제가 가능합니다</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">결제가 안될때는 어떻게 하나요?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">결제가 안될 시에는 홈페이지에서 제공하는 결제방법을 확인하시고 안되신다면 1:1문의로 도와드리겠습니다.</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">결제 수단에는 어떤게 있나요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">결제 수단에는 카드,문화상품권,핸드폰결제,무통장 입금 이 있습니다.</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">온라인 결제를 했는데 정확한 가맹점명은 어떻게 확인하나요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">결제를 진행 한 뒤 가맹점 명이 생각이 안나실때엔<a href="user_main.do">마이페이지</a>의 현재 예약중인 항목을 확인해주세요. </td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">카드결제가 안됩니다.</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">결제내용을 잘 확인해보시고 안되실때에 1:1문의로 연락주시면 감사하겠습니다.</td>
						</tr>
					</tbody>
					<!-- 환불  -->
					<tbody class="content">
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">환불 과정이 어떻게 되나요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">환불은 3일이전으로 예약취소 할 경우 바로 환불이 되고 3일 이내일 경우 하루 30%씩 차감되어 자동으로 환불됩니다</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">예약 후 언제까지 취소해야 환불 받을 수 있나요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">예약취소는 예약 1일전 까지 가능합니다.</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">예약한 곳에 다녀온 후 마음에 들지 않아 환불하고 싶을때 환불이 가능한가요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">단숨변심으로 인한 환불은 불가능하며 불이익을 받으셨을 경우 1:1문의로 연락주시면 도와드리겠습니다.</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">예약한 곳에서 갈등이 있었습니다. 환불이 가능한가요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">해당 가맹점에서의 갈등이 생겨 불이익을 받으셨을 경우 1:1문의로 연락주시면 도와드리겠습니다.</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">업체규정을 잘못 보아 현장에서 이용하고 싶지 않을때 바로 환불이 가능한가요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">고객의 실수로 인한 환불은 도와드리지 않습니다 .</td>
						</tr>
					</tbody>
					<!-- 리뷰  -->
					<tbody class="content">
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">리뷰를 잘못 올렸습니다 수정이 가능한가요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray"><a href="user_main.do">마이페이지</a>의 하단 후기내역을 보시면 수정이 가능합니다</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">해당 리뷰가 마음에듭니다. 추천을 하고싶은데 어떻게 하나요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">해당 리뷰 오른편 추천하기 버튼으로 가능합니다.</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">글을 보는 도중에 부적절한 리뷰를 봤습니다. 삭제요청은 어떻게 하나요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">1:1문의로 연락주시면 도와드리겠습니다.</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">리뷰가 베스트리뷰가 되었을때 혜택은 없나요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">혜택은 따로 존재하지 않습니다.</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">업체가 너무 마음에 들어 리뷰를 잘 쓰고 싶은데 도와주세요</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">예약은 컨텐츠 진입 후 예약하기 버튼으로 하시면 됩니다.</td>
						</tr>
					</tbody>
					<!-- 회원정보  -->
					<tbody class="content">
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">회원 탈퇴를 하고 싶습니다 어떻게 하나요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">회원 탈퇴의 경우 <a href="user_main.do">마이페이지</a>의 회원정보 수정하기 안의 회원탈퇴로 가능합니다</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">비밀번호 변경이 가능한가요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray"><a href="user_main.do">마이페이지</a>의 비밀번호 변경으로 가능합니다</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">회원정보 수정은 어떻게 하나요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray"><a href="user_main.do">마이페이지</a>의 회원정보 수정에서 가능합니다</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">같은 정보로 두개의 회원가입이 가능한가요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">두개의 회원가입은 불가하나, 사업자 와 사용자의 경우 가능합니다</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">사업자와 사용자를 같은 아이디로 사용이 가능한가요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">사업자와 사용자는 같은 아이디로 운용하는것은 불가능하지만 같은정보로 두개의 아이디를 만들어 사용하면 가능합니다.</td>
						</tr>
					</tbody>
					<!-- 서비스  -->
					<tbody class="content">
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">업체의 서비스가 너무 좋아요! 추천이 가능할까요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">해당업체에 리뷰를 남겨주시면 됩니다.</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">업체의 서비스가 마음에 안듭니다. 비추천이 가능할까요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">해당업체에 리뷰를 남겨주시면 됩니다.</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">업체의 서비스를 조금만 바꾸면 괜찮을거같아요. 조언이 가능한가요 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">해당업체에 리뷰를 남겨주시면 됩니다.</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">쓸 글이 생각이 안나요 ! 그만써도 되겠죠 ?</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">예약은 컨텐츠 진입 후 예약하기 버튼으로 하시면 됩니다.</td>
						</tr>
						<tr class="content-head">
							<td style="width:90%;vertical-align:middle">홈페이지가 너무 마음에 듭니다. 개발자가 궁금해요 !</td>
							<td><button class="w3-button w3-white w3-hover-white"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></button></td>
						</tr>
						<tr class="content-body">
							<td colspan="2" class="w3-light-gray">그러신가요?</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div>
				
		</div>
	</div>
	<script>
		$(function() {
			$('.content').hide();
			$('.content-body').hide();
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
				$('.content').hide(100);
				var idc = $(this).index();
				var title = $(this).eq(idx).text();
				$('#faq_bottom_title').eq(idx).text(title);
				$('.content-body').hide();
				$('.content').eq(idc).toggle(300);
			});
			
			$('.content-head').click(function(){
				var ch = $(this).index('.content-head');
				$('.content-body').eq(ch).toggle(200);
			});
		});
	</script>
	<jsp:include page="footer.jsp"></jsp:include>