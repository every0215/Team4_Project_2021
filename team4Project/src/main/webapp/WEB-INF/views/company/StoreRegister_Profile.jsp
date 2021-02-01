<jsp:include page="../crm/backOffice.jsp" flush="true"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改簡介</title>
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
	<legend >門市簡介</legend> 
	
		<form action="<c:url value='/company/updateStoreProfiles'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="cmpid" value="${sessionScope.company.id}">
		<input type="hidden" name="id" value="${storeBean.id}">
	<table style="border:1px solid #64A600;border-radius:10px;padding:10px">
	<tr>
		<td >

			<div style="padding:5px">
			門市簡介:<br/>
			<textarea rows="4" cols="50" placeholder="請輸入簡介(不輸入預設企業簡介)" name="profiles"></textarea>
			</div>

	
		</td>
	
	</tr>
</table>
				<hr/>
			<input type="submit" value="send"/>
			<input type="reset" value="delete"/>
	
			</form>
</fieldset>
<a href="<c:url value='/company/ShowStore'/> " >回門市管理頁</a>
</div>
</div>
</body>
</html>