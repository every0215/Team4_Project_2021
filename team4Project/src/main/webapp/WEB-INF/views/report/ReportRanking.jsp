<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Ranking</title>
<style>
.rep_ranking_div {
	width: 1000px;
	margin-right: 50px;
	text-align: center;
}
</style>
<!-- 外掛dataTables -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#myTable').DataTable({
			"dom" : 'rti',

		});

	});
</script>
</head>
<body>

	<div class="rep_ranking_div">
		<form>
			<table id="myTable">
				<caption>
					<span style="font-weight: bolder; font-size: 20px;">廣告精選商品排行榜</span>
					<span style="display: inline; float: right;">
						銷售前五名<input type="button" value="匯入" name="queryadddata">
					</span>

				</caption>
				<thead>
					<th>排名/順序</th>
					<th>商品名稱</th>
					<th>商品描述</th>
					<th>商品金額</th>
					<th>商品圖片</th>
					<th>變更</th>
				</thead>
				<tbody>
<%-- 					<c:forEach var="#Sto" items="${}"> --%>
<!-- 						<tr> -->
<%-- 							<td>${}</td> --%>
<%-- 							<td>${}</td> --%>
<%-- 							<td>${}</td> --%>
<%-- 							<td>${}</td> --%>
<%-- 							<td>${}</td> --%>
<!-- 							<td><input type="button" value="修改" name="revisedata"></td> -->
				</tbody>
			</table>
		</form>
	</div>

</body>
</html>