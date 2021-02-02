<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<c:import url="/layout/head" />
<link rel="stylesheet"
	href="https://code.jquery.com/ui/jquery-ui-git.css">

<style>
.ticket-info-title {
	text-align: left;
}

.panel-body {
	border: 5px #ffffff solid;
	width:1500px;
	border-radius: 5px;
	padding: 3px;
	padding-left: 50px;
	box-shadow: 0px 0px 9px #FF7575;
	float:right;
	margin-left:50px;
	
}

.more-link {
	padding-right: 15px;
}

.search-bar {
	clear: both;
	padding: 10px;
}

.input-group {
	margin: 10px;
	display: inline;
}

.sub-title {
	position: relative;
	text-align: center;
	font-size: 14px;
	color: #999;
	overflow: hidden;
	padding: 1.2em 0;
	/**把高度撐起來**/
}

.ticket-content {
	display: flex;
}

.inner {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	white-space: nowrap;
	line-height: 1px;
	border-left: 9999px solid #ccc;
	border-right: 9999px solid #ccc;
	padding: 0 10px;
}
.mytable_length {
	float: left;
}
</style>

<body>
	<!-- wpf loader Two -->
	<div id="wpf-loader-two">
		<div class="wpf-loader-two-inner">
			<span>Loading</span>
		</div>
	</div>
	<!-- / wpf loader Two -->
	<!-- SCROLL TOP BUTTON -->
	<a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
	<!-- END SCROLL TOP BUTTON -->

	<c:import url="/layout/header" />

	<div class="search-bar">
		
	</div>

	<!-- 購買票券主頁面START -->
	${member.Id}的訂單
	<div class="ticket-content" style="margin-bottom: 10px ;">
			<div class="ticket-info">
			 	
				<div class="panel-body">
			
					<div style="float: left" >
					<table id="mytable" class="display" style="width: 1000px">
			<thead>
				<tr>
					<th>商品名稱</th>
					<th>商品圖片</th>
					<th>廠商名稱</th>
					<th>購買數量</th>
					<th>商品類別</th>
					<th>商品價格</th>
					<th>商品折扣</th>
					<th>商品總價</th>
					
					

				</tr>
			</thead>
			
			<tbody class="">
				<c:forEach var="product" items="${Cart}">
					<tr>
						<td width="100"></td>
						<td width="100"><img height="150px"
							src="<c:url value='/getproductimage/${product.productId}'/>" /></td>
						<td width="100"></td>
						<td width="100"></td>
						<td width="100"></td>
						<td width="100"></td>
						<td width="100"></td>
						<td width="100">${cart.showtotal}</td>
						
						
					</tr>
				</c:forEach>
			</tbody>
		</table>





					</div>
					<div style="float: right">
					
								
									<table style="cellpadding: '10px'; border: 3px #ffffff solid">

										<thead>
											<tr>
												
												<td>價格</td>
												<td>數量</td>
												<td>金額</td>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="price" items="${priceList}"
												varStatus="status">
												<tr>
													
													<td class="cost" priceId="${price.id}">${price.cost}</td>
													<td><input type=" text" class="spinner"
														target="subtotal-${price.id}" name="count"
														priceSPId="${price.id}" price="${price.cost}"
														style="width: 20px; height: 18px" /></td>
													<td name="subtotal-${price.id}" class="subtotal">0</td>
												</tr>
											</c:forEach>
											<tr>
												<td colspan="3">總價</td>
												<td id="totalAmount" name="totalAmount">0</td>

											</tr>
										</tbody>

									</table>

									<button type="submit" class="btn btn-info">送出訂單</button>
								
							
								
								
					</div>
				</div>

			</div>
		</div>
	

<c:import url="/layout/footer"></c:import>






	<!-- 購買票券主頁面 END -->

	<!-- footer -->
	
	<!-- / footer -->



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
	<script type="text/javascript"
		src="<c:url value='/js/nouislider.js' />"></script>
	<!-- Custom js -->
	<script src="<c:url value='/js/custom.js' />"></script>

	<script src="<c:url value='/js/luke_js.js' />"></script>
	<!-- script src="https://code.jquery.com/jquery-3.5.1.min.js"></script-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

	<script>
        </script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js">
</script>

	<script>
$(document).ready( function () {
    $('#mytable').DataTable();
} );
</script>
</body>


</html>