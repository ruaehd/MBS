<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>답글작성</title>
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/w3.css"/>
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
						<input style="width:400px" type="text" class="form-control" value="${vo.rsv_cmt_point}" readonly/>
					</div>
					<div class="form-inline" style="margin-bottom:10px">
						<label style="width:100px">작성자</label>
						<input style="width:400px" type="text" class="form-control" value="${vo.rsv_cmt_writer}" readonly/>
					</div>
					<div class="form-inline" style="margin-bottom:10px">
						<label style="width:100px">리뷰내용</label>
						<div class="form-group con" style="width:350px;">
							${fn:replace(vo.rsv_cmt_content, cn, br)}
						</div>
					</div>
					<div class="form-inline" style="margin-bottom:10px">
						<label style="width:100px">리뷰답글</label>
						<form:textarea style="width:400px; resize:none" path="rep_content" rows="6" class="form-control" onkeyup="fnChkByte(this)"></form:textarea>
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
	<script src="resources/js/readmore.min.js"></script>
	<script>
		$(function() {
			
			$('.con').readmore({
				blockCSS: 'display: inline-block;',
				speed: 75,
				collapsedHeight: 110,
				moreLink: '<a href="#"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>펼치기</a>',
				lessLink: '<a href="#"><span class="glyphicon glyphicon-triangle-top" aria-hidden="true"></span>접기</a>'
			});
			
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
		
		function fnChkByte(obj) {
		    var maxByte = 500;
		    var str = obj.value;
		    var str_len = str.length;
		 
		    var rbyte = 0;
		    var rlen = 0;
		    var one_char = "";
		    var str2 = "";
		 
		    for (var i = 0; i < str_len; i++) {
		        one_char = str.charAt(i);
		 
		        if (escape(one_char).length > 4) {
		            rbyte += 2;
		        } else {
		            rbyte++;
		        }
		 
		        if (rbyte <= maxByte) {
		            rlen = i + 1;
		        }
		    }
		 
		    if (rbyte > maxByte) {
		        alert("최대 한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자 까지 작성 가능합니다.");
		        str2 = str.substr(0, rlen);
		        obj.value = str2;
		        fnChkByte(obj, maxByte);
		    } else {
		        document.getElementById('byteInfo').innerText = rbyte;
		    }
		}
	</script>

</body>
</html>