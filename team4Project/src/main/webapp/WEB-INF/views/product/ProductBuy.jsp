<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>商品查詢</title>
<meta charset="UTF-8">
<c:import url="/layout/head" />
<c:import url="/layout/header" />
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<c:url value='/js/bootstrap.js' />"></script>
<!-- SmartMenus jQuery plugin -->
<script type="text/javascript"
	src="<c:url value='/js/jquery.smartmenus.js' />"></script>
<!-- SmartMenus jQuery Bootstrap Addon -->
<script type="text/javascript"
	src="<c:url value='/js/jquery.smartmenus.bootstrap.js' />"></script>
<!-- To Slider JS -->
<script src="<c:url value='/js/sequence.js' />"></script>
<script src="<c:url value='/js/sequence-theme.modern-slide-in.js' />"></script>
<!-- Product view slider -->
<script type="text/javascript"
	src="<c:url value='/js/jquery.simpleGallery.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/js/jquery.simpleLens.js' />"></script>
<!-- slick slider -->
<script type="text/javascript" src="<c:url value='/js/slick.js' />"></script>
<!-- Price picker slider -->
<script type="text/javascript" src="<c:url value='/js/nouislider.js' />"></script>
<!-- Custom js -->
<script src="<c:url value='/js/custom.js' />"></script>

<script src="<c:url value='/js/luke_js.js' />"></script>
<!-- script src="https://code.jquery.com/jquery-3.5.1.min.js"></script-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>


<link href="<c:url value='/css/productbuy.css' />" rel="stylesheet" type="text/css">

</head>

<body>
	
		<div class ='buybox' >
			<div>
				<div class = 'imgbox'>
					<img src="<c:url value='/getproductimage/${product.productId}'/>"
						class="img-responsive" style=" float:left; width:700px; height: 500px">
				</div>
				<table border= 0 style="border:1px solid black ;height: 500px" >
				<tr><td>
				商品名稱:
				<div class='textbox'>
					<h1>${product.productName}</h1>
				</div>
				<br>
				</td></tr>
				<tr><td>
				商品單價:
				<div class='textbox'>
					<p id ="price" >${product.productPrice}</p>
				</div>
				<br>
				</td></tr>
				
				<tr><td>
				商品說明:
				<div class='textbox'>
					<h3>${product.productDescript}</h3>
				</div>
				<br>
				</td></tr>
				<tr><td>
				數量
				<form method="post" action="../ShoppingCart">
				<input id="min" name="" type="button" value="-" >
				<input id="num" name="num" type="text" value="1" onblur="setTotalP()"
				  onchange="setTotal();"  >
				<input id="add" name="" type="button" value="+" >
				
				</td></tr>
				<tr><td >
				<br>
					總價:$<p id="total" name="total"  onchange="setTotalPrice();">0</p>
<!-- 					onchange="setTotalprice();" -->
				<br><br>
				</td></tr>
				<tr><td>
				<button type="submit" class="btn btn-primary" >前往購物車</button>
				
				
				<br>
				</td></tr>
				</table>
			</div>
	</form>


	</div>




</body>
<c:import url="/layout/footer" />

<script>


		

// $(document).ready(function(){
	  
// 	function appendText(){
// 	var num=document.getElementById("#num");
// 	var price=document.getElementById("#price");
// 	  // 以 DOM 创建新元素

// 	$("#total").append(num*price);         // 追加新元素
// 	}
// )}
function setTotalP(){
		var n =$("#price").text()*$("#num").val();
		$("#total").text(n);

		}

$(function(){ //加減按鈕
	var t = $("#num"); 
	$("#add").click(function(){		
		t.val(parseInt(t.val())+1)
		var n =$("#price").text()*$("#num").val();
		$("#total").text(n);
		setTotal();
		setTotalPrice();
	})
	$("#min").click(function(){
		if(t.val()>1){
		t.val(parseInt(t.val())-1);
		var n =$("#price").text()*$("#num").val();
		$("#total").text(n);
		}
		else{
		alert("至少購買一件哦！");
		}
		setTotal();
		setTotalPrice();
	})
});


</script>

<script >
$(document).ready(function (){
	 var n =$("#price").text()*$("#num").val();
	 $("#total").text(n);
	
})
</script>
<!--   自定義js -->
<script type="text/javascript" src="js/Carousel.js"></script>
<script src="<c:url value='/js/luke_js.js' />"> </script>

</html>