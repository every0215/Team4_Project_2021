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
<!-- 外掛dataTables -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.5/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.html5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<style>
/* datatable按鈕 */
.dataTables_wrapper .dataTables_paginate {
	float: none;
}

div.dt-buttons {
	position: relative;
	float: right;
	margin-top: 5px;
}

@media ( max-width : 767px) .main-sidebar , . left-side {
	-ms-transform
	
	
	:unset
	
		
	
	
	-o-transform
	
	
	:unset
	
	
	;
}
</style>
<!-- li的藍色標籤 -->
<script>
	$(function() {

		$("#rep_liaction li").click(function() {
			// 			console.log($(this).hasClass('last-element'));
			$(".tab-pane").removeClass("active");
			if ($(this).hasClass('last-element')) {
				// 				$(".tab-pane.tab-2").addClass("active").css("display","inline-block");		
				$(".tab-pane.tab-2").addClass("active");
				$("#rep_data").hide();
			} else {
				$(".tab-pane.tab-1").addClass("active");
				$("#rep_data").show();
			}
			$(this).siblings().removeClass("active").end().addClass("active");
		});

	})
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
								<h3>${singlemember}</h3>
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
						<div class="small-box bg-green" style="height: 100px;">
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
								<li class="active">
									<a id="queryAreaSales">年度各區業績(各店)</a>
								</li>
								<li id="rep_123">
									<a id="queryProdustClass">年度品類銷售</a>
								</li>
								<li>
									<a id="queryActiveSales">年度活動銷售</a>
								</li>

								<li class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" href="#">
										各店項目報表
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li>
											<a id="queryAllStoreSales">各店年度業績/折扣</a>
										</li>
										<li>
											<a id="queryAllActiveSales">各店活動業績</a>
										</li>
										<li>
											<a id="queryAllStorePayment">各店付款方式</a>
										</li>
										<li>
											<a id="queryAllStoreStock">各店無庫存項數(<10)</a>
											<!-- 											<a id="ReporyQueryAllData">全部明細</a> -->
										</li>
									</ul>
								</li>
								<li class='last-element'>
									<!-- 									<a id="rep_adv" href="#rep_tab_8" data-toggle="tab">商品前五名排行(廣告)</a> -->
									<a id="rep_adv" data-toggle="tab">商品前五名排行(廣告)</a>
								</li>
							</ul>

							<!-- 圖表區 -->
							<div class="tab-content">
								<div class="tab-pane tab-1 active" id="rep_tab_1">
									<div id="rep_tab_2"></div>
								</div>
								<!-- 								<div id="chart_container"> -->
								<%-- 									<canvas id="myChart" width="200px" height="50%"></canvas> --%>
								<!-- 								</div> -->
								<div class="tab-pane tab-2">
									<div id="rep_tab_8">
										<jsp:include page="ReportRanking.jsp" flush="true" />
										<jsp:include page="Report_Adv.jsp" flush="true" />
									</div>
								</div>

								<!-- /.tab-pane -->
							</div>
							<!-- /.tab-content -->
						</div>
						<!-- nav-tabs-custom -->
					</div>
					<!-- /.col -->

					<!-- 資料區 -->
					<!-- Left col -->
					<div class="col-md-8" id="rep_data">
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
											<div id="world-map-markers">
												<!-- 資料表區 -->
												<!-- 全部明細 -->
												<div>
													<fieldset class="rep_tabs_db" " style="height: 170px; margin-bottom: 0px;">
														<div id="tabs_1">
															<table id="rep_table" class="table table-striped" style="margin-bottom: 0px; text-align: center;">

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

						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

	</div>

	<!-- 外掛JS檔-顯示圖與ajax -->
	<script src="js/Report_Js.js"></script>

	<script type="text/javascript">
		// 	function myFunc(){
		// 		console.log('123123');
		// 		setTimeout(function(){
		// // 			$("body").html($('#tabs_1').html())
		// 			$('#tabs_1 > table').DataTable({
		// 				scrollY: 20,
		// 				"dom": "Bftlp",
		// 				buttons: [
		// 			        'copy'
		// 			    ]
		//	 			buttons: [
		//	            {
		//	                 extend:'excelHtml5',
		//	                 title: 'Data export',
		//	                 bom:true,
		//	             },
		//	             {
		//	                 extend:'csvHtml5',
		//	                 title: 'Data export',
		//	                 bom:true,
		//	             },

		//	 				'copy'

		//	             ]
		// 			});
		// 		},2000);

		// 	}
		// 		$(function() {
		// 			$("#rep_adv").click(function() {
		// 				console.log("rep_adv")
		// 			})
		// 		});

		// 	function codeInsert(){
		// 		$('#tabs_1 > table').DataTable({
		// 			defaultStyle: {
		// 			    font: 'msyh'
		// 			},
		// 			scrollY: 120,
		// 			"dom": '<"top"if>rt<"bottom"lp>B<"clear">',
		// 			buttons: [
		//             {
		//                 extend: 'pdfHtml5',
		//                 title: 'Data export',
		// 				bom:true

		//             },{
		//                 extend: 'excelHtml5',
		//                 title: 'Data export',
		//                 bom:true
		//             },
		//             ,{
		//                 extend: 'csvHtml5',
		//                 title: 'Data export',
		//                 bom:true
		//             }
		// 				,'copy'

		//             ],
		// 		});
		//	}
	</script>


</body>
</html>