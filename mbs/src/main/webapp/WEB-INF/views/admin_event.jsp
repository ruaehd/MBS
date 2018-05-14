<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> <!-- //한글처리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- // 반복문 c:forEach c:if-->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> <!-- // model and view -->
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  	<title>이벤트 관리</title>
  	<link rel="stylesheet" href="resources/css/bootstrap.css" />
   	<link rel="stylesheet" href="resources/css/v1_adminside.css" />
   	<link rel="stylesheet" href="resources/css/w3.css" />
   	<link rel="stylesheet" href="resources/css/daterangepicker.css" />
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
	        <div class="title"> 관리명 </div>
	            <div class="row">
	           <div class="col-md-2">
	              <button type="button" id="btn_insert" class="btn btn-primary btn_add">추가하기</button>
	           </div>
	           <div class=" col-md-offset-6 col-md-4 form-inline">
	                 <select class="form-control" id="search_type">
	                    <option value="evt_title">제목</option>
	                 </select>
	                 <input type="text" class="form-control" id="search_text" />
	                 <button type="button" class="form-control btn-success" id="search_btn">검색</button>
	              </div>
	           </div>
	          
	           <table class="table">
	              <tr class="w3-dark-gray table-head">
	                 <th style="vertical-align:middle">번호</th>
	                 <th style="vertical-align:middle">제목</th>
	                 <th style="vertical-align:middle">이미지</th>
	                 <th style="vertical-align:middle">내용</th>
	                 <th style="vertical-align:middle">
	            	  <select class="form-control w3-dark-gray w3-border-dark-gray" id="date_sel">
	                 	<option style="display:none">이벤트기간</option>
	                 </select>
	                 </th>
	                 <th style="width:120px">
	                 <select id="sel_type" class="form-control w3-dark-gray w3-border-dark-gray">
	                    <option value="all" ${param.sel_type eq all ? 'selected="selected"':''}>전체</option>
	                    <option value="1" ${param.sel_type == '1' ? 'selected="selected"':''}>진행</option>
	                    <option value="2" ${param.sel_type == '2' ? 'selected="selected"':''}>대기</option>
	                    <option value="3" ${param.sel_type == '3' ? 'selected="selected"':''}>종료</option>
	                    <option value="0" ${param.sel_type == '0' ? 'selected="selected"':''}>삭제</option>	
	                 </select>
	                 </th>
	                 <th style="vertical-align:middle">등록날짜</th>
	                 <th style="vertical-align:middle">비고</th>
	              </tr>
	              <c:forEach var="vo" items="${list}">
	                 <tr>
		              	<td>${vo.evt_no}</td>
		                <td style="width:200px">${vo.evt_title}</td>
		                <td style="width:300px"><img src="eventImgList.do?evt_no=${vo.evt_no}" width="300px" height="60px" class="checkimg" /></td>
		                <td style="width:300px"><img src="eventImgContent.do?evt_no=${vo.evt_no}" width="300px" height="60px" class="checkimg1" /></td>
		                <td style="width:225px">${vo.evt_begintime}~${vo.evt_endtime}</td>
		                <td>
		                	<c:if test="${vo.evt_delete==3}">종료</c:if>
		                	<c:if test="${vo.evt_delete==2}">대기</c:if>
		                	<c:if test="${vo.evt_delete==1}">진행</c:if>
	                    	<c:if test="${vo.evt_delete==0}">삭제</c:if>
	                    </td>
		                <td style="width:50px">${vo.evt_date}</td>	
		                <td>
		                <a href="#" class="btn btn-xs btn-warning">수정</a>
		                <c:if test="${vo.evt_delete!=0}">
	                    <a href="#" class="btn btn-xs btn-danger btn-delete">삭제</a>
	                    </c:if>
	                    <c:if test="${vo.evt_delete==0}">
	                    <a href="#" class="btn btn-xs btn-primary btn-delete">복원</a>
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
	
	<form:form action="admin_event.do" method="post" modelAttribute="vo" enctype="multipart/form-data">
		<div class="modal fade" id="insertmodal">
			<div class="modal-dialog">
				<div class="modal-content" style="width:700px">
					<div class="modal-header">
						<h4>이벤트등록</h4>
					</div>
					<div class="modal-body">
						<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
							<label style="width:120px">제목</label>
							<form:input type="text" style="width:500px" path="evt_title" class="form-control" />
						</div>
						
						<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
							<label style="width:120px">메인이미지</label>
							<input type="file" name="evt_image1" class="form-control" />
						</div>
						
						<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
							<label style="width:120px">내용이미지</label>
							<input type="file" name="evt_content1" class="form-control" />
						</div>
						
						<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
							<label style="width:120px">기간</label>
								<input type="text" style="width:500px" id="date_insert" class="form-control" />
								<form:input type="hidden" path="evt_begintime" id="event_begin" />
								<form:input type="hidden" path="evt_endtime" id="event_end" />
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
	
	<form action="event_delete.do" method="get" enctype="multipart/form-data">
		<div class="modal fade" id="deletemodal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h2>이벤트삭제</h2>
					</div>
					<div class="modal-body">
						<input type="hidden" name="evt_no" id="evt_delete_no" />
						<input type="hidden" name="evt_delete" id="delete_no">
						<label style="font-size:30px">제목 : </label>
						<label style="font-size:30px" id="delete_title"></label><br />
						<label style="" id="delete_name"></label>
						<label>하시겠습니까?</label>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-success" value="삭제" />
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<form:form action="event_update.do" method="post" modelAttribute="vo" enctype="multipart/form-data">
		<div class="modal fade" id="updatemodal">
			<div class="modal-dialog">
				<div class="modal-content" style="width:700px">
					<div class="modal-header">
						<h2>이벤트수정</h2>
					</div>
					<div class="modal-body">
						<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
							<form:input type="hidden" class="form-control" id="update_evt_no" path="evt_no" />
							<label style="width:120px">이벤트제목</label>
							<form:input type="text" class="form-control" style="width:500px;" id="update_evt_title" path="evt_title" />
						</div>
						<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
							<label style="width:120px">이벤트메인</label>
							<img src="" width="500px" height="180px" id="evt_img" />
							<input type="file" name="evt_image1" style="display:none" id="evt_img1" />
						</div>
						<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
							<label style="width:120px">이벤트내용</label>
							<img src="" width="500px" height="180px" id="evt_content" />
							<input type="file" name="evt_content1" style="display:none" id="evt_content1" />
						</div>
						<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
							<label style="width:120px">이벤트기간</label>
							<input type="text" style="width:500px" class="form-control" id="date_update">
							<form:input type="hidden" id="event_update_begin" path="evt_begintime" />
							<form:input type="hidden" id="event_update_end" path="evt_endtime" />
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
		
	<div class="modal fade" id="checkmodal">
			<div class="modal-dialog">
				<div class="modal-content" style="width:700px">
					<div class="modal-header">
						<h2>사진확인</h2>
					</div>
					<div class="modal-body">
						<div class="form-inline" style="margin-top:3px; margin-bottom:3px">
							<img src="" width="650px" height="650px" id="check_img"/>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>

	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
   <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="resources/js/jquery.twbsPagination-1.3.1.js"></script>
	<script type="text/javascript" src="resources/js/moment.js"></script>
	<script type="text/javascript" src="resources/js/daterangepicker.js"></script>

   <script>
	$(function() {
		$('#evt_img1').change(function(){
			//현재 파일을 img변수에 넣음
			var img = this;
			//img변수에 값이 있다면, 파일을 선택했다면
			if(img.files && img.files[0]){
				//파일을 읽기위한 객체 생성
				var reader = new FileReader();
				//파일을 읽어 들임.
				reader.onload = function(e){
					//읽은 파일을 img src태그에 넣음
					$('#evt_img').attr('src',e.target.result);
				};
				//파일의 링크를 읽음
				reader.readAsDataURL(img.files[0]);
			}
			/* else{	//파일을 선택하지 않았다면
				$('#preview_img').attr('src','resources/imgs/dafault.jpg');
			} */
		});
		
		$('#evt_content1').change(function(){
			//현재 파일을 img변수에 넣음
			var img = this;
			//img변수에 값이 있다면, 파일을 선택했다면
			if(img.files && img.files[0]){
				//파일을 읽기위한 객체 생성
				var reader = new FileReader();
				//파일을 읽어 들임.
				reader.onload = function(e){
					//읽은 파일을 img src태그에 넣음
					$('#evt_content').attr('src',e.target.result);
				};
				//파일의 링크를 읽음
				reader.readAsDataURL(img.files[0]);
			}
			/* else{	//파일을 선택하지 않았다면
				$('#preview_img').attr('src','resources/imgs/dafault.jpg');
			} */
		});
		
		$('#date_sel').daterangepicker({
			locale: {
		            format: 'YYYY-MM-DD',
		            applyLabel: '적용',
		            cancelLabel: '취소',
		            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		            daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
		    }, 
			opens: 'left'
		}, 
		
		function(start, end, label) {
			var start = start.format('YYYY-MM-DD');
			var end = end.format('YYYY-MM-DD');
			window.location.href="admin_event.do?type=${param.type}&text=${param.text}&sel_type=${param.sel_type}&begin="+start+"&end="+end+"&page=1";
			
		}); 
		
		var func = function(){
			var ty = $('#search_type').val();
			var tx = encodeURIComponent($('#search_text').val());
			window.location.href="admin_event.do?type="+ty+"&text="+tx+"&sel_type=${param.sel_type}&begin=${param.begin}&end=${param.end}&page=1";
		};
		
	 	$('#search_btn').click(function(){
				func();
		});
		$('#search_text').keyup(function(event){
			if(event.which == 13){
				func();
			}
		}); 
		
		$('#sel_type').change(function(){
	  	  		var sty = $(this).val();
	  	  		window.location.href="admin_event.do?type=${param.type}&text=${param.text}&sel_type="+sty+"&begin=${param.begin}&end=${param.end}&page=1";
	  	});
			
		$('#evt_img').click(function(){
			$('#evt_img1').click();
		})
		
		$('#evt_content').click(function(){
			$('#evt_content1').click();
		})
		
		$('.checkimg').click(function(){
			var idx = $(this).index('.checkimg');
			var arr = new Array(); 
	  		<c:forEach var="vo" items="${list}">
	  			var arr1 = new Array()
	  			arr1.push("${vo.evt_no}");
	  			arr.push(arr1);
	  		</c:forEach>
	  		$('#check_img').attr('src', 'eventImgList.do?evt_no='+arr[idx][0]);
			$('#checkmodal').modal('show');
	  	});
		
		$('.checkimg1').click(function(){
			var idx = $(this).index('.checkimg1');
			var arr = new Array(); 
	  		<c:forEach var="vo" items="${list}">
	  			var arr1 = new Array()
	  			arr1.push("${vo.evt_no}");
	  			arr.push(arr1);
	  		</c:forEach>
	  		$('#check_img').attr('src', 'eventImgContent.do?evt_no='+arr[idx][0]);
			$('#checkmodal').modal('show');
	  	});
			
		
		$('.btn-warning').click(function(){
			var idx = $(this).index('.btn-warning');
			var arr = new Array(); 
	  		<c:forEach var="vo" items="${list}">
	  			var arr1 = new Array();
	  			arr1.push("${vo.evt_no}");
	  			arr1.push("${vo.evt_title}");
	  			arr1.push("${vo.evt_begintime}")
	  			arr1.push("${vo.evt_endtime}")
	  			arr.push(arr1);
	  		</c:forEach>
	  		$('#date_update').daterangepicker({
			 	 locale: {
			            format: 'YYYY-MM-DD',
			            applyLabel: '적용',
			            cancelLabel: '취소',
			            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			            daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
			     },
			     "startDate": arr[idx][2],
			     "endDate": arr[idx][3] 
			});
	  		
	  		var beforedate = $('#date_update').val();
    	  	var afterdate = beforedate.split(" ");
    	  	$('#event_update_begin').val(afterdate[0]);
    	  	$('#event_update_end').val(afterdate[2]);
	  		$('#date_update').change(function(){
    	  		var beforedate = $(this).val();
    	  		var afterdate = beforedate.split(" ");
    	  		$('#event_update_begin').val(afterdate[0]);
    	  		$('#event_update_end').val(afterdate[2]);
    	  	});
	  		$('#update_evt_no').val(arr[idx][0]);
	  		$('#update_evt_title').val(arr[idx][1]);
	  	 	$('#evt_img').attr('src', 'eventImgList.do?evt_no='+arr[idx][0]);
	  	 	$('#evt_content').attr('src', 'eventImgContent.do?evt_no='+arr[idx][0]);
	  		$('#updatemodal').modal('show');
	  	});
		
		
		$('.btn-delete').click(function(){
			var idx = $(this).index('.btn-delete');
			var arr = new Array(); 
	  		<c:forEach var="vo" items="${list}">
	  			var arr1 = new Array()
	  			arr1.push("${vo.evt_no}");
	  			arr1.push("${vo.evt_delete}");
	  			arr1.push("${vo.evt_title}");
	  			arr.push(arr1);
	  		</c:forEach>
	  		$('#evt_delete_no').val(arr[idx][0]);
	  		$('#delete_no').val(arr[idx][1]);
	  		$('#delete_title').text(arr[idx][2]);
	  		if(arr[idx][1] == 0){
	  			$('#delete_name').text('복원');
	  			$('#delete_name').attr('style', 'color:blue; font-size:30px');
	  		}
	  		else if(arr[idx][1] == 1){
				$('#delete_name').text('삭제');
				$('#delete_name').attr('style', 'color:red; font-size:30px');
			}
	  		
			$('#deletemodal').modal('show');
	  	});
			
			$('#btn_insert').click(function(){
				var beforedate = $('#date_insert').val();
	    	  	var afterdate = beforedate.split(" ");
	    	  	$('#event_begin').val(afterdate[0]);
	    	  	$('#event_end').val(afterdate[2]);
				
	    	  	$('#date_insert').change(function(){
	    	  		var beforedate = $(this).val();
	    	  		var afterdate = beforedate.split(" ");
	    	  		$('#event_begin').val(afterdate[0]);
	    	  		$('#event_end').val(afterdate[2]);
	    	  	});
	    	  	
				$('#insertmodal').modal('show');
			});	
		
			$('#date_insert').daterangepicker({
			 	 locale: {
			            format: 'YYYY-MM-DD',
			            applyLabel: '적용',
			            cancelLabel: '취소',
			            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			            daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
			     }
			});
			
	  		/* <c:forEach var="vo" items="${list}" varStatus="i">
	  			$('#date_'+${i.index}).daterangepicker({
				 	 locale: {
				            format: 'YYYY-MM-DD',
				            applyLabel: '적용',
				            cancelLabel: '취소',
				            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				            daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
				     },
				     "startDate": "${vo.evt_begintime}",
				     "endDate": "${vo.evt_endtime}" 
				});
	  		</c:forEach> */
            $('.pagination').twbsPagination({
               totalPages:'${totPage}',
               visiblePages:10,
               href:'?type=${param.type}&text='+encodeURIComponent('${param.text}')+'&sel_type=${param.sel_type}&begin=${param.begin}&end=${param.end}&page={{number}}'
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