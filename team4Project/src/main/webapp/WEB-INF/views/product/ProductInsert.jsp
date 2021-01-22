<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>商品新增</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        <script src="../ticketjs/checkDateTime.js"></script>

<<<<<<< HEAD
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
=======
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
>>>>>>> parent of 4cb941c... x

    <body>

        <h3>商品新增</h3>
        <form name="myForm" method="post">
            <hr />

            <label class="t1" for="">商品名稱:</label>
            <input type="text" name="ProductName" required="required"><br> <br>
            <label class="t1" for="">公司名稱:</label>
            <input type="text" name="CompanyName" required="required">
            <br> <br>
            <label class="t1" for="">商品存貨:</label>
            <input type="text" name="ProductStuck" required="required">
            <br> <br>
            <label class="t1" for="">商品價格:</label>
            <input type="text" name="ProductType" required="required">
            <br> <br>
            <label class="t1" for="">商品類型:</label>
            <input type="text" name="ProductStuck" required="required">
            <br> <br>
            <label class="t1" for="">商品說明:</label>
            <textarea style="resize: none; width: 600px; height: 200px;" name="ProductDescription"></textarea>
            <br> <br>
            <label class="t1" for="">商品狀態:</label>
            <input type="radio" id="on" name="ProductStuck" value="1">
            <label for="on">上架</label>
            <input type="radio" id="off" name="ProductStuck" value="0">
            <label for="off">下架</label>

<<<<<<< HEAD
            <br> <br>
            <label class="t1" for="">商品圖片:</label>
            <input id="image_input" type="file" name="ProductPic"><br>
            <br>




            <input type="submit" name="submit" id="s1"><input type="reset" name="reset" id="s1">
        </form>
        <a href="../ProductIndex">回主頁</a>
    </body>

    </html>
=======
		
		<input type="submit" name="submit" id="s1">
	</form>
	<a href="../TicketIndex">回主頁</a>
</body>
</html>
>>>>>>> parent of 4cb941c... x
