<jsp:include page="../crm/backOffice.jsp" flush="true"></jsp:include>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Management</title>
<!-- 外掛css Button Styles -->

<!-- 引入的自定義css -->
<link href="css/styles1.css" rel="stylesheet">

<!-- Table連動 -->


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
								<h3>5000萬</h3>
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
								<h3>10</h3>
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
								<h3>72</h3>
								<p>商品項目數量</p>
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
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#tab_1" data-toggle="tab">年度各區業績(各店)</a>
								</li>
								<li>
									<a href="#tab_2" data-toggle="tab">年度品類銷售</a>
								</li>
								<li>
									<a href="#tab_3" data-toggle="tab">年度活動銷售</a>
								</li>
								<li>
									<a href="#tab_4" data-toggle="tab">商品前十名排行(廣告)</a>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" href="#">
										單項項目報表
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li role="presentation">
											<a role="menuitem" tabindex="-1" href="#tab_5">各店年度業績</a>
										</li>
										<li role="presentation">
											<a role="menuitem" tabindex="-1" href="#tab_6">各店年度折扣</a>
										</li>
										<li role="presentation">
											<a role="menuitem" tabindex="-1" href="#tab_7">各店會員數</a>
										</li>
										<li role="presentation">
											<a role="menuitem" tabindex="-1" href="#tab_8">各店無庫存項數</a>
										</li>
										<li role="presentation">
											<a role="menuitem" tabindex="-1" href="#tab_9">各店付款方式</a>
										</li>
									</ul>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tab_1">
									<b>How to use:</b>
									<p>
										Exactly like the original bootstrap tabs except you should use the custom wrapper
										<code>.nav-tabs-custom</code>
										to achieve this style.
									</p>
									A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with
									my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls
									like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I
									neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I
									never was a greater artist than now.
								</div>
								<!-- /.tab-pane -->
								<div class="tab-pane" id="tab_2">The European languages are members of the same family. Their separate
									existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in
									their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be
									desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform
									grammar, pronunciation and more common words. If several languages coalesce, the grammar of the resulting language
									is more simple and regular than that of the individual languages.</div>
								<!-- /.tab-pane -->
								<div class="tab-pane" id="tab_3">tab_3</div>
								<!-- /.tab-pane -->
								<div class="tab-pane" id="tab_4">tab_4</div>
								<!-- /.tab-pane -->
								<div class="tab-pane" id="tab_5">tab_5</div>
								<!-- /.tab-pane -->
								<div class="tab-pane" id="tab_6">tab_6</div>
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
												<div>
													<fieldset class="rep_tabs_db">
														<div id="tabs_1">
															<table class="table table-striped">
																<thead class="rep_table_font">
																	<tr>
																		<th>報表id</th>
																		<th>公司id</th>
																		<th>門市id</th>
																		<th>門市地區</th>
																		<th>門市名稱</th>
																		<th>商品類別</th>
																		<th>商品id</th>
																		<th>商品名稱</th>
																		<th>銷售日期</th>
																		<th>商品定價</th>
																		<th>商品折扣後價</th>
																		<th>商品銷售數量</th>
																		<th>商品庫存數量</th>
																		<th>付款方式</th>
																		<th>活動項目</th>
																		<th>商品狀態</th>
																	</tr>
																</thead>

																<tbody class="rep_table_font">
																	<c:forEach var="lista" items="${list}">
																		<tr>
																			<td>${lista.reportid}</td>
																			<td>${lista.companyid}</td>
																			<td>${lista.storeid}</td>
																			<td>${lista.storearea}</td>
																			<td>${lista.storename}</td>
																			<td>${lista.productclass}</td>
																			<td>${lista.productname}</td>
																			<td>${lista.salesdate}</td>
																			<td>${lista.salesamount}</td>
																			<td>${lista.productprice}</td>
																			<td>${lista.payment}</td>
																			<td>${lista.activeitem}</td>
																		</tr>
																	</c:forEach>
																</tbody>

															</table>
															<span>table1</span>
														</div>
<!-- 														<div id="tabs_2"> -->
<!-- 															<table class="table table-striped"> -->
<!-- 																<thead class="rep_table_font"> -->
<!-- 																	<tr> -->
<!-- 																		<th>報表id</th> -->
<!-- 																		<th>公司id</th> -->
<!-- 																		<th>門市id</th> -->
<!-- 																		<th>門市地區</th> -->
<!-- 																		<th>門市名稱</th> -->
<!-- 																		<th>商品類別</th> -->
<!-- 																		<th>商品id</th> -->
<!-- 																		<th>商品名稱</th> -->
<!-- 																		<th>銷售日期</th> -->
<!-- 																		<th>商品定價</th> -->
<!-- 																		<th>商品折扣後價</th> -->
<!-- 																		<th>商品銷售數量</th> -->
<!-- 																		<th>商品庫存數量</th> -->
<!-- 																		<th>付款方式</th> -->
<!-- 																		<th>活動項目</th> -->
<!-- 																		<th>商品狀態</th> -->
<!-- 																	</tr> -->
<!-- 																</thead> -->

<!-- 																<tbody class="rep_table_font"> -->
<%-- 																	<c:forEach var="lista" items="${list}"> --%>
<!-- 																		<tr> -->
<%-- 																			<td>${lista.reportid}</td> --%>
<%-- 																			<td>${lista.companyid}</td> --%>
<%-- 																			<td>${lista.storeid}</td> --%>
<%-- 																			<td>${lista.storearea}</td> --%>
<%-- 																			<td>${lista.storename}</td> --%>
<%-- 																			<td>${lista.productclass}</td> --%>
<%-- 																			<td>${lista.productname}</td> --%>
<%-- 																			<td>${lista.salesdate}</td> --%>
<%-- 																			<td>${lista.salesamount}</td> --%>
<%-- 																			<td>${lista.productprice}</td> --%>
<%-- 																			<td>${lista.payment}</td> --%>
<%-- 																			<td>${lista.activeitem}</td> --%>
<!-- 																		</tr> -->
<%-- 																	</c:forEach> --%>
<!-- 																</tbody> -->
<!-- 															</table> -->
<!-- 															<span>table2</span> -->
<!-- 														</div> -->
													</fieldset>
												</div>
											</div>
										</div>

									</div>
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-body -->
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
</body>
</html>