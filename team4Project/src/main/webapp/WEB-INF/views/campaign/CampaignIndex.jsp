<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>活動首頁</title>
    <link rel="stylesheet" href="css/Campaign_index.css">
</head>
<style>
    *{
    /* border:2px solid ; */
    margin:0px;
    padding: 0px;
}

a{
    text-decoration: none;
}

a:visited{
    color:black;
}

.title{
    width: 500px;
    background-color: #2d3e48;
    text-align: center;
    color: white;
    margin: 20px auto 0px;
    border-radius: 10px;
}

.company{
    border-top:2px solid;
    width: 80%;
    margin: 20px auto;
}

.company .camp_section_top{
    width: 500px;
    margin: auto;
    text-align: center;
}

.company .camp_section_bottom{
    width: 100%;
    display:flex;
}

.camp{
	width:calc(100%/3);
	padding:10px
}

.camp .camp_top{
    height: 160px;
    overflow: hidden;
}

.camp_top img{
    width: 100%;
    height: 100%;
}

.camp_top img:hover{
    width: 100%;
    height: 100%;
    transform: scale(1.3);
    transition-duration: .5s;
}

.more_btn{
    display: inline;
    padding: 5px 10px;    
    font-size: 16px;
    border:1px solid ;
    border-radius: 5px;
}

.more_btn:hover{
    background-color: rgb(43, 40, 40);
}

.more_btn:hover>a{
    background-color: rgb(43, 40, 40);
    color: white;
}
</style>

<body>
    <div class="campaign_section">
        <div class="title">
            <h2>商家優惠活動</h2>
        </div>
		
		<c:forEach items="${companys}" var="comp">
	        <div class="company">
	            <div class="camp_section_top">
	                <h2>${comp.companyName}</h2>
	            </div>
	
	            <div class="camp_section_bottom">	                
	                <c:forEach items="${comp.campaigns}" var="campaign">
		                <div class="camp">
		                    <div class="camp_top"><a href=""><img src="${campaign.picturePath}" alt=""></a></div>
		                    <div class="camp_bottom">
		                        <h3 class="camp_date">
		                        <fmt:formatDate value="${campaign.startDateTime}" pattern='yyyy-MM-dd'/> ~
		                        <fmt:formatDate value="${campaign.endDateTime}" pattern='yyyy-MM-dd'/>
		                        </h3>
		                        <h3 class="camp_title"><a href="">${campaign.name}</a></h3>
		                    </div>
		                </div>
	                </c:forEach>
	            </div>
	            
	            <div style="text-align: center;">
	                <div class="more_btn"><a href="${pageContext.request.contextPath}/campaign/index/${comp.id}">查看更多優惠</a></div>
	            </div>
	            
	        </div>
		</c:forEach>
    </div>
</body>
</html>