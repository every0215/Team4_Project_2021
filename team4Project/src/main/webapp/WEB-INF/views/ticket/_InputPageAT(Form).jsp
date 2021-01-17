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
	<form:form action="/ticket/testAt" method="POST" modelAttribute="event" enctype="multipart/form-data"><hr />
		<form:input type="hidden" path="typeId" value="2" />
		

		<label class="t1" for="">景點名稱:</label>
		<form:input type="text" path="eventName" required="required" />
		<br>
		<br>
		
		<label class="t1" for="">景點地點:</label>
		<form:input type="text" path="eventLocation" required="required" /><br><br>
		
		<form:input type="hidden" path="companyId" value="1" />
		<label class="t1" for="">景點宣傳圖片:</label>
		<form:input id="image_input" type="file" path="eMultipartFile"/><br><br>

		<a href="../TicketIndex">回主頁</a>
		<input type="submit" name="sumbmit" id="s1">
		<!-- 		<a href="XXX" class="btn btn-success" role="button">查詢所有票券</a> -->
	</form:form>
</body>
</html>