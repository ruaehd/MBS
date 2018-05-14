<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<jsp:include page="v1_admin_header.jsp"></jsp:include>
		<div class="container" style="margin-top:20px">
			
			<h2>예약목록</h2>
			<hr />
			<div class="row">
				<div class="col-md-6">
					<c:if test="${fn:length(param.text) ne 0}">
						<a href="admin_rsv_management.do?rsv_code=0" class="btn btn-success">전체보기</a>
						검색어 : <strong>${param.text}</strong>
					</c:if>
				</div>
				<div class="col-md-6">
					<div align="right">
						<div class="btn-group" role="group" aria-label="..."  style="margin-bottom:10px">
							<c:forEach var="tmp" items="${map}" varStatus="i">
						  		<c:if test="${param.rsv_code == i.index}">
							  		<a class="btn btn-primary" href="admin_rsv_management.do?rsv_code=${i.index}&type=${param.type}&text=${param.text}">
										${tmp.key} : <strong>${tmp.value}</strong>
									</a>
								</c:if>
								<c:if test="${param.rsv_code != i.index}">
									<a class="btn btn-default" href="admin_rsv_management.do?rsv_code=${i.index}&type=${param.type}&text=${param.text}">
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
				 		<th>상호명</th>
				 		<th>예약자</th>
				 		<th>사용예정일</th>
				 		<th>예약일</th>
				 		<th style="text-align:center">비고</th>
				 	</tr>
				 	<c:forEach var="tmp" items="${list}" varStatus="i">
						<tr>
					 		<td>
						 		<a href="#" class="rsv_info">${tmp.rsv_no}</a>
					 		</td>
					 		<td>${tmp.rsv_code_chk}</td>
					 		<td>
					 			<a href="usr_content.do?str_number=${tmp.str_number}">${tmp.str_name}</a>
					 			<input type="hidden" value="${tmp.str_delete}" id="chk_${i.index}"/>
					 			<input type="hidden" value="${tmp.str_number}" id="no_${i.index}"/>
					 			<input type="hidden" value="${tmp.rsv_no}" id="rsv_no_${i.index}"/>
					 		</td>
					 		<td>
					 			<a href="#">${tmp.rsv_sub_id}</a>
					 			<input type="hidden" value="${tmp.rsv_sub_id}" id="id_${i.index}"/>
					 		</td>
					 		<td>${tmp.rsv_day}</td>
					 		<td>${tmp.rsv_date}</td>
					 		<td style="text-align:center">
					 			<c:if test="${tmp.rsv_code_chk eq '이용예정'}">
					 				<a href="usr_rsv_edit.do?str_number=${tmp.str_number}&rsv_no=${tmp.rsv_no}" class="btn btn-xs btn-info">예약수정</a>
									<a href="usr_rsv_cancel.do?rsv_no=${tmp.rsv_no}" class="btn btn-xs btn-danger">예약취소</a>
								</c:if>
								<c:if test="${tmp.rsv_code_chk eq '이용완료'}">
					 				<a href="#" class="btn btn-xs btn-warning new_rsv">추가예약</a>
								</c:if>
								<c:if test="${tmp.rsv_code_chk eq '예약취소'}">
					 				<a href="#" class="btn btn-xs btn-success new_rsv">신규예약</a>
								</c:if>
								
					 		</td>
				 		</tr>
				 	</c:forEach>
				 </table>
			 </c:if>
			 <hr/>

			 <div class="form-inline" align="right" style="margin-top:5px; margin-bottom:5px">
				<select class="form-control" id="search_type" >
					<option value="str_name">상호명</option>
					<option value="rsv_sub_id">예약자</option>
				</select>
				<input type="text" id="search_text" class="form-control" />
				<input type="button" id="search_btn" class="btn btn-success" value="검색" />
			</div>
			 
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
			
			$('.rsv_info').click(function(){
				//class로 지정란 버튼의 위치 얻기(0부터 시작함)
				var idx = $(this).index('.rsv_info');
				var no = $('#rsv_no_'+idx).val();
				console.log(no);
				window.open('biz_rsv_info.do?rsv_no='+no,'','width=800, height=700, left=650, top=100');
			});
			
			$('.new_rsv').click(function(){
				//class로 지정란 버튼의 위치 얻기(0부터 시작함)
				var idx = $(this).index('.new_rsv');
				var chk = $('#chk_'+idx).val();
				var no = $('#no_'+idx).val();
				var id = $('#id_'+idx).val();
				
				console.log("no"+no);
				console.log("chk"+chk);
				console.log("id"+id);
				if(chk == 0){
					swal({
					  title: "운영중단",
					  text: "운영이 중단된 업체입니다.",
					  icon: "warning",
					  button: "확인",
					});
				}
				if(chk == 1){
					window.location.href="usr_content_pay.do?str_number="+no+"&rsv_id="+id;
				}
				
			});
			
			
			
			var func = function(){
				var ty = $('#search_type').val();
				var tx = encodeURIComponent( $('#search_text').val() );
				window.location.href="?rsv_code=${param.rsv_code}&type="+ty+"&text="+tx;
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
				href:'?rsv_code=${param.rsv_code}&page={{number}}&type=${param.type}&text='+encodeURIComponent('${param.text}')
			})
		});
	</script>
</body>
</html>