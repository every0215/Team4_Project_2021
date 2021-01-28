<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>商品修改</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

        <style>
            .t1 {
                width: 150px;
                float: left;
                text-align: right;
            }
            
         
        </style>
        <script>
        $(document).ready(function() {
        	var productType ="${product.productType}";
        	console.log(productType);
			$('#DropDownList1').val(productType);
		});
        
        $(document).ready(function() {
        	var status ="${product.status}";
        	console.log(status);
			if(status == 1)
				$('#on').attr('checked',true);
			else
				$('#off').attr('checked',true);
				
		});
        
        </script>
    </head>

    <body>

        <h3>商品修改</h3>
        <form  name="myForm" method="post" enctype="multipart/form-data">
            <hr />
			
            <label class="t1" >商品名稱:</label>
            <input type="text"  value='${product.productName}' name="productName" required="required"><br> <br>
            <label class="t1" >公司名稱:</label>
<!--        		<input type="text" name="companyName" required="required"> -->
            <input type="text"  name="cName" readonly="readonly" value='${company.companyName}' required="required" />
            <br><br>
            <label class="t1" >商品存貨:</label>
            <input type="text" value='${product.productStuck}' name="productStuck" required="required">
            <br><br>
            <label class="t1" >商品價格:</label>
            <input type="text" value='${product.productPrice}' name="productPrice" required="required">
            <br> <br>
            <label class="t1" >商品類別:</label>
            
            <select style="width: 185px" id="DropDownList1" class="t1" name="productType"  >
				<option value="-1" selected disabled  >商品類別</option>
				<option value="飲料">飲料</option>
				<option value="泡麵">泡麵</option>
				<option value="零食">零食</option>
				<option value="甜點">甜點</option>
				<option value="清潔">清潔</option>
				<option value="餐廚">餐廚</option>
				<option value="調味">調味</option>
				<option value="生鮮">生鮮</option>
				<option value="保健">保健</option>
			</select>
            <br> <br>
            <label class="t1" >商品說明:</label>
            <textarea style="resize: none; width: 600px; height: 200px;" name="productDescript" >${product.productDescript}</textarea>
            <br><br>
            <label class="t1" >商品狀態:</label>
            <label ><input type="radio" id="on" name="status" value="1"  checked>
            上架</label>
            <label ><input type="radio" id="off" name=status value="0">
            下架</label>
			
            <br><br>
            <label class="t1" for="">商品圖片:</label>
            <input id="image_input"  readonly="readonly" type=file name="productimage">
            <br><br>




            <input type="submit" name="submit" ><input type="reset" name="reset" id="s1">
        </form>
        <a href="../ProductIndex">回商品瀏覽</a>
    </body>

    </html>