<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> <!-- //한글처리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- // 반복문 c:forEach c:if-->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> <!-- // model and view -->
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지 관리</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css" />
	<link rel="stylesheet" href="resources/css/v1_adminside.css" />
	<link rel="stylesheet" href="resources/css/w3.css" />
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
</head>

<body>
<div class="row">
    <jsp:include page="v1_admin_header.jsp"></jsp:include>
    <div class="container-fluid">
        <div class="side-body">
        <div class="title">공지관리</div>
            <div class="row">
           <div class="col-md-2">
              <button type="button" class="btn btn-primary btn_add" id="btn_insert">추가하기</button>
           </div>
           <div class=" col-md-offset-6 col-md-4 form-inline">
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
               	 <th>비고</th>	
              </tr>
              <c:forEach var="vo" items="${list}">
                 <tr>
                    <td>${vo.ntc_no}</td>
                    <td>${vo.ntc_title}</td>
                    <td style="width:800px;"><div class="con">${vo.ntc_content}</div></td>
                    <td>
                    <c:if test="${vo.ntc_delete==1}">공개</c:if>
                    <c:if test="${vo.ntc_delete==0}">비공개</c:if>
                    </td>
                    <td>${vo.ntc_date}</td>
                    <td>
                    <a href="#" class="btn btn-xs btn-warning">공지수정</a>
                    <c:if test="${vo.ntc_delete==1}">
                    <a href="#" class="btn btn-xs btn-danger btn-change">비공개전환</a>
                    </c:if>
                    <c:if test="${vo.ntc_delete==0}">
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
</div>

    <!-- Main Content -->
    

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
	
	<form action="notice_delete.do" method="get">
			<div class="modal fade" id="deletemodal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h2>공지전환</h2>
						</div>
						<div class="modal-body">
							<input type="hidden" name="ntc_no" id="ntc_delete_no" />
							<input type="hidden" name="ntc_delete" id="delete_no">
							<input type="hidden" name="type" value="${param.type}">
							<input type="hidden" name="text" value="${param.text}">
							<input type="hidden" name="sel_type" value="${param.sel_type}">
							<input type="hidden" name="page" value="${param.page}">
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
		
	<form:form action="notice_update.do?type=${param.type}&text=${param.text}&sel_type=${param.sel_type}&page=${param.page}" method="post" modelAttribute="vo">
			<div class="modal fade" id="updatemodal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h2>공지수정</h2>
						</div>
						<div class="modal-body">
							<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
								<form:input type="hidden" class="form-control" path="ntc_no" style="width:400px;" id="update_ntc_no"/>
								<label style="width:120px">공지제목</label>
								<form:input type="text" class="form-control" path="ntc_title" style="width:400px;" id="update_ntc_title"/>
							</div>
							<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
								<label style="width:120px">공지내용</label>
								<form:textarea class="form-control" path="ntc_content" style="width: 400px; resize:none;" rows="20" id="update_ntc_content"></form:textarea>
							</div>
							<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
								<label style="width:120px">공개여부</label>
								<form:select class="form-control" id="update_ntc_delete" path="ntc_delete">
										<option value="1">공개</option>
										<option value="0">비공개</option>
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
		
   <script type="text/javascript" src="resources/js/jquery-1.9.1.min.js"></script>
   <script type="text/javascript" src="resources/js/readmore.min.js"></script>
   <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="resources/js/jquery.twbsPagination-1.3.1.js"></script>	
   <script>
	 /*   function nl2br(str){  
		    return str.replace(/\n/g, "<br />");  
		}   */
	
	$(function() {
			var br2nl = function(varTest){
				return varTest.replace(/<br>/g, "\n");
			};
			
			$('.con').readmore({
	            blockCSS: 'display: block;',
	            speed: 75,
	            collapsedHeight: 65,
	            
	            moreLink: '<a href="#" style="color:blue;"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>자세히</a>',
	            lessLink: '<a href="#" style="color:blue;"><span class="glyphicon glyphicon-triangle-top" aria-hidden="true"></span>숨김</a>'
	         });
    	  
    		$('.btn-warning').click(function(){
    			var idx = $(this).index('.btn-warning');
    			var arr = new Array(); //js 배열 생성
    	  		<c:forEach var="vo" items="${list}">
    	  			var arr1 = new Array();
    	  			arr1.push("${vo.ntc_no}");
    	  			arr1.push("${vo.ntc_title}");
    	  			arr1.push("${vo.ntc_content}");
    	  			arr1.push("${vo.ntc_delete}");
    	  			arr.push(arr1);
    	  		</c:forEach>
    	  		
    	  		$('#update_ntc_no').val(arr[idx][0]);
     	  		$('#update_ntc_title').val(arr[idx][1]);
     	  		$('#update_ntc_content').val(br2nl(arr[idx][2]));
 				$('#update_ntc_delete').val(arr[idx][3]).prop("selected", true);
    	  	 
    	  		$('#updatemodal').modal('show');
    	  	});
    	  
    	  
    		$('.btn-change').click(function(){
    			var idx = $(this).index('.btn-change');
    			var arr = new Array(); 
    	  		<c:forEach var="vo" items="${list}">
    	  			var arr1 = new Array()
    	  			arr1.push("${vo.ntc_no}");
    	  			arr1.push("${vo.ntc_delete}");
    	  			arr1.push("${vo.ntc_title}");
    	  			arr.push(arr1);
    	  		</c:forEach>
    	  		$('#ntc_delete_no').val(arr[idx][0]);
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
    	  
    	 	 $('#sel_type').change(function(){
	  	  		var sty = $(this).val();
	  	  		window.location.href="admin_notice.do?type=${param.type}&text=${param.text}&sel_type="+sty+"&page=1";
  	  		});
    	  
    		$('#btn_insert').click(function(){
				$('#insertmodal').modal('show');	
			});	
    	  
    	  	var func = function(){
				var ty = $('#search_type').val();
				var tx = encodeURIComponent($('#search_text').val());
				window.location.href="admin_notice.do?type="+ty+"&text="+tx+"&sel_type=${param.sel_type}&page=1";
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
               href:'?type=${param.type}&text='+encodeURIComponent('${param.text}')+'&sel_type=${param.sel_type}&page={{number}}'
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