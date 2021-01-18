<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productBean</title>
</head>
<body>

	<table class="">
		<thead class="">
			<tr>
				<th>商品ID</th>
				<th>商品名稱</th>
				<th>廠商名稱</th>
				<th>店家編號</th>
				<th>商品存貨</th>
				<th>商品種類</th>
				<th>商品價格</th>				
				<th>商品折扣</th>
				<th>商品圖片</th>
				<th>商品說明</th>

			</tr>
		</thead>

		<tbody class="">
			<c:forEach var="productBean" items="${ProductList}">
				<tr>
					<td>${productBean.productId}</td>
					<td>${productBean.productName}</td>
					<td>${productBean.companyName}</td>
					<td>${productBean.storeID}</td>
					<td>${productBean.productStuck}</td>
					<td>${productBean.productType}</td>
					<td>${productBean.productPrice}</td>
					<td>${productBean.discount}</td>
					<td>${productBean.productPic}</td>
					<td>${productBean.productDescript}</td>

				</tr>
			</c:forEach>
		</tbody>

	</table>

</body>
</html>