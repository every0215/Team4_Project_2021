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
<script>

</script>
<script>
$("#demo").live( 'click', function(){
	var cname="全家便利店";
	alert(cname);
});
$("#demo1").live( 'click', function(){
	var cname="全聯福利中心";
	alert(cname);
});
$("#demo2").live( 'click', function(){
	var cname="萊爾富";
	alert(cname);
});
$("#demo3").live( 'click', function(){
	var cname="null";
	alert(cname);
});

</script>
</head>

<body>
	<div
		style="background-color: gray; height: 100vh; width: 170px; font-size: 22px; float: left;">
		<div>
			商品價格:<br>
			<div style="text-align: center;">0~100</div>
			<div style="text-align: center;">101~500</div>
			<div style="text-align: center;">500+</div>
			<div id='can1' style="text-align: center;">取消條件</div>

		</div>
		<div>
			店家類別:<br>
			
			<div id="fam" 
				style="text-align: center;"><input type = 'button'  id = "demo" value="全家"></input></div>
			<div id='all' 
				style="text-align: center;"><input type = 'button'  id = "demo1" value="全聯"></input></div>
			<div id='hi' 
				style="text-align: center;"><input type = 'button'  id = "demo2" value="萊爾富"></input></div>
			<div id='can2' onclick="<c:set var="cname"  value="null"/>"
				style="text-align: center;"><input type = 'button'  id = "demo3" value="取消條件"></input></div>
		</div>
	</div>
	<!-- 	<div id='showp'> -->
	
	<c:forEach var="product" items="${ProductList}">
		<c:choose>
			<c:when test="${cname == 'null' }">
				<div class="col-sm-4" style="width: 250px; float: left;">
					<div class="panel panel-primary" onclick="location.href = '<c:url value='/ProductBuy/${product.productId}'/>'">
						<div class="panel-heading"
							style="height: 60px; text-align: center;">${product.productName}</div>
						<div class="panel-body">
							<img src="<c:url value='/getproductimage/${product.productId}'/>"
								class="img-responsive" style="width: 100%; height: 164px">
						</div>
						<div class="panel-footer"
							style="height: 50px; text-align: center; font-size: 16px;">

							店家:${product.companyName} &nbsp; $${product.productPrice}</div>

					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:if test="${product.companyName == cname}">
					<div class="col-sm-4" style="width: 250px; float: left;">
						<div class="panel panel-primary" onclick="location.href = '<c:url value='/ProductBuy/${product.productId}'/>'">
							<div class="panel-heading"
								style="height: 60px; text-align: center;">${product.productName}</div>
							<div class="panel-body">
								<img
									src="<c:url value='/getproductimage/${product.productId}'/>"
									class="img-responsive" style="width: 100%; height: 164px">
							</div>
							<div class="panel-footer"
								style="height: 50px; text-align: center; font-size: 16px;">

								店家:${product.companyName} &nbsp; $${product.productPrice}</div>

						</div>
					</div>
				</c:if>
			</c:otherwise>
		</c:choose>

	</c:forEach>


</body>
<c:import url="/layout/footer" />


<!--   自定義js -->
<script type="text/javascript" src="js/Carousel.js"></script>
<script src="<c:url value='/js/luke_js.js' />"></script>
</html>