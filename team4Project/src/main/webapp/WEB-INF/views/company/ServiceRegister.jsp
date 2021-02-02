<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service Register</title>
<style>
.main-header .navbar-custom-menu, .main-header .navbar-right {
	height:500px;
	}
body{
	background-color: #ECF0F5;
	}
</style>
</head>
<body>
<fieldset>
	<legend >企業服務</legend> 
	
<form action="<c:url value='serviceRegister'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="CompanyId" value="${sessionScope.company.id}">
	<table style="border:1px solid #64A600;border-radius:10px;padding:10px">
	<tr>
	</tr>
	<tr>
		<td style="border:1px solid #64A600;border-radius:10px;padding:10px">
	
			服務圖示:<input type="file" name="ServiceP" value=""/><br>
			<!-- 	上傳檔案 -->
			名稱:<input type="text" name="Ser" value=""/><br>
			<!-- 	上傳檔案 -->
			<hr/>

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