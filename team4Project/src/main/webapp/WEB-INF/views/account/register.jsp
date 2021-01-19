<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
  <c:import url="/layout/head" />
  <body> 
   <!-- wpf loader Two -->
    <div id="wpf-loader-two">          
      <div class="wpf-loader-two-inner">
        <span>Loading</span>
      </div>
    </div> 
    <!-- / wpf loader Two -->       
  <!-- SCROLL TOP BUTTON -->
    <a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
  <!-- END SCROLL TOP BUTTON -->

	<c:import url="/layout/header" />

  <!-- catg header banner section -->
  <section id="aa-catg-head-banner">
    <img src="<c:url value='/img/fashion/fashion-header-bg-8.jpg' />" alt="fashion img">
    <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Account Page</h2>
        <ol class="breadcrumb">
          <li><a href="index.html">Home</a></li>                   
          <li class="active">Account</li>
        </ol>
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->

 <!-- Cart view section -->
 <section id="aa-myaccount">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
       <div class="aa-myaccount-area">         
           <div class="row">
             <div class="col-md-12">
               <div class="aa-myaccount-register">                 
                <h4>會員註冊</h4>
                <form:form id="RegisterForm" method="POST" class="aa-login-form" action="${pageContext.request.contextPath}/account/register" modelAttribute="member" enctype='multipart/form-data'>
                	<div class="form-group">
						<label for="fullname">姓名:<span>*</span></label> 
						<input type="text" class="form-control" id="fullname" name="fullname" placeholder="請輸入全名" required>
						<img id="fullnameErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
						<small id="fullnameErrorMsg" class="form-text ll-err-msg CheckStatus">(至少2個字以上且必須全部為中文字)</small>
						<img id="fullnameCheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
	
					</div>
					<div class="form-group">
						<label for="nickname">暱稱:<span>*</span></label> 
						<input type="text" class="form-control" id="nickname" name="nickname" placeholder="請輸入暱稱" required>
						<img id="nicknameErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
						<small id="nicknameErrorMsg" class="form-text ll-err-msg CheckStatus">(5個到30個字)</small>
						<img id="nicknameCheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
					</div>
					<div class="form-group">
						<label for="qid">身份證字號:<span>*</span></label> <input type="text"
							class="form-control" id="qid" name="qid" placeholder="請輸入身份證字號" required>
						<img id="qidErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
						<small id="qidErrorMsg" class="form-text ll-err-msg CheckStatus"></small>
						<img id="qidCheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
					</div>
					<div class="form-group">
						<label for="email">電子郵件:<span>*</span></label> <input type="email"
							class="form-control" id="email" name="email" placeholder="請輸入電子郵件" required>
						<img id="emailErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
						<small id="emailErrorMsg" class="form-text ll-err-msg CheckStatus"></small>
						<img id="emailCheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
					</div>
					<div class="form-group">
						<label for="password">密碼:<span>*</span></label> <input type="password"
							class="form-control" id="password" name="pwd" placeholder="請輸入密碼" required>
						<img id="passwordErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
						<small id="passwordErrorMsg" class="form-text ll-err-msg CheckStatus"></small>
						<img id="passwordCheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
					</div>
					<div class="form-group">
						<label for="password2">再次輸入密碼:<span>*</span></label> <input type="password"
							class="form-control" id="password2" name="pwd2" placeholder="請輸入密碼" required>
						<img id="password2ErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
						<small id="password2ErrorMsg" class="form-text ll-err-msg CheckStatus">(1.不可為空白)</small>
						<img id="password2CheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
					</div>
					<div class="form-group form-check">
						<label class="form-check-label"> <input class="form-check-input" type="checkbox" id="acceptAgreement" name="acceptAgreement" required>
							我已閱讀並同意以上條件及條款
						</label>
					</div>
					<div class="form-group" >
	                   <div class="g-recaptcha" data-callback="captchaCallback" data-sitekey="6LdV6CYaAAAAAKhDJ6LusYaCpuu6EVvCnNMw2tDV" ></div>
                    </div>
					<hr style="border-bottom: 1px solid #ccc; height:3px;" />
					<div class="form-group">
						<button type="submit" id="RegisterSubmit" class="aa-browse-btn">送出</button>
						<button type="reset" id="reset" class="aa-browse-btn">清除</button><br/><br/>
                   	</div>  
                   	<div class="form-group">
	               		<div id="RegisterMsgDiv" class="alert alert-danger"><strong>註冊失敗</strong><br><span id="RegisterMsg"></span></div>
					</div>  
					
                 </form:form>
               </div>
             </div>
           </div>          
        </div>
      </div>
    </div>
  </div>
</section>
 <!-- / Cart view section -->

  <!-- footer -->  
  <footer id="aa-footer">
    <!-- footer bottom -->
    <div class="aa-footer-top">
     <div class="container">
        <div class="row">
        <div class="col-md-12">
          <div class="aa-footer-top-area">
            <div class="row">
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <h3>Main Menu</h3>
                  <ul class="aa-footer-nav">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Our Services</a></li>
                    <li><a href="#">Our Products</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact Us</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3>Knowledge Base</h3>
                    <ul class="aa-footer-nav">
                      <li><a href="#">Delivery</a></li>
                      <li><a href="#">Returns</a></li>
                      <li><a href="#">Services</a></li>
                      <li><a href="#">Discount</a></li>
                      <li><a href="#">Special Offer</a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3>Useful Links</h3>
                    <ul class="aa-footer-nav">
                      <li><a href="#">Site Map</a></li>
                      <li><a href="#">Search</a></li>
                      <li><a href="#">Advanced Search</a></li>
                      <li><a href="#">Suppliers</a></li>
                      <li><a href="#">FAQ</a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3>Contact Us</h3>
                    <address>
                      <p> 25 Astor Pl, NY 10003, USA</p>
                      <p><span class="fa fa-phone"></span>+1 212-982-4589</p>
                      <p><span class="fa fa-envelope"></span>dailyshop@gmail.com</p>
                    </address>
                    <div class="aa-footer-social">
                      <a href="#"><span class="fa fa-facebook"></span></a>
                      <a href="#"><span class="fa fa-twitter"></span></a>
                      <a href="#"><span class="fa fa-google-plus"></span></a>
                      <a href="#"><span class="fa fa-youtube"></span></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
     </div>
    </div>
    <!-- footer-bottom -->
    <div class="aa-footer-bottom">
      <div class="container">
        <div class="row">
        <div class="col-md-12">
          <div class="aa-footer-bottom-area">
            <p>Designed by <a href="http://www.markups.io/">MarkUps.io</a></p>
            <div class="aa-footer-payment">
              <span class="fa fa-cc-mastercard"></span>
              <span class="fa fa-cc-visa"></span>
              <span class="fa fa-paypal"></span>
              <span class="fa fa-cc-discover"></span>
            </div>
          </div>
        </div>
      </div>
      </div>
    </div>
  </footer>
  <!-- / footer -->

  <!-- Login Modal -->  
  <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">                      
        <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4>Login or Register</h4>
          <form class="aa-login-form" action="">
            <label for="">Username or Email address<span>*</span></label>
            <input type="text" placeholder="Username or email">
            <label for="">Password<span>*</span></label>
            <input type="password" placeholder="Password">
            <button class="aa-browse-btn" type="submit">Login</button>
            <label for="rememberme" class="rememberme"><input type="checkbox" id="rememberme"> Remember me </label>
            <p class="aa-lost-password"><a href="#">Lost your password?</a></p>
            <div class="aa-register-now">
              Don't have an account?<a href="account.html">Register now!</a>
            </div>
          </form>
        </div>                        
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>    

  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="<c:url value='/js/bootstrap.js' />"></script>  
  <!-- SmartMenus jQuery plugin -->
  <script type="text/javascript" src="<c:url value='/js/jquery.smartmenus.js' />"></script>
  <!-- SmartMenus jQuery Bootstrap Addon -->
  <script type="text/javascript" src="<c:url value='/js/jquery.smartmenus.bootstrap.js' />"></script>  
  <!-- To Slider JS -->
  <script src="<c:url value='/js/sequence.js' />"></script>
  <script src="<c:url value='/js/sequence-theme.modern-slide-in.js' />"></script>  
  <!-- Product view slider -->
  <script type="text/javascript" src="<c:url value='/js/jquery.simpleGallery.js' />"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery.simpleLens.js' />"></script>
  <!-- slick slider -->
  <script type="text/javascript" src="<c:url value='/js/slick.js' />"></script>
  <!-- Price picker slider -->
  <script type="text/javascript" src="<c:url value='/js/nouislider.js' />"></script>
  <!-- Custom js -->
  <script src="<c:url value='/js/custom.js' />"></script> 
	  
  <script src="<c:url value='/js/luke_js.js' />"></script> 
  
  <script>
	 var gReCAPTCHAchecked = false;
	 function captchaCallback(response) {
		 gReCAPTCHAchecked = true;
	 }
	 
	$(document).ready(function(){
		var checkFullnameFlag;
		var checkNicknameFlag;
		var checkQidFlag;
		var checkEmailFlag;
		var checkPwdFlag;
		oneClickSetValues();
		
	    $(".CheckStatus").hide();
	    $("#RegisterSubmit").attr("disabled", false);
	    let registerMsgDiv = $("#RegisterMsgDiv");
	    let registerMsg = $("#RegisterMsg");
	    registerMsgDiv.hide();
	    
	    checkName();
	    checkNickname();
	    checkQid();
	    checkEmail();
	    checkPassword();

	    
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
	            
	            let matched1 = nameVal.match(/[,./;\[\]\\\|{}`~!@#$%^&*()\'+= ]+/g);
	            //if(!hasChinese()){
	            if (matched1) {
	                msg = "不可有特殊字元";
	                check = false;
	                console.log("check nickname: "+check);
	            }
// 	            for (i = 0; i < nameVal.length; i++) {
// 	                let charUnicode = nameVal.charCodeAt(i);
// 	                //if(!hasChinese()){
// 	                if (charUnicode < 0x4e00 || charUnicode > 0x9fff) {
// 	                    msg = "必須為中文字";
// 	                    check = false;
// 	                }
// 	            }
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
	        }
	        checkFullnameFlag = check;
	    }
	
	    function hideFullnameImgMsg() {
	    	$("#fullnameCheckImg").hide();
	    	$("#fullnameErrorImg").hide();
	        $("#fullnameErrorMsg").hide();
	
	    }
	    
	  	//2. 檢查暱稱
	    function checkNickname() {
	        let nickVal = $("#nickname").val();
	        let nickCheckImg = $("#nicknameCheckImg");
	        let nickErrorMsg = $("#nicknameErrorMsg");
	        let nickErrorImg = $("#nicknameErrorImg");
	        let msg = "";
	        let check = true;
	        if (nickVal == "") {
	            msg = "不可為空白"; check = false;
	        }
	        else if ((nickVal.length < 5)||(nickVal.length > 30)) {
	            msg = "5個到30個字"; check = false;
	        }
	        else {
	            let matched1 = nickVal.match(/[,./;\[\]\\\|{}`~!@#$%^&*()\'+=]+/g);
	            //if(!hasChinese()){
	            if (matched1) {
	                msg = "不可有特殊字元";
	                check = false;
	                console.log("check nickname: "+check);
	            }
	        }
	
	        hideNicknameImgMsg();
	
	        if (!check) {
	        	nickErrorMsg.html(msg);
	            nickErrorMsg.show();
	            nickErrorImg.show();
	        }
	        else {
	        	nickCheckImg.show();
	        }
	        checkNicknameFlag = check;
	    }
	
	    function hideNicknameImgMsg() {
	    	 $("#nicknameCheckImg").hide();
	         $("#nicknameErrorMsg").hide();
	         $("#nicknameErrorImg").hide();
	
	    }
	
	  	//3. 檢查身份證字號
	    function checkQid() {
	        let qidVal = $("#qid").val();
	        let qidCheckImg = $("#qidCheckImg");
	        let qidErrorMsg = $("#qidErrorMsg");
	        let qidErrorImg = $("#qidErrorImg");
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
	            qidErrorMsg.show();
	            qidErrorImg.show();
	        }
	        else {
	        	qidCheckImg.show();
	        }
	        checkQidFlag = check;
	    }
	
	    function hideQidValImgMsg() {
	    	 $("#qidCheckImg").hide();
	         $("#qidErrorMsg").hide();
	         $("#qidErrorImg").hide();
	
	    }
	
	  	//4. 檢查電子郵件
	    function checkEmail() {
	        let emailVal = $("#email").val();
	        let emailCheckImg = $("#emailCheckImg");
	        let emailErrorMsg = $("#emailErrorMsg");
	        let emailErrorImg = $("#emailErrorImg");
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
	        	emailErrorMsg.show();
	        	emailErrorImg.show();
	        }
	        else {
	        	emailCheckImg.show();
	        }
	        checkEmailFlag = check;
	    }
	
	    function hideEmailValImgMsg() {
	    	 $("#emailCheckImg").hide();
	         $("#emailErrorMsg").hide();
	         $("#emailErrorImg").hide();
	
	    }
	
	 	 //5. 檢查密碼
	    function checkPassword() {
	        let pwdVal = $("#password").val();
	        let pwdVal2 = $("#password2").val();
	        let pwdCheckImg = $("#passwordCheckImg");
	        let pwdErrorMsg = $("#passwordErrorMsg");
	        let pwdErrorImg = $("#passwordErrorImg");
	        let pwd2CheckImg = $("#password2CheckImg");
	        let pwd2ErrorMsg = $("#password2ErrorMsg");
	        let pwd2ErrorImg = $("#password2ErrorImg");
	        console.log("passwordVal: "+pwdVal);
	        console.log("passwordCheckImg: "+ pwdCheckImg.attr("id"));
	        console.log("password2Val: "+pwdVal);
	        console.log("password2CheckImg: "+ pwdCheckImg.attr("id"));
	        let msg = "";
	        let msg2 = "";
	        let check = true;
	        let check2 = true;
	      	
	        //password1的check
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
	            let matched3 = pwdValLower.match(/(.*[~!@#\$%\^\&*].*)/g);
	            if ((matched1 == null) || (matched2 == null) || (matched3 == null)) {
	                msg = "必須包含英文字母、數字、特殊字元[~!@#$%^&*]"; check = false;
	            }
	            console.log(matched1+":"+matched2+":"+matched2);
	        }
	        
	      	//password2的check
	        if( pwdVal != pwdVal2 ){
	        		msg2 = "密碼不一致"; check2 = false;
	        }
	
	        hidePwdImgMsg();
	
	      	//password1的check結果動作
	        if (!check) {
	        	pwdErrorMsg.html(msg);
	        	pwdErrorMsg.show();
	        	pwdErrorImg.show();
	        }
	        else {
	        	pwdCheckImg.show();
	        }
	        checkPwdFlag = check;
	
	        //password2的check結果動作
	        if (!check2) {
	        	pwd2ErrorMsg.html(msg2);
	        	pwd2ErrorMsg.show();
	        	pwd2ErrorImg.show();
	        }
	        else {
	        	pwd2CheckImg.show();
	        }
	        checkPwd2Flag = check2;
	    }
	
	    function hidePwdImgMsg() {
	    	 $("#passwordCheckImg").hide();
	         $("#passwordErrorMsg").hide();
	         $("#passwordErrorImg").hide();
	         $("#password2CheckImg").hide();
	         $("#password2ErrorMsg").hide();
	         $("#password2ErrorImg").hide();
	    }
	
	   

	    $("#RegisterSubmit").click(function(e){
		    e.preventDefault();
		    let AgreementChecked = $("#acceptAgreement").is(":checked");
		    console.log("checkFullnameFlag: "+checkFullnameFlag +" checkNicknameFlag:" + checkNicknameFlag+" checkQidFlag:"  + checkQidFlag+" checkEmailFlag:"  + checkEmailFlag + " checkPwdFlag:" + checkPwdFlag + "checkPwd2Flag:" + checkPwd2Flag );
		    console.log($("#acceptAgreement").is(":checked"));
		    checkName();
		    checkNickname();
		    checkQid();
		    checkEmail();
		    checkPassword();
		    
		    let errorMSG = "<ul class='ll-err-list-msg' >";
		    
		    if(!checkFullnameFlag || !checkNicknameFlag || !checkQidFlag || !checkEmailFlag || !checkPwdFlag || !checkPwd2Flag )
		    {
		    	errorMSG += "<li>表單填寫有誤</li>";
		    }
		    else{
		    	registerMsgDiv.hide();
		    }
		    
		 	//check使用者服務條款
		    let acceptAgreementFlag = $("#acceptAgreement").is(":checked");
		    if(!acceptAgreementFlag){
		    	errorMSG += "<li>請同意以上條件及條款</li>";
		    	registerMsgDiv.show();
		    }
		    else{
		    	registerMsgDiv.hide();
		    }
		    //check Google ReCAPTCHA Code
		    console.log("gReCAPTCHAchecked:" + gReCAPTCHAchecked);

		    if (!gReCAPTCHAchecked){
		    	errorMSG += "<li>Google驗證碼驗證錯誤</li>";
		    	registerMsgDiv.show();
		    }
		    else{
		    	registerMsgDiv.hide();
		    }
		    errorMSG += "</ul>";
		    registerMsg.html(errorMSG);
		    
		    if (checkFullnameFlag && checkNicknameFlag && checkQidFlag && checkEmailFlag && checkPwdFlag && checkPwd2Flag && AgreementChecked && acceptAgreementFlag && gReCAPTCHAchecked) {
		        $("#RegisterForm").submit();
		    }
		    else {
		    	registerMsgDiv.show();
		    }
		       
		});
	    
	});
	
	
    </script>
  </body>
</html>