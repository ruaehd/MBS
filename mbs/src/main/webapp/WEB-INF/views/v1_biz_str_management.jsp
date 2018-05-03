<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" type="text/css" href="resources/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/component.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/w3.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/jquery-ui.min.css" />
	<link rel="stylesheet" href="resources/css/card.css" />
	<style>
		.container{
			z-index:2;
		}
		.gn-menu-main{
			z-index:10;
		}
	</style>	
</head>
<body>
	<div class="row">
		<jsp:include page="v1_header.jsp"></jsp:include>
		<div class="container" style="margin-top:100px">
			<h2>리뷰관리</h2>
			<hr />
			
			<section id="team" class="pb-5">
			<div class="row">
				<div class="col-md-6" style="margin-bottom:10px; margin-left:20px" >
					<c:if test="${fn:length(param.text) ne 0}">
						<a href="biz_str_management.do" class="btn btn-success">전체보기</a>
						검색어 : <strong>${param.text}</strong>
					</c:if>
				</div>
			</div>
				<c:if test="${fn:length(list) eq 0 }">
					<div style="text-align:center; vertical-align:middle;">
						<h3>검색 결과가 없습니다</h3>
					</div>
				</c:if>
			
				<c:if test="${fn:length(list) ne 0 }">
			     
			        <div class="row">
			            <c:forEach var="tmp" items="${list}">
			            <div class="col-xs-12 col-sm-6 col-md-4" style="padding:0 50px">
			                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
			                    <div class="mainflip">
			                        <div class="frontside" style="width:300px">
			                            <div class="card" style="padding-top:10px">
			                                <div class="card-body text-center">
			                                    <p><img class=" img-fluid" src="get_blob_img.do?str_number=${tmp.str_number}&idx=0" alt="card image"></p>
			                                    <h4 class="card-title str_name">${tmp.str_name}</h4>
			                                    <p class="card-text">${tmp.str_address}</p>
			                                    <p class="card-text"></p>
			                                    <a href="#" class="btn btn-primary btn-sm" style="margin-right:10px"><i class="glyphicon glyphicon-earphone"></i></a>${tmp.str_tel}
			                                </div>
			                            </div>
			                        </div>
			                        <div class="backside" style="width:300px;">
			                            <div class="card">
			                                <div class="card-body text-center mt-4">
			                                    <a href="usr_content.do?str_number=${tmp.str_number}"><h4 class="card-title">${tmp.str_name}</h4></a>
			                                    <p class="card-text">평점평균 : <fmt:formatNumber value="${tmp.avg}" pattern=".00"/> /5</p>
			                                    <p class="card-text">이용예정 : ${tmp.exp}</p>
			                                    <p class="card-text">이용완료 : ${tmp.com}</p>
			                                    <p class="card-text">예약취소 : ${tmp.can}</p>
			                                    <div class="form-inline">
			                                        <a href="biz_rsv_management.do?str_number=${tmp.str_number}" class="btn btn-success">예약목록</a>
			                                        <a href="#" class="btn btn-primary">리뷰목록(${tmp.cnt})</a> 
			                                    </div>
			                                    
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			            </c:forEach>
			        </div>
				</c:if>
			</section>	
			<hr/>
			 
			<div class="form-inline" align="right" style="margin-top:5px; margin-bottom:5px">
				<div class="form-group">
				 	<label>상호명 검색</label>
				 	<input type="text" id="search_text" class="form-control" />
					<input type="button" id="search_btn" class="btn btn-success" value="검색" />
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
			
			var func = function(){
				var tx = encodeURIComponent( $('#search_text').val() );
				window.location.href="?str_cat=${param.str_cat}&text="+tx;
			};
			
			$('#search_text').keyup(function(event){
				if(event.which == 13){
					func();
				}
			});
			
			$('#search_btn').click(function(){
				func();
			});
			
			
			$('#pagination').twbsPagination({
				totalPages: 5,
				visiblePage:10,
				href:'?str_cat=${param.str_cat}&page={{number}}&text=${param.text}'
			});
			
		});
	</script>
</body>
</html>