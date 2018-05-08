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
	<div id="wrapper" style="width:600px; margin:0 auto">
		<form:form action="write_reply.do" modelAttribute="rvo" method="post">	
			<div style="padding:20px 0">
				<h3>답변 작성</h3>
				<hr />
				<div class="form-inline">				
					<form:input type="hidden" path="rsv_cmt_no" value="${vo.rsv_cmt_no}"/>
					<div class="form-inline" style="margin-bottom:10px">
						<label style="width:100px">평점</label>
						<input style="width:300px" type="text" class="form-control" value="${vo.rsv_cmt_point}" readonly/>
					</div>
					<div class="form-inline" style="margin-bottom:10px">
						<label style="width:100px">작성자</label>
						<input style="width:300px" type="text" class="form-control" value="${vo.rsv_cmt_writer}" readonly/>
					</div>
					<div class="form-inline" style="margin-bottom:10px">
						<label style="width:100px">리뷰내용</label>
						<input style="width:300px" type="text" class="form-control" value="${vo.rsv_cmt_content}" readonly/>
					</div>
					<div class="form-inline" style="margin-bottom:10px">
						<label style="width:100px">리뷰답글</label>
						<form:textarea style="width:300px; resize:none" path="rep_content" rows="6" class="form-control" ></form:textarea>
					</div>
				</div>
				<hr />
				<div class="form-inline" align="center" style="margin-bottom:20px">
					<input type="submit" class="btn btn-success" value="답변 작성"/>
					<input type="button" class="btn btn-default" id="btn_cancel" value="작성 취소"/>
					
				</div>
			</div>
		</form:form>
	
	</div>
	
	
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.raty.js"></script>
	<script>
		$(function() {
			$(".star_rating a").click(function() {
			     $(this).parent().children("a").removeClass("on");
			     $(this).addClass("on").prevAll("a").addClass("on");
			     var str =$('.on').length;
			     console.log(str);
			     $('#rating').val(str);
			     return false;
			});
			
			$('#btn_cancel').click(function() {
				close();
			});
	    });
	</script>

</body>
</html>