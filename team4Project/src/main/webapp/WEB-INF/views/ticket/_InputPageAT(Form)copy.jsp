<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>展覽</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="../ticketjs/checkDateTime.js"></script>

<style>
.t1 {
	width: 150px;
	float: left;
	text-align: right;
}

select option[value="0"] {
	display: none;
}
</style>
</head>
<body>
	<div class="jumbotron text-center">
		<h1>E-Ticket票券系統</h1>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<a href="InputPageEX">展覽</a>
	<a href="InputPageAT">樂園與景點</a>
	<a href="InputPageSP">運動賽事</a>

	<h3>Event Input Page-樂園與景點</h3>
	<form:form action="/ticket/testAt" method="POST" modelAttribute="event"
		enctype="multipart/form-data">
		<hr />
		<form:input type="hidden" path="typeId" value="2" />
		<!-- 			<form:errors type="hidden" path="event.typeId"/> -->

		<label class="t1" for="">景點名稱:</label>
		<form:input type="text" path="eventName" required="required" />
		<br>
		<br>
		<%-- 			<form:errors path="event.eventName"/><br><br> --%>
		<label class="t1" for="">景點地點:</label>
		<form:input type="text" path="eventLocation" required="required" />
		<br>
		<br>
		<%-- 			<form:errors path="event.eventLocation" /><br><br> --%>

					<form:input type="hidden" path="companyId" value="1" />
				<label class="t1" for="">景點宣傳圖片:</label>
					<form:input id="image_input" type="file" path="eMultipartFile"/><br><br>
					<form:errors path="event.eMultipartFile"/><br><br>

		<%-- 以上為eventBean 以下為attractionBean --%>

		<!-- 		<label class="t1" for="">起始售票時間:</label> -->
		<%-- 			<form:input type="text" id="dateTime1" path="attraction.onSaleDate" placeholder="ex:2021-01-01 9:00:01" required="required"/> --%>
		<%-- 			<form:errors path="attraction.onSaleDate"/> --%>
		<!-- 				<span id="datetimesp1"></span><br><br> -->
		<!-- 				<span>時間格式:yyyy-MM-dd HH:mm:ss</span><br><br> -->
		<!-- 		<label class="t1" for="">結束售票時間:</label> -->
		<%-- 			<form:input type="text" id="dateTime2" path="attraction.offSaleDate" placeholder="ex:2021-01-31 21:00:01" required="required"/> --%>
		<%-- 			<form:errors path="attraction.offSaleDate"/> --%>
		<!-- 				<span id="datetimesp2"></span><br><br> -->
		<!-- 				<span>時間格式:yyyy-MM-dd HH:mm:ss</span><br><br> -->
		<!-- 		<label class="t1" for="">展覽起始日:</label> -->
		<%-- 			<form:input type="text" id="date1" path="attraction.commDate" placeholder="ex:2021-01-01" required="required"/> --%>
		<%-- 			<form:errors path="attraction.commDate"/> --%>
		<!-- 				<span id="datesp1"></span><br><br> -->
		<!-- 				<span>時間格式:yyyy-MM-dd</span><br><br> -->
		<!-- 		<label class="t1" for="">展覽終止日:</label> -->
		<%-- 			<form:input type="text" id="date2" path="attraction.dueDate" placeholder="ex:2021-01-31" required="required"/> --%>
		<%-- 			<form:errors path="attraction.dueDate"/> --%>
		<!-- 				<span id="datesp2"></span><br><br> -->
		<!-- 				<span>時間格式:yyyy-MM-dd</span><br><br> -->
		<!-- 		<label class="t1" for="">描述:</label> -->
		<%-- 			<form:textarea style="resize: none; width: 600px; height: 200px;" path="attraction.description"/><br><br> --%>

		<%-- 		<%-- 以上為attractionBean 以下為priceBean --%> --%>
<!-- 		<div id="price"> -->
		<!-- 			<div> -->
		<!-- 				<label class="t1" for="">票券名稱:</label> -->
		<%-- 					<form:input type="text" path="priceList[0].name" required="required"/><br><br> --%>
		<%-- 					<form:errors path="priceList[0].name"/><br><br> --%>
		<!-- 				<label class="t1" for="">票券價格:</label> -->
		<%-- 					<form:input type="text" path="priceList[0].cost" required="required"/><br><br><br> --%>
		<%-- 					<form:errors path="priceList[0].cost"/><br><br><br> --%>
		<!-- 			</div> -->
		<!-- 		</div> -->

		<!-- 		<div id="price"> -->
		<!-- 			<div> -->
		<!-- 				<label class="t1" for="">票券名稱:</label> -->
		<%-- 					<form:input type="text" path="priceList[1].name" required="required"/><br><br> --%>
		<%-- 					<form:errors path="priceList[1].name"/><br><br> --%>
		<!-- 				<label class="t1" for="">票券價格:</label> -->
		<%-- 					<form:input type="text" path="priceList[1].cost" required="required"/><br><br><br> --%>
		<%-- 					<form:errors path="priceList[1].cost"/><br><br><br> --%>
		<!-- 			</div> -->
		<!-- 		</div> -->

		<!-- 		<input id="Button1" type="button" value="新增價位與名稱" /> -->
		<!-- 		<script> -->
// 		$("#Button1").click(function addPrice(){
// 			console.log($("#price").html());
			

// 			console.log($("#price").html());
// 		})
		

// 		$("#price").on("change","input",function(){		
// 			$(this).attr("value",$(this).val()) 
// 		})
		
// 			$("#price").on("click",".btn-danger",function(){
//                 $(this).closest("div").remove(); 
//             })
//             //當dateTime1 onblur時 他會進行一個箭頭函數 箭頭函數內包含checkDateTime函式
//             document.getElementById("dateTime1").onblur= () => { checkDateTime('dateTime1', 'datetimesp1') }
//         	document.getElementById("dateTime2").onblur= () => { checkDateTime('dateTime2', 'datetimesp2') }
//         	document.getElementById("date1").onblur= () => { checkDate('date1', 'datesp1') }
//         	document.getElementById("date2").onblur= () => { checkDate('date2', 'datesp2') }
//         	window.onload = function () {
// 				getMethod()
// 			}
<!-- 		</script> -->



		<a href="../TicketIndex">回主頁</a>
		<input type="submit" name="sumbmit" id="s1">
		<!-- 		<a href="XXX" class="btn btn-success" role="button">查詢所有票券</a> -->
	</form:form>
</body>
</html>