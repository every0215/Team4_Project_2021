<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>門市服務登錄</title>
</head>
<body>
 <section>
        <div>
            <div class="container" style="text-align: center" >
                <h1>企業服務</h1>
            </div>	
        </div>
    </section>
<!--     GET帶服務資訊進來，POST帶勾選的服務進去 -->
    <hr style="height:1px;border:none;color:#333;background-color:#333;">
    <section class="container">
    <input type="hidden" name="CompanyId" value="${sessionScope.company.id}">
<%--     ${sessionScope.company.id} --%>
        <div class="row">
        <c:forEach var='Cmpsv' items='${CmpsvList}'>
        <input type="hidden" name="CmpsvId" value="${Cmpsv.id}">
            <div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
                <div class="thumbnail" style="width: 320px; height: 340px">
                    <div class="caption">
                        <p>
                        <img height="100px" src="<c:url value='/company/getCompanyServiceImage/${Cmpsv.id}'/>" />

                        </p>
                        <p>${Cmpsv.spService}</p>
                        
                        <p>

                        </p>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </section>








<a href="<c:url value='/company/ShowStore'/> " >回門市管理頁</a>
</body>
</html>