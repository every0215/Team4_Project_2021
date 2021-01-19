<jsp:include page="../crm/backOffice.jsp" flush="true"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Management</title>


<!-- 引入的自定義css -->
<link href="css/styles1.css" rel="stylesheet">
<!-- 外掛Chart.js cdn -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("button").click(function(){
    $("#div1").load("demo_test.txt");
  });
});

// $(function() {
//     $("#rep_liaction li").hover(function() {
//         $(this).attr("class", "active").
//         siblings().attr("class", "");
//     });
// });

// $(function(){
// 	console.log("123")
// 	$("ul li").click(function(){
// 		console.log("test")
// 		$("li").removeClass("active");
// 		$(this).addClass("active");
// 		console.log("stop")
// 	})
// 	$("#rep_liaction_2").click(function(){
// 		var url="http://localhost:8080/proj/"
//        	console.log("2")
//        	var url_path = $(this).find("a").attr("href")
//        	url = url + url_path
//        	document.location.href = url
// 		var activeElement = $("#rep_liaction_1.active")
//        	console.log(activeElement)
//        	activeElement.next().addClass("active")
//        	activeElement.removeClass("active")
// 		console.log("3")

//         });
//     $("#rep_liaction_1 li").click(function() {
//     	var url="http://localhost:8080/proj/"
//     	console.log("1")
    	//$(this).attr("class", "active").siblings().attr("class", "");
//     });
});



</script>



</head>
<body>
	<div class="rep_reportarea">
		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Report <small>Version 1.0</small>
				</h1>
			</section>

			<!-- Main content 統計區-->
			<section class="content">
				<!-- Small boxes (Stat box) -->
				<div class="row">
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-yellow">
							<div class="inner">
								<h3>200</h3>
								<p>累計會員數</p>
							</div>
							<div class="icon">
								<i class="ion ion-person-add"></i>
							</div>
						</div>
					</div>
					<!-- ./col -->

					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-green">
							<div class="inner">
								<h3>${singlesales}</h3>
								<p>年度累計銷售金額</p>
							</div>
							<div class="icon">
								<i class="ion ion-stats-bars"></i>
							</div>
						</div>
					</div>
					<!-- ./col -->

					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-red">
							<div class="inner">
								<h3>${singlestore}</h3>
								<p>目前門市數量</p>
							</div>
							<div class="icon">
								<i class="ion ion-pie-graph"></i>
							</div>
						</div>
					</div>
					<!-- ./col -->

					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-aqua">
							<div class="inner">
								<h3>${queryclass}</h3>
								<p>已銷售商品項目數量</p>
							</div>
							<div class="icon">
								<i class="ion ion-bag"></i>
							</div>
						</div>
						<!-- ./col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- Main row -->
				<!-- START CUSTOM TABS選擇區 -->
				<div class="row">
					<div class="col-md-8">
						<!-- Custom Tabs -->
						<div class="nav-tabs-custom">
							<ul class="nav nav-tabs" id="rep_liaction">
								<li class="menu active"  id="rep_liaction_1">
									<a href="reportindex">年度各區業績(各店)</a>
<!-- 									<a href="#tab_1" data-toggle="tab">年度各區業績(各店)</a> -->
									<!--<a href="ReporyQueryAllData">全部明細</a> -->
								</li>
								<li class="menu" id="rep_liaction_2">
									<!-- <a href="#tab_2" data-toggle="tab">年度品類銷售</a> -->
									<a href="queryProdustClass">年度品類銷售</a>
								</li>
								<li class="menu" id="rep_liaction_3">
									<!--<a href="#tab_3" data-toggle="tab"></a> -->
									<a href="queryActiveSales">年度活動銷售</a>
								</li>

								<li class="menu" class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" href="#">
										各店項目報表
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">

										<li>
											<!-- 											<a href="#tab_5" data-toggle="tab"> -->
											<a href="SingleItemQuerySales">各店年度業績/折扣/會員數</a>
										</li>
										<li>
											<a href="queryAllActiveSales">各店活動業績</a>
										</li>
										<li>
											<a href="queryAllStorePayment">各店付款方式</a>
										</li>
										<li>
											<a href="#tab_8" data-toggle="tab">各店無庫存項數</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="#tab_4" data-toggle="tab">商品前十名排行(廣告)</a>
								</li>
							</ul>
							<!-- 圖表區 -->
							<div class="tab-content">
								<div class="tab-pane active" id="tab_1">
									<c:if test="${!empty area}">
										<canvas id="myChart" width="200px" height="30%"></canvas>
									</c:if>
								</div>
								<!-- /.tab-pane -->
								<div class="tab-pane" id="tab_2" href="reportindex">tab_2</div>
								<%-- 								<c:if test="${!empty classlist}"> --%>
								<%-- 									<canvas id="myChart" width="200px" height="30%"></canvas> --%>
								<%-- 								</c:if> --%>
								<!-- /.tab-pane -->
								<div class="tab-pane" id="tab_3">
									tab_3
									</a>
								</div>
								<!-- /.tab-pane -->
								<div class="tab-pane" id="tab_4"><jsp:include page="ReportRanking.jsp" flush="true" /></div>
								<!-- /.tab-pane -->
								<div class="tab-pane" id="tab_5">tab_5</div>
								<!-- /.tab-pane -->
								<div class="tab-pane" id="tab_7">tab_7</div>
								<!-- /.tab-pane -->
								<div class="tab-pane" id="tab_8">tab_8</div>
								<!-- /.tab-pane -->
								<div class="tab-pane" id="tab_9">tab_9</div>
								<!-- /.tab-pane -->

							</div>
							<!-- /.tab-content -->
						</div>
						<!-- nav-tabs-custom -->
					</div>
					<!-- /.col -->


					<!-- 圖表區 -->
					<!-- Left col -->
					<div class="col-md-8">
						<!-- MAP & BOX PANE -->
						<div class="box box-success">
							<div class="box-header with-border">
								<h3 class="box-title">Data Report</h3>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body no-padding">
								<div class="row">
									<div class="col-md-9 col-sm-8">
										<div class="pad">
											<!-- Map will be created here -->
											<div id="world-map-markers" style="height: 200px;">
												<!-- 資料表區 -->
												<!-- 全部明細 -->
												<div>
													<fieldset class="rep_tabs_db" " style="overflow: scroll; height: 170px; margin-bottom: 0px;">
														<div id="tabs_1">
															<table class="table table-striped" style="margin-bottom: 0px; text-align: center;">
																<thead class="rep_table_font">
																	<tr>
																		<!-- 各區業績Tab5 -->
																		<c:if test="${!empty area}">
																			<th>門市地區</th>
																			<th>門市銷售數量</th>
																			<th>門市總業績</th>
																			<th>門市總折扣金額</th>
																		</c:if>

																		<!-- Tab2-年度品類銷售 -->
																		<c:if test="${!empty classlist}">
																			<th>品類</th>
																			<th>品類銷售數量</th>
																			<th>品類總業績</th>
																			<th>品類總折扣金額</th>
																		</c:if>

																		<!-- Tab3-年度活動銷售 -->
																		<c:if test="${!empty activelist}">
																			<th>活動名稱</th>
																			<th>活動銷售數量</th>
																			<th>活動總業績</th>
																			<th>活動總折扣金額</th>
																		</c:if>

																		<!-- Tab4-各店-各店年度業績/折扣/會員數 -->
																		<c:if test="${!empty storelist}">
																			<th>門市地區</th>
																			<th>門市名稱</th>
																			<th>總業績</th>
																			<th>總折扣金額</th>
																		</c:if>
																		<!--Tab5-各店-各店活動業績 -->
																		<c:if test="${!empty storeactivelist}">
																			<th>門市名稱</th>
																			<th>活動分類</th>
																			<th>活動銷售數量</th>
																			<th>活動總業績</th>
																			<th>活動總折扣金額</th>
																		</c:if>
																		<!--Tab6-各店-各店付款方式 -->
																		<c:if test="${!empty storepaymentlist}">
																			<th>門市名稱</th>
																			<th>付款方式</th>
																			<th>銷售數量</th>
																			<th>總業績</th>
																			<th>總折扣金額</th>
																		</c:if>

																		<!--↓全部明細 -->
																		<%-- 																		<c:if test="${!empty list}"> --%>
																		<!-- 																			<th>報表id</th> -->
																		<!-- 																			<th>公司id</th> -->
																		<!-- 																			<th>門市id</th> -->
																		<!-- 																			<th>門市地區</th> -->
																		<!-- 																			<th>門市名稱</th> -->
																		<!-- 																			<th>商品類別</th> -->
																		<!-- 																			<th>商品id</th> -->
																		<!-- 																			<th>商品名稱</th> -->
																		<!-- 																			<th>銷售日期</th> -->
																		<!-- 																			<th>商品定價</th> -->
																		<!-- 																			<th>商品折扣後價</th> -->
																		<!-- 																			<th>商品銷售數量</th> -->
																		<!-- 																			<th>商品庫存數量</th> -->
																		<!-- 																			<th>付款方式</th> -->
																		<!-- 																			<th>活動項目</th> -->
																		<!-- 																			<th>商品狀態</th> -->
																		<%-- 																		</c:if> --%>
																		<!-- 																	</tr> -->
																</thead>
																<!-- 																<tbody class="rep_table_font"> -->
																<%-- 																	<c:forEach var="lista" items="${list}"> --%>
																<!-- 																		<tr> -->
																<%-- 																			<td>${lista.reportid}</td> --%>
																<%-- 																			<td>${lista.companyid}</td> --%>
																<%-- 																			<td>${lista.storeid}</td> --%>
																<%-- 																			<td>${lista.storearea}</td> --%>
																<%-- 																			<td>${lista.storename}</td> --%>
																<%-- 																			<td>${lista.productclass}</td> --%>
																<%-- 																			<td>${lista.productid}</td> --%>
																<%-- 																			<td>${lista.productname}</td> --%>
																<%-- 																			<td>${lista.salesdate}</td> --%>
																<%-- 																			<td>${lista.productprice}</td> --%>
																<%-- 																			<td>${lista.productdiscountprice}</td> --%>
																<%-- 																			<td>${lista.salesamount}</td> --%>
																<%-- 																			<td>${lista.stockamount}</td> --%>
																<%-- 																			<td>${lista.payment}</td> --%>
																<%-- 																			<td>${lista.activeitem}</td> --%>
																<%-- 																			<td>${lista.productstatus}</td> --%>
																<!-- 																		</tr> -->
																<%-- 																	</c:forEach> --%>
																<!--↑全部明細 -->
																<!-- Tab1-年度各區業績-->
																<c:forEach var="areaa" items="${area}">
																	<tr>
																		<td>${areaa[0]}</td>
																		<td>${areaa[1]}</td>
																		<td>${areaa[2]}</td>
																		<td>${areaa[3]}</td>
																	</tr>
																</c:forEach>

																<!-- Tab2-年度品類銷售 -->
																<c:forEach var="classlista" items="${classlist}">
																	<tr>
																		<td>${classlista[0]}</td>
																		<td>${classlista[1]}</td>
																		<td>${classlista[2]}</td>
																		<td>${classlista[3]}</td>
																	</tr>
																</c:forEach>

																<!-- Tab3-年度活動銷售 -->
																<c:forEach var="activelista" items="${activelist}">
																	<tr>
																		<td>${activelista[0]}</td>
																		<td>${activelista[1]}</td>
																		<td>${activelista[2]}</td>
																		<td>${activelista[3]}</td>
																	</tr>
																</c:forEach>

																<!-- Tab4-各店-各店年度業績/折扣/會員數 -->
																<c:forEach var="storelista" items="${storelist}">
																	<tr>
																		<td>${storelista[0]}</td>
																		<td>${storelista[1]}</td>
																		<td>${storelista[2]}</td>
																		<td>${storelista[3]}</td>
																	</tr>
																</c:forEach>

																<!-- Tab5-各店-各店活動業績 -->
																<c:forEach var="storeactivelista" items="${storeactivelist}">
																	<tr>
																		<td>${storeactivelista[0]}</td>
																		<td>${storeactivelista[1]}</td>
																		<td>${storeactivelista[2]}</td>
																		<td>${storeactivelista[3]}</td>
																		<td>${storeactivelista[4]}</td>
																	</tr>
																</c:forEach>

																<!-- Tab6-各店-各店付款方式 -->
																<c:forEach var="storepaymentlista" items="${storepaymentlist}">
																	<tr>
																		<td>${storepaymentlista[0]}</td>
																		<td>${storepaymentlista[1]}</td>
																		<td>${storepaymentlista[2]}</td>
																		<td>${storepaymentlista[3]}</td>
																		<td>${storepaymentlista[4]}</td>
																	</tr>
																</c:forEach>


																<!-- ↓資料表區下半段 -->
																</tbody>
															</table>
														</div>
													</fieldset>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-body -->
							<!-- ↑資料表區截止 -->


							<!-- 	測試按紐區 待刪-->
							<!-- 							<div> -->
							<%-- 								<form action="<c:url value="/ReporyQueryAllData" />" method="post"> --%>
							<!-- 									<input type="submit" value="查詢所有" name="quiredata"> -->
							<!-- 								</form> -->
							<!-- 							</div> -->
							<!-- 							<div> -->

							<!--測試區 待刪 -->
							<!-- 							</div> -->
							<%-- 														<h1>${title}</h1> --%>
							<%-- 														<p>${subtitle}</p> --%>
							<!-- 							<a href="welcome">回首頁</a> -->
							<%-- 							<h1>${title1}</h1> --%>
							<%-- 							<p>${subtitle1}</p> --%>

							<!-- 下載區 -->
							<div class="rep_downloadbutton">
								<select>
									<option value=" ">請選擇下載格式</option>
									<option value="downloadJson">Json</option>
									<option value="downloadPDF">PDF</option>
									<option value="downloadXml">Xml</option>
								</select>
								<input type="submit" value="下載">

							</div>
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

	</div>

	<script>
		var ctx = document.getElementById('myChart');
		var ctx = document.getElementById('myChart').getContext('2d');
		var ctx = $('#myChart');
		var ctx = "myChart";

		var ctx = document.getElementById('myChart');
		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				
				labels : ['北區','中區','南區'],
				
				datasets : [ {
					backgroundColor : [ 'rgba(255, 99, 132, 0.8)',
							'rgba(54, 162, 235, 0.8)',
							'rgba(255, 206, 86, 0.8)' ],
					borderColor : [ 'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)' ],
					borderWidth : 1,
					label : '銷售業績(百萬)',
					data : [38970,25631,42032]
				
				} ]
			}
		});
	</script>
</body>
</html>