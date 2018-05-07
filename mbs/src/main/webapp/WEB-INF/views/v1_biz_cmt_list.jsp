<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			
			<h2>예약목록</h2>
			<hr />
			<div class="row">
				<div class="col-md-6">
					<c:if test="${fn:length(param.text) ne 0}">
						<a href="biz_rsv_management.do?str_number=${param.str_number}" class="btn btn-success">전체보기</a>
						검색어 : <strong>${param.text}</strong>
					</c:if>
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
				 		<th>평점</th>
				 		<th>내용</th>
				 		<th>작성자</th>
				 		<th>예약일</th>
				 		<th>리뷰작성일</th>
				 		<th>예약확인</th>
				 		<th>답글달기</th>
				 	</tr>
				 	<c:forEach var="tmp" items="${list}" varStatus="i">
						<input type="hidden" id="no_${i.index}" value="${tmp.rsv_no}" />
					 	<input type="hidden" id="cmt_no_${i.index}" value="${tmp.rsv_cmt_no}" />
					 	<input type="hidden" id="cmt_point_${i.index}" value="${tmp.rsv_cmt_point}" />
					 	<input type="hidden" id="cmt_content_${i.index}" value="${tmp.rsv_cmt_content}" />
					 	<input type="hidden" id="cmt_writer_${i.index}" value="${tmp.rsv_cmt_writer}" />
						<tr>
					 		<td>
					 			${tmp.rsv_no}
					 		</td>
					 		<td>${tmp.rsv_cmt_point}</td>
					 		<td>
					 			<div style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; width: 300px;" title="${tmp.rsv_cmt_content}">
									${tmp.rsv_cmt_content}
								</div>
					 		</td>
					 		<td>${tmp.rsv_cmt_writer}</td>
					 		<td>${tmp.rsv_day}</td>
					 		<td>${tmp.rsv_cmt_date}</td>
					 		<td>
					 			<a href="#" class="btn btn-success btn-xs rsv_info">내용확인</a>
					 		</td>
					 		<td>
					 			<a href="#" class="btn btn-primary btn-xs reply">답글달기</a>
					 		</td>
				 		</tr>
				 	</c:forEach>
				 </table>
			 </c:if>
			 <hr/>

			 <div class="form-inline" align="right" style="margin-top:5px; margin-bottom:5px">
				<select class="form-control" id="search_type" >
					<option value="rsv_cmt_content">내용</option>
					<option value="rsv_cmt_writer">작성자</option>
				</select>
				<input type="text" id="search_text" class="form-control" />
				<input type="button" id="search_btn" class="btn btn-default" value="검색" />
			</div>
			 
			<div align="center">
				<ul id="pagination" class="pagination"></ul>
			</div>
			
		 </div>
	</div>

	<form action="write_reply.do" method="post">
		<div class="modal fade" id="writeReply">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4>답글 달기</h4>
					</div>
					<div class="modal-body" style="padding:50px">
						<input type="hidden" id="cmt_no" name="cmt_no"/>
						<div class="form-inline" style="margin-bottom:10px">
							<label style="width:100px">평점</label>
							<input style="width:300px" type="text" id="cmt_point" class="form-control" readonly/>
						</div>
						<div class="form-inline" style="margin-bottom:10px">
							<label style="width:100px">작성자</label>
							<input style="width:300px" type="text" id="cmt_writer" class="form-control" readonly/>
						</div>
						<div class="form-inline" style="margin-bottom:10px">
							<label style="width:100px">리뷰내용</label>
							<input style="width:300px" type="text" id="cmt_content" class="form-control" readonly/>
						</div>
						<div class="form-inline" style="margin-bottom:10px">
							<label style="width:100px">리뷰답글</label>
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
			
			$('.rsv_info').click(function(){
				//class로 지정란 버튼의 위치 얻기(0부터 시작함)
				var idx = $(this).index('.rsv_info');
				var no = $('#no_'+idx).val();
				console.log(no);
				window.open('biz_rsv_info.do?rsv_no='+no,'','width=800, height=700, left=650, top=100');
			});
			
			$('.reply').click(function(){
				//class로 지정란 버튼의 위치 얻기(0부터 시작함)
				var idx = $(this).index('.reply');
				var no = $('#cmt_no_'+idx).val();
				var point = $('#cmt_point_'+idx).val();
				var content = $('#cmt_content_'+idx).val();
				var writer = $('#cmt_writer_'+idx).val();
				
				console.log(no);
				
				$('#cmt_no').val(no);
				$('#cmt_point').val(point);
				$('#cmt_content').val(content);
				$('#cmt_writer').val(writer);
				$('#writeReply').modal('show');
			});
			
			
			var func = function(){
				var ty = $('#search_type').val();
				var tx = encodeURIComponent( $('#search_text').val() );
				window.location.href="?str_number=${param.str_number}&text="+tx+"&type="+ty;
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
				href:'?str_number=${param.str_number}&page={{number}}&type=${param.type}&text='+encodeURIComponent('${param.text}')
			})
		});
	</script>
</body>
</html>