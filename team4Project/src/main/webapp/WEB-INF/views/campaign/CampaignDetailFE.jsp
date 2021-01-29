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
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
  <title>活動頁面</title>

  <style>
    *{
      /* border:1px solid; */
      padding: 0;
      margin: 0;
      margin-bottom: 0;
    }
    
/*     將文件根的字大小設為14px */
    html{
    	font-size:14px 
    }
    
    .camp-section{
      clear:both;
      padding-top:20px;
    }

    .img-part{
      height: 300px;
      margin-bottom:10px;
      overflow: hidden
    }

    .img-part img{
      width: 100%;
      height: 100%;
      cursor: pointer;
    }

    .top-part{
      height: 150px;
      overflow: hidden;
    }

    .bottom-part{
      background-color: #f3f3f3;
    }

    .top-part img{
      width: 100%;
      height: 100%;
      transition: .5s;
      cursor: pointer;
    }

    .top-part img:hover{
      width: 100%;
      height: 100%;
      transform: scale(1.3);
    }

    #container{
      margin-top:50px;
    }

    .date-part{
      margin-bottom:10px;
    }

    .title-part{
      border-bottom:solid 1px black;
    }

    .side-camp{
      padding: 10px 0;
    }

    .side-title{
      text-align: center;
      padding:15px;
      background-color: #bc87d9;
      font-size: 25px;
      color: #fff;
      font-weight: bold;
    }

    .date-part{
      color:#0abbb5;
      font-weight: 900;
    }

    .text-part h5{
      margin: 10px 0px;
    }

    .description-part{
      border-bottom: 1px solid #000;
    }

    .content-part{
      font-size: 16px;
      margin-top:10px;
    }
  </style>
</head>

<body>
        
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
        
  <section class="camp-section">
    <div class="container" id="container">
      <div class="row">
        <div class="col-sm-9">
          <div class="img-part">
            <img src="${camp.picturePath}" alt="">
          </div>
          <div class="text-part">
            <div class="date-part">
            <h4><fmt:formatDate value="${camp.startDateTime}" pattern='yyyy-MM-dd' /> ~
            	<fmt:formatDate value="${camp.endDateTime}" pattern='yyyy-MM-dd' />
            </h4>
            </div>
            <div class="title-part"><h3>${camp.name}</h3><span style="color:red">優惠商家:${camp.company.companyName}</span></div>         
            <div class="description-part"><h5>${camp.description}</h5> </div>
            <div class="content-part">
              <p>${camp.content}</p>
            </div>
          </div>
        </div>

        <div class="col-sm-3">
          <h2  class="side-title" style="">更多優惠</h2>
          <c:forEach items="${sideCamps}" var="sideCamp">
	          <div class="side-camp">
	            <div class="top-part">
	              <a href="<c:url value='/campaign/detail/${sideCamp.id}'/>"><img src="${sideCamp.picturePath}" alt=""></a>      
	            </div>
	            <div class="bottom-part">
	              <div>
	              	<fmt:formatDate value="${sideCamp.startDateTime}" pattern='yyyy-MM-dd' /> ~
	              	<fmt:formatDate value="${sideCamp.endDateTime}" pattern='yyyy-MM-dd' />
	              </div>
	              <div>
	              	${sideCamp.name}
	              </div>
	            </div>
	          </div>
          </c:forEach>
        </div>		
      </div>
    </div>
  </section>
  
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