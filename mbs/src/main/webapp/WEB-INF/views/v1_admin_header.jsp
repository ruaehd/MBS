<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
<!DOCTYPE html>
<div class="side-menu" style="overflow: auto">
	<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<div class="brand-wrapper">
				<button type="button" class="navbar-toggle">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span>
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<div class="brand-name-wrapper">
					<a class="navbar-brand" href="admin_user.do"> 관리자 페이지 </a>
				<c:if test="${sessionScope.Mem_Id ne null}">
					<a class="navbar-brand" href="user_logout.do"style="margin-left:50px">로그아웃</a>
				</c:if>
				</div>
			</div>
		</div>
		<div class="side-menu-container">
			<ul class="nav navbar-nav">
         		<li class="panel panel-default" id="dropdown">
	                <a data-toggle="collapse" href="#dropdown-lvl1">
	                   <span class="glyphicon glyphicon-send"></span> 회원관리<span class="caret"></span>
	                </a>
	                 <div id="dropdown-lvl1" class="panel-collapse collapse">
	                    <div class="panel-body">
	                        <ul class="nav navbar-nav">
	                            <li><a href="admin_user.do">회원목록</a></li>
	                            <li><a href="admin_reportuser.do">차단회원관리</a></li>
	                        </ul>
	                    </div>
	                </div>
            	</li>
         
         		<li class="panel panel-default" id="dropdown">
					<a data-toggle="collapse" href="#dropdown-lvl2"> 
						<span class="glyphicon glyphicon-plane"></span> 예약관리
						<span class="caret"></span>
					</a>
					<div id="dropdown-lvl2" class="panel-collapse collapse">
						<div class="panel-body">
							<ul class="nav navbar-nav">
								<li><a href="admin_rsv_management.do">예약관리</a></li>
								<li><a href="admin_rev_management.do">리뷰관리</a></li>
							</ul>
						</div>
					</div>
				</li>
            	<li class="panel panel-default" id="dropdown">
	                <a data-toggle="collapse" href="#dropdown-lvl5">
	                    <span class="glyphicon glyphicon-user"></span> 고객센터관리<span class="caret"></span>
	                </a>
	                <div id="dropdown-lvl5" class="panel-collapse collapse">
	                    <div class="panel-body">
	                        <ul class="nav navbar-nav">
	                            <li><a href="admin_notice.do">공지</a></li>
	                            <li><a href="admin_event.do">이벤트</a></li>
	                            <li><a href="admin_qna.do">1:1문의</a></li>
	                             <li><a href="admin_fna.do">자주하는질문</a></li>
	                        </ul>
	                    </div>
	                </div>
	            </li>
           		<li class="panel panel-default" id="dropdown">
	                <a data-toggle="collapse" href="#dropdown-lvl6">
	                      <span class="glyphicon glyphicon-signal"></span>통계<span class="caret"></span>
	                </a>
	                <div id="dropdown-lvl6" class="panel-collapse collapse">
	                    <div class="panel-body">
	                        <ul class="nav navbar-nav">
	                            <li><a href="admin_memberchart.do">회원통계</a></li>
	                            <li><a href="admin_storechart.do">업체통계</a></li>
	                            <li><a href="admin_reservationchart.do">예약통계</a></li>
	                        </ul>
	                    </div>
	                </div>
	            </li>
        	</ul>
		</div>
	</nav>
</div>

<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$('.navbar-toggle').click(function() {
			$('.navbar-nav').toggleClass('slide-in');
			$('.side-body').toggleClass('body-slide-in');
			$('#search').removeClass('in').addClass('collapse').slideUp(200);
		});
		$('#search-trigger').click(function() {
			$('.navbar-nav').removeClass('slide-in');
			$('.side-body').removeClass('body-slide-in');
		});
	});
</script>
