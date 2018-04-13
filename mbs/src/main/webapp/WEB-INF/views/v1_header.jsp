<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
		<div id="header">
			<ul id="gn-menu" class="gn-menu-main">
				<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu"><span>Menu</span></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								<li class="gn-search-item">
									<input placeholder="Search" type="search" class="gn-search">
									<a class="gn-icon gn-icon-search"><span>검색</span></a>
								</li>
								<li>
									<a class="gn-icon gn-icon-help sub_main1">고객센터</a>
									<ul class="gn-submenu sub_1" >
										<li><a class="gn-icon gn-icon-illustrator" href="user_custcenter_main.do">고객센터 메인</a></li>
										<li><a class="gn-icon gn-icon-photoshop" href="user_custcenter_notice.do">공지사항</a></li>
										<li><a class="gn-icon gn-icon-photoshop" href="user_custcenter_event.do">이벤트</a></li>
										<li><a class="gn-icon gn-icon-photoshop" href="user_custcenter_question.do">1:1문의</a></li>
										<li><a class="gn-icon gn-icon-photoshop" href="user_custcenter_faq.do">자주하는질문</a></li>
									</ul>
								</li>
								<li><a class="gn-icon gn-icon-cog sub_main2" >사용자관리</a>
									<ul class="gn-submenu sub_2"  >
										<li><a class="gn-icon gn-icon-illustrator" href="user_main.do">마이페이지</a></li>
										<li><a class="gn-icon gn-icon-illustrator" href="user_member_changepw.do">비밀번호변경</a></li>
										<li><a class="gn-icon gn-icon-photoshop" href="user_member_change.do">회원정보수정</a></li>
										<li><a class="gn-icon gn-icon-photoshop" href="user_cheat.do">내 채팅내역</a></li>
										<li><a class="gn-icon gn-icon-photoshop" href="user_question.do">내 문의내역</a></li>
									</ul>
								</li>
								<li><a class="gn-icon gn-icon-cog sub_main3" >예약관리</a>
									<ul class="gn-submenu sub_3"  >
										<li><a class="gn-icon gn-icon-illustrator" href="usr_rsv_list.do?rsv_code=0">예약목록</a></li>
										<li><a class="gn-icon gn-icon-illustrator" href="usr_content.do">업소정보</a></li>
									</ul>
								</li>
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
				<li><input type="search" class="gn-search" placeholder="주소로 검색하기"/></li>
				<li><a href="map_main.do">지도로 보기</a></li>
				<li><a href="web_main.do">자세히 보기</a></li>
				<li><a href="#">로그인</a></li>
			</ul>
		
		
			<script src="resources/js/jquery-1.11.1.js"></script>
			<script src="resources/js/bootstrap.min.js"></script>
			<script src="resources/js/classie.js"></script>
			<script src="resources/js/gnmenu.js"></script>
			<script>
				new gnMenu(document.getElementById('gn-menu'));
			</script>
			<script>
				$(function() {
					$('.sub_1').hide();
					$('.sub_2').hide();
					$('.sub_3').hide();
					$('.sub_4').hide();
				
					$('.sub_main1').click(function() {
						$('.sub_1').toggle(500);
					});
					$('.sub_main2').click(function() {
						$('.sub_2').toggle(500);
					});
					$('.sub_main3').click(function() {
						$('.sub_3').toggle(500);
					});
					$('.sub_main4').click(function() {
						$('.sub_4').toggle(500);
					});
				});
			</script>
		</div>
