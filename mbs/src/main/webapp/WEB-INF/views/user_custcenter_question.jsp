<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
<jsp:include page="header.jsp"></jsp:include>
<div style="margin-top:68px">
	<div class="container" style="width:80%; margin:0px auto" align="center" >
		<div class="w3-display-container" style="width:100%; height:200px">
			<div class="w3-display-middle" align="center">
				<h1>1:1문의</h1>
				궁금하신 점을 물어보시거나 개선해야 할 점을 알려주시면 <br/>성심성의껏 답변해드립니다.
			</div>
		</div>
		<form:form action="qna.do" method="post" modelAttribute="vo" enctype="multipart/form-data">
		<div class="w3-round" style="border:2px solid #cccccc;padding:30px; width:800px;">
		<div class="form-inline" style="margin-bottom:20px;">
			<div class="form-group" >
				<div style="width:100px">유형</div>
			</div>
			<div class="form-group">
				<form:select class="w3-select w3-border w3-round" style="width:600px" id="sel1" path="qst_code">
					<option>예약</option>
					<option>결재</option>
					<option>환불</option>
					<option>리뷰</option>
					<option>서비스</option>
					<option>기타</option>
				</form:select>
			</div>
		</div>
			<div class="form-inline">
				<div class="form-group">
				<div style="width:100px">제목</div>	
			</div>
			<div class="form-group">
				<form:input type="text" required="required" class="w3-input w3-border w3-round" placeholder="제목을 입력해주세요" path="qst_title" style="width:600px"/>
			</div>
			</div>
			
			<hr/>
			<div class="form-inline">
				<div class="form-group">
				<div  style="width:100px">글내용</div>
				</div>
			
			<div class="form-group">
				<form:textarea rows="8" class="w3-input w3-border w3-round" required="required" path="qst_content" style="resize:none;width:600px"></form:textarea>
			</div>
			</div>
			<hr/>
			<div class="form-inline">
				<div class="form-group">
				<div style="width:100px">파일첨부</div>
				</div>
			
			<div class="form-group">
				<input type="file" name="qst_img1" class="w3-input w3-round w3-border" style="width:600px" id="qna_img1" />
				<img src="resources/imgs/default.jpg" width="600px" height="180px" id="qna_img" />
			</div>
			</div>
			<form:input type="hidden" path="mb_id" value="${sessionScope.Mem_Id}" />
			<hr/>
			<div align="center">
				<input type="submit" class="w3-button w3-round w3-border" value="보내기"/>
				<a href="user_custcenter_main.do"><button class="w3-button w3-round w3-border">뒤로가기</button></a>
			</div>
			
		</div>
		</form:form>
	</div>
</div>

<script>
	$(function() {
		$('#qna_img').click(function(){
			$('#qna_img1').click();
		})
		
		$('#qna_img1').change(function(){
			//현재 파일을 img변수에 넣음
			var img = this;
			//img변수에 값이 있다면, 파일을 선택했다면
			if(img.files && img.files[0]){
				//파일을 읽기위한 객체 생성
				var reader = new FileReader();
				//파일을 읽어 들임.
				reader.onload = function(e){
					//읽은 파일을 img src태그에 넣음
					$('#qna_img').attr('src',e.target.result);
				};
				//파일의 링크를 읽음
				reader.readAsDataURL(img.files[0]);
			}
			/* else{	//파일을 선택하지 않았다면
				$('#evt_img').attr('src','resources/imgs/default.jpg');
			}  */
		});
	});
</script>
<jsp:include page="footer.jsp"></jsp:include>