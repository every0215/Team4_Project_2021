<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table style="margin: auto;width: 800px;border:3px #cccccc solid;" cellpadding="10" border='1'>
<th colspan='6' style="text-align:center;">票券一覽表</th>
<tr>
<td>序號</td>
<td>票券類別</td>
<td>名稱</td>
<td>
	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-geo-alt" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M12.166 8.94C12.696 7.867 13 6.862 13 6A5 5 0 0 0 3 6c0 .862.305 1.867.834 2.94.524 1.062 1.234 2.12 1.96 3.07A31.481 31.481 0 0 0 8 14.58l.208-.22a31.493 31.493 0 0 0 1.998-2.35c.726-.95 1.436-2.008 1.96-3.07zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
  <path fill-rule="evenodd" d="M8 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
</svg>
展覽地點</td>

<td>照片</td>
<td>公司代號</td>


</tr>
<c:forEach var="event" items="${events}">
<tr>
<td>${event.id}</td>
<td>${event.typeId}</td>
<td>${event.eventName}</td>
<td>${event.eventLocation}</td>
<td>${event.eventImage}</td>
<td>${event.companyId}</td>
<td>
<form action="<c:url value='/ticket/InputPage'/>" method="post">
	<input type="hidden" name="typeId" value="${event.typeId}"/>
	<input type="hidden" name="companyId" value="1"/>
	<input type="hidden" name="eventId" value="${event.id}"/>
<input type="submit" class="btn btn-success" name="submit" value="See More">
<a onclick="return del(this)" href="${pageContext.request.contextPath }/emp/${emp.employeeId }">刪除</a>
              <a href="update/${emp.employeeId }">修改</a>
</form>
</td>
</tr>
</c:forEach>



</body>
</html>