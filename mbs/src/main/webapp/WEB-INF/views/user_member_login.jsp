<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Google Nexus Website Menu</title>
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="resources/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/component.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/w3.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/footer.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	</head>
<body>
	<div id="wrapper">
		<jsp:include page="v1_header.jsp"></jsp:include>
		<div id="main">
			<div style="margin-top:128px">
		      <div class="container w3-border w3-round w3-white" style="width:40%;padding:30px;">
		       <h2 align="center"><b>로그인</b></h2>
		       <div align="right">
		      		<a href="user_forgetpw.do" style="font-size:12px">비밀번호를 잊으셨습니까?</a>
		      	</div>
		    	  <div class="row">
		             <form:form action="user_login.do" id="form" method="post" modelAttribute="vo">
		               <div class="input-group">
		                  <span class="input-group-addon"><i class="fa fa-user"></i></span>
		                  <form:input type="text" class="form-control" id="id" path="mb_id" placeholder="아이디를 입력하세요"/>
		               </div>
		               <div class="input-group">
		                  <span class="input-group-addon"><i class="fa fa-lock"></i></span>
		                  <form:input  type="password" class="form-control" id="pw" path="mb_pw" placeholder="암호를 입력하세요"/>
		               </div>
		                    <font color="red" class="help-block" style="height:10px; font-size:12px;"></font>
		               <button type="button" id="login_btn" class="btn btn-primary btn-block">로그인</button>
		            </form:form>
		         </div>
		         	<div class="row" style="margin-top:10px;line-height:40px">
		         		<div class="col-md-6">
		      				<input type="checkbox" id="save" value="forget-password" style="margin-top:10px"/>
		      				<font style="margin-top:10px;">아이디/ 암호 저장하기</font>
		      			</div>
		      			<div class="col-md-6" align="right">
		      			<a href="user_join.do">회원가입</a>
		      			</div>
	      			</div>
		  		 </div>
		   </div>
		</div>
		<jsp:include page="v1_footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script type="text/javascript" src="resources/js/jquery.cookie.js"></script>
   <script>
   	$(function(){
   		
   		var ck = $.cookie('c_ck');
   		if(ck == 'y'){
   			var id = $.cookie('c_id');
   			var pw = $.cookie('c_pw');
   			$('#id').val(id);
   			$('#pw').val(pw);
   			$('#save').attr('checked',true);
   		}
   		$('#save').click(function(){
   			if($('#save').is(":checked")){
   				var id=$('#id').val();
   				var pw=$('#pw').val();
   				
   				$.cookie('c_id',id);
   				$.cookie('c_pw',pw);
   				$.cookie('c_ck','y');
   			}
   			else{
   				$.cookie('c_id','');
   				$.cookie('c_pw','');
   				$.cookie('c_ck','n');
   			}
   		});
   		
   		$('#login_btn').click(function(){
   			$('#form').submit(); 
   		});
   	});
   </script>
   </body>
   </html>
