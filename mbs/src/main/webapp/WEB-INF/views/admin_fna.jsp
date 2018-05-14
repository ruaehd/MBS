<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> <!-- //한글처리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- // 반복문 c:forEach c:if-->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> <!-- // model and view -->
<%@ page session="false" %>
<html>
<head>
   <title>자주하는질문</title>
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
        <div class="title"> 자주하는질문 </div>
            <div class="row">
           <div class="col-md-2">
              <button type="button" class="btn btn-primary btn_add" id="btn_insert">추가하기</button>
           </div>
           <div class=" col-md-offset-6 col-md-4 form-inline">
                 <select class="form-control" id="search_type">
                    <option value="all">질문+답변</option>
                    <option value="fna_title">질문</option>
                    <option value="fna_content">답변</option>
                 </select>
                 <input type="text" class="form-control"  id="search_text" />
                 <button type="button" class="form-control btn-success" id="search_btn">검색</button>
              </div>
           </div>
           <table class="table">
              <tr class="w3-dark-gray table-head">
                 <th style="vertical-align:middle">번호</th>
                 <th style="vertical-align:middle">질문</th>
                 <th style="vertical-align:middle">답변</th>
                 <th style="vertical-align:middle">
				<select class="form-control w3-dark-gray w3-border-dark-gray" id="sel_code">
                    <option value="0" ${param.sel_code == '0' ? 'selected="selected"':''}>전체</option>
                    <option value="1" ${param.sel_code == '1' ? 'selected="selected"':''}>예약</option>
                    <option value="2" ${param.sel_code == '2' ? 'selected="selected"':''}>결재</option>
                    <option value="3" ${param.sel_code == '3' ? 'selected="selected"':''}>환불</option>
                    <option value="4" ${param.sel_code == '4' ? 'selected="selected"':''}>리뷰</option>
                    <option value="5" ${param.sel_code == '5' ? 'selected="selected"':''}>회원</option>
                    <option value="6" ${param.sel_code == '6' ? 'selected="selected"':''}>서비스</option>
                 </select>
				</th>
                 <th>
                 <select class="form-control w3-dark-gray w3-border-dark-gray" id="sel_type">
                    <option value="2" ${param.sel_type == '2' ? 'selected="selected"':''}>전체</option>
                    <option value="1" ${param.sel_type == '1' ? 'selected="selected"':''}>공개</option>
                    <option value="0" ${param.sel_type == '0' ? 'selected="selected"':''}>비공개</option>
                 </select>
                 </th>
                  <th style="vertical-align:middle">날짜</th>
                  <th style="vertical-align:middle">비고</th>
              </tr>
              <c:forEach var="vo" items="${list}">
                 <tr>
                    <td class="count">${vo.fna_no}</td>
                    <td style="width:200px;">${vo.fna_title}</td>
                    <td style="width:500px;">${vo.fna_content}</td>
                    <td>
                    <c:if test="${vo.fna_code==1}">예약</c:if>
                    <c:if test="${vo.fna_code==2}">결재</c:if>
                    <c:if test="${vo.fna_code==3}">환불</c:if>
                    <c:if test="${vo.fna_code==4}">리뷰</c:if>
                    <c:if test="${vo.fna_code==5}">회원</c:if>
                    <c:if test="${vo.fna_code==6}">서비스</c:if>
                    </td>
                    <td>
                    <c:if test="${vo.fna_delete==0}">비공개</c:if>
                    <c:if test="${vo.fna_delete==1}">공개</c:if>
                    </td>
                    <td>${vo.fna_date}</td>
                    <td>
                    <a href="#" class="btn btn-xs btn-warning">공지수정</a>
                    <c:if test="${vo.fna_delete==1}">
                    <a href="#" class="btn btn-xs btn-danger btn-change">비공개전환</a>
                    </c:if>
                    <c:if test="${vo.fna_delete==0}">
                    <a href="#" class="btn btn-xs btn-primary btn-change">공개전환</a>
                    </c:if>
                    </td>
                 </tr>
              </c:forEach>
           </table>
           <div align="center">
            <ul class="pagination"></ul>
         </div>
        </div>
    </div>

	<form:form action="admin_fna.do" modelAttribute="vo" method="post">
	<div class="modal fade" id="insertmodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4>자주하는질문 등록</h4>
				</div>
				<div class="modal-body">
					<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
						<label style="width:120px">질문</label>
						<form:input type="text" class="form-control" style="width:400px;" path="fna_title" />
					</div>
					
					<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
						<label style="width:120px">답변</label>
						<form:textarea class="form-control" style="width: 400px; resize:none;" rows="20" path="fna_content"></form:textarea>
					</div>
					
					<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
						<label style="width:120px">분류</label>
						<form:select class="form-control" path="fna_code">
								<option value="1">예약</option>
								<option value="2">결재</option>
								<option value="3">환불</option>
								<option value="4">리뷰</option>
								<option value="5">회원</option>
								<option value="6">서비스</option>
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
	
	<form action="fna_delete.do" method="get">
			<div class="modal fade" id="deletemodal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h2>자주하는질문 전환</h2>
						</div>
						<div class="modal-body">
							<input type="hidden" name="fna_no" id="fna_delete_no" />
							<input type="hidden" name="fna_delete" id="delete_no">
							<label style="font-size:30px">제목 : </label>
							<label style="font-size:30px" id="delete_title"></label><br />
							<label style="" id="delete_name"></label>
							<label>로 전환 하시겠습니까?</label>
						</div>
						<div class="modal-footer">
							<input type="submit" class="btn btn-success" value="전환" />
							<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		
		<form:form action="fna_update.do" method="post" modelAttribute="vo">
			<div class="modal fade" id="updatemodal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h2>자주하는질문 수정</h2>
						</div>
						<div class="modal-body">
							<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
								<form:input type="hidden" class="form-control" path="fna_no" style="width:400px;" id="update_fna_no"/>
								<label style="width:120px">공지제목</label>
								<form:input type="text" class="form-control" path="fna_title" style="width:400px;" id="update_fna_title"/>
							</div>
							<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
								<label style="width:120px">공지내용</label>
								<form:textarea class="form-control" path="fna_content" style="width: 400px; resize:none;" rows="20" id="update_fna_content"></form:textarea>
							</div>
							<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
								<label style="width:120px">공개여부</label>
								<form:select class="form-control" id="update_fna_code" path="fna_code">
										<option value="1">예약</option>
										<option value="2">결재</option>
										<option value="3">환불</option>
										<option value="4">리뷰</option>
										<option value="5">회원</option>
										<option value="6">서비스</option>
								</form:select>
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
    		var func = function(){
				var ty = $('#search_type').val();
				var tx = encodeURIComponent($('#search_text').val());
				window.location.href="admin_fna.do?type="+ty+"&text="+tx+"&sel_code=${param.sel_code}&sel_type=${param.sel_type}&page=1";
			};
			
			$('#search_btn').click(function(){
					func();
			});
	
			$('#search_text').keyup(function(event){
				if(event.which == 13){
					func();
				}
			});
    	  
    	  
    		$('.btn-warning').click(function(){
    			var idx = $(this).index('.btn-warning');
    			var arr = new Array(); 
    	  		<c:forEach var="vo" items="${list}">
    	  			var arr1 = new Array();
    	  			arr1.push("${vo.fna_no}");
    	  			arr1.push("${vo.fna_title}");
    	  			arr1.push("${vo.fna_content}");
    	  			arr1.push("${vo.fna_code}");
    	  			arr.push(arr1);
    	  		</c:forEach>
    	  		
    	  		$('#update_fna_no').val(arr[idx][0]);
     	  		$('#update_fna_title').val(arr[idx][1]);
     	  		$('#update_fna_content').val(arr[idx][2]);
 				$('#update_fna_code').val(arr[idx][3]).prop("selected", true);
    	  	 
    	  		$('#updatemodal').modal('show');
    	  	});
    	  
    	  $('.btn-change').click(function(){
  			var idx = $(this).index('.btn-change');
  			var arr = new Array(); 
  	  		<c:forEach var="vo" items="${list}">
  	  			var arr1 = new Array()
  	  			arr1.push("${vo.fna_no}");
  	  			arr1.push("${vo.fna_delete}");
  	  			arr1.push("${vo.fna_title}");
  	  			arr.push(arr1);
  	  		</c:forEach>
  	  		$('#fna_delete_no').val(arr[idx][0]);
  	  		$('#delete_no').val(arr[idx][1]);
  	  		$('#delete_title').text(arr[idx][2]);
  	  		if(arr[idx][1] == 0){
  	  			$('#delete_name').text('공개');
  	  			$('#delete_name').attr('style', 'color:blue; font-size:30px');
  	  		}
  	  		else if(arr[idx][1] == 1){
					$('#delete_name').text('비공개');
					$('#delete_name').attr('style', 'color:red; font-size:30px');
				}
  	  		
  			$('#deletemodal').modal('show');
  	  	});
    	  
    	  	$('#sel_code').change(function(){
	  	  		var sty = $(this).val();
	  	  		window.location.href="admin_fna.do?type=${param.type}&text=${param.text}&sel_code="+sty+"&sel_type=${param.sel_type}&page=1";
	  		});
    	  	
    	  	 $('#sel_type').change(function(){
 	  	  		var sty = $(this).val();
 	  	  		window.location.href="admin_fna.do?type=${param.type}&text=${param.text}&sel_code=${param.sel_code}&sel_type="+sty+"&page=1";
   	  		});
    	  
		   	$('#btn_insert').click(function(){
				$('#insertmodal').modal('show');	
			});	
         
            $('.pagination').twbsPagination({
            	totalPages:'${totPage}',
                visiblePages:10,
                href:'?type=${param.type}&text='+encodeURIComponent('${param.text}')+'&sel_code=${param.sel_code}&sel_type=${param.sel_type}&page={{number}}'
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