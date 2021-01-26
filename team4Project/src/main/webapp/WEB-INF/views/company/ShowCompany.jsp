<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>合作企業</title>
</head>
<body>
    <section>
        <div>
            <div class="container" style="text-align: center" >
                <h1>合作企業</h1>
            </div>
            <div align='center'>
				<a href="<c:url value='/' />">回首頁</a>
			</div>	
        </div>
    </section>
    
<!--     Logo圖 名字 分類 簡介 -->
    <hr style="height:1px;border:none;color:#333;background-color:#333;">
    <section class="container">
        <div class="row">
        <c:forEach var='Cmp' items='${CompanyList}'>
            <div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
                <div class="thumbnail" style="width: 320px; height: 340px">
                    <div class="caption">
                        <p>
                        <img height="300px" src="<c:url value='/getCompanyimage/${Cmp.id}'/>" />
<%--                             <b style='font-size: 16px;'>${Company.title}</b> --%>
                        </p>
                        <p>${Cmp.companyName}</p>
                        <p>企業類別:${Cmp.categories}</p>
                        <p>簡介: ${Cmp.profiles}</p>
                        <p>
                         <a href="<c:url value='/product?id=${Cmp.id}' />"
    						class="btn btn-primary">
    						<span class="glyphicon-info-sigh glyphicon"></span>詳細資料-OK
 						</a>
                        </p>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </section>
</body>
</html>