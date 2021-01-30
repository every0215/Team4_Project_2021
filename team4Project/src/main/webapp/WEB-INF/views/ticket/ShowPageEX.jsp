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
<tr><td>售票期間</td> <td>${exhibition.onSaleDate.toString().substring(0, 19)} ~ ${exhibition.offSaleDate.toString().substring(0, 19)}</td></tr>
<tr><td>展出期間 </td> <td>${exhibition.commDate} ~ ${exhibition.dueDate}</td></tr>
<tr><td>展覽介紹</td> <td>${exhibition.description}</td></tr>
<tr><td>優惠信用卡</td> <td>${creditCard.cardName}</td></tr>
<tr><td>優惠信用卡折扣</td> <td>${exhibition.discountRatio}</td></tr>
</table>
<br>
<img height="300px" src="<c:url value='/geteventimage/${event.id}'/>" style="display:block; margin:auto;"/>
<br>
<table style="margin: auto;width: 800px;border:3px #cccccc solid;" cellpadding="10" border='1'>
<tr><td>票券名稱</td> <c:forEach var="price" items="${priceList}"><td>${price.name}</td></c:forEach></tr>
<tr><td>票券價格</td> <c:forEach var="price" items="${priceList}"><td>${price.cost}</td></c:forEach></tr>
</table>
<c:choose>
               	 <c:when test="${event.status==1}">
               	 	<button id="statusButton" class="deleteBtn btn btn-success" onclick="location.href = '<c:url value="/EventUpdateStatus/${event.id}" />'">下架</button>
               	 </c:when>       	 
               	 <c:otherwise>
               	 	<button id="statusButton" class="deleteBtn btn btn-success" onclick="location.href = '<c:url value="/EventUpdateStatus/${event.id}" />'">上架</button>
               	 </c:otherwise>
            </c:choose>

<button id="updateButton" class="btn btn-success" onclick="location.href = '<c:url value="/EventUpdate/${event.id}" />'">修改</button>
<button id="deleteButton" class="btn btn-danger" onclick="location.href = '<c:url value="/EventDel/${event.id}" />'">刪除</button>
<a href="<c:url value='/TicketIndex'/>" class="btn btn-info" role="button">回主頁</a>


<script>
let unbindFunction = (checkTime) => {
    return () => {
        clearInterval(checkTime);
    }
}


let buttonDUdisabe = () => {
    let nowDate = new Date();
    console.log('現在時間'+nowDate);
    
    let period = $("table tr:nth-child(6) td:last-child").html();
    console.log(period);
    let onSaleStr = period.substring(0,19);
    let offSaleStr = period.substring(22,41);
    
    let onSaleDate = new Date(Date.parse(onSaleStr.replace('-','/')));
    let offSaleDate = new Date(Date.parse(offSaleStr.replace('-','/')));
         
         if ( Date.parse(onSaleDate) < Date.parse(nowDate)){
        	 
             $('#updateButton').attr('disabled', true)
             $('#deleteButton').attr('disabled', true)
             
              console.log("更新與刪除Button變為disable");
         
         }else{
             console.log("Session比系統目前時間大");
         }
         
		if ( Date.parse(offSaleDate) < Date.parse(nowDate)){
        	 
			$('#statusButton').attr('disabled', true)
             
              console.log("上下架Button變為disable");
         
         }else{
             console.log("Session比系統目前時間大");
         }
         
         
    
    
}


$( function() {    
    
	buttonDUdisabe();
    
    let checkTime =  window.setInterval(buttonDUdisabe, 10000);

    $(window).bind('beforeunload',unbindFunction(checkTime));

})




</script>



</body>
</html>