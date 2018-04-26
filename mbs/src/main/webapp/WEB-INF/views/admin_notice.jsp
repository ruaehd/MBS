<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> <!-- //한글처리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- // 반복문 c:forEach c:if-->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> <!-- // model and view -->
<%@ page session="false" %>
<html>
<head>
   <title>관리자test1122</title>
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
    <jsp:include page="admin_header.jsp"></jsp:include>
</div>

    <!-- Main Content -->
    <div class="container-fluid">
        <div class="side-body">
        <div class="title">공지관리</div>
            <div class="row">
           <div class="col-md-2">
              <button type="button" class="btn btn-primary btn_add" id="btn_insert">추가하기</button>
           </div>
           <div class=" col-md-offset-7 col-md-3 form-inline">
                 <select class="form-control" id="search_type">
                 	<option value="all">제목+내용</option>
                    <option value="ntc_title" >제목</option>
                    <option value="ntc_content">내용</option>
                 </select>
                 <input type="text" class="form-control" id="search_text" />
                 <button type="button" class="form-control btn-success" id="search_btn">검색</button>
              </div>
           </div>
           <table class="table">
              <tr class="w3-dark-gray table-head">
                 <th style="vertical-align:middle">공지번호</th>
                 <th style="vertical-align:middle">공지제목</th>
                 <th style="vertical-align:middle">공지내용</th>
                 <th style="vertical-align:middle">  
                 <select id="sel_type" class="form-control w3-dark-gray w3-border-dark-gray">
                 	
                    <option value="all" ${param.sel_type eq all ? 'selected="selected"':''}>전체</option>
                    <option value="1" ${param.sel_type == '1' ? 'selected="selected"':''}>공개</option>
                    <option value="0" ${param.sel_type == '0' ? 'selected="selected"':''}>비공개</option>
                 </select>
                 </th>
                 <th style="vertical-align:middle">등록시간</th>
               
              </tr>
              <c:forEach var="vo" items="${list}">
                 <tr>
                    <td>${vo.ntc_no}</td>
                    <td>${vo.ntc_title}</td>
                    <td>${vo.ntc_content}</td>
                    <td>
                    <c:if test="${vo.ntc_delete==1}">공개</c:if>
                    <c:if test="${vo.ntc_delete==0}">비공개</c:if>
                    </td>
                    <td>${vo.ntc_date}</td>
                 </tr>
              </c:forEach>
           </table>
           <div align="center">
            <ul class="pagination"></ul>
         </div>
        </div>
    </div>

	<form:form action="admin_notice.do" modelAttribute="vo" method="post">
	<div class="modal fade" id="insertmodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4>공지등록</h4>
				</div>
				<div class="modal-body">
					<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
						<label style="width:120px">공지제목</label>
						<form:input type="text" class="form-control" path="ntc_title" style="width:400px;" placeholder="공지제목" />
					</div>
					
					<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
						<label style="width:120px">공지내용</label>
						<form:textarea class="form-control" path="ntc_content" style="width: 400px; resize:none;" rows="20" placeholder="공지내용"></form:textarea>
					</div>
					
					<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
						<label style="width:120px">공개여부</label>
						<form:select class="form-control" path="ntc_delete">
								<option value="1">공개</option>
								<option value="0">비공개</option>
						</form:select>
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


   <script>
      $(function() {
    	 	 $('#sel_type').change(function(){
	  	  		var sty = $(this).val();
	  	  		window.location.href="admin_notice.do?sel_type="+sty;
  	  		});
    	  
    		$('#btn_insert').click(function(){
				$('#insertmodal').modal('show');	
			});	
    	  
    	  	var func = function(){
				var ty = $('#search_type').val();
				var tx = encodeURIComponent($('#search_text').val());
				window.location.href="admin_notice.do?type="+ty+"&text="+tx;
			};
			
			$('#search_btn').click(function(){
					func();
			});

			
	
			$('#search_text').keyup(function(event){
				if(event.which == 13){
					func();
				}
			});
    	  	
         
            $('.pagination').twbsPagination({
               totalPages:'${totPage}',
               visiblePages:10,
               href:'?page={{number}}'
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