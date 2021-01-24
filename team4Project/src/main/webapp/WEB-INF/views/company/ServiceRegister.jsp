<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service Register</title>
</head>
<body>
企業服務 新增頁
<fieldset>
	<legend >註冊企業資料</legend> 
	<h1>我是沒登入</h1>
<form action="<c:url value='XXX'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="CompanyId" value="${company.id}">
	<table style="border:1px solid #64A600;border-radius:10px;padding:10px">
	<tr>
	</tr>
	<tr>
		<td style="border:1px solid #64A600;border-radius:10px;padding:10px">
	
			服務圖示:<input type="file" name="ServiceP" value=""/><br>
			<!-- 	上傳檔案 -->
			名稱:<input type="file" name="Ser" value=""/><br>
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