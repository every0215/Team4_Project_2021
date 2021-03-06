<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>滿滿大平台</title>
	<link rel="shortcut icon" type="image/jpg" href="<c:url value='/img/favicon.ico' />"/>
    <!-- Font awesome -->
    <link href="<c:url value='/css/font-awesome.css' />" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="<c:url value='/css/bootstrap.css' />" rel="stylesheet">
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="<c:url value='/css/jquery.smartmenus.bootstrap.css' />" rel="stylesheet">
    <!-- Product view slider -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/jquery.simpleLens.css' />">
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/slick.css' />">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/nouislider.css' />">
    <!-- Theme color -->
    <link id="switcher" href="<c:url value='/css/theme-color/orange-theme.css' />" rel="stylesheet">
    <!-- <link id="switcher" href="css/theme-color/bridge-theme.css" rel="stylesheet"> -->
    <!-- Top Slider CSS -->
    <link href="<c:url value='/css/sequence-theme.modern-slide-in.css' />" rel="stylesheet" media="all">

    <!-- Main style sheet -->
    <link href="<c:url value='/css/style.css' />" rel="stylesheet">

    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
	<script src="https://www.google.com/recaptcha/api.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- 引入的自定義css -->
  	<link href="<c:url value='/css/carousel.css' />" rel="stylesheet">
  	<link href="<c:url value='/css/styles1.css' />" rel="stylesheet" >
	<link href="<c:url value='/css/luke-style.css' />" rel="stylesheet">
		   
  </head>
    
  <style >
	@import 'https://fonts.googleapis.com/css?family=Material+Icons';
	
	.ll-notification-container::-webkit-scrollbar { width: 0 !important }
	
	.ll-notification-container { -ms-overflow-style: none; }
	
	.ll-notification-container { overflow: -moz-scrollbars-none; }
	
	/*會員帳號管理Header呈現*/
	#aa-catg-head-banner .aa-catg-head-banner-area {
    	background-color: rgba(0, 0, 0, 0.4);
	}
	
	#aa-catg-head-banner .aa-catg-head-banner-area .aa-catg-head-banner-content {
    	display: inline-block;
	    float: left;
	    padding: 5% 0;
	    text-align: center;
	    width: 100%;
	}

	#aa-catg-head-banner {
		height:200px;
		overflow: hidden; 
	}
	
	#aa-catg-head-banner img{
		
		
	}
	

	
	/* Header Search Box*/
	#aa-header .aa-header-bottom .aa-header-bottom-area .aa-search-box {
	    float: right;
	    margin-right: 15%;
	    margin-top: 13px;
	    position: relative;
	    width: 500px;
	}
	
	#aa-header .aa-header-top {
/* 		margin-top: 6px; */
	}
	
  </style>
  