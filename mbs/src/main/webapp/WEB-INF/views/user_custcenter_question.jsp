<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<div style="margin-top:68px">
	<div class="container" style="width:80%; margin:0px auto">
		<div class="w3-display-container" style="width:100%; height:200px">
			<div class="w3-display-middle" align="center">
				<h1>1:1문의</h1>
				궁금하신 점을 물어보시거나 개선해야 할 점을 알려주시면 <br/>성심성의껏 답변해드립니다.
			</div>
		</div>
		<div class="w3-round" style="border:2px solid #cccccc;padding:30px">
		<div class="form-inline" style="margin-bottom:20px">
				<div class="form-group">
				<div  style="width:100px">유형</div>
				
			</div>
			<div class="form-group">
				<select class="w3-select w3-border w3-round" style="width:100px">
					<option>예약</option>
					<option>결제</option>
					<option>환불</option>
					<option>리뷰</option>
					<option>서비스</option>
					<option>기타</option>
				</select>
			</div></div>
			<div class="form-inline">
				<div class="form-group">
				<div style="width:100px">제목</div>	
			</div>
			<div class="form-group">
				<input type="text" class="w3-input w3-border w3-round" placeholder="제목을 입력해주세요" style="width:800px"/>
			</div>
			</div>
			
			<hr/>
			<div class="form-inline">
				<div class="form-group">
				<div  style="width:100px">글내용</div>
				</div>
			
			<div class="form-group">
				<textarea rows="8" class="w3-input w3-border w3-round" style="resize:none;width:800px"  ></textarea>
			</div>
			</div>
			<hr/>
			<div class="form-inline">
				<div class="form-group">
				<div style="width:100px">파일첨부</div>
				</div>
			
			<div class="form-group">
				<input type="file" class="w3-input w3-round w3-border" style="width:600px">
			</div>
			</div>
			<hr/>
			<div align="center">
				<input type="submit" class="w3-button w3-round w3-border" value="보내기"/>
				<a href="user_custcenter_main.do"><button class="w3-button w3-round w3-border">뒤로가기</button></a>
			</div>
			
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>