<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>예약목록</title>
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" type="text/css" href="resources/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/component.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/w3.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/jquery-ui-timepicker-addon.css" />
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
		<div id="main">
			<div class="container" style="margin-top:100px">
				<h2>예약목록</h2>
				<hr />
				<div class="row">
					<div class="col-md-6">
						<c:if test="${fn:length(param.text) ne 0}">
							<a href="biz_rsv_management.do?str_number=${param.str_number}" class="btn btn-success">전체보기</a>
							검색어 : <strong>${param.text}</strong>
						</c:if>
					</div>
					<div class="col-md-6">
						<div align="right" class="form-inline">
							<div class="btn-group" role="group" aria-label="..."  style="margin-bottom:10px">
								<c:forEach var="tmp" items="${map}" varStatus="i">
							  		<c:if test="${param.rsv_code == i.index}">
								  		<a class="btn btn-primary" href="biz_rsv_management.do?str_number=${param.str_number}&rsv_code=${i.index}&type=${param.type}&text=${param.text}">
											${tmp.key} : <strong>${tmp.value}</strong>
										</a>
									</c:if>
									<c:if test="${param.rsv_code != i.index}">
										<a class="btn btn-default" href="biz_rsv_management.do?str_number=${param.str_number}&rsv_code=${i.index}&type=${param.type}&text=${param.text}">
											${tmp.key} : <strong>${tmp.value}</strong>
										</a>
									</c:if>
							  	</c:forEach>
							</div>
						</div>
					</div>
				</div>
				
				<c:if test="${fn:length(list) eq 0 }">
					<div style="text-align:center; vertical-align:middle;">
						<h3>검색결과가 없습니다</h3>
					</div>
				</c:if>
				<c:if test="${fn:length(list) ne 0 }">
					<table class="table">
					 	<tr>
					 		<th>예약번호</th>
					 		<th>상태</th>
					 		<th>예약자</th>
					 		<th>예약자명</th>
					 		<th>사용예정일</th>
					 		<th>예약일</th>
					 		<th>예약확인</th>
					 	</tr>
					 	<c:forEach var="tmp" items="${list}" varStatus="i">
							<tr>
						 		<td>
						 			<input type="hidden" id="no_${i.index}" value="${tmp.rsv_no}" />
						 			${tmp.rsv_no}
						 		</td>
						 		<td>${tmp.rsv_code_chk}</td>
						 		<td><a href="#">${tmp.rsv_sub_id}</a></td>
						 		<td>${tmp.rsv_sub_name}</td>
						 		<td>${tmp.rsv_day}</td>
						 		<td>${tmp.rsv_date}</td>
						 		<td>
						 			<a href="#" class="btn btn-success btn-xs rsv_info">내용확인</a>
						 		</td>
					 		</tr>
					 	</c:forEach>
					 </table>
				 </c:if>
				 <hr/>
	
				 <div class="form-inline" align="right" style="margin-top:5px; margin-bottom:5px">
					<select class="form-control" id="search_type" >
						<option value="rsv_no">예약번호</option>
						<option value="rsv_sub_name">예약자명</option>
					</select>
					<input type="text" id="search_text" class="form-control" />
					<input type="button" id="search_btn" class="btn btn-default" value="검색" />
				</div>
				 
				<div align="center">
					<ul id="pagination" class="pagination"></ul>
				</div>
				
			 </div>
		</div>
		 <jsp:include page="v1_footer.jsp"></jsp:include>
	</div>

	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.twbsPagination.min.js"></script>
	<script>
		$(function(){
			
			$('.rsv_info').click(function(){
				//class로 지정란 버튼의 위치 얻기(0부터 시작함)
				var idx = $(this).index('.rsv_info');
				var no = $('#no_'+idx).val();
				console.log(no);
				window.open('biz_rsv_info.do?rsv_no='+no,'','width=800, height=700, left=650, top=100');
			});
			
			var func = function(){
				var ty = $('#search_type').val();
				var tx = encodeURIComponent( $('#search_text').val() );
				window.location.href="?str_number=${param.str_number}&rsv_code=${param.rsv_code}&text="+tx+"&type="+ty;
			};
			
			$('#search_text').keyup(function(event){
				if(event.which == 13){
					func();
				}
			});
			
			$('#search_btn').click(function(){
				func();
			});
			
			var totpage=0;
			if(${param.rsv_code} == 0){
				totpage = (${map.get("합계")}-1)/10+1
			}
			else if(${param.rsv_code} == 1){
				totpage = (${map.get("이용예정")}-1)/10+1
			}
			else if(${param.rsv_code} == 2){
				totpage = (${map.get("이용완료")}-1)/10+1
			}
			else if (${param.rsv_code} == 3){
				totpage = (${map.get("예약취소")}-1)/10+1
			}
			
			$('#pagination').twbsPagination({
				totalPages: totpage,
				visiblePage:10,
				href:'?str_number=${param.str_number}&rsv_code=${param.rsv_code}&page={{number}}&text='+encodeURIComponent('${param.text}')+'&type=${param.type}'
			})
		});
	</script>
</body>
</html>