<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>門市新增</title>
</head>
<body>



<form:form method='POST' modelAttribute="storeBean" >
			
			<c:if test='${Store.id != null}'>
                 <form:hidden path="id" />
			</c:if>
			<fieldset class="fieldset-auto-width">
				<legend>門市資料</legend>
				<table>
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
					</tr>
					<tr>
						<td align='right'>Fex<font size='-3' color='blue'>(yyyy-MM-dd)</font>：
						</td>
						<td><form:input path="fex"  type="text" />
						 <form:hidden path="companyId" value="${company.id}"/>
						</td>
					</tr>
					
				
					
					<tr>
						<td colspan='2' align='center'>
						<input type='submit' value='提交'></td>
					</tr>
				</table>
			</fieldset>
		</form:form>

<a href="<c:url value='/ShowStore'/> " >回門市管理頁</a>

</body>
</html>