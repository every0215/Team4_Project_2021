<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<a href="<c:url value='/storeRegister' />">新增門市</a>


<link rel="stylesheet" href="<c:url value='https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css' />">
<script src="<c:url value='https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js' />"></script>

 <div style="width:1000px;margin:0 auto">
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
              <td>${Sto.status}</td>
              
              <td>
<%--                 <input type="hidden" name="typeId" value="${event.typeId}" /> --%>
<!--                 <input type="hidden" name="companyId" value="1" /> -->
<%--                 <input type="hidden" name="eventId" value="${event.id}" /> --%>
                <button class="deleteBtn btn btn-success" onclick="location.href = '<c:url value="/ShowStore/${Sto.id}" />'">修改</button>

              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      </div>




	  <script>
        $(document).ready(function () {
          $('#myTable').DataTable();
        });
      </script>


</body>
</html>