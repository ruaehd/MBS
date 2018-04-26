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
	<link rel="stylesheet" href="resources/css/bootstrap.css" />
	<link rel="stylesheet" href="resources/css/v1_adminside.css" />
	<link rel="stylesheet" href="resources/css/w3.css" />
	<link rel="stylesheet" href="resources/css/card.css" />
</head>
<body>
	<div class="row">
		<jsp:include page="v1_admin_nav.jsp"></jsp:include>
		<div class="container" style="margin-top:50px">
			<h2>리뷰관리</h2>
			<hr />
			
			<section id="team" class="pb-5">
			<div style="margin-bottom:10px; margin-left:20px" >
				<c:if test="${fn:length(param.text) ne 0}">
					<a href="admin_rev_management.do" class="btn btn-success">전체보기</a>
					검색어 : <strong>${param.text}</strong>
				</c:if>
			</div>
				<c:if test="${fn:length(list) eq 0 }">
					<div style="text-align:center; vertical-align:middle;">
						<h3>검색 결과가 없습니다</h3>
					</div>
				</c:if>
				<c:if test="${fn:length(list) ne 0 }">
			        
			        <div class="row">
			            <c:forEach var="tmp" items="${list}">
			            <div class="col-xs-12 col-sm-6 col-md-4">
			                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
			                    <div class="mainflip">
			                        <div class="frontside">
			                            <div class="card" style="padding-top:10px">
			                                <div class="card-body text-center">
			                                    <p><img class=" img-fluid" src="get_blob_img.do?str_number=${tmp.str_number}&idx=1" alt="card image"></p>
			                                    <h4 class="card-title str_name">${tmp.str_name}</h4>
			                                    <p class="card-text">${tmp.str_address}</p>
			                                    <p class="card-text"></p>
			                                    <a href="#" class="btn btn-primary btn-sm" style="margin-right:10px"><i class="glyphicon glyphicon-earphone"></i></a>${tmp.str_tel}
			                                </div>
			                            </div>
			                        </div>
			                        <div class="backside" style="width:350px">
			                            <div class="card">
			                                <div class="card-body text-center mt-4">
			                                    <a href="usr_content.do?str_number=${tmp.str_number}"><h4 class="card-title">${tmp.str_name}</h4></a>
			                                    <p class="card-text">평점평균 : <fmt:formatNumber value="${tmp.avg}" pattern=".00"/> /5</p>
			                                    
			                                    <p class="card-text">이용예정 : ${tmp.exp}</p>
			                                    <p class="card-text">이용완료 : ${tmp.com}</p>
			                                    <p class="card-text">예약취소 : ${tmp.can}</p>
			                                    <div class="form-inline">
			                                    	<a href="#" class="btn btn-primary btn-sm send_email">
			                                    		<i class="glyphicon glyphicon-envelope"></i>
			                                    		<input type="hidden" class="mb_email" value="${tmp.mb_email}" />
			                                    	</a>
			                                        <a href="admin_rev_list.do?str_number=${tmp.str_number}" class="btn btn-primary btn-sm">리뷰관리(${tmp.cnt})</a> 
			                                    </div>
			                                    
			                                    
			                                    <ul class="list-inline">
			                                        <li class="list-inline-item">
			                                            
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


	
	<form action="sendemail.do" method="post">
		<div class="modal fade" id="sendemail">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4>이메일 전송</h4>
					</div>
					<div class="modal-body" style="padding:50px">
						<div class="form-inline" style="margin-bottom:10px">
							<label style="width:100px">상호명</label>
							<input style="width:300px" type="text" id="str_name" class="form-control" readonly/>
						</div>
						<div class="form-inline" style="margin-bottom:10px">
							<label style="width:100px">이메일 주소</label>
							<input style="width:300px" type="text" id="email" name="email" class="form-control" readonly/>
						</div>
						<div class="form-inline" style="margin-bottom:10px">
							<label style="width:100px">제목</label>
							<input style="width:300px" type="text" name="title" class="form-control" />
						</div>
						<div class="form-inline" style="margin-bottom:10px">
							<label style="width:100px">내용</label>
							<textarea style="width:300px; resize:none" name="text" rows="6" class="form-control" ></textarea>
						</div>
						
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-success" value="보내기" />
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	


	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.twbsPagination.min.js"></script>
	<script>
		$(function(){
			
			var func = function(){
				var tx = encodeURIComponent( $('#search_text').val() );
				window.location.href="?text="+tx;
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
				totalPages: ${tot},
				visiblePage:10,
				href:'?page={{number}}&text=${param.text}'
			});
			
			$('.send_email').click(function(){
				var idx =$(this).index('.send_email');
				var email =  $('.mb_email').eq(idx).val();
				var name =  $('.str_name').eq(idx).text();
				
				$('#email').val(email);
				$('#str_name').val(name);
				$('#sendemail').modal('show');
			});
		});
	</script>
</body>
</html>