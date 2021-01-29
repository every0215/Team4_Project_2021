<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Event Show Page</title>
</head>
<body>
<div class="jumbotron text-center">
  <h1>E-Ticket票券系統</h1>
</div>

<h2>您輸入的資訊:</h2><br>

<table style="margin: auto;width: 800px;border:3px #cccccc solid;" cellpadding="10" border='1'>
<tr><td>序號</td> <td>${event.id}</td></tr>
<tr><td>種類</td> <td>${eventType.typeName}</td></tr>
<tr><td>名稱</td> <td>${event.eventName}</td></tr>
<tr><td>地點</td> <td>${event.eventLocation}</td></tr>
<tr><td>狀態</td> <td><c:choose>
               	 <c:when test="${event.status==1}">上架
               	 </c:when>
               	 
               	 <c:otherwise>下架</c:otherwise>
                 </c:choose></td></tr>
<tr><td>售票期間</td> <td>${attraction.onSaleDate.toString().substring(0, 19)} ~ ${attraction.offSaleDate.toString().substring(0, 19)}</td></tr>
<tr><td>展出期間 </td> <td>${attraction.commDate} ~ ${attraction.dueDate}</td></tr>
<tr><td>展覽介紹</td> <td>${attraction.description}</td></tr>
</table>
<br>
<img height="300px" src="<c:url value='/geteventimage/${event.id}'/>" style="display:block; margin:auto;"/>
<br>
<table style="margin: auto;width: 800px;border:3px #cccccc solid;" cellpadding="10" border='1'>
<tr><td>票券名稱</td> <c:forEach var="price" items="${priceList}"><td>${price.name}</td></c:forEach></tr>
<tr><td>票券價格</td> <c:forEach var="price" items="${priceList}"><td>${price.cost}</td></c:forEach></tr>
</table>


<a href="<c:url value='/EventUpdate/${event.id}'/>" class="btn btn-success" role="button">修改</a>	
<a href="<c:url value='/EventDel/${event.id}'/>" class="btn btn-danger" role="button">刪除</a>	
<a href="<c:url value='/TicketIndex'/>" class="btn btn-info" role="button">回主頁</a>
<!-- //超連結都是get -->
</body>
</html>