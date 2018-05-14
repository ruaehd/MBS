<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> <!-- //한글처리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- // 반복문 c:forEach c:if-->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> <!-- // model and view -->
<%@ page session="false" %>
<html>
<head>
   <title>QNA관리</title>
   <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
   <link rel="stylesheet" href="resources/css/v1_adminside.css" />
   <link rel="stylesheet" href="resources/css/w3.css" />
</head>
<style>
	.modal-backdrop.in {
         z-index:auto;
   }
   .table-head{
      font-color:white;
   }
   .title{
      margin-top:50px;
      margin-bottom:20px;
      font-size:50px
   }
   .count{
      width:100px;
      align:center
   }
   .btn_add{
      margin-bottom:10px
   }
   .select{
      width:50px;
      vertical-align:middle
   }
</style>
<body>
   <script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
   <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="resources/js/jquery.twbsPagination-1.3.1.js"></script>

<div class="row">
    <jsp:include page="v1_admin_header.jsp"></jsp:include>
</div>

    <!-- Main Content -->
    <div class="container-fluid">
        <div class="side-body">
        <div class="title">QNA관리</div>
            <div class="row">
           <div class=" col-md-offset-8 col-md-4 form-inline" style="margin-bottom:10px;">
                 <select class="form-control" id="search_type">
                 	<option value="all">전체</option>
                    <option value="qst_title">질문</option>
                    <option value="qst_content">내용</option>
                    <option value="mb_id">아이디</option>
                 </select>
                 <input type="text" class="form-control" id="search_text" />
                 <button type="button" class="form-control btn-success" id="search_btn">검색</button>
              </div>
           </div>
           <table class="table">
              <tr class="w3-dark-gray table-head">
                 <th style="vertical-align:middle">번호</th>
                 <th style="vertical-align:middle">질문</th>
                 <th style="vertical-align:middle">내용</th>
                 <th style="vertical-align:middle">이미지</th>
                 <th style="vertical-align:middle; width:120px">
                	<select class="form-control w3-dark-gray w3-border-dark-gray" id="sel_code">
                    <option ${param.sel_code == '유형' ? 'selected="selected"':''}>유형</option>
                    <option ${param.sel_code == '예약' ? 'selected="selected"':''}>예약</option>
                    <option ${param.sel_code == '결재' ? 'selected="selected"':''}>결재</option>
                    <option ${param.sel_code == '환불' ? 'selected="selected"':''}>환불</option>
                    <option ${param.sel_code == '리뷰' ? 'selected="selected"':''}>리뷰</option>
                    <option ${param.sel_code == '서비스' ? 'selected="selected"':''}>서비스</option>
                    <option ${param.sel_code == '기타' ? 'selected="selected"':''}>기타</option>
                 </select>
                 </th>
                 <th style="width:120px">
                 <select class="form-control w3-dark-gray w3-border-dark-gray" id="sel_type">
                    <option value="all" ${param.sel_type == 'all' ? 'selected="selected"':''}>답변여부</option>
                    <option value="0" ${param.sel_type == '0' ? 'selected="selected"':''}>미답변</option>
                    <option value="1" ${param.sel_type == '1' ? 'selected="selected"':''}>답변완료</option>
                 </select>
                 </th>
                 <th style="vertical-align:middle">아이디</th>
                 <th style="vertical-align:middle">날짜</th>
              </tr>
              <c:forEach var="vo" items="${list}">
                 <tr>
                    <td class="count qst_no">${vo.qst_no}</td>
                    <td class="qst_title">${vo.qst_title}</td>
                    <td style="width:300px" class="qst_content">${vo.qst_content}</td>
                    <td style="width:300px"><img src="qnaImg.do?qst_no=${vo.qst_no}" width="300px" height="60px" /></td>
                    <td>${vo.qst_code}</td>
                    <td>
                    <c:if test="${vo.qst_open==0}">
                    <a href="#" class="btn btn-xs btn-danger btn_common btn_insert">답변등록</a>
                    </c:if>
                    <c:if test="${vo.qst_open==1}">
                    <a href="#" class="btn btn-xs btn-primary btn_common btn_update">답변완료</a>
                    </c:if>
                    
                    
                    </td>
                    <td>${vo.mb_id}</td>
                    <td>${vo.qst_date}</td>
                 </tr>
              </c:forEach>
           </table>
           <div align="center">
            <ul class="pagination"></ul>
         </div>
        </div>
    </div>

	<form:form action="admin_qna.do" modelAttribute="vo" method="post">
	<div class="modal fade" id="insertmodal">
		<div class="modal-dialog">
			<div class="modal-content" style="width:700px; height:850px;">
				<div class="modal-header">
					<h4>답변등록</h4>
				</div>
				<div class="modal-body">
					<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
						<form:input type="hidden" id="qst_no" path="qst_no" />
						<label style="width:120px">제목</label>
						<input type="text" class="form-control" style="width:400px;" id="qst_title" readonly />
					</div>
					<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
						<label style="width:120px">질문</label>
						<textarea class="form-control" style="width: 400px; resize:none;" rows="15" id="qst_content" readonly></textarea>
					</div>
					<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
						<label style="width:120px">답변</label>
						<form:textarea class="form-control" path="qst_as_content" style="width: 400px; resize:none;" rows="15"></form:textarea>
					</div>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-success" value="등록" />
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	</form:form>
	
	<form:form action="admin_qna_update.do" method="post" modelAttribute="vo">
			<div class="modal fade" id="updatemodal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h2>답변수정</h2>
						</div>
						<div class="modal-body">
							<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
								<form:input type="hidden" id="qst_no1" path="qst_no" />
								<label style="width:120px">제목</label>
								<input type="text" class="form-control" style="width:400px;" id="qst_title1" readonly />
							</div>
							<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
								<label style="width:120px">질문</label>
								<textarea class="form-control" style="width: 400px; resize:none;" rows="15" id="qst_content1" readonly></textarea>
							</div>
							<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
								<label style="width:120px">답변</label>
								<form:textarea class="form-control" path="qst_as_content" style="width: 400px; resize:none;" rows="15" id="qst_as_content1"></form:textarea>
							</div>
							<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
								<label style="width:120px">답변날짜</label>
								<input type="text" id="qst_as_date" class="form-control" style="width:400px;" readonly />
							</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-success" value="수정" />
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
					</div>
				</div>
			</div>
		</form:form>
   <script>
      $(function() {
    	  $('.pagination').twbsPagination({
              totalPages:'${totPage}',
              visiblePages:10,
              href:'?type=${param.type}&text='+encodeURIComponent('${param.text}')+'&sel_code='+encodeURIComponent('${param.sel_code}')+'&sel_type=${param.sel_type}&page={{number}}'
           });
    	  
    	  	$('#sel_type').change(function(){
	  	  		var sty = $(this).val();
	  	  		window.location.href="admin_qna.do?type=${param.type}&text=${param.text}&sel_code=${param.sel_code}&sel_type="+sty+"&page=1";
 	  		});
    	  
    	  	var func = function(){
				var ty = $('#search_type').val();
				var tx = encodeURIComponent($('#search_text').val());
				window.location.href="admin_qna.do?type="+ty+"&text="+tx+"&sel_code=${param.sel_code}&sel_type=${param.sel_type}&page=1";
			};
			
			$('#search_btn').click(function(){
					func();
			});
	
			$('#search_text').keyup(function(event){
				if(event.which == 13){
					func();
				}
			});
    	  
    		$('#sel_code').change(function(){
	  	  		var sty = $(this).val();
	  	  		window.location.href="admin_qna.do?type=${param.type}&text=${param.text}&sel_code="+sty+"&sel_type=${param.sel_type}&page=1";
	  		});
    	  
    	  	$('.btn_update').click(function(){
	     		var idx = $(this).index('.btn_common');
	     		var qst_no = $('.qst_no').eq(idx).text();
	     		$('#qst_no1').val(qst_no);
	     		$('#qst_title1').val($('.qst_title').eq(idx).text());
	     		$('#qst_content1').val($('.qst_content').eq(idx).text());
	     		$.get('ajax_qst_answer.do?qst_no='+qst_no,function(data){
	     			$('#qst_as_content1').val(data.qst_as_content); 
	     			$('#qst_as_date').val(data.qst_as_date); 
				},'json');
				$('#updatemodal').modal('show');	
			});	
	     	$('.btn_insert').click(function(){
	     		var idx = $(this).index('.btn_common');
	     		$('#qst_no').val($('.qst_no').eq(idx).text());
	     		$('#qst_title').val($('.qst_title').eq(idx).text());
	     		$('#qst_content').val($('.qst_content').eq(idx).text());
				$('#insertmodal').modal('show');	
			});	
            
            $('.navbar-toggle').click(function () {
                 $('.navbar-nav').toggleClass('slide-in');
                 $('.side-body').toggleClass('body-slide-in');
                 $('#search').removeClass('in').addClass('collapse').slideUp(200);
                 /// uncomment code for absolute positioning tweek see top comment in css
                 //$('.absolute-wrapper').toggleClass('slide-in');
                 
             });
            
            // Remove menu for searching
            $('#search-trigger').click(function () {
                 $('.navbar-nav').removeClass('slide-in');
                 $('.side-body').removeClass('body-slide-in');
                 /// uncomment code for absolute positioning tweek see top comment in css
                 //$('.absolute-wrapper').removeClass('slide-in');
             });
      });
   </script>   
</body>
</html>