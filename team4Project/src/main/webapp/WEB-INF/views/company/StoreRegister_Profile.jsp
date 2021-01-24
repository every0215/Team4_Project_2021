<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改簡介</title>
</head>
<body>
<fieldset>
	<legend >門市簡介</legend> 
	
		<form action="<c:url value='updateStoreProfile'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="status" value="true">
	<table style="border:1px solid #64A600;border-radius:10px;padding:10px">
	<tr>
		<td >

			<div style="padding:5px">
			門市簡介:<input type="text" name="companyName" placeholder="請輸入簡介(不輸入預設企業簡介)" autocomplete="off" required="required" value=""/><br/>
			</div>

	
		</td>
	
	</tr>
</table>
				<hr/>
			<input type="submit" value="send"/>
			<input type="reset" value="delete"/>
	
			</form>
</fieldset>
</body>
</html>