<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form action="test.do" method="post" modelAttribute="vo"><br />
		<form:input type="text" path="title" placeholder="title"/><br />

		<input type="submit" class="btn btn-success" value="가입"/>
	</form:form>
</body>
</html>