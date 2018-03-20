<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.min.css" />
</head>
<body>
	<form action="test.do" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label class="col-sm-4 control-label" for="menu">사진</label>
			<div class="col-sm-5">
				<div class="buttons">
					<div class="form-inline" style="margin-bottom: 5px">
						<input type="file" class="form-control" name="aaa[]"> 
						<input type="button" class="btnAdd btn btn-success" value="추가">
					</div>
				</div>
			</div>
		</div>
		<input type="submit" value="전송" />
	</form>

	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script>
	
		$(document).ready (function () {
	    	var aaa = [];
	
	        $('.btnAdd').click (function () {
	        	if(aaa.length<5){
	        		$('.buttons').append (                        
	                        '<div class="form-inline del" style="margin-bottom:5px">' +
	                        	'<input type="file" class="form-control" name="aaa[]"> ' +
	                        	'<input type="button" class="btnRemove btn btn-danger" value="삭제"> ' +
	                        '</div>'
	                    );
	        		
	        		aaa = $('input[name="aaa[]"').toArray();
	        	}
	        	else{
	            	alert("최대 5개까지 추가 가능합니다.");
	            	return false;
	        	}
	        	
	             // end append                            
	            $('.btnRemove').on('click', function () { 
	                $(this).parent().remove (); //
	                aaa.splice($(this),1);
	            });
	        }); // end click                                            
	    }); // end ready  
	</script>
</body>
</html>