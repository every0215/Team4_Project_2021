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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

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
	box-shadow: 2px 2px 2px rgb(200, 200, 200);
	padding: 50px;
	

}
span.note{
	color:#888;
	font-size:10px;
}
</style>
</head>
<body>
	<jsp:include page="<c:url value='/views/account/layout/LukeTop.jsp' />" />
	<div id="RegisterDiv" class="container">
			<form id="UpdateForm" action="AccountServlet.do" method="post" >
				<fieldset>
				<legend><h2>會員資料異動</h2></legend>
				<div class="form-group">
					<label for="fullname">姓名:</label> <input type="text"
						class="form-control" id="fullname" name="fullname" value="${member.fullname}" placeholder="請輸入全名" disabled>
					
				</div>
				<div class="form-group">
					<label for="nickname">暱稱:</label> <input type="text"
						class="form-control" id="nickname" name="nickname" value="${member.nickname}" placeholder="請輸入暱稱" required>
					<span class="note">(1.不可為空白，2.5個到30個字)</span><br/>
					<img id="nicknameCheckImg" class="CheckStatus" src="<c:url value='/images/check.png' />" style="width: 15px;"><span id="nicknameCheckMsg" class="CheckStatus" >正確</span>
					<img id="nicknameErrorImg" class="CheckStatus" src="<c:url value='/images/error.png' />" style="width: 15px;"><span id="nicknameErrorMsg" class="CheckStatus" >錯誤</span>
				</div>
				<div class="form-group">
					<label for="nickname">身份證字號:</label> <input type="text"
						class="form-control" id="qid" name="qid" value="${member.qid}" placeholder="請輸入身份證字號" disabled>
					
				</div>
				<div class="form-group">
					<label for="email">電子郵件:</label> <input type="email"
						class="form-control" id="email" name="email" value="${member.email}"  placeholder="請輸入電子郵件" disabled>
				
				</div>
				<input type="hidden" name="memberId" value="${member.id}" />
				<input type="hidden" name="action" value="update" />
				<button type="submit" id="UpdateSubmit" class="btn btn-primary">更新</button>
				</fieldset>
				<hr>
				<%
					if (request.getAttribute("Updated")!= null){
						MemberBean member = (MemberBean) request.getAttribute("member");
						Boolean updated = (Boolean) request.getAttribute("Updated");
						if (updated){
							out.write("<div class='alert alert-info' role='alert'>已成功更新會員資料: "+member.getFullname()+"</div>");
						}
					}
					else{
						
					}
				%>
			</form>
			<form id="UploadForm" action="AccountUploadServlet.do" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="profileImage1">個人圖像:</label> 
					<div class="custom-file" id="customImage1" name="customImage1" lang="es">
			        <input type="file" class="custom-file-input" id="profileImage1" name="profileImage1" aria-describedby="fileHelp">
			        <label class="custom-file-label" for="exampleInputFile">
			           Select file...
        			</label>
        			
					</div>
				</div>
				<input type="hidden" name="memberId" value="${member.id}" />
				<input type="hidden" name="action" value="upload" />
				<button type="submit" id="UpdateSubmit" class="btn btn-primary">更新</button><br/>
				<img src="AccountUploadServlet.do?MemberEdit_MemberId=${member.id}" width="200"/>
				</fieldset>
				<hr>
				<%
					if (request.getAttribute("Uploaded")!= null){
						MemberBean member = (MemberBean) request.getAttribute("member");
						Boolean uploaded = (Boolean) request.getAttribute("Uploaded");
						if (uploaded){
							out.write("<div class='alert alert-info' role='alert'>已成功更新會員圖像: "+member.getFullname()+"</div>");
						}
					}
					else{
						
					}
				%>
			</form>
			
			<div>
			
			
			</div>
	</div>
	<script>
	$(document).ready(function(){
		var checkFullnameFlag;
		var checkNicknameFlag;
		var checkQidFlag;
		var checkEmailFlag;
		var checkPwdFlag;
	
	    $(".CheckStatus").hide();
	    $("#UpdateSubmit").attr("disabled", false);
	    
	   
	    $("#nickname").change(checkNickname);
	    //document.querySelector('#pwd').oninput = checkPwd;
	    //document.querySelector('#date1').oninput = checkDate1;
	    //document.querySelector('#name').onchange = submitCheck;
	    //document.querySelector('#pwd').onchange = submitCheck;
	    //document.querySelector('#date1').onchange = submitCheck;
	
	
	
	
	    //=============================================================================
	    //================================  FUNCTIONS  ================================
	    //=============================================================================
	    	
	
	
	    
	  	//2. 檢查暱稱
	    function checkNickname() {
	        let nickVal = $("#nickname").val();
	        let nickCheckImg = $("#nicknameCheckImg");
	        let nickCheckMsg = $("#nicknameCheckMsg");
	        let nickErrorImg = $("#nicknameErrorImg");
	        let nickErrorMsg = $("#nicknameErrorMsg");
	        let msg = "";
	        let check = true;
	        if (nickVal == "") {
	            msg = "不可為空白"; check = false;
	        }
	        else if ((nickVal.length < 5)||(nickVal.length > 30)) {
	            msg = "5個到30個字"; check = false;
	        }
	        else {
	            let matched1 = nickVal.match(/^[a-zA-Z0-9 ]{2,30}$/g);
	            //if(!hasChinese()){
	            if (!matched1) {
	                msg = "不可有特殊字元";
	                check = false;
	                console.log("check nickname: "+check);
	            }
	        }
	
	        hideNicknameImgMsg();
	
	        if (!check) {
	        	nickErrorMsg.html(msg);
	            nickErrorImg.show();
	            nickErrorMsg.show();
	        }
	        else {
	        	nickCheckImg.show();
	        	nickCheckMsg.show();
	        }
	        checkNicknameFlag = check;
	    }
	
	    function hideNicknameImgMsg() {
	    	 $("#nicknameCheckImg").hide();
	         $("#nicknameCheckMsg").hide();
	         $("#nicknameErrorImg").hide();
	         $("#nicknameErrorMsg").hide();
	
	    }
	 	
	
	    $("#UpdateSubmit").click(function(e){
		    e.preventDefault();
		    
		    console.log( checkNicknameFlag );
		    if (checkNicknameFlag) {
		    	console.log( checkNicknameFlag );
		    	$("#UpdateForm").submit();
		    }
		       
		});
		
	   

	});
    </script>
</body>
</html>
