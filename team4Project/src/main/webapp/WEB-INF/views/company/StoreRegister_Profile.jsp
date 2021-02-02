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
	font-size:18px;
	
	
}
.main-header .navbar-custom-menu, .main-header .navbar-right {
	height:500px;
	}
body{
	background-color: #ECF0F5;
	}
</style>
</head>
<body>
<div class="rep_reportarea">
		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper" align="center">
<fieldset>
	<legend ><h1>門市簡介</h1></legend> 
	
		<form action="<c:url value='/company/updateStoreProfiles'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="cmpid" value="${sessionScope.company.id}">
		<input type="hidden" name="id" value="${storeBean.id}">
	<table style="border:1px solid #64A600;border-radius:10px;padding:10px">
	<tr>
		<td >

			<div style="padding:5px">
			門市簡介:<br/>
			<textarea rows="10" cols="80" placeholder="請輸入簡介(不輸入預設企業簡介)" name="profiles"></textarea>
			</div>

	
		</td>
	
	</tr>
</table>
				<hr/>
			<input type="submit" value="送出"/>
			<input type="reset" value="重新編輯"/>
	
			</form>
</fieldset>
<%-- <a href="<c:url value='/company/ShowStore'/> " >回門市管理頁</a> --%>
</div>
</div>
</body>
</html>