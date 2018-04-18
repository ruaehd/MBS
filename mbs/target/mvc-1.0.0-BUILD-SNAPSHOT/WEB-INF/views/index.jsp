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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <!--icons-->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--vendors-->
        <link rel="stylesheet" href="resources/js/vendors/daterangepicker/daterangepicker.css" />
        <!--custom css-->
        <link rel="stylesheet" href="resources/css/components.css" />
        <link rel="stylesheet" href="resources/css/colors.css" />
        <link rel="stylesheet" href="resources/css/demo.css" />
        <style>
        	.hero-header{
        		background-image: url("resources/imgs/bg1.jpg") !important;
        		height: 100vh !important;
        	}
        </style>
    </head>
    <body>
        <section class="colored-section hero-header demo-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 offset-md-2">
                            <div class="brand">
                                <h1 class="text-white">LBS</h1>
                                <input type="button" class="btn btn-white btn-round" name="coment_button" id="coment_button" value="설명보기"/> 
                                <div id="coment">
                                     <h6 class="text-uppercase mb-5">
                                    	 <font style="font-size:13px">Location-based booking site</font><br/>
                                 		    저희 홈페이지는 사용자 위치정보를 활용하여 근처 관광지 , 식당을 검색해주는 사이트입니다</h6>
                                     </div>
                                     <div id="coment_inside">
                                <a href="map_main.do" target="_blank" class="btn btn-white btn-round mr-3" style="opacity:0.9">
                                    <em class="fa fa-eye fa-fw" style="height:60px;padding:20px"></em>
                                    		<font style="margin-right:15px;opacity:1.0">지도로 볼래요</font>
                                </a>
                                <a href="web_main.do" target="_blank" class="btn btn-white btn-round" style="opacity:0.9">
                                    <em class="fa fa-eye fa-fw" style="height:60px;padding:20px"></em>
                                    		<font style="margin-right:15px">자세히 볼래요</font>
                                </a>
                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

           
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>
        <!--vendors-->
        <script src="resources/js/vendors/moment.min.js"></script>
        <script src="resources/js/vendors/daterangepicker/daterangepicker.js"></script>
        <!--custom js-->
        <script src="/resources/js/app.js"></script>
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
       					},1000);
       					
        			});
        		});
        	})
        </script>
    </body>
</html>

