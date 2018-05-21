<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Google Nexus Website Menu</title>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="resources/css/daterangepicker.css" />
	</head>
<body>
	<div id="wrapper">
		<jsp:include page="v1_header.jsp"></jsp:include>
		<div id="main">
			<div style="margin-top:78px">
			   <div class="container" style="width:80%;">
			      <div class="w3-display-container" style="height:200px">
			         <div class="w3-display-middle" align="center">
			            <img src="resources/imgs/member_edit.png" style="width:200px; height:100%"/><br/>
			            <h1>회원수정</h1>
			         </div>
			      </div>
			      <div class="container" style="width:80%;height:100px;margin-top:20px">
			      <div class="row form-group">
			         <div class="col-xs-12">
			            <ul class="nav nav-pills nav-justified thumbnail setup-panel">
			               <li><a href="#step-1">
			                     <h4 class="list-group-item-heading">본인확인</h4>
			                     <p class="list-group-item-text">Second step description</p>
			               </a></li>
			               <li class="disabled"><a href="#step-2">
			                     <h4 class="list-group-item-heading">개인정보수정</h4>
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
			                      <div class="row" style="width:60%; margin:0px auto">
			                     <label class="col-sm-4 control-label" for="email">현재 비밀번호</label>
			                     <div class="col-sm-8">
			                           <input type="password" class="form-control" id="nowpw" placeholder="현재 암호를 입력하세요"/>
			                           <input type="hidden" id="nowid" value="${vo.mb_id}">
			                     </div>
			                  </div>
			                   <div align="center" style="margin-bottom:20px;margin-top:50px">
			                   <a href="user_main.do"><button class="btn btn-primary">마이페이지</button></a>
			                      <button id="next-2" class="btn btn-primary">다음단계로</button>
			                  </div>
			            </div>   
			           </div>
			       </div>
			       
			      <div class="container setup-content" style="width:100%;padding:30px;margin:0px auto"  align="center" id="step-2">
			      <form:form action="user_edit.do" method="post" modelAttribute="vo" id="form">
			         <div style="margin:0px auto">
			            <div align="left">
			                  <h1>개인정보수정</h1>
			               </div>
			           </div>
			                   <div style="border:1px solid #cccccc; width:100%;margin:0px auto;margin-bottom:50px">
			                  </div>
			                  <div class="container">
			            <div class="row menu"  style="margin-bottom:20px">
			               <div class="col-md-offset-3 col-md-3" style="width:100px">
			                  아이디
			               </div>
			               <div class="col-md-5">
			                  <form:input type="text" path="mb_id" id="mb_id" class="w3-input w3-round w3-border form-control" readonly="true"/>
			               </div>
			            </div>
			            <div class="row menu"  style="margin-bottom:20px">
			               <div class="col-md-offset-3 col-md-3" style="width:100px">
			               이름
			               </div>
			               <div class="col-md-5">
			                  <form:input type="text" path="mb_name" id="mb_name" class="w3-input w3-round w3-border form-control" />
			               </div>
			            </div>
			            <div class="row menu"  style="margin-bottom:20px">
			               <div class="col-md-offset-3 col-md-3" style="width:100px">
			                  성별
			               </div>
			               <div class="col-md-5 row">
			               	  <div class="col-md-6">
			                  	<button type="button" id="man" class="w3-button w3-round w3-border form-control gender">남성</button>
			                  </div>
			                  <div class="col-md-6">
			                 	 <button type="button" id="woman" class="w3-button w3-round w3-border right form-control gender">여성</button>
			                  </div>
			               <form:input type="hidden" path="mb_gender" value="" id="gender"/>
			            </div>
			            </div>
			            <div class="row menu"  style="margin-bottom:20px">
			               <div class="col-md-offset-3 col-md-3" style="width:100px">
			                  생년월일
			               </div>
			               <div class="col-md-5">
			                  <form:input type="text" path="mb_birth" id="mb_brith" value="" class="w3-input w3-round w3-border form-control w3-white" readonly="true"/>
			               </div>
			            </div>
			            <div class="row menu"  style="margin-bottom:20px">
			               <div class="col-md-offset-3 col-md-3" style="width:100px">
			                  이메일
			               </div>
			               <div class="col-md-5">
			                  <form:input type="text" path="mb_email" id="mb_email" class="w3-input w3-round w3-border form-control" readonly="true"/>
			               </div>
			            </div>
			            <div class="row menu"  style="margin-bottom:20px">
			               <div class="col-md-offset-3 col-md-3" style="width:100px">
			                  전화번호
			               </div>
			               <div class="form-inline col-md-5">
			                  <input type="text" id="tel1" class="w3-input w3-round w3-border form-control" maxlength="3" style="width:50px"/>-
			                  <input type="text" id="tel2"class="w3-input w3-round w3-border form-control" maxlength="4" style="width:70px"/>-
			                  <input type="text" id="tel3"class="w3-input w3-round w3-border form-control" maxlength="4" style="width:70px"/>
			                  <form:input type="hidden" path="mb_tel" value=""/>
			               </div>
			         </div>
			          <div align="left" class="col-md-offset-5 col-md-3" style="margin-bottom:20px;margin-top:50px;">
			                  <button type="button" id="abc" class="btn btn-primary form-control">회원수정</button>
			          </div>
			         </div>  
			   		</form:form> 
			      </div>
			   </div>
		   </div>
		</div>
		<jsp:include page="v1_footer.jsp"></jsp:include>
	</div>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script type="text/javascript" src="resources/js/moment.js"></script>
	<script type="text/javascript" src="resources/js/daterangepicker.js"></script>
	<script>
		  $(document).ready(function() {
			  
			  if($('#gender').val() == 1){
				  $('#man').addClass('w3-blue');
			  }
			  else if($('#gender').val() == 2){
				  $('#man').addClass('w3-blue');
			  }
			  var edtel = $('#mb_tel').val().split('-');
			  $('#tel1').val(edtel[0]);
			  $('#tel2').val(edtel[1]);
			  $('#tel3').val(edtel[2]);
			  
			  var pcheck = 0;
			  var repcheck = 0;
				$('.gender').click(function(){
					  var gein = $('.gender').index(this);
					$('.gender').removeClass('w3-blue w3-hover-blue');
					$('.gender').eq(gein).addClass('w3-blue w3-hover-blue');
				});
				
	           $('#abc').click(function(){
	                 var c = $('#mb_name').val();
	                 var d = $('#mb_brith').val();   
	                 var e = $('#mb_email').val();
	                 var t1 = $('#tel1').val();
	                 var t2 = $('#tel2').val();
	                 var t3 = $('#tel3').val();
	                 if(c == ""){alert('이름을 입력해주세요 !');$('#mb_name').focus(); return null}
	                 else if(d == ""){alert('생년월일을 입력해주세요 !');$('#mb_birth').focus(); return null}
	                 else if(e == ""){alert('이메일을 입력해주세요 !');$('#mb_email').focus(); return null}
	                 else if(t1 == "" ||t2 == "" ||t3 == ""){alert('전화번호를 입력해주세요 !');$('#mb_tel').focus(); return null}
	                 var g = 0;
	                 if($('#man').hasClass('w3-blue')){
	                	$('#gender').val("1");
	                 }
	                 else if($('#woman').hasClass('w3-blue')){
	                	 $('#gender').val("2");
	                 }
	                 else{
	                	 alert('성별을 선택해 주세요 !');
	                	 return null
	                 }
	                 $('#mb_tel').val(t1+"-"+t2+"-"+t3);
	                 $('#form').submit();
	       
	           });
	         var navListItems = $('ul.setup-panel li a'), allWells = $('.setup-content');
	
	         allWells.hide();
	
	         navListItems
	               .click(function(e) {
	                  e.preventDefault();
	                  var $target = $($(this).attr('href')), $item = $(
	                        this).closest('li');
	
	                  if (!$item.hasClass('disabled')) {
	                     navListItems.closest('li')
	                           .removeClass('active');
	                     $item.addClass('active');
	                     allWells.hide();
	                     $target.show();
	                  }
	               });
	         $('ul.setup-panel li a[href="#step-1"]').trigger('click');
		
		         // DEMO ONLY //
        	$('#next-2').on('click',function(e) {
				var mb_id = $('#nowid').val();
				var mb_pw = $('#nowpw').val();
				$.post('ajax_memberPwCheck.do',{'mb_id' : mb_id,'mb_pw' : mb_pw},function(vo1) {
					if (vo1.mb_id != null) {
							$('ul.setup-panel li:eq(1)').removeClass('disabled');
							$('ul.setup-panel li a[href="#step-2"]').trigger('click');
					} 
					else {
						alert('비밀번호가 일치하지 않습니다');
						$('#nowpw').focus();
						return null;
					}
				});
			});
		         
			$('#next-3').on('click',function(e) {
				var em = $('#email').val();
				$('#mb_email').val(em);
				//이메일 인증 유효성검사 확인 필요
				$('ul.setup-panel li:eq(2)').removeClass('disabled');
				$('ul.setup-panel li a[href="#step-3"]').trigger('click');
			});
			
			$('#prev-1').on('click',function(e) {
			   $('ul.setup-panel li a[href="#step-1"]').trigger('click');
			});
		});
	</script>
	<script>
	  	$(function(){
	  		 $('#mb_brith').daterangepicker({
	  	  		singleDatePicker: true,
	  	  	    showDropdowns: true,
	  	  	    locale: {
	  	          format: 'YYYY-MM-DD',
	  	          applyLabel: '적용',
	  	          cancelLabel: '취소',
	  	          monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  	          daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
	  					  }
	  		    });
	  		});
  	</script>
  </body>
  </html>
