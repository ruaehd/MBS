<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<div style="margin-top:68px">
	<div class="container" style="width:60%; margin:0px auto">
		<div class="w3-display-container" style="width:100%; height:300px">
			<div class="w3-display-middle">
				<h1>공지사항</h1>
			</div>
			<div class="w3-display-bottomright" style="margin-right:10px">
				<a href="user_custcenter_main.do">고객센터</a>
			</div>
		</div>
		<table class="w3-table w3-bordered" style="margin-top:20px">
			<c:forEach var="vo" items="${list}">			
				<tr style="height:50px;padding:10px;">
					<td style="width:90%;vertical-align:middle"><a href="notice_content.do?ntc_no=${vo.ntc_no}">${vo.ntc_title}</a></td>
					<td style="vertical-align:middle">${vo.ntc_date}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>