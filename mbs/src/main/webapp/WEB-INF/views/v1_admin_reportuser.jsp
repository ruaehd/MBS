<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>회원관리</title>
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
      color:red
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
        <div class="title"> 차단회원관리 </div>
            <div class="row">
            <div class="col-md-3">
             	총 ${count}명의 차단된 회원이 있습니다
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
              <tr class="w3-red table-head">
                 <th style="vertical-align:middle">번호</th>
                 <th style="vertical-align:middle">아이디</th>
                 <th style="vertical-align:middle">이름</th>
                 <th style="vertical-align:middle">성별</th>
                 <th style="vertical-align:middle">생년월일</th>
                 <th style="vertical-align:middle">이메일</th>
                 <th style="vertical-align:middle">연락처</th>
                 <th style="vertical-align:middle">가입일자</th>
                 <th style="vertical-align:middle">비고</th>
              </tr>
              <tbody id="tableline">
              <c:forEach var="vo" items="${list}" varStatus="i">
                 <tr>
                    <td class="count">${(param.page-1)*10+i.count}</td>
                    <td class="listmb_id">${vo.mb_id}</td>
                    <td>${vo.mb_name}</td>
                    <c:if test="${vo.mb_gender == 1}">
                    <td class="gender">남</td>
                    </c:if>
                    <c:if test="${vo.mb_gender == 2}">
                    <td class="gender">여</td>
                    </c:if>
                    <td>${vo.mb_birth}</td>
                    <td>${vo.mb_email}</td>
                    <td>${vo.mb_tel}</td>
                    <td>${vo.mb_date}</td>
                    <td>
                    	<button type="button" class="btn btn-info">차단해제</button>
                    </td>
                 </tr>
              </c:forEach>
              </tbody>
           </table>
           <div align="center">
            <ul id="pagination" class="pagination"></ul>
         </div>
        </div>
        <form:form action="admin_insertMember.do" method="post" id="memberform" modelAttribute="mvo">
        	<div class="modal fade" id="insertMember">
				<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<div class="row">
									<div class="col-md-4">
									<font class="modal-title">회원추가</font>
									</div>
									<div align="right" class="form-group">
									<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
									</div>
								</div>
							</div>
							<div class="modal-body">
								<div class="form-inline modal-namespace">
									<label class="name-label">아이디</label>
									<input type="text" name="mb_id" id="mb_id" class="form-control" />
									<button type="button" class="btn w3-red"
										id="memberidcheck">중복체크</button>
								</div>
								<div class="form-inline modal-namespace">
									<label class="name-label">비밀번호</label>
									<form:input type="password"  path="mb_pw" id="mb_pw" class="form-control" />
								</div>
								<div class="form-inline modal-namespace">
									<label class="name-label">이름</label>
									<form:input type="text" path="mb_name" id="mb_name" class="form-control" />
								</div>
								<div class="form-inline modal-namespace">
									<label class="name-label">성별</label>
									<form:select class="form-control" path="mb_gender">
										<form:option value="1">남성</form:option>
										<form:option value="2">여성</form:option>
									</form:select>	
								</div>
								<div class="form-inline modal-namespace">
									<label class="name-label">생년월일</label>
									<form:input type="text" id="mb_brith" path="mb_birth" class="form-control w3-white" readonly="true" />
								</div>
								<div class="form-inline modal-namespace">
									<label class="name-label">이메일</label>
									<form:input type="text" path="mb_email" id="mb_email" class="form-control" />		
								</div>
								<div class="form-inline modal-namespace">
									<label class="name-label">전화번호</label>
									 <div class="form-group">
						                  <input type="text" id="tel1" class="w3-input w3-round w3-border form-control" maxlength="3" style="width:50px"/>-
						                  <input type="text" id="tel2"class="w3-input w3-round w3-border form-control" maxlength="4" style="width:70px"/>-
						                  <input type="text" id="tel3"class="w3-input w3-round w3-border form-control" maxlength="4" style="width:70px"/>
						                  <form:input type="hidden" path="mb_tel" id="mb_tel" value=""/>
              						 </div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary btn-join">회원추가</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>       	
        	</div>
        </form:form>
    </div>
</div>

<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
	$(function(){
		var secls = ${param.searchcol};
		if(secls == 1) {$('.secls1').prop("selected" , true);}
		else if (secls == 2){$('.secls2').prop("selected" , true);}
		
		$('#search').click(function(){
			var searchcol = $('#search_select').val();
			var searchval = $('#searchval').val();
			location.href = "admin_user.do?page=1&searchcol="+searchcol+"&searchval="+searchval;
		});
		
		
		$('.btn-info').click(function(){
			var idx= $('.btn-info').index(this);
			console.log(idx);
			var mb_id = $('.listmb_id').eq(idx).text();
			$.post('ajax_adminuserdelete1.do',{"mb_id":mb_id} , function(ret){
				if(ret == 1){
					alert("해당 회원을 차단 해제 하였습니다.");
					window.location.href= "admin_reportuser.do?page=${param.page}&searchcol=${param.searchcol}&searchval=${param.searchval}";
				}
				else{
					alert("해당 회원 차단 해제에 실패하셨습니다");
					return null;
				}
			});
		});
		
		 $('.pagination').twbsPagination({ 
             totalPages:'${pagecount}',
             visiblePages:10,
             href:'?page={{number}}&searchcol='+$('#search_select').val()+'&searchval='+$('#searchval').val()
          });

	});
</script>

</body>
</html>