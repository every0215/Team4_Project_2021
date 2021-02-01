<jsp:include page="../crm/backOffice.jsp" flush="true"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>門市服務登錄</title>
<style >
.rep_reportarea {
	background-color: transparent;
	position: absolute;
	width: calc(100vw - 15px);
	height: calc(100vh - 80px);
	bottom: 0px;
	right: 0px;
	font-family:微軟正黑體;
	font-weight:900;
}
</style>
</head>
<body>
<div class="rep_reportarea">
		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper">
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

	<form action="<c:url value='/company/storeServiceRegister'/>" method="post" enctype="multipart/form-data">
        <div class="row" >
    	<input type="hidden" name="CompanyId" value="${sessionScope.company.id}">
        <c:forEach var='Cmpsv' items='${CmpsvList}'>
            <div class="col-sm-6 col-md-3" style="height:200px;width:200px;display:inline-block; float:left">
                <div class="thumbnail" style="width: 200px; height: 200px">
                    <div class="caption">
       					<input type="hidden" name="CmpsvId" value="${Cmpsv.id}">
                        <p>
                        <img height="100px" src="<c:url value='/company/getCompanyServiceImage/${Cmpsv.id}'/>" />
                        </p>
                        <p>${Cmpsv.spService}</p>
                        <p><input type="checkbox" name="service" value="${Cmpsv.id}"></p>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    <input type="submit" value="send"/>
    </form>
    </section>

<a href="<c:url value='/company/storeRegister'/> " >繼續新增門市</a>
<a href="<c:url value='/company/ShowStore'/> " >回門市管理頁</a>
</div>
</div>
</body>
</html>