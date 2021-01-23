<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>門市新增</title>
</head>
<body>
第一步

門市名稱    24hr Y/N (Ajax送出資料 切換頁面)
地區        開店時間
地址        關店時間

電話
FAX

第二步

請輸入門市簡介
(若無輸入直接用Company的)(Ajax)

第三步

請輸入服務項目
()


<div id="page">

<form:form method='POST' modelAttribute="Store" >
			<c:if test='${Store.id != null}'>
                 <form:hidden path="id" /><br>&nbsp;
			</c:if>
			<fieldset class="fieldset-auto-width">
				<legend>客戶資料</legend>
				<table>
					<tr>
						<td align='right'>門市名稱：<br>&nbsp;</td>
						<td><form:input path="storeName" /><br>&nbsp;
<!-- 							<form:errors path="name" cssClass="error" /> -->
						</td>
						<td align='right'>24hr Y/N：<br>&nbsp;</td>
						<td><form:input path="businessHour" /><br>&nbsp;
						</td>
					</tr>
					<tr>
						<td align='right'>地區：<br>&nbsp;</td>
						<td><form:input path="storeArea" /><br>&nbsp;
<!-- 						    <form:errors path="password" cssClass="error" /> -->
						</td>
						<td align='right'>開店時間：<br>&nbsp;</td>
						<td><form:input path="openhour" /><br>&nbsp;
						</td>
						
						
					</tr>
					<tr>
						<td align='right'>地址：<br>&nbsp;</td>
						<td><form:input path="storeAddress" /><br>&nbsp;
<!-- 						    <form:errors path="password1" cssClass="error" /> -->
						</td>
						<td align='right'>關店時間：<br>&nbsp;</td>
						<td><form:input path="closehour" /><br>&nbsp;
						</td>
						
						
					</tr>
					<tr>
						<td align='right'>電話：<br>&nbsp;</td>
						<td><form:input path="phone" /><br>&nbsp;
<!-- 						    <form:errors path="email" cssClass="error" /> -->
						</td>
					</tr>
					<tr>
						<td align='right'>Fex<font size='-3' color='blue'>(yyyy-MM-dd)</font>：<br>&nbsp;
						</td>
						<td><form:input path="fex" /><br>&nbsp;
<!-- 						    <form:errors path="birthday" cssClass="error" /> -->
						</td>
					</tr>
					
				
					
					<tr>
						<td colspan='2' align='center'>
						<input type='submit' value='提交'></td>
					</tr>
				</table>
			</fieldset>
		</form:form>



選擇器，事件，功能

$("input[name='']").


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<table>
<tr>
<td>
門市名稱
</td>
<td>
 24hr Y/N
</td>
</tr>


<tr>
<td>
地區
</td>
<td>
開店時間
</td>
</tr>


<tr>
<td>
地址
</td>
<td>
 關店時間
</td>
</tr>

<tr>
<td>
電話
</td>
</tr>

<tr>
<td>
Fax
</td>
</tr>


</table>





</div>






</body>
</html>