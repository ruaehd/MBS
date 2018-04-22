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
	<style>
		#rsv_cnt {
		    list-style:none;
		    margin:0;
		    padding:0;
		}
		.rsv_cnt {
		    margin: 0 0 0 0;
		    padding: 0 0 0 0;
		    border : 0;
		    float: left;
		}
	</style>
</head>
<body>
	<div class="row">
		<jsp:include page="v1_admin_nav.jsp"></jsp:include>
		<div class="container" style="margin-top:100px">
			 
			 <table class="table">
			 	<tr>
			 		<th>예약번호</th>
			 		<th>상태</th>
			 		<th>상호명</th>
			 		<th>예약자</th>
			 		<th>예약일</th>
			 		<th style="text-align:center">비고</th>
			 	</tr>
			 	<c:forEach var="tmp" items="${list}">
					<tr>
				 		<td>${tmp.rsv_no}</td>
				 		<td>${tmp.rsv_code_chk}</td>
				 		<td>${tmp.str_name}</td>
				 		<td>${tmp.rsv_sub_id}</td>
				 		<td>${tmp.rsv_day}</td>
				 		<td style="text-align:center">
			 				<a href="#" class="btn btn-xs btn-info">리뷰관리</a>
				 		</td>
			 		</tr>
			 	</c:forEach>
			 </table>
			 <hr/>
			 <div align="center" class="form-inline" style="width:100px">
			 	<div class="form-group">
			 	<select class="form-control">
			 		<option>상호명</option>
			 		<option>예약자</option>
			 	</select >
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