<jsp:include page="../crm/backOffice.jsp" flush="true"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改企業簡介</title>
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
	<legend ><h1>企業簡介</h1></legend> 
	
		<form action="<c:url value='/company/updateCompanyProfile'/>" method="post" enctype="multipart/form-data">
<%-- 		<input type="hidden" name="cmpid" value="${sessionScope.company.id}"> --%>
		<input type="hidden" name="id" value="${sessionScope.company.id}">
	<table style="border:1px solid #64A600;border-radius:10px;padding:10px">
	<tr>
		<td >

			<div style="padding:5px">
			企業簡介:<br/>
			<textarea id="tex" rows="10" cols="80" placeholder="請輸入簡介" name="profiles" >${sessionScope.company.profiles}</textarea>
			</div>
			<div style="background-color:yellow">
			${resp}
			</div>
			
	
		</td>
	
	</tr>
</table>
				<hr/>
			<input type="submit" value="送出"/>
			<input type="reset" value="重新編輯"/>
	
			</form>
</fieldset>
<button id="insert">一鍵輸入</button>
</div>
</div>
<script>
$("#insert").click(function(){
	$("#tex").val("民國七十七年九月豐群企業集團在台灣同時開幕了三家OK，從此展開了 「OK超商」在台灣發展的序幕。豐群企業集團是由知名的企業家張國安 先生所創立，他秉持「豐富人群」的理想，將企業取名為「豐群」。")
	
})
</script>
</body>
</html>