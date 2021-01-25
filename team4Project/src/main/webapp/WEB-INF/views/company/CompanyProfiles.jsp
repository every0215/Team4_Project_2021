<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改企業簡介</title>
</head>
<body>
<fieldset>
	<legend >企業簡介</legend> 
	
		<form action="<c:url value='/company/updateCompanyProfile'/>" method="post" enctype="multipart/form-data">
<%-- 		<input type="hidden" name="cmpid" value="${sessionScope.company.id}"> --%>
		<input type="hidden" name="id" value="${sessionScope.company.id}">
	<table style="border:1px solid #64A600;border-radius:10px;padding:10px">
	<tr>
		<td >

			<div style="padding:5px">
			企業簡介:<br/>
			<textarea rows="4" cols="50" placeholder="請輸入簡介" name="profiles" >${sessionScope.company.profiles}</textarea>
			</div>
			<div style="background-color:yellow">
			${resp}
			</div>
			
	
		</td>
	
	</tr>
</table>
				<hr/>
			<input type="submit" value="送出"/>
			<input type="reset" value="delete"/>
	
			</form>
</fieldset>
<a href="<c:url value='/crm/backOffice'/> " >回企業管理頁</a>
</body>
</html>