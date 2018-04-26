<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>리뷰관리</title>
</head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
   .table-head{
      font-color:white;
   }
   .title{
      margin-top:50px;
      margin-bottom:20px;
      font-size:50px;
   }
   .count{
      width:100px;
      align:center
   }
   .btn_add{
      margin-bottom:10px
   }
   .w3-border-dark-gray{
   	  width:100px
   }
   .modal-backdrop.in {
   		z-index:auto;
   }
   .modal-title{
   	font-size:20px
   }
   .modal-namespace{
   	margin-bottom:10px
   }
   .name-label{
   	width:100px
   }
   .mb_shorttext{
   	width:150px
   }
</style>

<body>
   <div class="row">
      <jsp:include page="v1_admin_header.jsp"></jsp:include>
      <div class="container-fluid">
        <div class="side-body">
        <div class="title"> 후기목록 </div>
            <div class="row">
            <div class="col-md-3">
             	총 ${count}개의 후기가 있습니다
            </div>
           <div class=" col-md-offset-5 col-md-4 form-inline" align="center">
            
                 <select class="form-control" id="search_select">
                    <option class="secls1" value="1">이름</option>
                    <option class="secls2" value="2">아이디</option>
                 </select>
                 <input type="text" class="form-control" id="searchval" value="${svo.searchval}"/>
                 <button type="button" class="form-control btn-success" id="search">검색</button>
              </div>
           </div>
           <table class="table">
              <tr class="w3-dark-gray table-head">
                 <th style="vertical-align:middle">후기번호</th>
                 <th style="vertical-align:middle; width:60vh">후기내용</th>
                 <th style="vertical-align:middle">작성자</th>
                 <th style="vertical-align:middle">업체명</th>
                 <th style="vertical-align:middle">업체번호</th>
                 <th style="vertical-align:middle; width:150px">후기작성일자</th>
                 <th style="vertical-align:middle; width:150px">비고</th>
              </tr>
              <tbody id="tableline">
             	<c:forEach var="vo" items="${list}">
             		<tr>
             		<td class="id">${vo.rsv_cmt_no}</td>
             		<td class="content">${vo.rsv_cmt_content}</td>
             		<td>${vo.rsv_cmt_writer}</td>
             		<td>${vo.str_name}</td>
                    <td>${vo.str_number}</td>
                    <td>${vo.rsv_cmt_date}</td>
                    <td>
                    	<button type="button" class="btn btn-info">수정</button>
                    	<button type="button" class="btn btn-danger">삭제</button>
                    </td>
             		</tr>
             	</c:forEach>
              </tbody>
           </table>
           <div align="center">
            <ul id="pagination" class="pagination"></ul>
         </div>
        	<div class="modal fade" id="updateReview">
				<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<div class="row">
									<div class="col-md-4">
									<font class="modal-title">리뷰수정</font>
									</div>
									<div align="right" class="form-group">
									<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
									</div>
								</div>
							</div>
							<div class="modal-body">
								<div class="form-inline modal-namespace">
									<label class="name-label">내용</label>
									<input type="hidden" id="moid"/>
									<textarea id="mocontent" rows="6" class="form-control" style="resize:none; width:100%"></textarea>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary btn-update">리뷰수정</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
        	</div>
        </div>
    </div>
</div>

<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
	$(function(){
		$('.btn-info').click(function(){
			var idx = $(this).index('.btn-info');
			var id = $('.id').eq(idx).text();
			var content = $('.content').eq(idx).text();
			$('#moid').val(id);
			$('#mocontent').val(content);
			$('#updateReview').modal('show');
		});
		
		$('.btn-update').click(function(){
			var no = $('#moid').val();
			var content = $('#mocontent').val();
			if(content == ""){alert("내용을 입력해주세요");}
			else{
				
				$.post('ajax_admin_updateReview.do',{"rsv_cmt_no":no, "rsv_cmt_content":content},function(ret){
					if(ret == 1){
						alert("해당 리뷰를 수정하였습니다");
						window.location.href= "admin_review.do?page=${param.page}&searchcol=${param.searchcol}&searchval=${param.searchval}";
					}
					else{
						alert("해당 리뷰를 수정에 실패하셨습니다");
						window.location.href= "admin_review.do";
					}
				},'json');
			}
		});
		
		$('.btn-danger').click(function(){
			var idx = $(this).index('.btn-danger');
			var id = $('.id').eq(idx).text();
			$.post('ajax_admin_deleteReview.do',{"rsv_cmt_no":id},function(ret){
				if(ret == 1){
					alert("해당 리뷰를 삭제하였습니다");
					window.location.href= "admin_review.do?page=${param.page}&searchcol=${param.searchcol}&searchval=${param.searchval}";
				}
				else{
					alert("해당 리뷰를 삭제에 실패하셨습니다");
					window.location.href= "admin_review.do";
				}
			});
		});
		
		var secls = ${param.searchcol};
		if(secls == 1) {$('.secls1').prop("selected" , true);}
		else if (secls == 2){$('.secls2').prop("selected" , true);}
		
		$('#search').click(function(){
			var searchcol = $('#search_select').val();
			var searchval = $('#searchval').val();
			location.href = "admin_review.do?page=1&searchcol="+searchcol+"&searchval="+searchval;
		});
		
		 $('.pagination').twbsPagination({ 
             totalPages:'${pagecount}',
             visiblePages:10,
             href:'?page={{number}}'
          });

	});
</script>

</body>
</html>