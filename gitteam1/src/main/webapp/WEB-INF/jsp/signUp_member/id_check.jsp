<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/id_check.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="js/id_check.js"></script>
</head>
<body>
<div id="id_check">
	<form name="frm_id_check" method="post" id="frm_id_check">
		<label>아이디</label>
		<input type="text" name="checkId" id="checkId" value="${param.checkId }"/>
		<input type="submit" value="아이디체크" id="btncheckId" name="btncheckId"/>
		<br/>
		<output id="id_check_result">${msg }</output>	
	</form>
</div>
</body>
</html>