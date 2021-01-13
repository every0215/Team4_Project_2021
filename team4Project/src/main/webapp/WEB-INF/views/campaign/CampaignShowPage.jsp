<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.1/moment.min.js"></script>

<title>活動查詢</title>
<style>
	.title {
		text-align: center;
	}

	.btnForm {
		display: inline-block;
	}

	ul.functionBar{
		list-style: none;
		display: flex;
		justify-content: center;
	}

	ul.functionBar li{
		padding: 0 20px;
	}

	#pageSelector{
		width: 50px;
		font-size: 18px;
	}

	#container{
		width: 1400px;
	}
	
	tr>td>button{
		margin:0 3px;
	}
</style>

<script type="text/javascript">


</script>
</head>

<body>
<!-- 	存放companyId -->
	<input id="companyId" type="hidden" value="1">  

	<ul class="functionBar">

		<li><button id="addBtn" class="btn btn-success" type="button">新增活動</button></li>

		<li><span>查詢活動:</span><input type="text" name=""></li>

		<li>
			<select class="form-control" name="queryType">
				<option value="">狀態</option>
				<option value="">上架</option>
				<option value="">下架</option>
				<option value="">進行中</option>
			</select>
		</li>

		<li>
			<label for="">開始時間：</label>
			<input type="date">
		</li>

		<li>
			<label for="">結束時間：</label>
			<input type="date">
		</li>

		
		<li><button id="queryBtn" class="btn btn-success" type="submit">查詢</button></li>
	</ul>

	<div id="container" class="container">
		
		<h2 class="title">活動總覽</h2>
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

			<tbody id="CampContainer">
			
			<c:forEach items="${camps}" var="camp">
				<tr>
					<td>${camp.name}</td>
					<td><fmt:formatDate value="${camp.startDateTime}" pattern='yyyy-MM-dd HH:mm:ss'/></td>
					<td><fmt:formatDate value="${camp.endDateTime}" pattern='yyyy-MM-dd HH:mm:ss'/></td>
					<c:if test="${camp.launchStatus}"><td>上架</td></c:if>
					<c:if test="${!camp.launchStatus}"><td>下架</td></c:if>
					<td>${camp.description}</td>
					<td style="font-size:0;">
						<button class="btn btn-success">編輯</button>
						<button class="btn btn-success">下架</button>
						<button class="btn btn-success">套用</button>
					</td>
				</tr>
			</c:forEach>


			</tbody>
		</table>
		<select name=page id="pageSelector">
		
		</select>
		<h4>共X筆資料</h4>

	</div>

	<script>
	
		
		
		$(function(){
			
			$("#addBtn").click(function(){
				location.href = "<c:url value='/campaign/insertPage'/>"
			})
			
			$.ajax({
				url : "<c:url value='/campaign/getPageByCompany/"+${1}+"/1' />",
				dataType : "json", 
				type : "GET",
				success : function(data) {
					console.log(data);
					console.log(data.totalPage)
					var selectionTemp = "";
					for(var i=1;i<=data.totalPage;i++){
						var optionTemp = "<option value="+i+">"+i+"</option>"
						selectionTemp += optionTemp;
					}
					$("select[name='page']").html(selectionTemp);
				}
			})
			
			$("select[name='page']").change(function(){
				var page = $(this).children(":selected").val();		
				$.ajax({
					url : "<c:url value='/campaign/getPageByCompany/"+ ${1} +"/"+page+"' />",
					dataType : "json", 
					type : "GET",
					success : function(data) {
						console.log(data)
						var camps = data.page;
						var properties = ["name","startDateTime","endDateTime","launchStatus","description"];
						var btns = ["編輯","下架","套用"];
						$("#CampContainer").html("")
						for(var i=0;i<camps.length;i++){
							var tr = document.createElement("tr")
							for(property of properties){
								if(property == "startDateTime" || property=="endDateTime"){
									camps[i][property] = new moment(camps[i][property]).format('YYYY-MM-DD HH:mm:ss');
								}
								if(property == "launchStatus"){
									camps[i][property] = camps[i][property]?"上架":"下架";
								}
								var td = document.createElement("td")
								td.innerText = camps[i][property];
								tr.append(td);							
							}
							var btnTd = document.createElement("td");
							for(btn of btns){
								var button = document.createElement("button");
								$(button).addClass("btn btn-success").text(btn);
								btnTd.append(button);		
							}
							tr.append(btnTd);
							$("#CampContainer").append(tr);				
						}
					},
				})
			})
			
		})
		
		// window.onload = function () {
		// 	var xhr = new XMLHttpRequest();
		// 	xhr.open("GET", "/proj/camaign/getPage", true);
		// 	xhr.send();
		// 	xhr.onreadystatechange = function () {
		// 		if (xhr.readyState == 4 && xhr.status == 200) {
		// 			var pageSelectObj = document.getElementById("pageSelect");
		// 			var responseData = xhr.responseText;
		// 			var mapData = JSON.parse(responseData);
		// 			var totalPage = mapData.totalPage;
		// 			var options = "";
		// 			for (var i = 1; i <= totalPage; i++) {
		// 				options += "<option value=" + i + ">" + i + "</option>"
		// 			}
		// 			pageSelectObj.innerHTML += options;
		// 		}
		// 	}



		// 	var pageSelectObj = document.getElementById("pageSelect");

		// 	pageSelectObj.onchange = function () {
		// 		var xhr2 = new XMLHttpRequest();
		// 		var pageNum = this.value;
		// 		console.log(pageNum);
		// 		xhr2.open("GET", "/proj/camaign/getPage" + "?page=" + pageNum, true);
		// 		xhr2.send();
		// 		xhr2.onreadystatechange = function () {
		// 			if (xhr2.readyState == 4 && xhr2.status == 200) {
		// 				var reponseData = xhr2.responseText;
		// 				var mapData = JSON.parse(reponseData);
		// 				display(mapData)
		// 			}
		// 		}

		// 	}

// 			function display(map) {
// 				var camps = map.page;
// 				console.log(camps)
// 				var campsRows = "";
// 				for (let camp of camps) {
// 					console.log(camp)
// 					var row = "<tr>";

// 					row += "<td>" + camp.title + "</td>";
// 					var startTime = new Date(camp.startTime);
// 					row += "<td>" + startTime.getFullYear() + "年" + (startTime.getMonth() + 1) + "月" + startTime.getDate() + "日" + "</td>";
// 					row += "<td>" + new Date(camp.endTime) + "</td>";

// 					if (camp.status)
// 						row += "<td>上架</td>";
// 					else
// 						row += "<td>下架</td>";

// 					row += "<td>" + camp.description + "</td>";
// 					row += "</tr>"
// 					campsRows += row;
// 				}
// 				document.getElementById("CampContainer").innerHTML = campsRows;

// 			}

// 		}
	</script>

</body>

</html>