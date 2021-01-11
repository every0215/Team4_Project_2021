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
<form>
<h2>您輸入的資訊:</h2><br>

<input type="hidden" name="typeId" value="${event.typeId}"/>
<table style="margin: auto;width: 800px;border:3px #cccccc solid;" cellpadding="10" border='1'>
<tr><td>序號</td> <td>${event.id}</td></tr>
<tr><td>種類</td> <td>${event.typeId}</td></tr>
<tr><td>名稱</td> <td>${event.eventName}</td></tr>
<tr><td>地點</td> <td>${event.eventLocation}</td></tr>
<tr><td>售票期間</td> <td>${exhibition.onSaleDate} ~ ${exhibition.offSaleDate}</td></tr>
<tr><td>展出期間 </td> <td>${exhibition.commDate} ~ ${exhibition.dueDate}</td></tr>
<tr><td>展覽介紹</td> <td>${exhibition.description}</td></tr>
<tr><td>優惠信用卡代碼</td> <td>${exhibition.cardId}</td></tr>
<tr><td>優惠信用卡折扣</td> <td>${exhibition.discountRatio}</td></tr>
</table>
<br><br>

<img alt="" src="" id="img" width="400px;"><br>

<table style="margin: auto;width: 800px;border:3px #cccccc solid;" cellpadding="10" border='1'>
<tr><td>票券名稱</td> <c:forEach var="price" items="${priceList}"><td>${price.name}</td></c:forEach></tr>
<tr><td>票券價格</td> <c:forEach var="price" items="${priceList}"><td>${price.cost}</td></c:forEach></tr>
</table>


<input type="submit" name="sumbmit" value="修改">
</form>
<a href="../TicketIndex" class="btn btn-success" role="button">查詢所有票券</a>	
</body>
</html>