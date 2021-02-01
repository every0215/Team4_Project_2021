<jsp:include page="../crm/backOffice.jsp" flush="true"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>企業服務登錄</title>
<style >
.rep_reportarea {
	background-color: transparent;
	position: absolute;
	width: calc(100vw - 15px);
	height: calc(100vh - 80px);
	bottom: 0px;
	right: 0px;
	font-family:微軟正黑體;
	font-weight:900;
}
</style>
</head>
<body>
<div class="rep_reportarea">
		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper">
<fieldset>
	<legend >企業服務登錄</legend> 
		<div style="background-color:yellow">
			${respsv}
			</div>
		<form action="<c:url value='/company/serviceRegister'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="CompanyId" value="${sessionScope.company.id}">
	<table style="border:1px solid #64A600;border-radius:10px;padding:10px">
	<tr>
		<td >
			<div style="padding:5px">
			服務名稱:<input type="text" name="Ser"  autocomplete="off" required="required" value=""/><br/>
			</div>
		</td>
		<td style="border:1px solid #64A600;border-radius:10px;padding:10px">
	
			服務圖示:	<input type="file" name="ServiceP" value=""/><br>

		</td>
	</tr>
	</table>
				<hr/>
			<input type="submit" value="登錄"/>
			<input type="reset" value="delete"/>
	
		</form>
</fieldset>
</div>
</div>


</body>
</html>