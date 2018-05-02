<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<body>
<script src="resources/js/jquery-1.11.1.js"></script>
<script src="resources/js/sweetalert.min.js"></script>
<script>
	$(function(){
		swal({
			title: "${title}",
			text: "${message}",
			icon: "success",
			button: "확인"
		}).then((value)=>{
			if(value){
				window.location.href='${url}';
			}
		});	
	});
</script>
</body>
</html>