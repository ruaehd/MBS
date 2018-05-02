<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> <!-- //한글처리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- // 반복문 c:forEach c:if-->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> <!-- // model and view -->
<%@ page session="false" %>
<html>
<head>
   <title>관리자1</title>
   <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
   <link rel="stylesheet" href="resources/css/v1_adminside.css" />
   <link rel="stylesheet" href="resources/css/w3.css" />
   <link rel="stylesheet" href="resources/css/daterangepicker.css" />
</head>
<style>
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
<div class="row">
    <jsp:include page="admin_header.jsp"></jsp:include>
</div>

    <!-- Main Content -->
    <div class="container-fluid">
        <div class="side-body">
        <div class="title"> 관리명 </div>
            <div class="row">
           <div class="col-md-2">
              <button type="button" class="btn btn-primary btn_add">추가하기</button>
           </div>
           <div class=" col-md-offset-7 col-md-3 form-inline">
                 <select class="form-control">
                    <option>이름</option>
                    <option>날짜</option>
                    <option>번호</option>
                 </select>
                 <input type="text" class="form-control"/>
                 <button type="button" class="form-control btn-success">검색</button>
              </div>
           </div>
           <table class="table">
              <tr class="w3-dark-gray table-head">
                 <th style="vertical-align:middle">번호</th>
                 <th style="vertical-align:middle">제목</th>
                 <th style="vertical-align:middle">이미지</th>
                 <th style="vertical-align:middle">내용</th>
                 <th style="vertical-align:middle">이벤트기간</th>
                 <th style="width:120px">
                 <select class="form-control w3-dark-gray w3-border-dark-gray">
                    <option>전체</option>
                    <option>진행</option>
                    <option>종료</option>	
                 </select>
                 </th>
                 <th style="vertical-align:middle">등록날짜</th>
                 <th style="vertical-align:middle">등록날짜</th>
              </tr>
              <c:forEach var="vo" items="${list}">
                 <tr>
	              	<td>${vo.evt_no}</td>
	                <td style="width:200px">${vo.evt_title}</td>
	                <td style="width:300px"><img src="eventImgList.do?evt_no=${vo.evt_no}" width="300px" height="60px" /></td>
	                <td style="width:300px"><img src="eventImgContent.do?evt_no=${vo.evt_no}" width="300px" height="60px" /></td>
	                <td style="width:225px">${vo.evt_begintime}~${vo.evt_endtime}</td>
	                <td>${vo.evt_delete}</td>
	                <td style="width:50px">${vo.evt_date}</td>	
	                <td><input id="date" class="date" type="text"></td>
                </tr>
              </c:forEach>
       
           </table>
           
           
           
           <div align="center">
            <ul class="pagination"></ul>
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
			$('.btn-success').click(function(){
			/* var idx = $(this).index('.date');
			var arr = new Array();  */
	  		<c:forEach var="vo" items="${list}">
	  			/* var arr1 = new Array();
	  			arr1.push("${vo.evt_begintime}");
	  			arr1.push("${vo.evt_endtime}");
	  			arr.push(arr1); */
	  			console.log("${vo.evt_begintime}"); 
	  		</c:forEach>
			});
		
		
			$('#date').daterangepicker({
			 	 locale: {
			            format: 'YYYY-MM-DD',
			            applyLabel: '적용',
			            cancelLabel: '취소',
			            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			            daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
			     },
			     "startDate": "2018/04/20",
			     "endDate": "2018/05/20" 
			});

            $('.pagination').twbsPagination({
               totalPages:15,
               visiblePages:10,
               href:'#'
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