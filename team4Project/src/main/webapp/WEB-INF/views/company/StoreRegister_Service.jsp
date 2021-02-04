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
	font-size:18px;
}
.main-header .navbar-custom-menu, .main-header .navbar-right {
	height:50px;
	}
body{
	background-color: #ECF0F5;
	}
</style>
</head>
<body>
<div class="rep_reportarea">
		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper" align="center">
 <section>
        <div>
            <div class="container" >
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
<!--                 <div class="thumbnail" style="width: 200px; height: 200px"> -->
                    <div class="caption">
       					<input type="hidden" name="CmpsvId" value="${Cmpsv.id}">
                        <p align="center">
                        <img height="100px" src="<c:url value='/company/getCompanyServiceImage/${Cmpsv.id}'/>" />
                        </p>
                        <p align="center">${Cmpsv.spService}</p>
                        <p align="center"><input id="sv" type="checkbox" name="service" value="${Cmpsv.id}"></p>
                    </div>
<!--                 </div> -->
            </div>
            </c:forEach>
        </div>
    <input id="sub" type="submit" value="登錄"/>
<%-- <a href="<c:url value='/company/ShowStore'/> " >回門市管理頁</a> --%>
<%-- <button type="button" style="height:40px;width:100px;margin-top:10px"><a href="<c:url value='/company/ShowStore'/>" style="font-size:18px">回門市管理頁</a></button> --%>

    </form>
    </section>
<script>
// $('#sub').click(function (e) {
// 	 if (testcheckbox()) {
// 		        $('#button_submit').attr('disabled', true);
// 		    }
// 		    else {
// 		        alert('Username/Password不允許為空值!');
// 		        e.preventDefault();
// 		    }
	
// });

// function testcheckbox(){
// 	var check=$("input[name='service[]']:checked").length;//判斷有多少個方框被勾選
// 	if(check==0){
// 		alert("您尚未勾選任何項目");
// 		return false;//不要提交表單
// 	}else{
// 		alert("你勾選了"+check+"個項目");
// 		return true;//提交表單
// 	}
// }
	

</script>
<%-- <a href="<c:url value='/company/storeRegister'/> " >繼續新增門市</a> --%>
</div>
</div>
</body>
</html>