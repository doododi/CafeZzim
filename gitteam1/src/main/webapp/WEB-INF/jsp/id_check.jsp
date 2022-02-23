<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/id_check.css" rel="stylesheet" />
</head>
<body>
<div id='id_check'>
	<form name='frm_id_check' method='post'>
		<label>아이디</label>
		<input type='text' name='checkId' value='${param.checkId }'/>
		<input type='submit' value='아이디체크'/>
		<br/>
		<output id='id_check_result'></output>	
	</form>
</div>
</body>
</html>