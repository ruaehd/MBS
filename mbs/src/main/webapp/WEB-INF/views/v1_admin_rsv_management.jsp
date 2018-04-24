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
			 
			 <div id="summary_board" class="form-group" style="margin-bottom:10px" align="right">
				<ul id="rsv_cnt" class="list-group">
					<c:forEach var="tmp" items="${map}" varStatus="i">
						<li class="rsv_cnt">
							<c:if test="${param.rsv_code == i.index}">
								<a style="width:150px; text-align:center" class="list-group-item active" href="admin_rsv_management.do?rsv_code=${i.index}">
									${tmp.key}<br /><h3>${tmp.value}</h3>
								</a>
							</c:if>
							<c:if test="${param.rsv_code != i.index}">
								<a style="width:150px; text-align:center" class="list-group-item" href="admin_rsv_management.do?rsv_code=${i.index}">
									${tmp.key}<br /><h3>${tmp.value}</h3>
								</a>
							</c:if>
						</li>
					</c:forEach>
				</ul>
			</div>
			 
			 
			 <table class="table">
			 	<tr>
			 		<th>예약번호</th>
			 		<th>상태</th>
			 		<th>상호명</th>
			 		<th>예약자</th>
			 		<th>사용예정일</th>
			 		<th>예약일</th>
			 		<th style="text-align:center">비고</th>
			 	</tr>
			 	<c:forEach var="tmp" items="${list}">
					<tr>
				 		<td>${tmp.rsv_no}</td>
				 		<td>${tmp.rsv_code_chk}</td>
				 		<td><a href="usr_content.do?str_number=${tmp.str_number}">${tmp.str_name}</a></td>
				 		<td><a href="#">${tmp.rsv_sub_id}</a></td>
				 		<td>${tmp.rsv_day}</td>
				 		<td>${tmp.rsv_date}</td>
				 		<td style="text-align:center">
				 			<c:if test="${tmp.rsv_code_chk eq '이용예정'}">
				 				<a href="usr_rsv_edit.do?str_number=${tmp.str_number}&rsv_no=${tmp.rsv_no}" class="btn btn-xs btn-info">수정</a>
								<a href="usr_rsv_cancel.do?rsv_no=${tmp.rsv_no}" class="btn btn-xs btn-danger">삭제</a>
							</c:if>
							<c:if test="${tmp.rsv_code_chk eq '예약취소'}">
				 				<a href="usr_rsv_edit.do?str_number=${tmp.str_number}&rsv_no=${tmp.rsv_no}" class="btn btn-xs btn-success">다시예약</a>
							</c:if>
							
				 		</td>
			 		</tr>
			 	</c:forEach>
			 </table>
			 <hr/>
			 <div align="right" class="form-inline" >
			 	<div class="form-group">
				 	<select class="form-control" style="width:100px">
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

			var totpage = 0;
			
			if(${param.rsv_code} == 0){
				totpage = (${map.get("전체")}-1)/10+1
			}
			else if(${param.rsv_code} == 1){
				totpage = (${map.get("이용예정")}-1)/10+1
			}
			else if (${param.rsv_code} == 3){
				totpage = (${map.get("예약취소")}-1)/10+1
			}
			
			$('#pagination').twbsPagination({
				totalPages: totpage,
				visiblePage:10,
				href:'?rsv_code=${param.rsv_code}&page={{number}}'
			})
		});
	</script>
</body>
</html>