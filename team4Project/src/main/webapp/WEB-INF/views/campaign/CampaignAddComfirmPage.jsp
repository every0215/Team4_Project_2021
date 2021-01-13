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

        .head h3{
            text-align: center;
            margin: 10px auto;
        }

        .functionBar{
            text-align: center;
        }

        #container{
            margin-top:30px;
            border:solid 1px black;
            width: 800px;
            border-radius:10px;
        }

        #container .row{
            word-wrap: break-word;
        }

        .row{
           padding:20px;
           border-bottom:solid 1px;
        }

        .picturdField img{
            width: 300px;
            height: 150px;
        }
        
    </style>
    <title>確認頁面</title>
</head>


<body>
    
    <div id="container" class="container">
    
        <div class="row head">
            <h3>新增成功</h3>
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
            <div class="col-8" ><img src="${pageContext.request.contextPath}/campaign/pic/${camp.id}"/></div>
        </div>
        
        <div class="functionBar">
            <button class="btn btn-primary">返回</button>
        </div>
    </div>
</body>
</html>