<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<div class="row"
	style="margin-top: 68px; border-bottom: 1px solid #cccccc; width: 100%">

	<div class="col-md-9"
		style="border-right: 1px solid #cccccc; padding: 10px">
		<div class="container w3-light-gray w3-round"
			style="border: 1px solid #cccccc; width: 100%; height: 210px;">
			<h3>현재 예약중인 항목</h3>
			<div class="form-inline">
				<c:forEach begin="1" end="5">
					<div class="form-group">
						<div class="w3-white w3-round"
							style="padding: 10px; width: 120px; height: 120px; border: 1px solid #cccccc; margin-right: 20px">
							<div style="width: 100%; height: 80px; border: 1px solid #cccccc">
							<a href="user_content.do">
								<img src="resources/imgs/12.JPG"
									style="width: 100%; height: 100%" />
									</a>
							</div>
							<p align="center">8월01일/14:00</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="container" style="padding:10px">
		<h3>내게 온 메세지</h3>
		<c:forEach begin="1" end="5">
		<div class="form-inline" style="padding:20px;height:80px;margin:0px 30px">
			<div class="form-group" style="width:8.25%">
				<img src="resources/imgs/member_back.jpg" class="w3-round-xlarge" style="width:50px ; height:50px"/>
			</div>
			<div class="form-group" style="width:61.75%">
			<div class="w3-row" style="widrh:61.75%">
				<div class="w3-col" style="width:100px"><p><b>상대방 이름</b></p></div>
				<div class="w3-rest" align="right"><p style="font-size:12px">17/01/01 14:00<p></div>
				</div>
				<p>상대방이 입력한 내용을 여기에 표시 , 상대방이 채팅을 쳤을시 ajax 이용하여 변화 주어야 함</p>
			</div>
		</div>
		<div style="width:70%; height:5px; margin:5px 30px; border-bottom:1px solid #aaaaaa"></div>
		</c:forEach>
		</div>
		<div style="width:90%" align="right">
			<a href="user_cheat.do"><button class="btn btn-default">채팅 모두보기</button></a>
		</div>
	</div>
	<div class="col-md-3" style="padding: 10px">
		<div class="container w3-round w3-light-gray" style="width:100%;border:1px solid #cccccc;padding:10px" align="center">
			<div class="w3-round-xlarge"  style="width:200px; height:200px;border:1px solid #cccccc;">
				<img class="w3-round-xlarge" src="resources/imgs/member_back.jpg" style="width:100%; height:100%"/>
			</div> 
			<div style="margin-top:15px">
				<h4><b>사용자이름</b></h4>
				<div style="width:100%; height:5px; margin:5px 0px; border-bottom:1px solid #aaaaaa"></div>
				<p>abcd1234</p>
				<div style="width:100%; height:5px; margin:5px 0px; border-bottom:1px solid #aaaaaa"></div>
				<p>부산광역시 해운대구 가나다라 101번지 101호 (50121)</p>
				<div style="width:100%; height:5px; margin:5px 0px; border-bottom:1px solid #aaaaaa"></div>
				<p>010-1234-5678</p>
				<div style="width:100%; height:5px; margin:5px 0px; border-bottom:1px solid #aaaaaa"></div>
				<p>abcd1234@naver.com</p>
				<div style="width:100%; height:5px; margin:5px 0px; border-bottom:1px solid #aaaaaa"></div>
				<div align="center" >
					<a href="#"><button style="margin-top:10px" class="w3-button w3-border w3-white w3-round">회원정보 수정하기</button></a>
				</div>
			</div>
		</div>
		<div align="center" style="padding:30px; margin-top:50px">
		<div style="margin-bottom:30px">
		<a href="user_custcenter_notice.do"><input type="button" class="btn btn-default btn-lg" style="width:250px" value="공지 보기"/></a>
		</div>
		<a href="user_custcenter_event.do"><input type="button" class="btn btn-default btn-lg" style="width:250px" value="현재 진행중인 이벤트 보기"/></a>
		</div>
	</div>
</div>
<div class="container">
	<div class="row" style="margin:50px auto">
		<div class="col-md-offset-1 col-md-10">
			<div class="w3-border row" style="padding:20px">
				<div class="col-md-offset-1 col-md-2"><a href="#"><b>문의 n건</b></a></div>
				<div class="col-md-offset-1 col-md-2"><a href="#"><b>후기 n건</b></a></div>
				<div class="col-md-offset-1 col-md-2"><a href="#"><b>1:1상담 n건</b></a></div>
				<div class="col-md-offset-1 col-md-2"><a href="#"><b>관심항목 n건</b></a></div>
			</div>
		</div>
	</div>
	<div class="row" style="margin:50px auto">
	<div class="col-md-offset-1 col-md-5">
		<table class="w3-table" style="margin:25px 0px">
		<tr style="border-bottom:1px solid #cccccc; width:200px">
				<th>문의내역</th>
				<th style="width:30px" align="right"><a href="#">+</a></th>
			</tr>
			<tr>
				<td>현재 진행준인 문의가 없습니다</td>
			</tr>
		</table>
		
		<table class="w3-table" style="margin:25px 0px">
			<tr style="border-bottom:1px solid #cccccc; width:200px">
				<th>1:1상담 내역</th>
				<th style="width:30px" align="right"><a href="#">+</a></th>
			</tr>
			<tr>
				<td>현재 진행중인 상담이 없습니다</td>
			</tr>
		</table>
	</div>
	<div class="col-md-5">
		<table class="w3-table" style="margin:25px 0px">
			<tr style="border-bottom:1px solid #cccccc; width:200px">
				<th>후기내역</th>
				<th style="width:30px" align="right"><a href="#">+</a></th>
			</tr>
			<tr>
				<td>후기가 없습니다</td>
			</tr>
		</table>
		
		<table class="w3-table" style="margin:25px 0px">
			<tr style="border-bottom:1px solid #cccccc; width:200px">
				<th>관심항목</th>
				<th style="width:30px" align="right"><a href="#">+</a></th>
			</tr>
			<tr>
				<td>관심항목이 없습니다</td>
			</tr>
		</table>
	</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>