<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<title>Mbs</title>
		<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/w3.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/component.css" />	
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script src="resources/js/jquery-1.11.1.js"></script>
		<style>
		.map{
		z-index:2;
		}
		.gn-menu-main{
			z-index:3;
		}
		.z-i2{
			z-index:4;
		}
		</style>
	</head>
	<body>
		<div class="container">
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
								<c:if test="${sessionScope.Mem_Id ne null}">
									<li><a class="gn-icon gn-icon-cog sub_main2" >사용자관리</a>
										<ul class="gn-submenu sub_2"  >
											<li><a class="gn-icon gn-icon-illustrator" href="user_main.do">마이페이지</a></li>
											<li><a class="gn-icon gn-icon-illustrator" href="user_changepw.do">비밀번호변경</a></li>
											<li><a class="gn-icon gn-icon-photoshop" href="user_edit.do">회원정보수정</a></li>
											<li><a class="gn-icon gn-icon-illustrator" href="usr_rsv_list.do">내 예약목록</a></li>
										</ul>
									</li>
								</c:if>
								</li>
								<c:if test="${sessionScope.Mem_Grade eq 2}">
									<li><a class="gn-icon gn-icon-cog sub_main3" >사업자관리</a>
										<ul class="gn-submenu sub_3" >
											<li><a class="gn-icon gn-icon-illustrator" href="#?id=${sessionScope.Mem_Id ne null}">내 업체목록</a></li>
										</ul>
									</li>
								</c:if>
								<c:if test="${sessionScope.Mem_Grade eq 1}">
									<li><a class="gn-icon gn-icon-cog sub_main4" href="biz_join.do" >사업자로 등록하기</a></li>
								</c:if>
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
		</div><!-- /여기부터 container -->