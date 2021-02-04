<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js"></script>

    <style>
        *{
            /* border:solid 1px; */
        }
        
        body{
        	background-color: #f3f3f3;
        }

        .head h3{
            text-align: center;
            margin: 0px auto;
            font-weight:900;
        }

        .functionBar{
            text-align: center;
        }

        #container{
            margin-top:30px;
            border:solid 1px black;
            width: 800px;
            border-radius:10px;
            box-shadow: 0px 0px 10px black;
            font-family: 微軟正黑體;
    		font-weight: 900;
        }

        #container .row{
            word-wrap: break-word;
        }
        
        #container h3{
        	color:white;
        }

        .row{
           padding:20px;
           border-bottom:solid 1px;
        }

        .picturdField img{
            width: 100%;
            height: 200px;
        }
        
        .head{
        	background-color: #54959f;
        }
        
        
    </style>
    <title>確認頁面</title>
</head>


<body>
    
    <div id="container" class="container">
    
        <div class="row head">
        	<c:if test="${!empty isInsert}">
        		<h3>新增成功</h3>
        	</c:if>
            <c:if test="${!empty isUpdate}">
        		<h3>修改成功</h3>
        	</c:if>
        	<c:if test="${empty isUpdate && empty isInsert}">
        		<h3>活動詳情</h3>
        	</c:if>
        </div>
        
        <div class="row">
            <div class="col-4">活動名稱:</div>
            <div class="col-8">${camp.name}</div>
        </div>
        
        <div class="row">
            <div class="col-4">活動開始時間:</div>
            <div class="col-8"><fmt:formatDate value="${camp.startDateTime}" pattern='yyyy-MM-dd HH:mm:ss'/></div>
        </div>
        
        <div class="row">
            <div class="col-4">活動結束時間:</div>
            <div class="col-8"><fmt:formatDate value="${camp.endDateTime}" pattern='yyyy-MM-dd HH:mm:ss'/></div>
        </div>
        
        <div class="row">
            <div class="col-4">折扣類型:</div>
            <c:choose>
            	<c:when test="${camp.discountParams.type==1}">
            		<div class="col-8">折扣</div>
            	</c:when>
            	<c:when test="${camp.discountParams.type==2}">
            		<div class="col-8">滿額折</div>
            	</c:when>
            	<c:otherwise>
            		<div class="col-8">無類型</div>
            	</c:otherwise>           	
            </c:choose>
            
        </div>
        
        <c:if test="${camp.discountParams.type == 1}">
        	<div class="row">
	        	<div class="col-4">折扣參數:</div>
	            <div class="col-8">${camp.discountParams.offParam}</div>
            </div>
        </c:if>
        
        <c:if test="${camp.discountParams.type == 2}">
        	<div class="row">
	        	<div class="col-4">滿額:</div>
	            <div class="col-8">${camp.discountParams.amountUpTo}</div>
	        	<div class="col-4">折扣金額:</div>
	            <div class="col-8">${camp.discountParams.amountOffParam}</div>
       		</div>
		</c:if>
        
        <div class="row">
            <div class="col-4">活動描述:</div>
            <div class="col-8">${camp.description}</div>
        </div>
        
        <div class="row">
            <div class="col-4">活動內容:</div>
            <div class="col-8" style="">${camp.content}</div>
        </div>
        
        <div class="row">
            <div class="col-4">上架狀態:</div>
            <c:if test="${camp.launchStatus}">
            	<div class="col-8">上架</div>
            </c:if>
            <c:if test="${!camp.launchStatus}">
            	<div class="col-8">下架</div>
            </c:if>
        </div>
        
        <div class="row picturdField">
            <div class="col-4">活動圖片:</div>
            <div class="col-8" ><a href="${camp.picturePath}"><img src="${camp.picturePath}"/></a></div>
        </div> 
        
        <div class="functionBar">
        	<button style="margin-top: 10px"class="btn btn-primary" onclick="window.close()">返回</button>	
        </div>
    </div>
</body>
</html>