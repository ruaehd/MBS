<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>안녕하세요!</title>
        <meta name="description" content="Love UI Kit." />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <!--Bootstrap 4-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
        <!--icons-->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="resources/css/jquery.fullPage.css"/>
        <link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="resources/css/w3.css"/>
    </head>
<style>
.section{
	text-align:center;
	align:center;
	margin:0px auto;
}

#section1{
	background-image:url(resources/imgs/title.png);
	background-size:100% 100vh;
}
#section2{
	background-color:powderblue;
}
</style>
    <body>
		<div id="fullpage">
			<div class="section" id="section1">
					<div class="w3-white w3-round-xlarge" style="opacity:0.95;" id="content">
                                <h1 style="font-family:arial,helvetica;font-size:70px;">MBS</h1>
                                <input type="button" class="w3-button w3-white w3-round" id="coment_button" value="설명보기"/>
                                <div id="coment">
                                     <h6><font style="font-size:20px">Map based booking site</font></h6>
                                 	 <h4>이 프로젝트는 사용자 위치정보를 활용하여 근처 관광지 , 식당을 검색해주는 프로젝트 입니다</h4>
                                 </div>
                                 <div id="coment_inside"> 
                                     <em class="fa fa-caret-square-o-down" style="height:60px;padding:20px"></em>
                                     <font>아래로 스크롤 해보세요 !</font>
                                 </div>
				</div>
			</div>
			<div class="section" id="section2">
				<div class="slide" id="slide1" data-anchor="slide1">
					<div style="width:100%">
						<div style="width:60%;margin:0px auto">
							<h1 style="font-family:arial,helvetica;font-size:50px;">맹정열</h1>
							<h4 style="margin-top:50px">소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글</h4>
							<a href="resources/file/test.pdf" target="_blank">포트폴리오 보기</a>
						</div>
					</div>
				</div>
				<div class="slide"  id="slide2" data-anchor="slide2">
					<div style="width:100%">
						<div style="width:60%;margin:0px auto">
							<h1 style="font-family:arial,helvetica;font-size:50px;">이경환</h1>
							<h4 style="margin-top:50px">소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글</h4>
							<a href="resources/file/test.pdf" target="_blank">포트폴리오 보기</a>					
						</div>
					</div>
				</div>
				<div class="slide"  id="slide3" data-anchor="slide3">
					<div style="width:100%">
						<div style="width:60%;margin:0px auto">
							<h1 style="font-family:arial,helvetica;font-size:50px;">남동현</h1>
							<h4 style="margin-top:50px">소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글</h4>
							<a href="resources/file/test.pdf" target="_blank">포트폴리오 보기</a>
						</div>
					</div>
				</div>
				<div class="slide">
					<div style="width:100%">
						<div style="width:60%;margin:0px auto">
							<h1 style="font-family:arial,helvetica;font-size:50px;">박준영</h1>
							<h4 style="margin-top:50px">소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글</h4>
							<a href="resources/file/test.pdf" target="_blank">포트폴리오 보기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="section" style="background-color:gray">
			<div class="row">
				<div class="col-md-6" style="border-right:1px solid #FFFFFF">
			   <a href="map_main.do" target="_blank" class="btn btn-white btn-round mr-3 col-md-6" style="opacity:0.9">
               <em class="fa fa-eye fa-fw" style="height:60px;padding:20px"></em>
                <font style="margin-right:15px;opacity:1.0">지도로 볼래요</font></a>
                </div>
           		 <div class="col-md-6" >
               <a href="web_main.do" target="_blank" class="btn btn-white btn-round" style="opacity:0.9">
                 <em class="fa fa-eye fa-fw" style="height:60px;padding:20px"></em>
                 <font style="margin-right:15px">자세히 볼래요</font>
               </a>
               </div>
               </div>
           </div>
		</div>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="resources/js/jquery.fullPage.js"></script>
        <script>
        	$(function(){
        		$(window).ready(function(){
        			$('#coment').hide();
        			$('#coment_inside').hide();
        			$('#coment_button').click(function(){
        				$('#coment_button').hide();
       				$('#coment').slideToggle(800);
       					setTimeout(function(){
       						$('#coment_inside').slideToggle(500);
       					},2500);
       					
        			});
        		});
        		$('#fullpage').fullpage({
        			slidesNavigation:true,
        			navigation:true,
        			navigationPosition:'right',
        			navigationTooltips:['소개글','개발자소개','페이지이동']
        		});
        	})
        </script>
    </body>
</html>

