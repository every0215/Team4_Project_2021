<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<%-- <jsp:include page="../crm/backOffice.jsp" flush="true"></jsp:include> --%>
<head>
<meta charset="UTF-8">

<title>ProductIndex</title>

<title>商品管理</title>
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
	<h1>商品管理</h1>
	<br>
	<div>
		<a href="ProductInsert" class="btn btn-success" role="button">新增商品</a>
		<table id="productlist" class="display">
			<thead>
				<tr>
					<th>功能</th>
					<th>商品名稱</th>
					<th>廠商名稱</th>
					<th>門市編號</th>
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
						<td><input type="button" value="修改"
							onclick="location.href='ProductAlter'"><input
							type="button" value="刪除" onclick="ProductDelete()"></td>
						<td>${product.productName}</td>
						<td>${product.companyName}</td>
						<td>${product.storeID}</td>
						<td>${product.productStuck}</td>
						<td>${product.productType}</td>
						<td>${product.productPrice}</td>
						<td>${product.discount}</td>
						<td>${product.productPic}</td>
						<td>${product.productDescript}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>

</html>

