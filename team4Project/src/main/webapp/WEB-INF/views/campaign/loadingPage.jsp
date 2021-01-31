<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<meta charset="UTF-8">
<title>載入中</title>
<link rel="stylesheet" href="<c:url value='/css/loading_circle.css'/>">

<style>
	#loading-circle{
          display: flex;
          border:3px black solid;
          border-radius:50%;
          width: 150px;
          height: 150px;
          text-align: center;
          justify-content: center;
          align-items:center ;
          animation: blink 3s infinite linear;
      }

      #loading-circle div{
          padding: 0;
          margin: 0;
          font-size: 24px;
          font-weight: 900;
      }

      #circle-wraper{
          display:inline-block;
          position: absolute;
          left:50%;
          top: 50%;
          transform: translate(-50%,-50%);
      }

      .loading-bg{
          height: 100vh;
          width: 100vw;
          background-color: rgba(248, 248, 248, 0.2);
          z-index: 1000;
          position:absolute;
          top:0;
          left:0;
      }

      @keyframes blink {
          0%{
              opacity:1;
          }

          50%{
              opacity:0;
          }

          100%{
              opacity:1;
          }               
      }
      
      .loading-bg{
      	background-color:rgba(0,0,0,0.1)
      }
      
</style>
</head>


<body>
<div class="loading-bg" style="display:blcok">
        <div id = "circle-wraper">
            <div id="loading-circle">
                <div>Loading</div>
			</div>
		</div>
</div>
<script>
location.href = "<c:url value='/campaign/applyPage/'/>"+${campaignId};
</script>
</body>
</html>