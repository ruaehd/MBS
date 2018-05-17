<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
	</head>
<body>
	<div class="row" style="margin-top: 68px; border-bottom: 1px solid #cccccc; width: 100%">
		<jsp:include page="v1_header.jsp"></jsp:include>
		<div class="col-md-9"
			style="border-right: 1px solid #cccccc; padding: 10px">
			<div class="w3-round" id="imgcon" style="border: 1px solid #cccccc; width: 100%; height: 300px;white-space:nowrap;overflow-x:auto;overflow-y:hidden">
				<h3>현재 예약중인 항목</h3>
					<c:if test="${empty rlist}">
					<div style="margin-top:80px">
						<h1  style="margin-left:200px">예약중인 항목이 존재하지 않습니다.</h1>
						</div>
					</c:if>
					<c:if test="${!empty rlist}">
					<c:forEach items="${rlist}" var="rvo"	>
							<div class="w3-white w3-round-xlarge"
								style="padding: 10px; width: 200px; height: 220px; border: 1px solid #cccccc; margin-right:20px;display:inline-block">
								<div style="width: 100%; height: 140px; border: 1px solid #cccccc">
								<a href="usr_rsv_content.do?rsv_no=${rvo.rsv_no}&str_number=${rvo.str_number}" id="img">
								<img src="getBlobImg.do?no=${rvo.str_number}" style="width:100%;height:100%"/>
								</a>
								</div>
								<p align="center">${rvo.str_name}</p>
								 <p align="center"><font class="day">${rvo.rsv_day}</font><font color="blue" style="margin-left:10px">${rvo.rsv_personnel}명 </font></p>
						</div>
					</c:forEach>
					</c:if>
				</div>
			<div style="padding:10px">
			<h3>문의 내역</h3>
			<c:if test="${empty qlist}">
					<div style="margin-top:80px;height:400px">
						<h1 style="margin-left:100px;">내가 문의한 항목이 존재하지 않습니다</h1>
							<div style="margin-top:50px">
								<a href="qna.do" style="margin-left:350px"><button class="btn btn-default">문의하러 가기</button></a>
							</div>
						</div>
					</c:if>
			<c:if test="${!empty qlist}">
			<c:forEach items="${qlist}" var="qvo">
			<div class="form-inline" style="padding:20px;height:80px;margin:0px 30px">
				<div class="form-group" style="width:100%">
				<div class="row">
					<div class="col-md-10">
						<p style="color:red;float:left;width:90px" class="openval">${qvo.qst_open}</p>
						<p><b><a href="user_question" style="color:black">${qvo.qst_title}</a></b>
						<font color="gray" style="font-size:10px;">[문의번호:${qvo.qst_no}]</font></p>
					</div>
					<div class="col-md-2" align="right" style="vertical-align:bottom"><p style="font-size:12px;color:gray;">${qvo.qst_date}<p></div>
				</div>
					<p>${qvo.qst_content}</p> 
				</div>
			</div>
			<div style="width:95%; height:5px; margin:5px 30px; border-bottom:1px solid #aaaaaa"></div>
			</c:forEach>
			<div style="width:100%;margin-top:50px" align="right">
				<button class="btn btn-default" id="allque">문의내역 모두보기</button>
			</div>
			</c:if>
			</div>
			
		</div>
		<div class="col-md-3" style="padding: 10px">
			<div class="w3-border w3-round-xlarge" style="width:100%;border:1px solid #cccccc;padding:10px;height:300px;" align="center">
				<div style="margin-top:15px">
					<h4><b>사용자 정보 </b></h4>
					<div style="width:90%; height:5px; margin-bottom:5px; border-bottom:1px solid #aaaaaa"></div>
					<p>${mvo.mb_id}</p>
					<div style="width:90%; height:5px; margin-bottom:5px; border-bottom:1px solid #aaaaaa"></div>
					<p id="mbbir">${mvo.mb_birth}</p>
					<div style="width:90%; height:5px; margin-bottom:5px; border-bottom:1px solid #aaaaaa"></div>
					<p id="mbtel">${mvo.mb_tel}</p>
					<div style="width:90%; height:5px; margin-bottom:5px; border-bottom:1px solid #aaaaaa"></div>
					<p>${mvo.mb_email}</p>
					<div style="width:90%; height:5px; margin-bottom:5px; border-bottom:1px solid #aaaaaa"></div>
					<div align="center"  style="margin-top:20px" >
						<a href="user_edit.do"><button class="w3-button w3-small w3-border w3-white w3-round">회원정보 수정</button></a>
						<a href="user_changepw.do"><button class="w3-button w3-small w3-border w3-white w3-round">비밀번호 변경</button></a>
					</div>
				</div>
			</div>
			<div align="center" style="padding:30px; margin-top:50px">
				<div class="row" style="margin:0px auto">
			<table class="w3-table" style="margin:25px 0px;height:200px">
				<tr style="border-bottom:1px solid #cccccc; width:200px;height:30px">
					<th>공지</th>
					<th style="width:40px"></th>
					<th style="width:40px" align="right"><a href="notice.do">+</a></th>
				</tr>
				<c:forEach var="nvo" items="${nlist}">
					<tr>
						<td><a href="notice_content.do?ntc_no=${nvo.ntc_no}">${nvo.ntc_title}</a></td>
						<td colspan="2" align="right"><font color="gray" style="font-size:10px">${nvo.ntc_date}</font></td>
					</tr>
				</c:forEach>
			</table>
			<table class="w3-table" style="margin:25px 0px;height:200px">
				<tr style="border-bottom:1px solid #cccccc; width:200px;height:30px">
					<th>진행중인 이벤트</th>
					<th style="width:60px"></th>
					<th style="width:40px" align="right"><a href="event.do">+</a></th>
				</tr>
				<c:forEach var="evo" items="${elist}">
					<tr>
						<td><a href="event_content.do?evt_no=${evo.evt_no}">${evo.evt_title}</a></td>
						<td colspan="2" align="right">
							<font color="gray" style="font-size:10px">${evo.evt_endtime}까지</font>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
			</div>
		</div>
	</div>

        	<div class="modal fade" id="questionlist">
				<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<div class="row">
									<div class="col-md-4">
									<font class="modal-title">문의내역</font>
									</div>
									<div align="right" class="form-group" style="margin-right:10px">
									<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
									</div>
								</div>
							</div>
							<div class="modal-body" id="questionbody">
								
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>       	
        	</div>
        	<jsp:include page="v1_footer.jsp"></jsp:include>
   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
	$(function(){
		var rlist = new Array();
		<c:forEach items="${rlist}" var="vo">
			var json = new Object();
			json.rsv_day="${vo.rsv_day}";
			rlist.push(json);
		</c:forEach>
		
		$('#allque').click(function(){
			$.post('ajax_memberquestion.do',{mb_id:'${sessionScope.Mem_Id}'},function(list){
				for(var i=0;i<list.length;i++){
					if(list[i].qst_open == 0){
						var open = '<p style="color:red;float:left;width:70px">열람안함</p>';
					}
					if(list[i].qst_open == 1){
						var open = '<p style="color:green;float:left;width:70px">답변완료</p>';
					}
				$('#questionbody').append(
						'<div class="form-inline" style="padding:20px;height:80px;margin:0px 30px">'+
							'<div class="form-group" style="width:100%">'+
							'<div class="row">'+
								'<div class="col-md-9">'+open+''+
									'<b><a href="user_question" style="color:black">'+list[i].qst_title+'</a></b>'+
									'<font color="gray" style="font-size:10px;">[문의번호:'+list[i].qst_no+']</font>'+
								'</div>'+
								'<div class="col-md-3" align="right" style="vertical-align:bottom"><p style="font-size:12px;color:gray">'+list[i].qst_date+'</div>'+
							'</div>'+
								'<p>'+list[i].qst_content+'</p>'+
							'</div>'+
						'</div>'+
						'<div style="width:90%; height:5px; margin:5px 30px; border-bottom:1px solid #aaaaaa"></div>'
				);
				}
			});
			$('#questionlist').modal('show');
		});
		
		var len = $('.openval').length;
		for(var i=0;i<len;i++){
		if($('.openval').eq(i).text() == 0){
			$('.openval').eq(i).css("color","red");
			$('.openval').eq(i).text("[열람안함]");
		}
		else if($('.openval').eq(i).text() == 1){
			$('.openval').eq(i).css("color","green");
			$('.openval').eq(i).text("[문의완료]");
		}
		}
		var mb_bir = $('#mbbir').text();
		var biry = mb_bir.substring(0,4);
		var birm = mb_bir.substring(5,7);
		var bird = mb_bir.substring(8,10);
		
		$('#mbbir').text(biry+"년 "+birm+"월 "+bird+"일");
		var mb_tel = $('#mbtel').text();
		if(mb_tel.length == 10){
			var tel1 = mb_tel.substring(0,3);
			var tel2 = mb_tel.substring(3,6);
			var tel3 = mb_tel.substring(6,10);
			$('#mbtel').text(tel1+'-'+tel2+'-'+tel3);
		}
		if(mb_tel.length == 11){
			var tel1 = mb_tel.substring(0,3);
			var tel2 = mb_tel.substring(3,7);
			var tel3 = mb_tel.substring(7,11);
			$('#mbtel').text(tel1+'-'+tel2+'-'+tel3);
		}
		for(var j=0;j<rlist.length;j++){
			var day =rlist[j].rsv_day;
			$('.day').text(day.toString().substring(0, 13)+"시");
		}
	});
</script>
