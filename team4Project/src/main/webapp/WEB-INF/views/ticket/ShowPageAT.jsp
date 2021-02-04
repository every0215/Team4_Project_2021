<jsp:include page="../crm/backOffice.jsp" flush="true"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Event Show Page</title>
<style>

body{
				background-color: #ECF0F5;
			}
				
				.main-header .navbar-custom-menu, .main-header .navbar-right {
				height:500px;
				}
				.ticket_area{
				background-color: transparent;
				position: absolute;
				width: calc(100vw);
				height: calc(100vh - 80px);
				bottom: 0px;
				right: 0px;
				}
				


</style>


</head>
<body>
<div class="ticket_area">
		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper" style="min-height:204px">
			<!-- Content Header (Page header) -->

<br>
<div style="margin:10px auto;padding:10px;border-radius:20px;width:900px;background-color:#FDFFFF;box-shadow:3px 3px 9px #C4E1FF;">
<h1 style="text-align:center;margin-top:10px;font-weight:bolder;color:	#003D79">${event.eventName}</h1>
<table style="margin: auto;width: 800px;border:3px 	#003060 solid;background-color:#ECF5FF;text-align:center" cellpadding="10" border='1'>
<tr><td>種類</td> <td>${eventType.typeName}</td></tr>
<tr><td>名稱</td> <td>${event.eventName}</td></tr>
<tr><td>地點</td> <td>${event.eventLocation}</td></tr>
<tr><td>狀態</td> <td><c:choose>
               	 <c:when test="${event.status==1}">上架
               	 </c:when>
               	 
               	 <c:otherwise>下架</c:otherwise>
                 </c:choose></td></tr>
<tr><td nowrap="nowrap">售票期間</td> <td>${attraction.onSaleDate.toString().substring(0, 19)} ~ ${attraction.offSaleDate.toString().substring(0, 19)}</td></tr>
<tr><td>展出期間 </td> <td>${attraction.commDate} ~ ${attraction.dueDate}</td></tr>
<tr><td style="width:100px">展覽介紹</td> <td style="text-align:left">${attraction.description}</td></tr>
</table>
<br>
<img height="300px" src="<c:url value='/geteventimage/${event.id}'/>" style="display:block; margin:auto;"/>
<br>
<table style="margin: auto;width: 800px;border:3px 	#003060 solid;background-color:#ECF5FF;text-align:center" cellpadding="10" border='1'>
<tr><td>票券名稱</td> <c:forEach var="price" items="${priceList}"><td>${price.name}</td></c:forEach></tr>
<tr><td style="width:100px">票券價格</td> <c:forEach var="price" items="${priceList}"><td>${price.cost}</td></c:forEach></tr>
</table>
<div style="margin:10px auto;width:250px">
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
</div>
<!-- //超連結都是get -->
</div>
</div>
</div>




<script>
let unbindFunction = (checkTime) => {
    return () => {
        clearInterval(checkTime);
    }
}


let buttonDUdisabe = () => {
    let nowDate = new Date();
    console.log('現在時間'+nowDate);
    
    let period = $("table tr:nth-child(5) td:last-child").html();
    console.log(period);
    let onSaleStr = period.substring(0,19);
    console.log(onSaleStr)
    let offSaleStr = period.substring(22,41);
    console.log(offSaleStr)
    let onSaleDate = new Date(Date.parse(onSaleStr.replace('-','/')));
    let offSaleDate = new Date(Date.parse(offSaleStr.replace('-','/')));
         
         if ( Date.parse(onSaleDate) < Date.parse(nowDate)){
        	 
             $('#updateButton').attr('disabled', true)
             $('#deleteButton').attr('disabled', true)
             
              console.log("已開賣");
              console.log("更新與刪除Button變為disable");
         
         }else{
             console.log("Session比系統目前時間大");
         }
         
		if ( Date.parse(offSaleDate) > Date.parse(nowDate)){
        	 
			
             
			console.log("還在售票期間");
         
         }else{
        	 $('#statusButton').attr('disabled', true)
        	 console.log("上下架Button變為disable");
             
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