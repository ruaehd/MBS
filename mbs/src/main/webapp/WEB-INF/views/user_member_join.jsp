<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<style>
.menu{
	margin-bottom:20px
}
</style>
<div style="margin-top:68px">
	<div class="container" style="width:80%;">
		<div class="w3-display-container" style="height:200px">
			<div class="w3-display-middle" align="center">
				<img src="resources/imgs/join.png" style="width:200px; height:100%"/><br/>
			</div>
		</div>
		<div class="container" style="width:80%;height:100px">
      <div class="row form-group">
         <div class="col-xs-12">
            <ul class="nav nav-pills nav-justified thumbnail setup-panel">
               <li class="active"><a href="#step-1">
                     <h4 class="list-group-item-heading">약관동의</h4>
                     <p class="list-group-item-text">First step description</p>
               </a></li>
               <li class="disabled"><a href="#step-2">
                     <h4 class="list-group-item-heading">본인확인</h4>
                     <p class="list-group-item-text">Second step description</p>
               </a></li>
               <li class="disabled"><a href="#step-3">
                     <h4 class="list-group-item-heading">개인정보</h4>
                     <p class="list-group-item-text">Third step description</p>
               </a></li>
            </ul>
         </div>
      </div>
	</div>
	<div class="row setup-content" id="step-1">
           <div class="col-xs-12">
               <div style="width:64%; margin:0px auto">
                  <h1> 회원약관</h1>
                  <div style="border:1px solid #cccccc; width:100%;margin:0px auto;margin-bottom:50px"></div>
                   <div class="wrapper" style="width:600px; margin:10px auto">
                      <div style="margin-bottom:10px">
                         <div class="row" style="margin-bottom:10px">
                            <div class="col-md-6">
                               <label>이용약관 (필수)</label>
                            </div>
                          <div class="col-md-offset-4 col-md-2">
                           <div class="form-inline" align="right">
                                  <label>동의</label>
                                  <input type="checkbox" class="form-control" style="width:25px; height:25px;"/>
                               </div>
                        </div>
                         </div>
                         <div style="margin-bottom:20px">
                            <textarea class="form-control" rows="6" style="resize:none" readonly>약관</textarea>
                         </div>
                      </div>
                      
                      <div style="margin-bottom:10px">
                         <div class="row" style="margin-bottom:10px">
                            <div class="col-md-6">
                               <label>개인정보 수집 및 이용 (필수)</label>
                            </div>
                          <div class="col-md-offset-4 col-md-2">
                           <div class="form-inline" align="right">
                                  <label>동의</label>
                                  <input type="checkbox" class="form-control" style="width:25px; height:25px;"/>
                               </div>
                        </div>
                         </div>
                         <div style="margin-bottom:20px">
                            <textarea class="form-control" rows="6" style="resize:none" readonly>약관</textarea>
                         </div>
                      </div>
                      
                      <div style="margin-bottom:10px">
                         <div class="row" style="margin-bottom:10px">
                            <div class="col-md-6">
                               <label>광고성 정보 수신 (선택)</label>
                            </div>
                          <div class="col-md-offset-4 col-md-2">
                           <div class="form-inline" align="right">
                                  <label>동의</label>
                                  <input type="checkbox" class="form-control" style="width:25px; height:25px;"/>
                               </div>
                        </div>
                         </div>
                         <div style="margin-bottom:20px">
                            <textarea class="form-control" rows="6" style="resize:none" readonly>약관</textarea>
                         </div>
                      </div>
                      <div style="border:1px solid #cccccc; width:100%;margin-bottom:20px;margin-top:50px; margin-left:auto;margin-right:auto"></div>
                         <div class="row" style="margin-bottom:10px">
                            <div class="col-md-6"></div>
                          <div class="col-md-offset-3 col-md-3">
                           <div class="form-inline" align="right" style="margin-left:25px">
                                  <label>전체동의</label>
                                  <input type="checkbox" class="form-control" style="width:25px; height:25px;"/>
                               </div>
                        </div>
                      </div>

                   </div>
                   
                   <div align="center" style="margin-bottom:20px;margin-top:50px">
                      <a href="index.do"><button class="btn btn-primary">홈으로</button></a>
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
                      <button id="prev-1" class="btn btn-primary">이전단계로</button>
                      <button id="next-3" class="btn btn-primary">다음단계로</button>
                  </div>
            </div>   
           </div>
       </div>
		
		<div  class="container setup-content" style="width:80%;padding:30px;margin:0px auto"  align="center" id="step-3">
			<div style="margin:0px auto">
				<div align="left">
	            	<h1>개인정보입력</h1>
	            </div>
	        </div>
                   <div style="border:1px solid #cccccc; width:100%;margin:0px auto;margin-bottom:50px">
                    </div>
				<div class="form-inline menu">
					<div class="form-group" style="width:100px">
						아이디
					</div>
					<div class="form-group">
						<input type="text" class="w3-input w3-round w3-border form-control" />
					</div>
					<div class="form-group" style="margin-left:20px">
						<input type="button" class="btn btn-info" value="중복확인"/>
					</div>
				</div>
				<div class="form-inline menu">
					<div class="form-group" style="width:100px">
						암호
					</div>
					<div class="form-group">
						<input type="password" class="w3-input w3-round w3-border form-control" />
					</div>
				</div>
				<div class="form-inline menu">
					<div class="form-group" style="width:100px">
						암호 재확인
					</div>
					<div class="form-group">
						<input type="password" class="w3-input w3-round w3-border form-control" />
					</div>
				</div>
				<div class="form-inline menu">
					<div class="form-group" style="width:100px">
						성별
					</div>
					<div class="form-group">
						<button class="w3-button w3-round w3-border form-control">남성</button>
						<button class="w3-button w3-round w3-border form-control">여성</button>
					</div>
				</div>
				<div class="form-inline menu">
					<div class="form-group" style="width:100px">
						생년월일
					</div>
					<div class="form-group">
						<input type="text" class="w3-input w3-round w3-border form-control" id="datepicker" />
					</div>
				</div>
				<div class="form-inline menu">
					<div class="form-group" style="width:100px">
						이메일
					</div>
					<div class="form-group">
						<input type="text" class="w3-input w3-round w3-border form-control" />
					</div>
				</div>
				<div class="form-inline menu">
					<div class="form-group" style="width:100px">
						전화번호
					</div>
					<div class="form-group">
						<input type="text" class="w3-input w3-round w3-border form-control" style="width:50px"/>-
						<input type="text" class="w3-input w3-round w3-border form-control" style="width:70px"/>-
						<input type="text" class="w3-input w3-round w3-border form-control" style="width:70px"/>
					</div>
			</div>
			<div align="center" style="margin-bottom:20px;margin-top:50px">
                  <button id="prev-2" class="btn btn-primary">이전단계로</button>
                  <a href="#"><button class="btn btn-success">가입완료</button></a>
               </div>
		</div>	
		</div>
	</div>
  <script>
      $(document).ready(function() {
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

         $('ul.setup-panel li.active a').trigger('click');

         // DEMO ONLY //
         $('#next-2').on('click',function(e) {
            $('ul.setup-panel li:eq(1)').removeClass('disabled');
            $('ul.setup-panel li a[href="#step-2"]').trigger('click');
         });
         $('#next-3').on('click',function(e) {
            $('ul.setup-panel li:eq(2)').removeClass('disabled');
            $('ul.setup-panel li a[href="#step-3"]').trigger('click');
         });
         $('#prev-1').on('click',function(e) {
            $('ul.setup-panel li a[href="#step-1"]').trigger('click');
         });
         $('#prev-2').on('click',function(e) {
            $('ul.setup-panel li a[href="#step-2"]').trigger('click');
         });
      });
  </script>
<script>
$(function(){
	

$('#datepicker').datepicker({
	dateFormat:"yy-mm-dd",
	changeYear: true,
	dayNamesMin:['일','월','화','수','목','금','토'],
	monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	showMonthAfterYear:true,
	yearRange:"c-90:c+90",
});
});
</script>
<jsp:include page="footer.jsp"></jsp:include>