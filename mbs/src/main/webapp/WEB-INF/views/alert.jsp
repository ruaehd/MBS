<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<body>
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script>
		$(function(){
			alert('${message}');
			opener.parent.location.reload();
			window.close();
		});
	</script>
</body>
</html>
