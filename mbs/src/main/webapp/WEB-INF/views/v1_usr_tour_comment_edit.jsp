<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>Google Nexus Website Menu</title>
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" type="text/css" href="resources/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/component.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/w3.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/jquery-ui-timepicker-addon.css" />
	<style>
		.star_rating {
			font-size:0; letter-spacing:-4px;
		}
		.star_rating a {
		    font-size:22px;
		    letter-spacing:0;
		    display:inline-block;
		    margin-left:5px;
		    color:#ccc;
		    text-decoration:none;
		}
		.star_rating a:first-child {
			margin-left:0;
		}
		.star_rating a.on {
			color:#777;
		}
	</style>
</head>
<body>
	<div id="wrapper" >
		<form:form action="usr_tour_comment_edit.do" modelAttribute="vo" method="post">
			<div class="container" style="padding:20px">
				<h3>한줄평 작성</h3>
				<hr />
				<div class="form-inline" style="margin-bottom:20px">
					<label style="width:100px">관광지 명</label>
					${vo.str_name}
					<form:input type="hidden" path="str_number" />
					<form:input type="hidden" path="tour_cmt_no" />
				</div>
				<div class="form-inline" style="margin-bottom:20px">
					<label style="width:100px">사용일</label>
					<form:input type="text" class="form-control" path="tour_cmt_day" id="date1"/>
				</div>
				<div class="form-inline" style="margin-bottom:20px">
					<div class="form-group">
						<label style="width:100px">예약 평가</label>
				        <p style="display:inline-block" class="star_rating">
						    <c:forEach begin="1" end="${vo.tour_cmt_point}">
						    	<a href="#" class="on">★</a>
						    </c:forEach>
						    <c:forEach begin="1" end="${5-vo.tour_cmt_point}">
						    	<a href="#">★</a>
						    </c:forEach>
						</p>
						<form:input type="hidden" id="rating" path="tour_cmt_point" value="1"/>
					</div>
				</div>
				<div class="form-inline" style="margin-bottom:20px">
					<div class="form-group">
						<label style="width:100px">후기 작성</label>
						<form:textarea rows="3" path="tour_cmt_content" style="resize:none; width:400px"></form:textarea>
					</div>
				</div>
				<hr />
				<div class="form-inline" align="center">
					<input type="submit" class="btn btn-success" value="후기 수정" />
					<a href="usr_tour_comment_delete.do?tour_cmt_no=${vo.tour_cmt_no}" class="btn btn-danger">후기 삭제</a>
					<input type="button" class="btn btn-default" value="작성 취소"/>
				</div>
			</div>
		</form:form>
	
	</div>
	
	
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script src="resources/js/jquery-ui-timepicker-addon.js"></script>
	<script>
	$(function() {
		var maxDate = new Date();
		
		$("#date1").datetimepicker({
			dateFormat:'yy-mm-dd',
			monthNamesShort:[ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
	        dayNamesMin:[ '일', '월', '화', '수', '목', '금', '토' ],
	        maxDate : maxDate,
	        showTime : false,
	        showTimepicker : false
		});
	
		$( ".star_rating a" ).click(function() {
		     $(this).parent().children("a").removeClass("on");
		     $(this).addClass("on").prevAll("a").addClass("on");
		     var str =$('.on').length;
		     console.log(str);
		     $('#rating').val(str);
		     return false;
		});
		
	});
	</script>

</body>
</html>