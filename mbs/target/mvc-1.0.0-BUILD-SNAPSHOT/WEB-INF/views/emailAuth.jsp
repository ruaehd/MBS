<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 본인 인증</title>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
</head>
<body>
	<div style="padding:25px 20px 25px 40px; width:400px; margin:0">
		<h4>인증번호 입력</h4>
		<hr />
		<div>
			<form method="post" name="authenform" onSubmit="return check();">
				<div align="center">
					<label style="width:100px;">인증번호</label>
					<input style="width:200px; display: inline-block;" type="text" class="form-control" name="authnum">
				</div>
				<hr />
				<div align="center">
					<input type="submit" class="btn btn-info" value="인증번호 입력">
				</div>
			</form>
		</div>
	</div>
	<script src="resources/js/jquery-1.11.1.js"></script>
	<script>
	function check(){
		var form = document.authenform;
		var authNum = ${authNum};
		
		if (!form.authnum.value){
			alert("인증번호를 입력하세요");
			return false;
		}
		if(form.authnum.value!=authNum){
			alert("틀린 인증번호 입니다. 인증번호를 다시 입력해주세요");
			form.authnum.value="";
			return false;
		}
		if(form.authnum.value==authNum){
			alert("인증완료");
			opener.document.auth.emailauth.value="인증완료";
			window.close();
		}
	}
	</script>
</body>
</html>