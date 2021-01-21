<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品新增</title>
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
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<a href="InputPageEX">展覽</a>
	<a href="InputPageAT">樂園與景點</a>
	<a href="InputPageSP">運動賽事</a>

	<h3>Event Input Page-樂園與景點</h3>
	<form name="myForm" action="<c:url value='/ticket/InputPageAT'/>"
		method="post" enctype="multipart/form-data">
		<hr />
		<input type="hidden" name="typeId" value="2" />
		<label class="t1" for="">景點名稱:</label>
		<input type="text" name="eventName"
			required="required"><br> <br> <label class="t1"
			for="">景點地點:</label> <input type="text" name="eventLocation"
			required="required"><br> <br> <input type="hidden"
			name="companyId" value="1" /> <label class="t1" for="">景點宣傳圖片:</label>
		<input id="image_input" type="file" name="productImage"><br>
		<br>

		<%-- 以上為eventBean 以下為attractionBean --%>


		
		<div id="price">
			<div>
				<label class="t1" for="">票券名稱:</label> <input type="text"
					name="priceName" required="required"><br>
				<br> <label class="t1" for="">票券價格:</label> <input type="text"
					name="priceCost" required="required"><br>
				<br>
				<br>
			</div>
		</div>

		
		<input type="submit" name="submit" id="s1">
	</form>
	<a href="../TicketIndex">回主頁</a>
</body>
</html>