<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<jsp:include page="header.jsp"></jsp:include>
   <script src="//code.jquery.com/jquery-1.10.2.js"></script>

	<div class="container" style="margin-top: 150px; min-height: 300px">
		<div class="row form-group">
			<div align="center" style="margin-bottom: 50px">
				<h1 style="font-size: 56px">
					<b>회웝가입을 축하드립니다 !</b>
				</h1>
				<br />
				<h2>
					해당 아이디를 바로 사용하실수도
					<br />사업자로 전환하여 업체를 등록하실수도 있습니다 !
				</h2>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-offset-1 col-md-5">
			<a href="user_login.do" style="text-decoration:none"><button type="button" class="btn btn-info btn-lg btn-block" style="height:50vh"><h1>바로 둘러보기</h1></button></a>
		</div>
		<div class="col-md-5">
			<a href="biz_join.do" style="text-decoration:none"><button type="button" class="btn btn-primary btn-lg btn-block" style="height:50vh"><h1>사업체 등록하기</h1></button></a>
		</div>
 	</div>
 <script src="resources/js/jquery-3.2.1.min.js"></script>
   <script src="resources/js/bootstrap.min.js"></script>
   <script>
   
   </script>
<jsp:include page="footer.jsp"></jsp:include>