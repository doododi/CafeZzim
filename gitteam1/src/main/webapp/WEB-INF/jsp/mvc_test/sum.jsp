<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC Test sum</title>

</head>
<body>
<h1>두 수의 합</h1>
<form name="frm" method="post" action="/mvc_test/sum_result" onsubmit="return sumTest()">
	<label>x</label>
	<input type="text" name="valX"><br>
	<label>y</label>
	<input type="text" name="valY">
	<input type="submit" value="두 수의 합">
</form>
<script type="text/javascript" src="/static/js/test.js"></script>
</body>
</html>