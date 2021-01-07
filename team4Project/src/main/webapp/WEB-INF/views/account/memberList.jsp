<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="com.web.store.account.javabean.MemberBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員註冊</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="<c:url value='/js/DateFormat.js' />"></script>

<style>
body {
	background-repeat: repeat;
	font-weight: bold;
}

.hint {
	color: grey;
	font-size: 12px;
}

#RegisterDiv form {
	margin: 0px;
	margin-top: 20px;
	box-shadow: 5px 5px 5px rgb(160, 160, 160);
	padding: 50px;
}

span.note {
	color: #888;
	font-size: 10px;
}
</style>
</head>
<body>
	<c:import url="/layout/lukeTop" />
	<div id="RegisterDiv" class="container">
		<form id="RegisterForm" action="AccountServlet.do" method="post">
			<fieldset>
				<legend>
					<h2>會員清單</h2>
				</legend>
				<div id="msg" class='alert' role='alert' >已成功刪除會員(Id:??)</div>
				<table id ="Table" class="table table-hover">
					
				</table>
				<input type="hidden" id="memberId" name="memberId" value="" /> <input
					type="hidden" id="action" name="action" value="" />
				<button type="submit" id="RegisterSubmit" class="btn btn-primary">送出</button>
				<button type="reset" id="reset" class="btn btn-primary">清除</button>
			</fieldset>
			<hr>

		</form>


		<div></div>
	</div>

	<div id="MemberListDiv" class="container"></div>
	<script>
		console.log((new Date()).format("yyyy-MM-dd hh:mm:ss"));

		window.onload = function() {
			var table = document.getElementById("Table")
			var result = document.getElementById("MemberListDiv")
			
			var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/member/getMemberList' />", true);
				xhr.send();

				xhr.onreadystatechange = function() {
					// 向伺服器提出的請求已經收到回應
					if (xhr.readyState === 4) {
						// status: HTTP通訊協定的狀態碼伺服器，
						// 200表示Server成功的處理請求
						if (xhr.status === 200) {
							// getResponseHeader: 取得回應內容的MIME Type
							var type = xhr.getResponseHeader("Content-Type");
							// 判斷回應類型，這裡使用 JSON
							if (type.indexOf("application/json") === 0) {
								var obj = JSON.parse(xhr.responseText);
								if (obj!= undefined) {
									result.innerHTML =  xhr.responseText;
									var tableHtml = "<thead><tr><th>姓名</th><th>暱稱</th><th>電子郵件</th><th>建立日期</th><th></th></tr></thead><tbody>";
									for(i=0;i<obj.length;i++){
										
										tableHtml+="<tr><td>"+ obj[i].fullname+"</td>"
										+"<td>"+obj[i].nickname+"</td>"
										+"<td>"+obj[i].email+"</td>"
										+"<td>"+( new Date(obj[i].createdDate)).format("yyyy-MM-dd hh:mm:ss")+"</td>"
										+"<td><button type='button' class='editbutton btn btn-primary' data-id='"+obj[i].id+"' >編輯</button>"
										+"<button type='button' class='deletebutton btn btn-danger' data-id='"+obj[i].id+"' >刪除</button></td></tr>"
									}
									tableHtml+="</tbody>";
									table.innerHTML = tableHtml;
								}
								
							}
						} else {
							alert("發生錯誤1: " + xhr.status + ", "
									+ xhr.responseText);
						}
					}
				}
			
		};
		
		$(document).ready(function() {
					// 初始設定
					let msgDiv = $("#msg");
					msgDiv.hide();
					
					
					//更新資料
					$(document).on(
							"click",".editbutton",
							function() {
								console.log('get edit memberid..');
								console.log($(this).data("id"));
								
								//$("#RegisterForm").submit();
							})

					//刪除資料
					$(document).on(
							"click", ".deletebutton",
							function() {
								let thisObj = $(this);
								let id = $(this).data("id");
								let memberName = thisObj.parents("tr").children("td:first").html();
								var r = confirm("確定要刪除此筆會員資料: " + memberName);
								if (r == true) {
									
									$.ajax({
										type: "POST",
										url: "<c:url value='/member/delete' />",
										data: { memberId: id },
										success:function(data){
											console.log("success: "+data);
											console.log(thisObj);
											//可增加動態處理
											// ....
											thisObj.parents("tr").hide(1000);
											//thisObj.parents("tr").animate({left: '250px', opacity:'0'}).fadeOut(1000);
											console.log(thisObj.parents("tr").children("td:first"));
											msgDiv.html("已成功刪除會員: " +  memberName);
											msgDiv.removeClass().addClass("alert alert-info").show();
	
										},
										error: function(xhr, status, error){
									    	var errorMessage = "[Error-"+  xhr.status+"]\r\n" + xhr.statusText + ': ' + xhr.responseText
									    	console.log(errorMessage);
									    	msgDiv.html("刪除會員發失敗(status:" +  xhr.status + ")");
									    	msgDiv.removeClass().addClass("alert alert-danger").show();
									    	
									    }
										
										
									});
									console.log('get delete memberid..');
									console.log($(this).id);
									console.log($(this).parent().siblings().eq(0));
									console.log($(this).parent().siblings().eq(0)
											.find("input:first").val());
									let memberId = $(this).parent().siblings()
											.eq(0).find("input:first").val();
									console.log("memberId: " + memberId);
									$("#memberId").val(memberId);
									$("#action").val("delete");
									//$("#RegisterForm").submit();
								}
							})
				});
		
		
	</script>

</body>
</html>
