<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<div style="margin-top: 68px">
	<div class="container" style="width:80%; marign:0px auto">
	<div align="center" style="width:100%;">
		<img src="resources/imgs/sou.jpg" style="width: 150px"><br/>
		<font style="font-size:40px">비밀번호 변경</font>
		</div>
		<div class="row w3-border w3-round" style="width:100%; margin-top:20px">
			<form method="post" action="pwchange.do">
				<div class="col-md-9" style="padding:30px;" align="center">
					<table style="margin-top:20px">
						<tr>
							<td id="pw">현재 비밀번호 <br> <input type="password"
								name="password" maxlength="16" style="width:300px" class="w3-input w3-border w3-round"><br>
								<br>
							</td>
						</tr>
						<tr>
							<td id="pw1">새로하실 비밀번호 <br> <input type="password"
								name="passwordcheck" maxlength="16" style="width:300px" class="w3-input w3-border w3-round"><br>
								<br>
							</td>
						</tr>
						<tr>
							<td id="name">비밀번호 확인 <br> <input type="password"
								name="name" maxlength="16" style="width:300px" class="w3-input w3-border w3-round"><br>
								<br>
							</td>
						</tr>
					</table>
					<br>
				</div>
					<div class="col-md-3" style="border-left:1px solid #cccccc; height:100%; display:table">
						<div style="display:table-cell; vertical-align:middle; width:100%">
						<font color="red" style="font-size:20px">주의사항</font><br/>
						<p style="font-size:15px">암호 보안 수준을 위해 <br/>영문 소문자 , 숫자 , 특수문자 중 2종류를 조합하여 8 ~ 16자리로 설정해 주세요<br/></p>
						</div>
					</div>
			</form>
		</div>
			
			<div align="center" style="margin:20px auto">
					<button class="w3-button w3-black w3-round">변경하기</button>
					<button class="w3-button w3-black w3-round">취소하기</button>
			</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>