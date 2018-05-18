<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
<link rel="stylesheet" type="text/css" href="resources/css/component.css" />
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="resources/css/w3.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/footer.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!DOCTYPE html>
		<div id="header">
			<ul id="gn-menu" class="gn-menu-main">
				<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu"><span>Menu</span></a> 
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								<li>
									<a class="gn-icon gn-icon-help sub_main1">고객센터</a>
									<ul class="gn-submenu sub_1" >
										<li><a class="gn-icon gn-icon-illustrator" href="service_main.do">고객센터 메인</a></li>
		                              	<li><a class="gn-icon gn-icon-photoshop" href="notice.do">공지사항</a></li>
		                              	<li><a class="gn-icon gn-icon-photoshop" href="event.do">이벤트</a></li>
		                              	<li><a class="gn-icon gn-icon-photoshop" href="qna.do">1:1문의</a></li>
		                              	<li><a class="gn-icon gn-icon-photoshop" href="fna.do">자주하는질문</a></li>
									</ul>
								</li>
								<li>
									<a class="gn-icon gn-icon-cog sub_main2" >사용자관리</a>
									<ul class="gn-submenu sub_2"  >
										<li><a class="gn-icon gn-icon-illustrator" href="user_main.do">마이페이지</a></li>
										<li><a class="gn-icon gn-icon-illustrator" href="user_changepw.do">비밀번호변경</a></li>
										<li><a class="gn-icon gn-icon-photoshop" href="user_edit.do">회원정보수정</a></li>
										<li><a class="gn-icon gn-icon-illustrator" href="usr_rsv_list.do">예약목록</a></li>
									</ul>
								</li>
								<li><a class="gn-icon gn-icon-cog sub_main3" >사업자관리</a>
									<ul class="gn-submenu sub_3"  >
										<li><a class="gn-icon gn-icon-cog sub_main4" href="biz_join.do" >업소등록</a></li>
										<c:if test="${sessionScope.Mem_Grade eq 2}">
											<li><a class="gn-icon gn-icon-illustrator" href="biz_str_management.do">내 업체목록</a></li>
										</c:if>
									</ul>
								</li>
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
				<li><a href="map_main.do">지도로 보기</a></li>
				<li><a href="web_main.do">자세히 보기</a></li>
				<c:if test="${sessionScope.Mem_Id eq null}">
					<li><a href="user_login.do">로그인</a></li>
				</c:if>
				<c:if test="${sessionScope.Mem_Id ne null}">
					<li><a href="user_logout.do">로그아웃</a></li>
				</c:if>
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
