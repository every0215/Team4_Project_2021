<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<a href="<c:url value='/XXX' />">新增門市</a>
秀查詢門市 依分類 依地區 用Ajax寫
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>





<script>
        $(document).ready(function () {
          $('#myTable').DataTable();
        });
      </script>


</body>
</html>