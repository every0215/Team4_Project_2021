<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>企業資料更新</title>
<style>
select option[value="-1"] {
 display: none;
}
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
<body style="background-color: #ECF0F5;">
<jsp:include page="../crm/backOffice.jsp" flush="true"></jsp:include>	
	<div class="rep_reportarea">
		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper" align="center">
		<fieldset>
	<legend ><h1>企業資料</h1></legend> 
	
		<form action="<c:url value='/company/updateCompany'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="status" value="true">
		<input type="hidden" name="id" value="${sessionScope.company.id}">
	<table style="border-radius:10px;padding-top:10px">
	<tr>
		<td >
		
<!-- 			企業編號:<input type="text" name="companyId" /><br/> -->
<!-- 			<!-- 	設流水號 -->
			<div style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
			企業名稱:<input type="text" name="companyName"  autocomplete="off" required="required" value="${sessionScope.company.companyName}"/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
			統一編號:<input type="text" name="uniformNumbers" required="required" value="${sessionScope.company.uniformNumbers}"/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
			行業類別:<select class="form-control" name="categories" required="required">
			<c:if  test="${sessionScope.company.categories == 1}">
				<option value="-1" ></option>
				<option value="1" selected>一般服務業</option>
				<option value="2">批發/零售</option>
				<option value="3">餐飲服務</option>
				<option value="4">旅遊休閒運動</option>
				<option value="5">大眾傳播</option>
			</c:if>
			<c:if  test="${sessionScope.company.categories == 2}">
				<option value="-1" ></option>
				<option value="1">一般服務業</option>
				<option value="2" selected>批發/零售</option>
				<option value="3">餐飲服務</option>
				<option value="4">旅遊休閒運動</option>
				<option value="5">大眾傳播</option>
			</c:if>
			<c:if  test="${sessionScope.company.categories == 3}">
				<option value="-1" ></option>
				<option value="1">一般服務業</option>
				<option value="2">批發/零售</option>
				<option value="3" selected>餐飲服務</option>
				<option value="4">旅遊休閒運動</option>
				<option value="5">大眾傳播</option>
			</c:if>
			<c:if  test="${sessionScope.company.categories == 4}">
				<option value="-1" ></option>
				<option value="1">一般服務業</option>
				<option value="2">批發/零售</option>
				<option value="3">餐飲服務</option>
				<option value="4" selected>旅遊休閒運動</option>
				<option value="5">大眾傳播</option>
			</c:if>
			<c:if  test="${sessionScope.company.categories == 5}">
				<option value="-1" ></option>
				<option value="1">一般服務業</option>
				<option value="2">批發/零售</option>
				<option value="3">餐飲服務</option>
				<option value="4">旅遊休閒運動</option>
				<option value="5" selected>大眾傳播</option>
			</c:if>
				
			</select>
			
			</div>
			<!-- 	radio用選的 -->
			<div style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
			&emsp;&emsp;帳號:<input type="text" name="account" autocomplete="off" required="required" value="${sessionScope.company.account}" disabled="disabled"/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
			&emsp;&emsp;密碼:<input type="password" name="password" autocomplete="off" required="required" value="${sessionScope.company.password}"/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
			&emsp;&emsp;信箱:<input type="text" name="email" autocomplete="off" required="required" value="${sessionScope.company.email}"/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
			公司電話:<input type="text" name="phone" required="required" value="${sessionScope.company.phone}"/><br/>
			</div>
			<!-- 	驗證 -->
	
		</td>
		<td style="border-radius:10px;padding-top:10px">
<!-- 			放圖片 -->
			<div style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
			品牌圖示:	
			<input type="file" name="logoA" /><br>
			<!-- 	上傳檔案 -->
			</div>
			<div style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
<!-- 			放圖片 -->
			營業登記證:<input type="file" name="busRCA" /><br>
			<!-- 	上傳檔案 -->
			</div>
			<hr/>
		</td>
	</tr>
</table>
				<hr/>
			<input type="submit" value="修改"/>
			
	
			</form>
</fieldset>


	</div>
	</div>

</body>
</html>