<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<body>
<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
<script>
	$(function(){
		alert('권한이 없습니다. 로그인페이지로 이동합니다');
		window.location.href = 'user_login.do';
	});
</script>
</body>
</html>