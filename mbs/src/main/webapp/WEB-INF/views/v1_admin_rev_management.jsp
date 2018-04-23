<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css" />
	<link rel="stylesheet" href="resources/css/v1_adminside.css" />
	<link rel="stylesheet" href="resources/css/w3.css" />
	<link rel="stylesheet" href="resources/css/card.css" />
</head>
<body>
	<div class="row">
		<jsp:include page="v1_admin_nav.jsp"></jsp:include>
		<div class="container" style="margin-top:100px">
			<section id="team" class="pb-5">
				<h5 class="section-title h1">OUR TEAM</h5>
		        <div class="row">
		            <c:forEach var="tmp" items="${list}">
		            <div class="col-xs-12 col-sm-6 col-md-4">
		                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
		                    <div class="mainflip">
		                        <div class="frontside">
		                            <div class="card">
		                                <div class="card-body text-center">
		                                    <p><img class=" img-fluid" src="https://sunlimetech.com/portfolio/boot4menu/assets/imgs/team/img_01.png" alt="card image"></p>
		                                    <h4 class="card-title">${tmp.str_name}</h4>
		                                    <p class="card-text">${tmp.str_address }</p>
		                                    <a href="#" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="backside">
		                            <div class="card">
		                                <div class="card-body text-center mt-4">
		                                    <h4 class="card-title">Sunlimetech</h4>
		                                    <p class="card-text">This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.</p>
		                                    <ul class="list-inline">
		                                        <li class="list-inline-item">
		                                            <a class="social-icon text-xs-center" target="_blank" href="#">
		                                                <i class="fa fa-facebook"></i>
		                                            </a>
		                                        </li>
		                                    </ul>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            </c:forEach>
		        </div>
			</section>
			<hr/>
			 
			<div align="right" class="form-inline" >
				<div class="form-group">
				 	<label>상호명 검색</label>
				 	<input class="form-control" type="text" style="width:200px" />
				 	<a href="#" class="btn btn-default">검색</a>
			 	</div>
			</div>
			 
			<div align="center">
				<ul id="pagination" class="pagination"></ul>
			</div>
		</div>
	</div>

	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.twbsPagination.min.js"></script>
	<script>
		$(function(){
			$('#pagination').twbsPagination({
				totalPages: ${tot},
				visiblePage:10,
				href:'?rsv_code=${param.rsv_code}&page={{number}}'
			})
		});
	</script>
</body>
</html>