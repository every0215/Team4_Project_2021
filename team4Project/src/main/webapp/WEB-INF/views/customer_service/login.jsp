<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="">
<meta name="description" content="">
<title>客服系統登入</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/lbt.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cs_style.css" type="text/css" media="all" />


</head>
<body>
<!--头部开始-->

<!--头部end-->
<!--登陆区域开始-->
<div class="loginMain">


	<div class="loginArea">
    	<h2>登入頁面</h2>
        <p>客服系統</p>
        <div><span  style="font-size:14px;color:red">${wrongData}</span></div>
        <form:form action="${pageContext.request.contextPath }/cs/login"  method="post" modelAttribute="cs">
        	<form:input type="text" placeholder="請輸入帳號" value="" path="userId" class="userEnter" id="myText" />
            <form:input type="password" placeholder="請輸入密碼" path="userPassword"  class="userEnter" id="myPassword" />
            <button>登入</button>
        </form:form>
    </div>
</div>
<!--登陆区域结束-->

</body>
<script type="text/javascript">
	
	

</script>
</html>