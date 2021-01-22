<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<c:import url="/layout/head" />
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商家活動頁面</title>
    <style>
        *{
            margin: 0px;
            padding: 0px;
            /* border:1px solid; */
            font-family: 微軟正黑體;
        }
		a{
			text-decoration:none;
		}
		
		.camp-section{
			clear:both;
			padding-top:20px
		}
        .header{
            margin:auto;
            text-align:center;
            background-color: rgb(0, 153, 255);
            color: #fff;
        }

        .select_bar{
            display: flex;
            justify-content: center;
            margin:20px auto;
            font-weight: 500;
        }
        
        .select_bar .select_btn{
            padding: 5px 40px;
            margin:0px 10px;
            font-size: 20px;
            border-radius: 5px;
            border:solid 1px rgb(0, 153, 255);
        }

        .select_bar .select_btn:hover{
            cursor: pointer;
            background-color: rgb(0, 153, 255);
            color: #fff;
        }


        .camp{
            width: calc(100%/3);
            padding: 10px;
            box-sizing: border-box;
        }
        .camp_top{
            height: 160px;
            overflow: hidden;
        }

        .camp_top img{
            width: 100%;
            height: 100%;
        }

        .camp_top img:hover{
            transform: scale(1.3);
            transition-duration: .5s;
        }
        
        .title{
            width: 500px;
            background-color: #2d3e48;
            text-align: center;
            color: white;
            margin: 20px auto 0px;
            border-radius: 10px;
            clear:both;
        }

        .camp-container{
            display: flex;
            flex-wrap:wrap;
            width: 80%;
            margin: auto;
            margin-top:20px;
            border-top:solid 2px;
            clear:both;
        }
        
        .more-btn{
            border-radius: 10px;
            text-align: center;
            width: 150px;
            border:dashed 1px;
            margin: auto;
            padding: 5px 10px;
        }
    </style>
</head>
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
<!--     section部分 -->
	<section class="camp-section">
	    <div class="title"><h2 style="padding-bottom:0;color:white">${companyName}</h2></div>
	    
	       <div class="camp-container">
	       	<c:forEach items="${page.content}" var="camp">
				<div class="camp">
					<div class="camp_top">
						<a href="<c:url value='/campaign/detail/${camp.id}'/>"><img src="${camp.picturePath}" alt=""></a>
					</div>
					<div class="camp_bottom">
						<h3 class="camp_date">
							<fmt:formatDate value="${camp.startDateTime}"
									pattern='yyyy-MM-dd' /> ~ 
							<fmt:formatDate value="${camp.endDateTime}" pattern='yyyy-MM-dd' />
						</h3>
						<a href="<c:url value='/campaign/detail/${camp.id}'/>"><h3 class="camp_title">${camp.name}</h3></a>
						
					</div>
				</div>
		    </c:forEach> 
	       </div> 
	             
	    <div class="more-btn">下滑查看更多</div>
    
    </section>
    <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="<c:url value='/js/bootstrap.js' />"></script>
        <!-- SmartMenus jQuery plugin -->
        <script type="text/javascript" src="<c:url value='/js/jquery.smartmenus.js' />"></script>
        <!-- SmartMenus jQuery Bootstrap Addon -->
        <script type="text/javascript" src="<c:url value='/js/jquery.smartmenus.bootstrap.js' />"></script>
        <!-- To Slider JS -->
        <script src="<c:url value='/js/sequence.js' />"></script>
        <script src="<c:url value='/js/sequence-theme.modern-slide-in.js' />"></script>
        <!-- Product view slider -->
        <script type="text/javascript" src="<c:url value='/js/jquery.simpleGallery.js' />"></script>
        <script type="text/javascript" src="<c:url value='/js/jquery.simpleLens.js' />"></script>
        <!-- slick slider -->
        <script type="text/javascript" src="<c:url value='/js/slick.js' />"></script>
        <!-- Price picker slider -->
        <script type="text/javascript" src="<c:url value='/js/nouislider.js' />"></script>
        <!-- Custom js -->
        <script src="<c:url value='/js/custom.js' />"></script>

        <script src="<c:url value='/js/luke_js.js' />"></script>
</body>
</html>