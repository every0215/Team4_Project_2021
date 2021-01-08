<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="Bootstrap.jsp"></jsp:include>

<title>活動查詢</title>
<style>

.title{	
	text-align:center;
}

.btnForm{
	display:inline-block;
}

</style>

<script type="text/javascript">


</script>
</head>
<body>

<jsp:include page="nav.jsp"></jsp:include>

<div class="container">
  <h1 class="title">查詢的活動</h1>            
  <table id="CampTable" class="table table-dark table-striped">
    <thead>
      <tr>
        <th>活動名稱</th>
        <th>開始時間</th>
        <th>結束時間</th>
        <th>狀態</th>
        <th>活動描述</th>
        <th>操作</th>
      </tr>
    </thead>
    <c:set var="count" value="0"/>
    <tbody id="CampContainer">
    <c:forEach var="camp" items="${camps}">
      <c:set var="count" value="${count+1}"/>
      <tr>
        <td>${camp.title}</td>
        <td>${camp.startTime}</td>
        <td>${camp.endTime}</td>
        <c:if test="${camp.status}">
        	<td>上架</td>
        </c:if>
        <c:if test="${!camp.status}">
        	<td>下架</td>
        </c:if>  
        <td>${camp.description}</td>
        <td>       
        
       	<input  name="campId" value="${camp.id}" type="hidden" />
       	<button class="deleteBtn btn btn-success del-btn" onclick="location.href = '<c:url value="/CampaignDel/${camp.id}"/>'">刪除</button>      
       	
       	<button class="deleteBtn btn btn-success" >修改</button>
      
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  <select name=page id="pageSelect">
  
  </select>
  <h4>共${count}筆資料</h4>
  
</div>

<img alt="" src="http://localhost:8080/proj//camaign/pic/28">
<script>
	
	window.onload = function(){
		var xhr = new XMLHttpRequest();
		xhr.open("GET","<c:url value='/camaign/getPage'/>",true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4 && xhr.status==200){
				var pageSelectObj = document.getElementById("pageSelect");
				var responseData = xhr.responseText;
				var mapData = JSON.parse(responseData);
				var totalPage = mapData.totalPage;
				var options = "";
				for(var i=1;i<=totalPage;i++){
					options += "<option value="+i+">"+ i +"</option>"
				}
				pageSelectObj.innerHTML += options;
			}		
		}
		
		
		
		var pageSelectObj = document.getElementById("pageSelect");
		
		pageSelectObj.onchange = function(){
			var xhr2 = new XMLHttpRequest();
			var pageNum = this.value;
			console.log(pageNum);
			xhr2.open("GET","<c:url value='/camaign/getPage'/>"+"?page="+pageNum,true);
			xhr2.send();
			xhr2.onreadystatechange = function(){
				if(xhr2.readyState==4 && xhr2.status==200){
					var reponseData = xhr2.responseText;
					var mapData = JSON.parse(reponseData);
					display(mapData)
				}
		}
		
	}
		
	function display(map){
		var camps = map.page;
		console.log(camps)
		var campsRows = "";
		for (let camp of camps){
			console.log(camp)
			var row="<tr>";
			
			row += "<td>" + camp.title + "</td>";
			var startTime = new Date(camp.startTime);
			row += "<td>" +startTime.getFullYear()+"年"+(startTime.getMonth()+1)+"月"+startTime.getDate()+"日"+"</td>";
			row += "<td>" + new Date(camp.endTime) + "</td>";
			
			if(camp.status)
				row += "<td>上架</td>";
			else
				row += "<td>下架</td>";
				
			row += "<td>" + camp.description + "</td>";
			row+="</tr>"
			campsRows+=row;
		}
		document.getElementById("CampContainer").innerHTML = campsRows;
		
	}
	
 }
</script>
	
</body>
</html>