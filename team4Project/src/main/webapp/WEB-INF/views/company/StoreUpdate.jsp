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
		<div class="content-wrapper">


<form:form method='POST' modelAttribute="storeBean"  action="${pageContext.request.contextPath}/company/updateStore" >
			
			<c:if test='${Store.id != null}'>
                 <form:hidden path="id" />
			</c:if>
			<fieldset class="fieldset-auto-width">
				<legend>門市資料</legend>
				<table>
				<form:hidden path="id" />
					<tr>
						<td align='right'>門市名稱：</td>
						<td><form:input path="storeName"  type="text" /></td>
						<td align='right'>24hr Y/N：</td>
						<td><form:select path="businessHour" >
							<form:option value="1">24hr</form:option>
							<form:option value="0">其他</form:option>
							</form:select>
						</td>
					</tr>
					<tr>
						<td align='right'>地區：</td>
						<td><form:select path="storeArea"  type="text" >
							<form:option value="0">北區</form:option>
							<form:option value="1">中區</form:option>
							<form:option value="2">南區</form:option>
							</form:select>
						</td>
						<td align='right'>開店時間：</td>
						<td>
						<form:input path="openhour"  type="time" />
<!-- 						<input type="time" name="openhour" /> -->
						</td>
						
						
					</tr>
					<tr>
						<td align='right'>地址：</td>
						<td><form:input path="storeAddress"  type="text" />
						</td>
						<td align='right'>關店時間：</td>
						<td>
						<form:input path="closehour"  type="time" />
<!-- 						<input type="time" name="closehour" /> -->
						</td>
						
						
					</tr>
					<tr>
						<td align='right'>電話：</td>
						<td><form:input path="phone"  type="text" />
						</td>
						<td align='right'>上下架狀態：</td>
						<td>
<!-- 						修改狀態 -->
                 		<form:radiobutton path = "status" value = "True" label = "上架" />
                		<form:radiobutton path = "status" value = "False" label = "下架" />

						
						
<!-- 						<input type="time" name="closehour" /> -->
						</td>
					</tr>
					<tr>
						<td align='right'>Fex<font size='-3' color='blue'></font>：
						</td>
						<td><form:input path="fex"  type="text" />
<%-- 						 <form:hidden path="company" value="${sessionScope.company.id}"/> --%>
						</td>
					</tr>
					
				
					
					<tr>
						<td colspan='2' align='center'>
						<div style="padding:5px">
							門市簡介:<br/>
						<form:textarea rows="4" cols="50" placeholder="請輸入簡介(不輸入預設企業簡介)" path="profiles"></form:textarea>
						</div>
						
						<input type='submit' value='提交'></td>
					</tr>
				</table>
			</fieldset>
			
			
		</form:form>

<a href="<c:url value='/company/ShowStore'/> " >回門市管理頁</a>
</div>
</div>
</body>
</html>