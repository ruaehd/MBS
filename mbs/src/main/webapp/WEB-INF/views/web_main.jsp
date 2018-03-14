<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="search_panel.jsp"></jsp:include>
<div style="margin-top: 20px">
	
		<div class="row" style="width: 80%; margin: 0px auto">
			<c:forEach begin="1" end="10">
			<div class="col-md-4 w3-border" style="margin-bottom:20px;">
					<a href="user_content.do">
					<img src="resources/imgs/12.JPG" style="width:100%;height:200px"/>
					</a>
					<div class="row">
						<div class="col-md-9">
					<h4><b>음식점</b></h4>
					<p style="font-size:12px">1인 8,600원</p>
					</div>
					<div class="col-md-3" align="center">
						<img src="resources/imgs/good.png" style="width:40px; height:40px;margin-top:10px;margin-right:5px"/>
						<br/>
						<font style="font-size:10px;margin-right:10px">1,200</font>
					</div>
					<div style="margin-left:15px">
						<p style="font-size:12px">부산광역시 가나다 가나다라 12길 56</p>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	
</div>
<jsp:include page="footer.jsp"></jsp:include>