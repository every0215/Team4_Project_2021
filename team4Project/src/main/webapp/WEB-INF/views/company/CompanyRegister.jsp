<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
select option[value="-1"] {
 display: none;
}
</style>
<title>企業註冊</title>
</head>
<body>
<fieldset>
	<legend >新增企業資料</legend> 
		<form action="CompanyRegister" method="post" enctype="multipart/form-data">
		<input type="hidden" name="status" value="true">
	<table style="border:1px solid #64A600;border-radius:10px;padding:10px">
	<tr>
		<td >
<!-- 			企業編號:<input type="text" name="companyId" /><br/> -->
<!-- 			<!-- 	設流水號 -->
			<div style="padding:5px">
			企業名稱:<input type="text" name="companyName"  autocomplete="off" required="required" value="歐虧"/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px">
			統一編號:<input type="text" name="uniformNumbers" required="required" value="52211110"/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px">
			行業類別:<select class="form-control" name="categories" required="required">
				<option value="-1" selected>請挑選</option>
				<option value="1">一般服務業</option>
				<option value="2">批發/零售</option>
				<option value="3">餐飲服務</option>
				<option value="4">旅遊休閒運動</option>
				<option value="5">大眾傳播</option>
			</select>
			
			</div>
			<!-- 	radio用選的 -->
			<div style="padding:5px">
			&emsp;&emsp;帳號:<input type="text" name="account" autocomplete="off" required="required" value="aaa"/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px">
			&emsp;&emsp;密碼:<input type="password" name="password" autocomplete="off" required="required" value="aaa"/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px">
			&emsp;&emsp;信箱:<input type="text" name="email" autocomplete="off" required="required" value="aaa@yahoo.com"/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px">
			公司電話:<input type="text" name="phone" required="required" value="0229983849"/><br/>
			</div>
			<!-- 	驗證 -->
	
		</td>
		<td style="border:1px solid #64A600;border-radius:10px;padding:10px">
	
			品牌圖示:	<input type="file" name="logo" /><br>
			<!-- 	上傳檔案 -->
			營業登記證:<input type="file" name="busRC" /><br>
			<!-- 	上傳檔案 -->
			<hr/>

		</td>
	</tr>
</table>
				<hr/>
			<input type="submit" value="send"/>
			<input type="reset" value="delete"/>
	
			</form>
</fieldset>
<br>
<a href="<c:url value='/views/index'/> " >回前頁</a>
<a href="<c:url value='/views/index'/>" >測試圖片顯示</a>

</body>
</html>