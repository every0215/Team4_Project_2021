<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    
    
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
<%--     <link href="<c:url value='${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css" /> --%>
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="<c:url value='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="<c:url value='http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css'/>" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
<%--     <link href="<c:url value='${pageContext.request.contextPath}/plugins/morris/morris.css'/>" rel="stylesheet" type="text/css" /> --%>
    <link href="<c:url value='/plugins/morris/morris.css'/>" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
<%--     <link href="<c:url value='${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css'/>" rel="stylesheet" type="text/css" /> --%>
    <link href="<c:url value='/plugins/jvectormap/jquery-jvectormap-1.2.2.css'/>" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
<%--     <link href="<c:url value='${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker-bs3.css'/>" rel="stylesheet" type="text/css" /> --%>
    <link href="<c:url value='/plugins/daterangepicker/daterangepicker-bs3.css'/>" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
<%--     <link href="<c:url value='${pageContext.request.contextPath}/dist/css/AdminLTE.min.css'/>" rel="stylesheet" type="text/css" /> --%>
    <link href="<c:url value='/dist/css/AdminLTE.min.css'/>" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<%--     <link href="<c:url value='${pageContext.request.contextPath}/dist/css/skins/_all-skins.min.css'/>" rel="stylesheet" type="text/css" /> --%>
    <link href="<c:url value='/dist/css/skins/_all-skins.min.css'/>" rel="stylesheet" type="text/css" />


</head>

<body class="skin-blue">
    <div class="wrapper" style="background-color: #ECF0F5;">

        <header class="main-header" style="color:orange;height:80px">
            <!-- Logo -->

            <a href="#" class="logo" style="width: 240px; height: 80px;margin:0px;padding:0px"><img src="<c:url value='/dist/img/luckycat.png'/>" class="img-circle" alt="logo" /><b>  滿滿大</b>廠商系統</a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" style="margin-left: 240px;height: 80px;" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button" style="padding: 30px 0px;height:80px;margin-right: 0px;">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <!-- Navbar Right Menu -->
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- Notifications: style can be found in dropdown.less -->
                        <li class="dropdown notifications-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="height:80px;margin:0px;padding:30px 20px">
                                <i class="fa fa-bell-o"></i>
                                <span class="label label-warning" style="background:red">10</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">You have 10 notifications</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the page and may cause design problems
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-users text-red"></i> 5 new members joined
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#">
                                                <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-user text-red"></i> You changed your username
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="#">View all</a></li>
                            </ul>
                        </li>
                        <!-- Tasks: style can be found in dropdown.less -->

                        <!-- User Account: style can be found in dropdown.less -->
                        <ul class="nav navbar-nav navbar-right"></ul>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<c:url value='/company/getCompanyimage/${sessionScope.company.id}'/>" alt="demo demo" title="demo" id="user-profile" class="img-circle" height="45" /> &nbsp;&nbsp;${sessionScope.company.companyName} <i class="fa fa-caret-down fa-fw"></i></a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li><a href="#"><i class="fa fa-book fa-fw" aria-hidden="true"></i>你的帳號</a></li>
                                <li role="separator" class="divider"></li>

                                <li class="dropdown-header">Help</li>

                                <li><a href="#" target="_blank"><i class="fa fa-long-arrow-left fa-fw" aria-hidden="true"></i>聯絡我們</a></li>
                            </ul>
                        </li>
                        <li><a href="<c:url value='/company/Logout' />"><i class="fa fa-sign-out fa-3x"></i></a></li>
                    </ul>


                </div>
            </nav>
        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar" style="background:#222d32;width:200px;top:80px;border:0px">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu">
                    <li></li>
                    <li>
                        <a href="<c:url value='/ProductIndex' />">
                            <i class="fa fa-th"></i> <span>商品管理</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-check-square-o"></i> <span>訂單管理</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="<c:url value='/campaign/boIndex/1' />">
                            <i class="fa fa-bullhorn"></i>
                            <span>活動管理</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="<c:url value='/TicketIndex' />">
                        
                            <i class="fa fa-ticket"></i>
                            <span>票券管理</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="<c:url value='/company/ShowStore' />">
                            <i class="fa fa-map-marker"></i> <span>門市管理</span>
                        </a>
                    </li>

                    <li class="treeview">
                        <a href="<c:url value='/reportin' />">
                        
                            <i class="fa fa-files-o"></i>
                            <span>報表管理</span>
                        </a>
                    </li>
                    
                    <li class="treeview">
                        <a href="<c:url value='/cs/loginpage' />">
                        
                            <i class="fa fa-files-o"></i>
                            <span>客服系統</span>
                        </a>
                    </li>
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<!--         測試用記得刪 -->
<<<<<<< HEAD
<!-- 		<div  style="top:500px;left:600px;background-color:yellow"> -->
<%-- 		<a href="<c:url value='/CompanyInfo' />">修改企業資訊 </a> --%>
<!-- 		</div> -->
<!-- 		<div  style="top:500px;left:600px;background-color:yellow"> -->
<%-- 		<a href="<c:url value='XXX' />">新增企業簡介 </a> --%>
<!-- 		</div> -->
<!-- 		<div  style="top:500px;left:600px;background-color:yellow"> -->
<%-- 		<a href="<c:url value='XXX' />">新增企業服務 </a> --%>
<!-- 		</div> -->
=======
		<div  style="top:500px;left:600px;background-color:yellow">
		<a href="<c:url value='/company/CmpRegi' />">修改企業資訊 </a>
		</div>
		<div  style="top:500px;left:600px;background-color:yellow">
		<a href="<c:url value='/company/CompanyProfiles' />">新增企業簡介 </a>
		</div>
		<div  style="top:500px;left:600px;background-color:yellow">
		<a href="<c:url value='/company/CompanyServiceRegister' />">新增企業服務 </a>
		</div>
>>>>>>> master
		
        <!-- Right side column. Contains the navbar and content of the page -->

        <!-- /.content-wrapper -->

    </div>
    <!-- ./wrapper -->
    <!-- jQuery 2.1.3 -->
    <script src="<c:url value='/plugins/jQuery/jQuery-2.1.3.min.js'/>"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='<c:url value='/plugins/fastclick/fastclick.min.js'/>'></script>
    <!-- AdminLTE App -->
    <script src="<c:url value='/dist/js/app.min.js'/>" type="text/javascript"></script>
    <!-- Sparkline -->
    <script src="<c:url value='/plugins/sparkline/jquery.sparkline.min.js'/>" type="text/javascript"></script>
    <!-- jvectormap -->
    <script src="<c:url value='/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'/>" type="text/javascript"></script>
    <!-- daterangepicker -->
    <script src="<c:url value='/plugins/daterangepicker/daterangepicker.js'/>" type="text/javascript"></script>
    <!-- datepicker -->
    <script src="<c:url value='/plugins/datepicker/bootstrap-datepicker.js'/>" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="<c:url value='/plugins/iCheck/icheck.min.js'/>" type="text/javascript"></script>
    <!-- SlimScroll 1.3.0 -->
    <script src="<c:url value='/plugins/slimScroll/jquery.slimscroll.min.js'/>" type="text/javascript"></script>
    <!-- ChartJS 1.0.1 -->
    <script src="<c:url value='/plugins/chartjs/Chart.min.js'/>" type="text/javascript"></script>

    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="<c:url value='dist/js/pages/dashboard2.js'/>" type="text/javascript"></script>

    <!-- AdminLTE for demo purposes -->
    <script src="<c:url value='dist/js/demo.js'/>" type="text/javascript"></script>
</body>

</html>