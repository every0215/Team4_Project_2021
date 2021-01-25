<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/layout/head" />
<c:import url="/layout/header" />     
<c:import url="/layout/footer" />  
</head>
<body>
 

	<c:forEach var="product" items="${ProductList}">
              <div class="col-sm-4">
                <div class="panel panel-primary" onclick="location.href = '*'">
                  <div class="panel-heading">${product.productName}</div>
                  <div class="panel-body"><img src="<c:url value='/getproductimage/${product.productId}'/>" class="img-responsive"
                      style="width:100%;height:164px" ></div>
                  <div class="panel-footer" style="text-align:left;font-size:13px;">價錢: ${product.productPrice}</div>
                </div>
              </div>
</c:forEach>         
<footer></footer>
</body>
</html>