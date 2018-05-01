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
		<div class="container" style="margin-top:20px">
			<h2>리뷰 목록</h2>
			<hr />
			<form id="form" action="admin_rev_delete.do" method="post"> 
				
					<div style="display:none">
						<input type="submit" onclick="return false;" />
						<input type="text"/>
					</div>
					<input type="hidden" name="str_number" value="${param.str_number}"/>
					<input type="hidden" name="str_cat" value="${param.str_cat}"/>
									
				<div class="row" style="margin-bottom:10px">
					<div class="col-md-6">
						<c:if test="${fn:length(param.text) ne 0}">
							<a href="admin_rev_list.do?str_number=${param.str_number}&str_cat=${param.str_cat}" class="btn btn-success">전체보기</a>
							검색어 : <strong>${param.text}</strong>
						</c:if>
					</div>
					<div class="col-md-6">
						<div align="right">
							<a href="#" class="btn btn-danger" id="btn_del_chk">선택 삭제</a>
						</div>
					</div>
				</div>
				<c:if test="${fn:length(list) eq 0 }">
					<div style="text-align:center; vertical-align:middle;">
						<h3>결과가 없습니다</h3>
					</div>
				</c:if>
				<c:if test="${fn:length(list) ne 0 }">
					
						<table class="table">
							<tr>
								<th><input type="checkbox" id="chk_all"/></th>
								<c:if test="${cat == 1}">
									<th>예약번호</th>
								</c:if>
								<th>평점</th>
								<th>내용</th>
								<th>작성자</th>
								<th>사용일</th>
								<th>작성일</th>
								<th>비고</th>
							</tr>
							<c:forEach var="tmp" items="${list}" varStatus="i">
								<tr>
									<td><input id="no_${i.index}" type="checkbox" class="chk" name="chk[]" value="${tmp.no}"/></td>
							 		<c:if test="${cat == 1}">
							 			<td><a href="usr_rsv_content.do?rsv_no=${tmp.rsv_no}&str_number=${param.str_number}">${tmp.rsv_no}</a></td>
							 		</c:if>
							 		<td>${tmp.point}</td>
							 		<td>
										<div style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; width: 300px;" title="${tmp.content}">
											${tmp.content}
										</div>
							 		</td>
							 		<td>${tmp.writer}</td>
							 		<td>${tmp.day}</td>
							 		<td>${tmp.date}</td>
							 		<td>
							 			<a href="#" class="btn btn-xs btn-warning del_rev"  >삭제</a>
							 		</td>	
							 	</tr>
						 	</c:forEach>
						 </table>
				 </c:if>
				 
				 
				<div class="form-inline" align="right" style="margin-top:5px; margin-bottom:5px">
					<select class="form-control" id="search_type" >
						<option value="rsv_cmt_content">내용</option>
						<option value="rsv_cmt_writer">작성자</option>
					</select>
					<input type="text" id="search_text" class="form-control" />
					<input type="button" id="search_btn" class="btn btn-success" value="검색" />
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
			
			var func = function(){
				var ty = $('#search_type').val();
				var tx = encodeURIComponent( $('#search_text').val() );
				window.location.href="?str_number=${param.str_number}&str_cat=${param.str_cat}&type="+ty+"&text="+tx;
			};
			
			$('#search_text').keyup(function(event){
				if(event.which == 13){
					func();
					$('#btn_del_chk').event.preventDefault();
				}
			});
			
			$('#search_btn').click(function(){
				func();
			});
			
			
			$('#pagination').twbsPagination({
				totalPages:${tot},
				visiblePage:10,
				href:'?str_number=${param.str_number}&str_cat=${param.str_cat}&page={{number}}&type=${param.type}&text='+encodeURIComponent('${param.text}')
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
						window.location.href='admin_rev_delete.do?str_number=${param.str_number}&str_cat=${param.str_cat}&no='+no;	
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