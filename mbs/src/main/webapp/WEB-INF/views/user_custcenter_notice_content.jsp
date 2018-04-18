<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<div style="margin-top:68px">
	<div class="container" style="width:60%; margin:0px auto">
		<div class="w3-display-container" style="width:100%; height:200px">
			<div class="w3-display-middle">
				<h1>공지사항</h1>
			</div>
		</div>
		<div class="form-inline">
			<div class="form-group" style="width:90%">
				<h4><b>${vo.ntc_title}</b></h4>
			</div>
			<div class="form-group">
				${vo.ntc_date}
			</div>
		</div>
		<hr/>
		<div style="font-size:12px">
		${vo.ntc_content}
		</div>
		<table class="w3-table w3-bordered" style="width:100%;border-top:1px solid #cccccc;border-bottom:1px solid #cccccc;margin-top:20px">
			<tr>
				<td style="width:10%;font-size:12px;vertical-align:middle">이전글</td>
				<td style="vertical-align:middle"><a href="notice_content.do?ntc_no=${pno}">${pvo.ntc_content}</a></td>
			</tr>
			<tr>
				<td style="width:10%;font-size:12px;vertical-align:middle">다음글</td>
				<td style="vertical-align:middle"><a href="notice_content.do?ntc_no=${nno}">${nvo.ntc_content}</a></td>
			</tr>
			
		</table>
		<div align="right" style="margin-top:20px">
			<c:if test="${pno == 0}">
			<a href="#"><input type="button" class="w3-button w3-round-xlarge w3-border" style="width:100px" value="이전글" disabled/></a>
			</c:if>
			<c:if test="${pno != 0}">
			<a href="notice_content.do?ntc_no=${pno}"><input type="button" class="w3-button w3-round-xlarge w3-border" style="width:100px" value="이전글"/></a>
			</c:if>
			<c:if test="${nno != 0}">
			<a href="notice_content.do?ntc_no=${nno}"><input type="button" class="w3-button w3-round-xlarge w3-border" style="width:100px" value="다음글"/></a>
			</c:if>
			<c:if test="${nno == 0}">
			<a href="#"><input type="button" class="w3-button w3-round-xlarge w3-border" style="width:100px" value="다음글" disabled/></a>
			</c:if>
			<a href="notice.do"><input type="button" class="w3-button w3-round-xlarge w3-border" style="width:100px" value="목록"/></a>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>