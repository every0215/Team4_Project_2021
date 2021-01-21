<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
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

        .campaign_cotainer{
            width: 1000px;
            margin:auto;
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
        }

        .camp-container{
            display: flex;
            flex-wrap:wrap;
            width: 80%;
            margin: auto;
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

    <div class="title"><h2>商店名稱</h2></div>
    
       <div class="camp-container">
       	<c:forEach items="${page.content}" var="camp">
			<div class="camp">
				<div class="camp_top">
					<a href=""><img src="${camp.picturePath}" alt=""></a>
				</div>
				<div class="camp_bottom">
					<h3 class="camp_date">
						<fmt:formatDate value="${camp.startDateTime}"
								pattern='yyyy-MM-dd' /> ~ 
						<fmt:formatDate value="${camp.endDateTime}" pattern='yyyy-MM-dd' />
					</h3>
					<a></a>
					<h3 class="camp_title">${camp.name}</h3>
				</div>
			</div>
	    </c:forEach> 
       </div> 
             
    <div class="more-btn">下滑查看更多</div>
</body>
</html>