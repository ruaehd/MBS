<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<title>Google Nexus Website Menu</title>
		<meta name="description" content="A sidebar menu as seen on the Google Nexus 7 website" />
		<meta name="keywords" content="google nexus 7 menu, css transitions, sidebar, side menu, slide out menu" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/w3.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/component.css" />	
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="//code.jquery.com/jquery-1.9.1.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
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
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
				<li><a href="map_main.do">지도로 보기</a></li>
				<li><a href="web_main.do">자세히 보기</a></li>
				<li><a href="#">로그인</a></li>
			</ul>
		</div><!-- /여기부터 container -->