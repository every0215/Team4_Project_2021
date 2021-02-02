<jsp:include page="../crm/backOffice.jsp" flush="true"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<div class="content-wrapper">
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<%-- <a href="<c:url value='/company/storeRegister' />">新增門市</a> --%>

<button type="button" style="height:40px;width:100px;margin-top:10px"><a href="<c:url value='/company/storeRegister' />" style="font-size:18px">新增門市</a></button>

<link rel="stylesheet" href="<c:url value='https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css' />">
<script src="<c:url value='https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js' />"></script>

 <div style="width:1000px;margin:20px auto">
      <table id="myTable" style="margin: auto;width: 1000px;border:3px #cccccc solid;" cellpadding="10" border='1'>
        <thead>
          <tr>
            <th colspan='6' style="text-align:center;">門市查詢</th>
          </tr>
          <tr>
            <th nowrap="nowrap">門市名稱</th>
            <th nowrap="nowrap">地區</th>
            <th nowrap="nowrap">地址</th>
            <th nowrap="nowrap">開店狀態</th> 
            <th nowrap="nowrap">詳細資料</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="Sto" items="${storeList}">
            <tr>
              <td>${Sto.storeName}</td>
              <td>${Sto.storeArea}</td>
              <td>${Sto.storeAddress}</td>
              <td>
              <c:choose>
              <c:when test="${Sto.status==true}">上架
              </c:when>
              <c:otherwise>下架</c:otherwise>
              </c:choose>
              
              </td>
              
              <td>
<%--                 <input type="hidden" name="typeId" value="${event.typeId}" /> --%>
<!--                 <input type="hidden" name="companyId" value="1" /> -->
<%--                 <input type="hidden" name="eventId" value="${event.id}" /> --%>
                <button class="deleteBtn btn btn-success" onclick="location.href = '<c:url value="/company/ShowStore/${Sto.id}" />'">修改</button>

              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      </div>




	  <script>
        $(document).ready(function () {
          $('#myTable').DataTable(
        		  {
        	  "language" :{
        		     "search" : "查詢: ",
        		     "info" : "",
        		     "sLengthMenu" : "顯示_MENU_筆記錄",
        		                    "zeroRecords" : "沒有符合條件的記錄",
        		                    "infoEmpty": "沒有符合條件的記錄",
        		                    "emptyTable" : "沒有符合條件的記錄",
        		                    "infoFiltered":   "",
        		     "paginate" : {
        		                        sFirst : " 首頁", sLast : "末頁 ", sPrevious : " 上一頁 ", sNext : " 下一頁"
        		                        
        		                     }
        		    }
          }
        		  );
          
        });
      </script>
</div>
</div>

</body>
</html>