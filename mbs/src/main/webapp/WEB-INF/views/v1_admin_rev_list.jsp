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
	
</head>
<body>
	<div class="row">
		<jsp:include page="v1_admin_nav.jsp"></jsp:include>
		<div class="container" style="margin-top:100px">
			<h3>리뷰 목록</h3>
			<hr />
			<form id="form" action="admin_rev_delete.do" method="post"> 
				<input type="hidden" name="str_number" value="${param.str_number}"/>
				<c:if test="${fn:length(list) eq 0 }">
					<div style="padding:100px">
						<h3>작성된 후기가 없습니다</h3>
					</div>
				</c:if>
				<c:if test="${fn:length(list) ne 0 }">
					<table class="table">
						<tr>
							<th><input type="checkbox" id="chk_all"/></th>
							<th>예약번호</th>
							<th>평점</th>
							<th>내용</th>
							<th>작성자</th>
							<th>사용일</th>
							<th>작성일</th>
							<th>비고</th>
						</tr>
						<c:forEach var="tmp" items="${list}" varStatus="i">
							<tr>
								<td><input id="no_${i.index}" type="checkbox" class="chk" name="chk[]" value="${tmp.rsv_cmt_no}"/></td>
						 		<td><a href="usr_rsv_content.do?rsv_no=${tmp.rsv_no}&str_number=${param.str_number}">${tmp.rsv_no}</a></td>
						 		<td>${tmp.rsv_cmt_point}</td>
						 		<td>${tmp.rsv_cmt_content}</td>
						 		<td>${tmp.rsv_cmt_writer}</td>
						 		<td>${tmp.rsv_day}</td>
						 		<td>${tmp.rsv_cmt_date}</td>
						 		<td>
						 			<a href="#" class="btn btn-xs btn-danger del_rev" >삭제</a>
						 		</td>	
						 	</tr>
					 	</c:forEach>
					 </table>
				 </c:if>
				 <div align="right" class="form-inline" style="margin-top:10px">
				 	<a href="#" class="btn btn-success" id="btn_del_chk">선택 삭제</a>
				 </div>
			 </form>
			 <div align="center">
				<ul id="pagination" class="pagination"></ul>
			</div>
		</div> 
	</div>

	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.twbsPagination.min.js"></script>
	<script src="resources/js/sweetalert.min.js"></script>
	<script>
		$(function(){
			$('#pagination').twbsPagination({
				totalPages: 10,
				visiblePage:10,
				href:'?str_number=${param.str_number}&page={{number}}'
			});
			
			$('.del_rev').click(function(){
				//class로 지정란 버튼의 위치 얻기(0부터 시작함)
				var idx = $(this).index('.del_rev');
				var no = $('#no_'+idx).val();
				console.log(no);
				swal({
					title : "삭제확인",
					text : "삭제 하시겠습니까?",
					icon : "warning",
					button : "확인"
				}).then((value)=>{
					if(value){
						window.location.href='admin_rev_delete.do?str_number=${param.str_number}&rsv_cmt_no='+no;	
					}
				});	
			});
			
			$('#chk_all').click(function(){
				if($(this).is(':checked')){	//체크가 된 상태
					$('.chk').prop('checked', true);
				}
				else{	//체크를 푼 상태
					$('.chk').prop('checked', false);
				}
			});
			
			$('#btn_del_chk').click(function(){
				var n = $('.chk:checked').length;
				if(n>0){
					swal({
						title : "삭제확인",
						text : "선택된 항목을 삭제 하시겠습니까?",
						icon : "warning",
						button : "확인"
					}).then((value)=>{
						if(value){
							$('#form').submit();
						}
					});	
				}
				else{
					swal('선택된 항목이 없습니다.');	
				}	
			});
			
		});
	</script>
</body>
</html>