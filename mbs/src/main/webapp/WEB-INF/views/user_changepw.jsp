<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<style>

</style>

   <div style="margin-top:68px">
   <form role="form">
  <div class="w3-border w3-round" style="width:600px; margin:100px auto 20px auto">
  <div class="panel-body">
  <div class="form-group">
    <label for="exampleInputEmail1">기존 암호</label>
    <input type="password" class="form-control" placeholder="기존 암호를 입력해주세요">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">새 암호</label> <a href="#" class="pull-right">비밀번호를 잊으셨습니까?</a>
    <input type="password" class="form-control" placeholder="새 암호를 입력하세요">
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">새 암호 재입력</label>
    <input type="password" class="form-control" placeholder="새 암호를 다시 입력하세요">
  </div>
  
  </div>
</div>
<div align="center">
<button type="submit" class="btn btn-default">변경하기</button>
</div>
</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>