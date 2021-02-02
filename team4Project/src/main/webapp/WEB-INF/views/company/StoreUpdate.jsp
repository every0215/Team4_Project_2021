<jsp:include page="../crm/backOffice.jsp" flush="true"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>門市修改</title>
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
.block{
	margin-right:20px;
	margin-left:10px;
	margin-bottom:20px;

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


<form:form method='POST' modelAttribute="storeBean"  action="${pageContext.request.contextPath}/company/updateStore" >
			
			<c:if test='${Store.id != null}'>
			</c:if>
                 <form:hidden path="id" />
						<fieldset class="fieldset-auto-width">
				<legend><h1>門市資料</h1></legend>
				<table>
					<tr>
						<td align='right'>
						<div class="block">門市名稱：</div>
						</td>
						<td>
						<div class="block"><form:input path="storeName"  type="text" /></div>
						</td>
<!-- 						<td align='right'>24hr Y/N：</td> -->
						<td>
						<div class="block">
<%-- 							<form:select path="businessHour" id="openallday"> --%>
<%-- 							<form:option value="1">24hr</form:option> --%>
<%-- 							<form:option value="0">其他</form:option> --%>
<%-- 							</form:select> --%>
							<form:radiobutton path = "businessHour" value = "1" label = "24hr" id="openallday"/>
                			<form:radiobutton path = "businessHour" value = "0" label = "請輸入營業時間" id="inputtime" />
						</div>
						</td>
					</tr>
					<tr>
						<td align='right'>
					<div class="block">地區：</div>
						</td>
						<td>
						<div class="block">
							<form:select path="storeArea"  type="text" >
							<form:option value="北區">北區</form:option>
							<form:option value="中區">中區</form:option>
							<form:option value="南區">南區</form:option>
							</form:select>
						</div>
						</td>
						<td align='justify' class="opentime" >
						<div class="block">開店時間：
						<form:input path="openhour"  type="time" class="opentime" />
						</div>
						</td>
						<td>

						
					</tr>
					<tr>
						<td align='right' >
						<div class="block">地址：</div>
						</td>
						<td>
						<div class="block">
						<form:input path="storeAddress"  type="text"/>
						</div>
						</td>
						<td align='justify' class="opentime">
						<div class="block">關店時間：
						<form:input path="closehour"  type="time" class="opentime"/>
						</div>
						</td>

						
					</tr>
					<tr>
						<td align='right'>
						<div class="block">電話：</div>
						</td>
						<td>
						<div class="block">
						<form:input path="phone"  type="text" />
						</div>
						</td>
						<td align='justify'>
						<div class="block">上下架狀態：
						
						<form:radiobutton path = "status" value = "True" label = "上架"/>
                		<form:radiobutton path = "status" value = "False" label = "下架" />
						
						
						</div>
						</td>

					</tr>
					<tr>
						<td align='right'>
						<div class="block">
						Fex<font size='-3' color='blue'></font>：
						</div>
						</td>
						<td>
						<div class="block">
						<form:input path="fex"  type="text" />
<%-- 						 <form:hidden path="company" value="${sessionScope.company}"/> --%>
						</div>
						</td>
					</tr>
					<tr>
						<td colspan='3' align='center'>
						<div class="block">
						<div style="padding:0px">
							門市簡介:<br/>
						<form:textarea rows="4" cols="70" placeholder="請輸入簡介(不輸入預設企業簡介)" path="profiles"></form:textarea>
						</div>
						<p align="right">
						<input type='submit' value='提交'>
						</p>
						</div>
						</td>
					</tr>
				</table>
			</fieldset>
			
		</form:form>
<button type="button" style="height:40px;width:100px;margin-top:10px"><a href="<c:url value='/company/ShowStore'/>" style="font-size:18px">回上頁</a></button>

<%-- <a href="<c:url value='/company/ShowStore'/> " >回門市管理頁</a> --%>
</div>
</div>
<script >
$(document).ready(function(){
	if($("#openallday").attr("checked")){
		$(".opentime").hide();
		$(".opentime").attr("disabled", true);
	}
})
/////////////////////////////////////////////////
$("#openallday").click(function () {
	$(".opentime").hide();
	$(".opentime").attr("disabled", true);
});
/////////////////////////////////////////////////
$("#inputtime").click(function () {
	$(".opentime").show();
	$(".opentime").attr("disabled", false);
});

</script>
</body>
</html>