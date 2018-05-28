<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>비밀번호변경</title>
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" type="text/css" href="resources/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/component.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/w3.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/jquery-ui.min.css" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
	<div class="wrapper">
		<jsp:include page="v1_header.jsp"></jsp:include>
		<div id="main">
			<div style="margin-top:78px">
			   <div class="container" >
			      <div class="w3-display-container" style="height:200px;">
			         <div class="w3-display-middle" align="center">
			            <img src="resources/imgs/sou.jpg" style="width:200px; height:100%"/><br/>
			            <h1>비밀번호변경</h1>
			         </div>
			      </div>
			      <div class="container" style="width:80%;height:100px;margin-top:40px">
			      <div class="row form-group">
			         <div class="col-xs-12">
			            <ul class="nav nav-pills nav-justified thumbnail setup-panel">
			               <li><a href="#step-1">
			                     <h4 class="list-group-item-heading">본인확인</h4>
			                     <p class="list-group-item-text">Second step description</p>
			               </a></li>
			               <li class="disabled"><a href="#step-2">
			                     <h4 class="list-group-item-heading">암호 변경</h4>
			                     <p class="list-group-item-text">Third step description</p>
			               </a></li>
			            </ul>
			         </div>
			      </div>
			   </div>
			       <div class="row setup-content" id="step-1">
			           <div class="col-xs-12">
			               <div class="col-md-12" style="width:100%;margin:0px auto">
			                  <div style="margin-left:20%">
			                      <h1>본인확인</h1>
			                      </div>
			                   <div style="border:1px solid #cccccc; width:64%;margin:0px auto;margin-bottom:50px">
			                    </div>
			                   <form name="auth" class="form-horizontal" action="emailAuth.do" target="emailAuth">
			                      <div class="form-group">
			                     <label class="col-sm-4 control-label" for="email">본인확인</label>
			                     <div class="col-sm-5">
			                        <div class="form-inline">
			                           <input type="text" class="form-control" id="email" name="email" placeholder="이메일 주소를 입력하세요" />
			                           <input type="button" class="btn btn-info" value="이메일 인증" onClick="openAuth()" style="margin-left:20px">
			                        </div>
			                     </div>
			                  </div>
			                  <div class="form-group">
			                     <label class="col-sm-4 control-label"></label>
			                     <div class="col-sm-5">
			                        <input type="text" class="form-control" id="email_ckh" name="emailauth" readonly>
			                     </div>
			                  </div>
			                   </form>
			                   <div align="center" style="margin-top:50px">
			                   	  <a href="user_main.do"><button class="btn btn-primary">마이페이지</button></a>
			                      <button id="next-2" class="btn btn-primary">다음단계로</button>
			                  </div>
			            </div>   
			           </div>
			       </div>
			      
			      
			      <div  class="container setup-content" style="width:80%;padding:30px;margin:0px auto"  align="center" id="step-2">
			         <div style="margin:0px auto">
			            <div align="left">
			                  <h1>비밀번호변경</h1>
			               </div>
			           </div>
			                   <div style="border:1px solid #cccccc; width:100%;margin:0px auto;margin-bottom:50px">
			                  </div>
						<form action="user_changepw.do" method="post" id="form">
							<div class="row" style="width: 60%; margin: 0px auto">
								<label class="col-sm-4 control-label" for="email">새 암호</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" name="mb_pw" id="mb_pw" placeholder="새 암호를 입력하세요" />
									<div id="exp" style="height:40px"></div>
								</div>
								<label class="col-sm-4 control-label" for="email">새 암호 확인</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="mb_repw" placeholder="새 암호를 다시 입력하세요" />
									<div id="reexp" style="height:20px"></div>
								</div>
							</div>
								<div align="center" style="margin-bottom: 20px; margin-top: 50px">
									<input type="button" id="change" class="btn btn-primary" value="비밀번호 변경" />
								</div>
							
						</form>
			
			
					</div> 
			      </div>
			   </div>
		</div>
		<jsp:include page="v1_footer.jsp"></jsp:include>
	</div>
	
   <script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


  <script>
			$(document).ready(function() {
				var pcheck = 0;
				var repcheck = 0;
			$('#mb_pw').keyup(function(event) {
					
			if ($('#mb_repw').val() != "") {
				if ($('#mb_pw').val() != $('#mb_repw').val()) {
						$('#reexp').empty();
						$('#reexp').append('<font color="red" style="font-size:12px;margin-left:20px">비밀번호가 일치하지 않습니다</font>');
							repcheck = 0;
						} 
				else if ($('#mb_pw').val() == $('#mb_repw').val()) {
					$('#reexp').empty();
					$('#reexp').append('<font color="green" style="font-size:12px;margin-left:20px">비밀번호가 일치합니다</font>');
							repcheck = 1;
							}
				else if ($('#mb_repw').val() == "") {
					if ($('#mb_pw').val() != $('#mb_repw').val()) {
						$('#reexp').empty();
						$('#reexp').append('<font color="red" style="font-size:12px;margin-left:20px">비밀번호가 일치하지 않습니다</font>');
						repcheck = 0;
					}
				}
		}
		if ($('#exp').text() == "") {
			if ($('#mb_pw').val().length < 8 || $('#mb_pw').val().length > 16) {
				$('#exp').append('<font color="red" style="font-size:12px;margin-left:20px">*비밀번호는 8자 이상 16자 이하로 <br/>작성해주세요</font>');
				pcheck = 0;
			}
		} 
		else if ($('#exp').text() != "") {
			if ($('#mb_pw').val().length >= 8 && $('#mb_pw').val().length <= 16) {
				$('#exp').empty();
				pcheck = 1;
			}
		}
	});
		$('#change').click(function() {
			if($('#mb_pw').val() == "" || $('#mb_repw').val() == ""){alert('암호를 입력해주세요');return null}
			else if (pcheck == 0 || repcheck == 0) {alert('암호 , 암호재확인 규정에 맞춰주세요.');$('#mb_pw').focus();return null}
			else {$('#form').submit()}
		});
		
		$('#mb_repw').keyup(function(event) {
			if ($('#mb_pw').val() != $('#mb_repw').val()) {
				$('#reexp').empty();
				$('#reexp').append('<font color="red" style="font-size:12px;margin-left:20px">비밀번호가 일치하지 않습니다</font>');
				repcheck = 0;
			} 
			else if ($('#mb_pw').val() == $('#mb_repw').val()) {
				$('#reexp').empty();
				$('#reexp').append('<font color="green" style="font-size:12px;margin-left:20px">비밀번호가 일치합니다</font>');
				repcheck = 1;
			}
		});
		var navListItems = $('ul.setup-panel li a'), allWells = $('.setup-content');
		allWells.hide();
		navListItems.click(function(e) {
			e.preventDefault();
			var $target = $($(this).attr('href')), $item = $(this).closest('li');
			if (!$item.hasClass('disabled')) {
				navListItems.closest('li').removeClass('active');
				$item.addClass('active');
				allWells.hide();
				$target.show();
			}
		});
		
		$('ul.setup-panel li a[href="#step-1"]').trigger('click');
								// DEMO ONLY //
			$('#next-2').on('click',function(e) {
				
				if($('#email_ckh').val() == '인증완료'){
	        		 var em = $('#email').val();
	             	$('#mb_email').val(em);
	             	 
	             	$('ul.setup-panel li:eq(1)').removeClass('disabled');
					$('ul.setup-panel li a[href="#step-2"]').trigger('click');
	        	 }
	        	 else{
	        		 alert("본인인증을 해주세요");
	        		 return null;
	        	 }
			});
								
								
			$('#prev-1').on('click',function(e) {
				$('ul.setup-panel li a[href="#step-1"]').trigger('click');
			});
		});
			
		function openAuth() {
			var email = $('#email').val();
			$.ajax({
				type: 'POST',
				url: 'ajax_emailcheck.do',
				data: {email:email, mb_id:"${sessionScope.Mem_Id}"},
				success:function(data){
					if(data == 1){
						window.open('emailAuth.do?email='+email,'emailAuth','width=500,height=300, left=650, top=100');			
					}
					else{
						alert("회원정보에 입력된 이메일과 일치하지 않습니다");
						return false;
					}
				}
			});
		}
</script>
</body>
</html>
