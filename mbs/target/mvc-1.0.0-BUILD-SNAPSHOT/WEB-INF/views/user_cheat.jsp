<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<div style="margin-top:68px;">
  <div class="container" style="margin:0px auto">
  	<div class="row">
  	<div class="col-md-2" style="width:80%"><h2>채팅</h2></div>
  	<div class="col-md-offset-5 col-md-3">
  	<input type="text" class="w3-input w3-border w3-round" placeholder="사용자 이름으로 검색" style="margin-top:15px"/>
  	</div>
  	<div class="col-md-2" style="margin-top:15px"><a href="#" style="margin-top:10px;"><h4>뒤로가기</h4></a></div>
  	
  	</div>
  <hr/>
  	<c:forEach begin="1" end="10">
	<div class="row w3-button" style="width: 100%;margin:0px auto">
		<div class="col-md-2">
			<img src="resources/imgs/member_back.jpg" style="width: 90px; height: 90px" />
		</div>
		<div class="col-md-10" align="left">
			<h4><b>상대방이름</b></h4>
			<p>상대방 채팅 내용</p>
		</div>
	</div>
	<hr/>
	</c:forEach>
	
  </div> 
</div>
<jsp:include page="footer.jsp"></jsp:include>