<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<div class="side-menu" style="overflow: auto">
	<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<div class="brand-wrapper">
				<button type="button" class="navbar-toggle">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> <span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<div class="brand-name-wrapper">
					<a class="navbar-brand" href="#"> 관리자 페이지 </a>
				</div>
			</div>
		</div>
		<div class="side-menu-container">
			<ul class="nav navbar-nav">
				<li class="panel panel-default" id="dropdown">
					<a data-toggle="collapse" href="#dropdown-lvl1"> 
						<span class="glyphicon glyphicon-send"></span> 회원관리
					</a>
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
					<a data-toggle="collapse" href="#dropdown-lvl3"> 
						<span class="glyphicon glyphicon-cloud"></span> 컨텐츠관리
					</a>
				</li>
				<li class="panel panel-default" id="dropdown">
					<a data-toggle="collapse" href="#dropdown-lvl4"> 
						<span class="glyphicon glyphicon-user"></span> 고객센터관리
						<span class="caret"></span>
					</a>
					<div id="dropdown-lvl4" class="panel-collapse collapse">
						<div class="panel-body">
							<ul class="nav navbar-nav">
								<li><a href="#">공지</a></li>
								<li><a href="#">이벤트</a></li>
								<li><a href="#">1:1문의</a></li>
								<li><a href="#">자주하는질문</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li class="panel panel-default" id="dropdown">
					<a data-toggle="collapse" href="#dropdown-lvl5"> 
						<span class="glyphicon glyphicon-signal"></span>통계
					</a>
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
