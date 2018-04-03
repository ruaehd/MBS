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
	<style>
		.container{
			z-index:2;
		}
		.gn-menu-main{
			z-index:10;
		}
		
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
	<div id="wrapper">
		<form:form action="usr_rsv_comment_edit.do?cmt_no=${vo.rsv_cmt_no}" modelAttribute="vo" method="post">
		<div style="padding:20px; width:600px">
			<h3>한줄평 작성</h3>
			<hr />
			<div class="form-inline">
				<div class="form-group">
					<label style="width:100px">예약 평가</label>
			        <p style="display:inline-block" class="star_rating">
					    <c:forEach begin="1" end="${vo.rsv_cmt_point}">
					    	<a href="#" class="on">★</a>
					    </c:forEach>
					    <c:forEach begin="1" end="${5-vo.rsv_cmt_point}">
					    	<a href="#">★</a>
					    </c:forEach>
					</p>
					<form:input type="hidden" id="rating" path="rsv_cmt_point" value="${vo.rsv_cmt_point}"/>
				</div>
			</div>
			<div class="form-inline">
				<div class="form-group">
					<label style="width:100px">한줄평</label>
					<form:textarea rows="3" path="rsv_cmt_content" style="resize:none; width:400px" value="${vo.rsv_cmt_content}"></form:textarea>
				</div>
			</div>
			<hr />
			<div class="form-inline" align="center">
				<input type="submit" class="btn btn-success" value="한줄평 수정"/>
				<input type="button" class="btn btn-danger" value="수정 취소"/>
			</div>
		</div>
		</form:form>
	
	</div>
	
	
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.raty.js"></script>
	<script>
		$(function() {
	      
	    });
		$( ".star_rating a" ).click(function() {
		     $(this).parent().children("a").removeClass("on");
		     $(this).addClass("on").prevAll("a").addClass("on");
		     var str =$('.on').length;
		     console.log(str);
		     $('#rating').val(str);
		     return false;
		});
	</script>

</body>
</html>