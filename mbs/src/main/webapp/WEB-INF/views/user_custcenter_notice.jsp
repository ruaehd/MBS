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
			<c:forEach begin="1" end="10">
				<tr style="height:50px;padding:10px;">
					<td style="width:90%;vertical-align:middle"><a href="user_custcenter_notice_content.do">홈페이지 점검 안내</a></td>
					<td style="vertical-align:middle">2018.01.01</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>