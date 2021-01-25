<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <section>
        <div>
            <div class="container" style="text-align: center" >
                <h1>企業服務</h1>
            </div>	
        </div>
    </section>
    
    <hr style="height:1px;border:none;color:#333;background-color:#333;">
    <section class="container">
        <div class="row">
        <c:forEach var='Cmpsv' items='${ServiceList}'>
            <div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
                <div class="thumbnail" style="width: 320px; height: 340px">
                    <div class="caption">
                        <p>
                        <img height="300px" src="<c:url value='/company/getCompanyimage/${Cmp.id}'/>" />

                        </p>
                        <p>${Cmp.companyName}</p>
                        <p>企業類別:${Cmp.categories}</p>
                        <p>簡介: ${Cmp.profiles}</p>
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