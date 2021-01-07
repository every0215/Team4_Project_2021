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
	box-shadow: 5px 5px 5px rgb(160, 160, 160);
	padding: 50px;
	

}
span.note{
	color:#888;
	font-size:10px;
}
</style>
</head>
<body>
	<c:import url="/layout/lukeTop" />
		<c:import url="/layout/header" /> 
	<div id="RegisterDiv" class="container">
			<form id="RegisterForm" action="AccountServlet.do" method="post" >
				<fieldset>
				<legend><h2>會員註冊</h2></legend>
				<div class="form-group">
					<label for="fullname">姓名:</label> <input type="text"
						class="form-control" id="fullname" name="fullname" placeholder="請輸入全名" required>
					<span class="note">(1.不可為空白，2.至少2個字以上，3.必須全部為中文字)</span><br/>
					<img id="fullnameCheckImg" class="CheckStatus" src="<c:url value='/images/check.png' />" style="width: 15px;"><span id="fullnameCheckMsg" class="CheckStatus" >正確</span>
					<img id="fullnameErrorImg" class="CheckStatus" src="<c:url value='/images/error.png' />" style="width: 15px;"><span id="fullnameErrorMsg" class="CheckStatus" >錯誤</span>
				</div>
				<div class="form-group">
					<label for="nickname">暱稱:</label> <input type="text"
						class="form-control" id="nickname" name="nickname" placeholder="請輸入暱稱" required>
					<span class="note">(1.不可為空白，2.5個到30個字)</span><br/>
					<img id="nicknameCheckImg" class="CheckStatus" src="<c:url value='/images/check.png' />" style="width: 15px;"><span id="nicknameCheckMsg" class="CheckStatus" >正確</span>
					<img id="nicknameErrorImg" class="CheckStatus" src="<c:url value='/images/error.png' />" style="width: 15px;"><span id="nicknameErrorMsg" class="CheckStatus" >錯誤</span>
				</div>
				<div class="form-group">
					<label for="nickname">身份證字號:</label> <input type="text"
						class="form-control" id="qid" name="qid" placeholder="請輸入身份證字號" required>
					<span class="note">(1.不可為空白)</span><br/>
					<img id="qidCheckImg" class="CheckStatus" src="<c:url value='/images/check.png' />" style="width: 15px;"><span id="qidCheckMsg" class="CheckStatus" >正確</span>
					<img id="qidErrorImg" class="CheckStatus" src="<c:url value='/images/error.png' />" style="width: 15px;"><span id="qidErrorMsg" class="CheckStatus" >錯誤</span>
				</div>
				<div class="form-group">
					<label for="email">電子郵件:</label> <input type="email"
						class="form-control" id="email" name="email" placeholder="請輸入電子郵件" required>
					<span class="note">(1.不可為空白)</span><br/>
					<img id="emailCheckImg" class="CheckStatus" src="<c:url value='/images/check.png' />" style="width: 15px;"><span id="emailCheckMsg" class="CheckStatus" >正確</span>
					<img id="emailErrorImg" class="CheckStatus" src="<c:url value='/images/error.png' />" style="width: 15px;"><span id="emailErrorMsg" class="CheckStatus" >錯誤</span>
				</div>
				<div class="form-group">
					<label for="password">密碼:</label> <input type="password"
						class="form-control" id="password" name="password" placeholder="請輸入密碼" required>
					<span class="note">(1.不可為空白，2.至少需要6到20個字且包含英文字母、數字、特殊字元[!@#$%^&*])</span><br/>
					<img id="pwdCheckImg" class="CheckStatus" src="<c:url value='/images/check.png' />" style="width: 15px;"><span id="pwdCheckMsg" class="CheckStatus" >正確</span>
					<img id="pwdErrorImg" class="CheckStatus" src="<c:url value='/images/error.png' />" style="width: 15px;"><span id="pwdErrorMsg" class="CheckStatus" >錯誤</span>
				</div>
				<div class="form-group">
					<label for="password2">再次輸入密碼:</label> <input type="password"
						class="form-control" id="password2" name="password2" placeholder="請輸入密碼" required>
					<span class="note">(1.不可為空白，2.至少需要6到20個字且包含英文字母、數字、特殊字元[!@#$%^&*])</span><br/>
					<img id="pwd2CheckImg" class="CheckStatus" src="<c:url value='/images/check.png' />" style="width: 15px;"><span id="pwd2CheckMsg" class="CheckStatus" >正確</span>
					<img id="pwd2ErrorImg" class="CheckStatus" src="<c:url value='/images/error.png' />" style="width: 15px;"><span id="pwd2ErrorMsg" class="CheckStatus" >錯誤</span>
				</div>
				<div class="form-group form-check">
					<label class="form-check-label"> <input class="form-check-input" type="checkbox" id="acceptAgreement" name="acceptAgreement" required>
						我已閱讀並同意以上條件及條款
					</label>
				</div>
				<button type="submit" id="RegisterSubmit" class="btn btn-primary">送出</button>
				<button type="reset" id="reset" class="btn btn-primary">清除</button>
				</fieldset>
				<hr>
				<%
					if (request.getAttribute("Added")!= null){
						MemberBean member = (MemberBean) request.getAttribute("member");
						Boolean added = (Boolean) request.getAttribute("Added");
						if (added){
							out.write("<div class='alert alert-info' role='alert'>已成功新增會員: "+member.getFullname()+"</div>");
						}
					}
					else{
						
					}
				%>
			</form>
			
			
			<div></div>
	</div>
	<script>
	$(document).ready(function(){
		var checkFullnameFlag;
		var checkNicknameFlag;
		var checkQidFlag;
		var checkEmailFlag;
		var checkPwdFlag;
		oneClickSetValues();
	
	    $(".CheckStatus").hide();
	    $("#RegisterSubmit").attr("disabled", false);
	    
	   
	    $("#fullname").change(checkName);
	    $("#nickname").change(checkNickname);
	    $("#qid").change(checkQid);
	    $("#email").change(checkEmail);
	    $("#password").change(checkPassword);
	    $("#password2").change(checkPassword);
	    //document.querySelector('#pwd').oninput = checkPwd;
	    //document.querySelector('#date1').oninput = checkDate1;
	    //document.querySelector('#name').onchange = submitCheck;
	    //document.querySelector('#pwd').onchange = submitCheck;
	    //document.querySelector('#date1').onchange = submitCheck;
	
	
	
	
	    //=============================================================================
	    //================================  FUNCTIONS  ================================
	    //=============================================================================
	    function oneClickSetValues(){
	    	$("#fullname").val("林林林");
	    	$("#nickname").val("Nickname 1");
	    	$("#qid").val("A111122222");
	    	$("#email").val("test@gmail.com");
	    	$("#password").val("123456!q");
	    	$("#password2").val("123456!q");
	    	checkFullnameFlag=true;
			checkNicknameFlag=true;
			checkQidFlag=true;
			checkEmailFlag=true;
			checkPwdFlag=true;
	    }
	    	
	
	    //1. 檢查姓名
	    function checkName() {
	        let nameVal = $("#fullname").val();
	        let nameCheckImg = $("#fullnameCheckImg");
	        let nameCheckMsg = $("#fullnameCheckMsg");
	        let nameErrorImg = $("#fullnameErrorImg");
	        let nameErrorMsg = $("#fullnameErrorMsg");
			console.log("nameVal: "+nameVal);
	        let msg = "";
	        let check = true;
	        if (nameVal == "") {
	            msg = "不可為空白"; check = false;
	        }
	        else if (nameVal.length < 2) {
	            msg = "至少2個字以上"; check = false;
	        }
	        else {
	            for (i = 0; i < nameVal.length; i++) {
	                let charUnicode = nameVal.charCodeAt(i);
	                //if(!hasChinese()){
	                if (charUnicode < 0x4e00 || charUnicode > 0x9fff) {
	                    msg = "必須為中文字";
	                    check = false;
	                }
	            }
	        }
	
	        hideFullnameImgMsg();
	        console.log("check fullname: "+check);
	        if (!check) {
	            nameErrorMsg.html(msg);
	            $("#fullnameErrorImg").show();
	            $("#fullnameErrorMsg").show();
	        }
	        else {
	        	 $("#fullnameCheckImg").show();
	             $("#fullnameCheckMsg").show();
	        }
	        checkFullnameFlag = check;
	    }
	
	    function hideFullnameImgMsg() {
	    	 $("#fullnameCheckImg").hide();
	         $("#fullnameCheckMsg").hide();
	         $("#fullnameErrorImg").hide();
	         $("#fullnameErrorMsg").hide();
	
	    }
	    
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
	
	  	//3. 檢查身份證字號
	    function checkQid() {
	        let qidVal = $("#qid").val();
	        let qidCheckImg = $("#qidCheckImg");
	        let qidCheckMsg = $("#qidCheckMsg");
	        let qidErrorImg = $("#qidErrorImg");
	        let qidErrorMsg = $("#qidErrorMsg");
	        let msg = "";
	        let check = true;
	        if (qidVal == "") {
	            msg = "不可為空白"; check = false;
	        }
	        else if ((qidVal.length!=10)) {
	            msg = "身份證字號長度錯誤"; check = false;
	        }
	        else {
	        	
	        	 let matched1 = qidVal.match(/^[A-Z][1-2]\d{8}$/g);
	             if (!matched1) {
	                 msg = "身份證格式錯誤";
	                 check = false;
	                 console.log("check qid: "+check);
	             }
	        	
	        }
	
	        hideQidValImgMsg();
	
	        if (!check) {
	        	qidErrorMsg.html(msg);
	            qidErrorImg.show();
	            qidErrorMsg.show();
	        }
	        else {
	        	qidCheckImg.show();
	        	qidCheckMsg.show();
	        }
	        checkQidFlag = check;
	    }
	
	    function hideQidValImgMsg() {
	    	 $("#qidCheckImg").hide();
	         $("#qidCheckMsg").hide();
	         $("#qidErrorImg").hide();
	         $("#qidErrorMsg").hide();
	
	    }
	
	  	//4. 檢查電子郵件
	    function checkEmail() {
	        let emailVal = $("#email").val();
	        let emailCheckImg = $("#emailCheckImg");
	        let emailCheckMsg = $("#emailCheckMsg");
	        let emailErrorImg = $("#emailErrorImg");
	        let emailErrorMsg = $("#emailErrorMsg");
	        let msg = "";
	        let check = true;
	        if (emailVal == "") {
	            msg = "不可為空白"; check = false;
	        }
	        else {
	        	
	        	 let matched1 = emailVal.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/g);
	             if (!matched1) {
	                 msg = "電子郵件格式錯誤";
	                 check = false;
	                 console.log("check email: "+check);
	             }
	        	
	        }
	
	        hideEmailValImgMsg();
	
	        if (!check) {
	        	emailErrorMsg.html(msg);
	        	emailErrorImg.show();
	        	emailErrorMsg.show();
	        }
	        else {
	        	emailCheckImg.show();
	        	emailCheckMsg.show();
	        }
	        checkEmailFlag = check;
	    }
	
	    function hideEmailValImgMsg() {
	    	 $("#emailCheckImg").hide();
	         $("#emailCheckMsg").hide();
	         $("#emailErrorImg").hide();
	         $("#emailErrorMsg").hide();
	
	    }
	
	 	 //5. 檢查密碼
	    function checkPassword(event) {
	        console.log("event: "+event.target.id);
	        let num = "";
	        if(event.target.id=="password2"){
				num="2";
	        }
	        let pwdVal = $("#password"+num).val();
	        let pwdCheckImg = $("#pwd"+num+"CheckImg");
	        let pwdCheckMsg = $("#pwd"+num+"CheckMsg");
	        let pwdErrorImg = $("#pwd"+num+"ErrorImg");
	        let pwdErrorMsg = $("#pwd"+num+"ErrorMsg");
	        console.log("pwdVal: "+pwdVal);
	        console.log("pwdCheckImg: "+ pwdCheckImg.attr("id"));
	        let msg = "";
	        let check = true;
	        if (pwdVal == "") {
	            msg = "不可為空白"; check = false;
	        }
	        else if (pwdVal.length < 8) {
	            msg = "至少需要8個字"; check = false;
	        }
	        else if (pwdVal.length > 20) {
	            msg = "不可超過20個字"; check = false;
	        }
	        else {
	            //必須包含英文字母、數字、特殊字元[!@#$%^&*]
	            let pwdValLower = pwdVal.toLowerCase();
	            let matched1 = pwdValLower.match(/(.*[a-z].*)/g);
	            let matched2 = pwdValLower.match(/(.*[0-9].*)/g);
	            let matched3 = pwdValLower.match(/(.*[!@#\$%\^\&*].*)/g);
	            if ((matched1 == null) || (matched2 == null) || (matched3 == null)) {
	                msg = "必須包含英文字母、數字、特殊字元[!@#$%^&*]"; check = false;
	            }
	            console.log(matched1+":"+matched2+":"+matched2);
	        }
	        if(event.target.id=="password2"){
	        	if( $("#password").val() != $("#password"+num).val() ){
	        		msg = "密碼不一致"; check = false;
	           	}
	        }
	
	        hidePwdImgMsg(num);
	
	        if (!check) {
	        	pwdErrorMsg.html(msg);
	        	pwdErrorImg.show();
	        	pwdErrorMsg.show();
	        }
	        else {
	        	pwdCheckImg.show();
	        	pwdCheckMsg.show();
	        }
	        checkPwdFlag = check;
	
	    }
	
	    function hidePwdImgMsg(num) {
	    	 $("#pwd"+num+"CheckImg").hide();
	         $("#pwd"+num+"CheckMsg").hide();
	         $("#pwd"+num+"ErrorImg").hide();
	         $("#pwd"+num+"ErrorMsg").hide();
	    }
	
	    //(格式:西元年/月/日 yyyy/MM/dd)
	    function checkDate1() {
	        let date1Val = String(document.getElementById('date1').value);
	        let date1CheckImg = document.querySelector("#date1CheckImg");
	        let date1CheckMsg = document.querySelector("#date1CheckMsg");
	        let date1ErrorImg = document.querySelector("#date1ErrorImg");
	        let date1ErrorMsg = document.querySelector("#date1ErrorMsg");
	
	        let msg = "";
	        let check = true;
	        if (date1Val == "") {
	            msg = "不可為空白"; check = false;
	        }
	        else {
	            let dateStr = date1Val.split('/');
	
	            let regular_expression = /^[0-9\/]+$/g; // 限制只能有數字和/
	            let matched = date1Val.match(regular_expression);
	            if (dateStr.length != 3 || matched == null) {
	                msg = "日期格式有誤"; check = false;
	            }
	            else {
	                let year = parseInt(dateStr[0]);
	                let month = parseInt(dateStr[1]);
	                let day = parseInt(dateStr[2]);
	                if (isNaN(year)) {
	                    msg = "西元年格式有誤"; check = false;
	                }
	                else if (year < 1911 || year > 9999) {
	                    msg = "西元年日期太大或太小"; check = false;
	                }
	                else if (isNaN(month)) {
	                    msg = "月份格式有誤"; check = false;
	                }
	                else if (month < 1 || month > 12) {
	                    msg = "月份應為1-12"; check = false;
	                }
	                else if (isNaN(day)) {
	                    msg = "日期格式有誤"; check = false;
	
	                }
	                else if (day < 1 || day > 31) {
	                    msg = "日期有誤"; check = false;
	                }
	                else if (!moment(date1Val, 'YYYY/MM/DD').isValid()) {
	                    msg = "日期有誤"; check = false;
	                }
	            }
	        }
	
	        hideA2Date1ImgMsg();
	
	        if (!check) {
	            date1ErrorMsg.innerHTML = msg;
	            date1ErrorImg.style.display = "inline";
	            date1ErrorMsg.style.display = "inline";
	        }
	        else {
	            date1CheckImg.style.display = "inline";
	            date1CheckMsg.style.display = "inline";
	        }
	        checkDate1Flag = check;
	    }
	
	    function hideA2Date1ImgMsg() {
	        date1CheckImg.style.display = "none";
	        date1CheckMsg.style.display = "none";
	        date1ErrorImg.style.display = "none";
	        date1ErrorMsg.style.display = "none";
	    }

	    $("#RegisterSubmit").click(function(e){
		    e.preventDefault();
		    let AgreementChecked = $("#acceptAgreement").is(":checked");
		    console.log(checkFullnameFlag +":" + checkNicknameFlag+":"  + checkQidFlag+":"  + checkEmailFlag+":"  + checkPwdFlag );
		    console.log($("#acceptAgreement").is(":checked"));
		    if (checkFullnameFlag && checkNicknameFlag && checkQidFlag && checkEmailFlag && checkPwdFlag && AgreementChecked) {
		        $("#RegisterForm").submit();
		    }
		       
		});
		
	   

	});
    </script>
</body>
</html>
