<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<div style="margin-top:68px">  
      <div class="container" style="width:60%">
       <h2><b>로그인</b></h2>
    	  <div class="row">
             <form action="user_member_login.do"  method="POST">
               <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-user"></i></span>
                  <input type="text" class="form-control" name="username" placeholder="아이디를 입력하세요">
               </div>
               <span class="help-block"></span>
                              
               <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                  <input  type="password" class="form-control" name="password" placeholder="암호를 입력하세요">
               </div>
                    <span class="help-block">비밀번호가 틀립니다</span>

               <button class="btn btn-primary btn-block" type="submit">로그인</button>
            </form>
         </div>
       
      <div class="row" style="width:100%">
      	<div class="col-md-4">
      		<label class="checkbox">
      			<input type="checkbox" value="forget-password"/>
      			아이디/ 암호 저장하기
      		</label>
      	</div>
      	<div class="col-md-offset-4 col-md-4" align="right">
      		<a href="#" style="font-size:12px">비밀번호를 잊으셨습니까?</a>
      	</div>
      </div>   
      </div>    
   </div>
<jsp:include page="footer.jsp"></jsp:include>