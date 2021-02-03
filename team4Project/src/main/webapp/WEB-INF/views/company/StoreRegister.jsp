<jsp:include page="../crm/backOffice.jsp" flush="true"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>門市新增</title>
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
	font-size:20px;
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


<form:form method='POST' modelAttribute="storeBean" >
			
			<c:if test='${Store.id != null}'>
                 <form:hidden path="id" />
			</c:if>
			<fieldset class="fieldset-auto-width">
				<legend><h1>&emsp;&emsp;&emsp;門市資料</h1></legend>
				<table>
					<tr>
						<td align='right'>
						<div class="block">門市名稱：</div>
						</td>
						<td>
						<div class="block"><form:input id="stoname" path="storeName"  type="text" /></div>
						</td>
<!-- 						<td align='right'>24hr Y/N：</td> -->
						<td>
						<div class="block">
<%-- 							<form:select path="businessHour" id="openallday"> --%>
<%-- 							<form:option value="1">24hr</form:option> --%>
<%-- 							<form:option value="0">其他</form:option> --%>
<%-- 							</form:select> --%>
							<form:radiobutton  path = "businessHour" value = "1" label = "24hr" id="openallday"/>
                			<form:radiobutton  path = "businessHour" value = "0" label = "請輸入營業時間" id="inputtime" checked="checked"/>
						</div>
						</td>
					</tr>
					<tr>
						<td align='right'>
					<div class="block">地區：</div>
						</td>
						<td>
						<div class="block">
							<form:select id="area" path="storeArea"  type="text" >
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
						<form:input id="add" path="storeAddress"  type="text"/>
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
						<form:input id="pho" path="phone"  type="text" />
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
						<form:input id="fe" path="fex"  type="text" />
<%-- 						 <form:hidden path="company" value="${sessionScope.company}"/> --%>
						</div>
						</td>
					</tr>
					<tr>
						<td colspan='2' align='center'>
						
						</td>
					</tr>
				</table>
				<div class="block">
						<input type='submit' value='提交'>
						</div>
			</fieldset>
		</form:form>
<%-- <a href="<c:url value='/company/ShowStore'/> " >回門市管理頁</a> --%>
<button id="insert">一鍵輸入</button>
</div>
</div>
<script >
$("#insert").click(function(){
	$("#stoname").val("和平梨山店")
	$("#area").val("中區")
	$("#openallday").attr("checked", true);
	$("#add").val("台中市和平區中正路88號")
	$("#pho").val("0425980098")
	$("#fe").val("0425980098")
	$(".opentime").hide();
})
/////////////////////////////////////////////////
$("#openallday").click(function () {
	$(".opentime").hide();
});
/////////////////////////////////////////////////
$("#inputtime").click(function () {
	$(".opentime").show();
});

</script>
</body>
</html>