<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<script src="<c:url value='/js/Report_Adv_a.js' />"></script>
<script>


$("#com1").live( 'click', function(){
	var cname="全家便利店";
	$(this).css('background-color','white');
	$(this).siblings().css('background-color','gray');
	$("#comp1").css('display','block'); 
	$("#comp2").css('display','none'); 
	$("#comp3").css('display','none'); 
	$("#comp5").css('display','none'); 
	alert(cname);
	loadAdv(1);
});
$("#com2").live( 'click', function(){
	var cname="全聯福利中心";
	$(this).css('background-color','white');
	$(this).siblings().css('background-color','gray');
	$("#comp1").css('display','none'); 
	$("#comp2").css('display','none'); 
	$("#comp3").css('display','block'); 
	$("#comp5").css('display','none');
	alert(cname);
	 loadAdv(4);
});
$("#com3").live('click', function(){
	var cname="萊爾富";
	$(this).css('background-color','white');
	$(this).siblings().css('background-color','gray');
	$("#comp1").css('display','none'); 
	$("#comp2").css('display','block'); 
	$("#comp3").css('display','none'); 
	$("#comp5").css('display','none'); 
	alert(cname);
	 loadAdv(2);
});
$("#com5").live('click', function(){
	var cname="統一超商";
	$(this).css('background-color','white');
	$(this).siblings().css('background-color','gray');
	$("#comp1").css('display','none'); 
	$("#comp2").css('display','none'); 
	$("#comp3").css('display','none'); 
	$("#comp5").css('display','block'); 
	alert(cname);
	loadAdv(3);
});


$("#com4").live('click', function(){
	var cname="all";
	$(this).css('background-color','white');
	$(this).siblings().css('background-color','gray');
	$("#comp1").css('display','block'); 
	$("#comp2").css('display','block'); 
	$("#comp3").css('display','block'); 
	
	alert(cname);
});

$("#can1").live('click', function(){
	var price="0~100";
	var price1 = $('#price1').html();
		

	if(($("#price1").html()) >0 && ($("#price").html())<=100){
		$("#price1").parent().parent().css('display','block');
		}else{
			$("#price1").parent().parent().css('display','none');
		}
	alert(price1);
});

$("#can4").live('click', function(){
	var price="取消條件";
	
		$("#price").parent().parent().css('display','block');

	alert(price);
});

</script>

</head>

<body>
	<div
		style="background-color: gray; height: 100vh; width: 250px; font-size: 22px; float: left;">
<!-- 		<div> -->
<!-- 			商品價格:<br> -->
<!-- 			<div id = "can1" style="text-align: center;">0~100</div> -->
<!-- 			<div id = "can2"style="text-align: center;">101~500</div> -->
<!-- 			<div id = "can3" style="text-align: center;">500+</div> -->
<!-- 			<div id = 'can4' style="text-align: center;">取消條件</div> -->

<!-- 		</div> -->
		<div>
			店家類別:<br>

			<div id="com1" style="text-align: center;">全家</div>
			<div id='com2' style="text-align: center;">全聯</div>
			<div id='com3' style="text-align: center;">萊爾富</div>
			<div id='com5' style="text-align: center;">統一超商</div>
			<div id='com4' style="text-align: center ; background-color:white ;">取消篩選</div>
		</div>
	</div>
	
	<div id = "action">
	 <div id ="comp1">
	<c:forEach var="product" items="${ProductList}">
		<span style="display:none" id ="companyName">${product.companyName}</span>
		<c:if test="${product.companyName == '全家便利店'}">
		<div class="col-sm-4" style="width: 250px; float: left;">
			<div class="panel panel-primary"
				onclick="location.href = '<c:url value='/ProductBuy/${product.productId}'/>'">
				<div class="panel-heading" style="height: 60px; text-align: center;">${product.productName}</div>
				<div class="panel-body">
					<img src="<c:url value='/getproductimage/${product.productId}'/>"
						class="img-responsive" style="width: 100%; height: 164px">
				</div>
				<div class="panel-footer"
					style="height: 50px; text-align: center; font-size: 16px;padding:0">
			
					店家:${product.companyName} &nbsp; <div id ="price1">$${product.productPrice}
					<c:if test="${product.productPrice!=product.productPrice*product.discount}">
					<span style="color:red;font-size:14px">特價:$<fmt:formatNumber value="${product.productPrice*product.discount}" minFractionDigits="0" maxFractionDigits="0"/></span>
					</c:if>
					</div>
					
				</div>	
			</div>
		</div>

	</c:if>
	</c:forEach>
	</div>
		<div id="comp2">
		<c:forEach var="product" items="${ProductList}">
		<span style="display:none" id ="companyName">${product.companyName}</span>
		<c:if test="${product.companyName == '萊爾富'}">
		<div class="col-sm-4" style="width: 250px; float: left;">
			<div class="panel panel-primary"
				onclick="location.href = '<c:url value='/ProductBuy/${product.productId}'/>'">
				<div class="panel-heading" style="height: 60px; text-align: center;">${product.productName}</div>
				<div class="panel-body">
					<img src="<c:url value='/getproductimage/${product.productId}'/>"
						class="img-responsive" style="width: 100%; height: 164px">
				</div>
				<div class="panel-footer"
					style="height: 50px; text-align: center; font-size: 16px; padding:0">

					店家:${product.companyName} &nbsp; <div id ="price2">$${product.productPrice}
					<c:if test="${product.productPrice!=product.productPrice*product.discount}">
					<span style="color:red;font-size:14px">特價:$<fmt:formatNumber value="${product.productPrice*product.discount}" minFractionDigits="0" maxFractionDigits="0"/></span>
					</c:if>
					</div>
					
				</div>

			</div>
		</div>
	
	
			
	
	
	</c:if>
	</c:forEach>
	</div>
		<div id="comp5">
		<c:forEach var="product" items="${ProductList}">
		<span style="display:none" id ="companyName">${product.companyName}</span>
		<c:if test="${product.companyName == '統一超商'}">
		<div class="col-sm-4" style="width: 250px; float: left;">
			<div class="panel panel-primary"
				onclick="location.href = '<c:url value='/ProductBuy/${product.productId}'/>'">
				<div class="panel-heading" style="height: 60px; text-align: center;">${product.productName}</div>
				<div class="panel-body">
					<img src="<c:url value='/getproductimage/${product.productId}'/>"
						class="img-responsive" style="width: 100%; height: 164px">
				</div>
				<div class="panel-footer"
					style="height: 50px; text-align: center; font-size: 16px;">

					店家:${product.companyName} &nbsp; <div id ="price2">$${product.productPrice}</div></div>

			</div>
		</div>
	
	
			
	
	
	</c:if>
	</c:forEach>
	</div>
	<div id="comp3">
		<c:forEach var="product" items="${ProductList}">
		<span style="display:none" id ="companyName">${product.companyName}</span>
		<c:if test="${product.companyName == '全聯福利中心'}">
		<div class="col-sm-4" style="width: 250px; float: left;">
			<div class="panel panel-primary"
				onclick="location.href = '<c:url value='/ProductBuy/${product.productId}'/>'">
				<div class="panel-heading" style="height: 60px; text-align: center;">${product.productName}</div>
				<div class="panel-body">
					<img src="<c:url value='/getproductimage/${product.productId}'/>"
						class="img-responsive" style="width: 100%; height: 164px">
				</div>
				<div class="panel-footer"
					style="height: 50px; text-align: center; font-size: 16px;padding:0">

					店家:${product.companyName} &nbsp; <div id ="price3">$${product.productPrice}
					<c:if test="${product.productPrice!=product.productPrice*product.discount}">
					<span style="color:red;font-size:14px">特價:$<fmt:formatNumber value="${product.productPrice*product.discount}" minFractionDigits="0" maxFractionDigits="0"/></span>
					</c:if>
					</div>
					
				</div>

			</div>
		</div>
	
	
			
	
	
	</c:if>
	</c:forEach>
	</div>
</div>





</body>

<c:import url="/layout/footer" />



</html>