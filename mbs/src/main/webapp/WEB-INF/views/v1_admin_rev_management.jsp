<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
			<section id="team" class="pb-5">
		        <div class="row">
		            <c:forEach var="tmp" items="${list}">
		            <div class="col-xs-12 col-sm-6 col-md-4">
		                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
		                    <div class="mainflip">
		                        <div class="frontside">
		                            <div class="card">
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
							<input style="width:300px" type="text" id="emial" class="form-control" readonly/>
						</div>
						<div class="form-inline" style="margin-bottom:10px">
							<label style="width:100px">제목</label>
							<input style="width:300px" type="text" id="title" class="form-control" />
						</div>
						<div class="form-inline" style="margin-bottom:10px">
							<label style="width:100px">내용</label>
							<textarea style="width:300px; resize:none" rows="6" class="form-control" ></textarea>
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
			$('#pagination').twbsPagination({
				totalPages: ${tot},
				visiblePage:10,
				href:'?page={{number}}'
			});
			
			$('.send_email').click(function(){
				var idx =$(this).index('.send_email');
				var email =  $('.mb_email').eq(idx).val();
				var name =  $('.str_name').eq(idx).text();
				
				$('#emial').val(email);
				$('#str_name').val(name);
				$('#sendemail').modal('show');
				
				console.log(idx);
				console.log(email);
			});
		});
	</script>
</body>
</html>