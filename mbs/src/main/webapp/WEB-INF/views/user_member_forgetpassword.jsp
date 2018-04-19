<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<jsp:include page="header.jsp"></jsp:include>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <script src="//code.jquery.com/jquery-1.10.2.js"></script>
   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<div style="margin-top:78px">
   <div class="container" style="width:80%; height:800px">
      <div class="w3-display-container" style="height:200px;">
         <div class="w3-display-middle" align="center">
            <img src="resources/imgs/sou.jpg" style="width:200px; height:100%"/><br/>
            <h1>비밀번호 찾기</h1>
         </div>
      </div>
      <div class="container" style="width:80%;height:100px;margin-top:40px">
      <div class="row form-group">
         <div class="col-xs-12">
            <ul class="nav nav-pills nav-justified thumbnail setup-panel">
           	 <li class="active"><a href="#step-1">
                     <h4 class="list-group-item-heading">아이디확인</h4>
                     <p class="list-group-item-text">First step description</p>
               </a></li>
               <li class="disabled"><a href="#step-2">
                     <h4 class="list-group-item-heading">본인확인</h4>
                     <p class="list-group-item-text">Second step description</p>
               </a></li>
               <li class="disabled"><a href="#step-3">
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
                      <div class="form-inline" style="margin-left:20%">
                     <label class="col-sm-2 control-label" for="email">아이디</label>
                     <div class="col-sm-5">
                           <input type="text" style="width:300px" class="form-control" id="id" placeholder="아이디를 입력하세요" />
                     </div>      
                  </div>
                   <div align="center" style="margin-bottom:20px;margin-top:50px">
                   	  <a href="user_main.do"><button class="btn btn-primary">마이페이지</button></a>
                      <button id="next-2" class="btn btn-primary">다음단계로</button>
                  </div>
            </div>   
           </div>
       </div>
   
       <div class="row setup-content" id="step-2">
           <div class="col-xs-12">
               <div class="col-md-12" style="width:100%;margin:0px auto">
                  <div style="margin-left:20%">
                      <h1>본인확인</h1>
                      </div>
                   <div style="border:1px solid #cccccc; width:64%;margin:0px auto;margin-bottom:50px">
                    </div>
                   <form name="auth" class="form-horizontal" action="emailAuth.do" target="emailAuth">
                      <div class="form-group">
                     <label class="col-sm-4 control-label" for="email">이메일</label>
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
                        <input type="text" class="form-control" name="emailauth" readonly>
                     </div>
                  </div>
                  <div class="form-group">
                     <label class="col-sm-4 control-label">자동가입 방지</label>
                     <div class="col-sm-5">
                        <div class="g-recaptcha" id ="grecaptcha" data-sitekey="6LdfiEoUAAAAANEiw_ZLNO_1pmL3fj-Ttt1rX44c"></div>
                     </div>
                  </div>
                   </form>
                   <div align="center" style="margin-bottom:20px;margin-top:50px">
                   	  <a href="user_main.do"><button class="btn btn-primary">마이페이지</button></a>
                      <button id="next-3" class="btn btn-primary">다음단계로</button>
                  </div>
            </div>   
           </div>
       </div>
      
      <div  class="container setup-content" style="width:80%;padding:30px;margin:0px auto"  align="center" id="step-3">
         <div style="margin:0px auto">
            <div align="left">
                  <h1>비밀번호변경</h1>
               </div>
           </div>
                   <div style="border:1px solid #cccccc; width:100%;margin:0px auto;margin-bottom:50px">
                  </div>
			<form action="user_forgetpw.do" method="post" id="form">
				<div class="row" style="width: 60%; margin: 0px auto">
					<label class="col-sm-4 control-label" for="email">새 암호</label>
					<div class="col-sm-8">
					<input type="hidden" name="mb_id"  id="mb_id"/>
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
			else if($('#nowpw').val() == $('#mb_pw').val()){alert('기존에 사용하던 암호로는 변경이 불가능합니다');return null}
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
			
		 $('#next-2').on('click',function(e) {
			 var id = $('#id').val();
			 
			 if(id == ""){alert("아이디를 입력해주세요"); return null}
			 
			 $.post('ajax_idcheck.do',{"id":id},function(ret){
				if(ret == 1){
					$('#mb_id').val(id);
			      	$('ul.setup-panel li:eq(1)').removeClass('disabled');
		            $('ul.setup-panel li a[href="#step-2"]').trigger('click');
			      }
				else if(ret == 0){
		      		 alert('해당 아이디는 존재하지 않습니다');
		       		 $('#idcheck').removeClass('w3-red');
		      		 $('#idcheck').addClass('w3-green');
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
<jsp:include page="footer.jsp"></jsp:include>