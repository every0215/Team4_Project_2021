<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 寫顯示器頁資料的頁面 -->
<!-- 送圖片出來 -->
<img height="300px" src="<c:url value='/getimage/${cmp.account}'/>" />
</body>
</html>