<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>票券主頁</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!--   =============TSET============= -->




</head>


<body>
	<div class="jumbotron text-center">
		<h1>E-Ticket票券系統</h1>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/lib$(document).ready( function () {
    	$('#table_id').DataTable();
		} );s/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>

	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
	<script
		src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
		
	<div style="width: 1000px; margin: 0 auto">
	<a href='<c:url value="ticket/InputPageEX" />' class="btn btn-success" role="button">新增票券</a>
	<br/><br/>
		<table id="myTable"
			style="margin: auto; width: 900px; border: 3px #cccccc solid;"
			cellpadding="10" border='1'>
			<thead>
				<tr>
					<th colspan='6' style="text-align: center;">票券一覽表</th>
				</tr>
				<tr>
<!-- 					<th nowrap="nowrap">序號</th> -->
					<th nowrap="nowrap"><svg xmlns="http://www.w3.org/2000/svg"
							width="16" height="16" fill="currentColor"
							class="bi bi-ui-checks-grid" viewBox="0 0 16 16">
                <path
								d="M2 10h3a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1zm9-9h3a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-3a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zm0 9a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h3a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1h-3zm0-10a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h3a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2h-3zM2 9a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h3a2 2 0 0 0 2-2v-3a2 2 0 0 0-2-2H2zm7 2a2 2 0 0 1 2-2h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2h-3a2 2 0 0 1-2-2v-3zM0 2a2 2 0 0 1 2-2h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm5.354.854a.5.5 0 1 0-.708-.708L3 3.793l-.646-.647a.5.5 0 1 0-.708.708l1 1a.5.5 0 0 0 .708 0l2-2z" />
              </svg> 票券類別</th>
					<th nowrap="nowrap">名稱</th>
					<th nowrap="nowrap"><svg width="1em" height="1em"
							viewBox="0 0 16 16" class="bi bi-geo-alt" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
								d="M12.166 8.94C12.696 7.867 13 6.862 13 6A5 5 0 0 0 3 6c0 .862.305 1.867.834 2.94.524 1.062 1.234 2.12 1.96 3.07A31.481 31.481 0 0 0 8 14.58l.208-.22a31.493 31.493 0 0 0 1.998-2.35c.726-.95 1.436-2.008 1.96-3.07zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
                <path fill-rule="evenodd"
								d="M8 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
              </svg> 地點</th>
              <th>狀態</th>
					<th nowrap="nowrap"><svg xmlns="http://www.w3.org/2000/svg"
							width="16" height="16" fill="currentColor"
							class="bi bi-card-image" viewBox="0 0 16 16">
                <path
                  d="M1.5 2A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13zm13 1a.5.5 0 0 1 .5.5v6l-3.775-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12v.54A.505.505 0 0 1 1 12.5v-9a.5.5 0 0 1 .5-.5h13z" />
              </svg>
              宣傳圖片
            </th>
            <th nowrap="nowrap">票券細節</th>
          </tr>
        </thead>
        <tbody>

          <c:forEach var="event" items="${events}">
            <tr>
<%--               <td>${event.id}</td> --%>
              <td>
  
               <c:choose>
               	 <c:when test="${event.typeId==1}">展覽
               	 </c:when>
               	 <c:when test="${event.typeId==2}">樂園與景點
               	 </c:when>
               	 <c:otherwise>運動賽事</c:otherwise>
                 </c:choose>
              </td>
              <td>${event.eventName}</td>
              <td>${event.eventLocation}</td>
              <td>
              <c:choose>
               	 <c:when test="${event.status==1}">上架
               	 </c:when>
               	 
               	 <c:otherwise>下架</c:otherwise>
                 </c:choose>
              
              </td>
              <td><img height="150px" src="<c:url value='/geteventimage/${event.id}'/>" /></td>
              <td>
                <input type="hidden" name="typeId" value="${event.typeId}" />
                <input type="hidden" name="eventId" value="${event.id}" />
                <button class="deleteBtn btn btn-success" onclick="location.href = '<c:url value="/EventShow/${event.id}" />'">See More</button>
               
                
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      </div>

	<script>
		$(document).ready(function() {
			$('#myTable').DataTable({
				"lengthMenu": [4, 8]
			});

			
		});
		
		
		
	</script>

	
</body>

</html>