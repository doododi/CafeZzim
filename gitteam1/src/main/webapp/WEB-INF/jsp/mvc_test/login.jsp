<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>

<h1>Spring MVC test</h1>
<form name="frm" method="post" action="/mvc_test/login_result">
	<label>ID</label>
	<input type="text" name="mid" value="hong"/>
	<br>
	<label>PW</label>
	<input type="password" name="pwd" value="1111" />
	<br>
	<input type="submit" value="전송">
</form>

</body>
</html>