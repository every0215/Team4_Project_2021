
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">

<title>ProductIndex</title>

<title>商品管理</title>
<link href="css/styles1.css" rel="stylesheet">
<!-- 外掛Chart.js cdn -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js">
</script>
<script
	src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js">
	</script>

<script>
		$(document).ready(function() {
			$('#productlist').DataTable();
		});
		
	</script>
</head>
<script language="javascript">
function ProductDelete() {
　
	if (confirm ("確定要刪除嗎 ") )
		{alert("已刪除" )}
	
}
</script>


<body>
	<div class="content-wrapper">
	</div>
	<h1>商品管理</h1>
	<br>
	<div>
		<a href="product/ProductInsert" class="btn btn-success" role="button">新增商品</a>
		<table id="productlist" class="display">
			<thead>
				<tr>
					<th>功能</th>
					<th>商品名稱</th>
					<th>廠商名稱</th>
					<th>商品存貨</th>
					<th>商品類別</th>
					<th>商品價格</th>
					<th>商品折扣</th>
					<th>商品圖片</th>
					<th>商品說明</th>

				</tr>
			</thead>

			<tbody class="">
				<c:forEach var="product" items="${ProductList}">
					<tr>

						<td width="125"><input type="hidden"  name="typeId"
							value="${product.productId}" />  
							<input type="button" value="修改"
							onclick="location.href='<c:url value="/product/productAlter/${product.productId}" />'"><input
							type="button" value="刪除" onclick="ProductDelete()"></td>
						<td width="100">${product.productName}</td>
						<td width="100">${product.companyName}</td>
						<td width="100">${product.productStuck}</td>
						<td width="100">${product.productType}</td>
						<td width="100">${product.productPrice}</td>
						<td width="100">${product.discount}</td>
						<td width="100"><img height="150px"
							src="<c:url value='/getproductimage/${product.productId}'/>" /></td>
						<td>${product.productDescript}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>

</html>

