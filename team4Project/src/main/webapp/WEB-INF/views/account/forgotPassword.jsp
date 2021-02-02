<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
  <c:import url="/layout/head" />
  <style>
  	
button {
  cursor: pointer;
}



.pdfobject-container {
  height: 30rem;
  border: 1rem solid rgba(0, 0, 0, 0.1);
}

 .trigger { 
   text-decoration: underline;
   color: #0037ff;
}

/* .trigger i { */
/*   margin-right: 0.3125rem; */
/* } */
/* .trigger:hover { */
/*   box-shadow: 0 0.875rem 1.75rem rgba(0, 0, 0, 0.25), 0 0.625rem 0.625rem rgba(0, 0, 0, 0.22); */
/* } */

.ll-modal {
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 0vh;
  background-color: transparent;
  overflow: hidden;
  transition: background-color 0.25s ease;
  z-index: 9999;
}
.ll-modal.open {
  position: fixed;
  width: 100%;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.5);
  transition: background-color 0.25s;
}
.ll-modal.open > .content-wrapper {
  transform: scale(1);
}
.ll-modal .content-wrapper {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  width: 50%;
  margin: 0;
  padding: 2.5rem;
  background-color: white;
  border-radius: 0.3125rem;
  box-shadow: 0 0 2.5rem rgba(0, 0, 0, 0.5);
  transform: scale(0);
  transition: transform 0.25s;
  transition-delay: 0.15s;
}
.ll-modal .content-wrapper .close {
  position: absolute;
  top: 0.5rem;
  right: 0.5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 2.5rem;
  height: 2.5rem;
  border: none;
  background-color: transparent;
  font-size: 1.5rem;
  transition: 0.25s linear;
}
.ll-modal .content-wrapper .close:before, .ll-modal .content-wrapper .close:after {
  position: absolute;
  content: "";
  width: 1.25rem;
  height: 0.125rem;
  background-color: black;
}
.ll-modal .content-wrapper .close:before {
  transform: rotate(-45deg);
}
.ll-modal .content-wrapper .close:after {
  transform: rotate(45deg);
}
.ll-modal .content-wrapper .close:hover {
  transform: rotate(360deg);
}
.ll-modal .content-wrapper .close:hover:before, .modal .content-wrapper .close:hover:after {
  background-color: tomato;
}
.ll-modal .content-wrapper .ll-modal-header {
  position: relative;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  margin: 0;
  padding: 0 0 1.25rem;
}
.ll-modal .content-wrapper .ll-modal-header h2 {
  font-size: 1.5rem;
  font-weight: bold;
}
.ll-modal .content-wrapper .content {
  position: relative;
  display: flex;
}
.ll-modal .content-wrapper .content p {
  font-size: 0.875rem;
  line-height: 1.75;
}
.ll-modal .content-wrapper .ll-modal-footer {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: flex-end;
  width: 100%;
  margin: 0;
  padding: 1.875rem 0 0;
}
.ll-modal .content-wrapper .ll-modal-footer .action {
  position: relative;
  margin-left: 0.625rem;
  padding: 0.625rem 1.25rem;
  border: none;
  background-color: slategray;
  border-radius: 0.25rem;
  color: white;
  font-size: 0.87rem;
  font-weight: 300;
  overflow: hidden;
  z-index: 1;
}
.ll-modal .content-wrapper .ll-modal-footer .action:before {
  position: absolute;
  content: "";
  top: 0;
  left: 0;
  width: 0%;
  height: 100%;
  background-color: rgba(255, 255, 255, 0.2);
  transition: width 0.25s;
  z-index: 0;
}
.ll-modal .content-wrapper .ll-modal-footer .action:first-child {
  background-color: #2ecc71;
}
.ll-modal .content-wrapper .ll-modal-footer .action:last-child {
  background-color: #e74c3c;
}
.ll-modal .content-wrapper .ll-modal-footer .action:hover:before {
  width: 100%;
}
  </style>
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
                <h4>忘記密碼</h4>
                <form:form id="RegisterForm" method="POST" class="aa-login-form" action="${pageContext.request.contextPath}/member/forgotPassword" modelAttribute="member" enctype='multipart/form-data'>
                	
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
	                   	<label for="">密碼<span>*</span></label>
	                   	<input type="password" id="pwd" name="pwd" placeholder="密碼" ">
	                   	<img id="passwordErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
						<small id="passwordErrorMsg" class="form-text ll-err-msg CheckStatus"></small>
						<img id="passwordCheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
                    </div>
					<hr style="border-bottom: 1px solid #ccc; height:3px;" />
					<div class="form-group">
						<button type="submit" id="SubmitButton" class="aa-browse-btn">送出</button>
						<button type="reset" id="reset" class="aa-browse-btn">清除</button><br/><br/>
                   	</div>  
                   	<div class="form-group">
						<div id="MsgDiv" class="alert alert-info"><strong id="MsgLabel">XXX:</strong><br>
						<span id="Msg">xxx</span>
						</div>
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

 <!-- Agreement section -->


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
		let msgDiv = $("#MsgDiv");
		let msgLabel = $("#MsgLabel");
		let msg = $("#Msg");
	  	msgDiv.hide();
	  	
	  //密碼變更成功
	  	<c:if test='${(verified != null)&&(verified== true)}'>
	  		showMsg('成功訊息:','<c:out value="${msg}" />','alert-info');
			</c:if>
  		//密碼變更錯誤
  		<c:if test='${(verified != null)&&(verified== false)}'>
  			showMsg('錯誤訊息:','<c:out value="${msg}" />','alert-danger');
  	  	</c:if>
  	  	
  	  	
		var checkQidFlag;
		var checkEmailFlag;

		oneClickSetValues();
		
	    $(".CheckStatus").hide();
	    $("#RegisterSubmit").attr("disabled", false);
	    let registerMsgDiv = $("#RegisterMsgDiv");
	    let registerMsg = $("#RegisterMsg");
	    registerMsgDiv.hide();

	    checkQid();
	    checkEmail();
	    checkPassword();

	    $("#qid").change(checkQid);
	    $("#email").change(checkEmail);
	    $("#pwd").change(checkPassword);
	
	    //=============================================================================
	    //================================  FUNCTIONS  ================================
	    //=============================================================================
	    function oneClickSetValues(){
	    	$("#qid").val("A111122222");
	    	$("#email").val("test@gmail.com");

	    	checkFullnameFlag=true;
			checkNicknameFlag=true;
			checkQidFlag=true;
			checkEmailFlag=true;
			checkPwdFlag=true;
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
	        let pwdVal = $("#pwd").val();
	        let pwdCheckImg = $("#passwordCheckImg");
	        let pwdErrorMsg = $("#passwordErrorMsg");
	        let pwdErrorImg = $("#passwordErrorImg");
	        console.log("passwordVal: "+pwdVal);
	        console.log("passwordCheckImg: "+ pwdCheckImg.attr("id"));

	        let msg = "";
	        let check = true;
	        
	      	
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
	
	        
	    }
	
	    function hidePwdImgMsg() {
	    	 $("#passwordCheckImg").hide();
	         $("#passwordErrorMsg").hide();
	         $("#passwordErrorImg").hide();
	    }

	    $("#SubmitButton").click(function(e){
		    e.preventDefault();
		    let AgreementChecked = $("#acceptAgreement").is(":checked");
		    console.log(" checkQidFlag:"  + checkQidFlag+" checkEmailFlag:"  + checkEmailFlag + " checkPwdFlag:" + checkPwdFlag);
		    console.log($("#acceptAgreement").is(":checked"));
		    
		    checkQid();
		    checkEmail();
		    checkPassword();
		    
		    let errorMSG = "<ul class='ll-err-list-msg' >";
		    
		    if(checkQidFlag || !checkEmailFlag  || !checkPwdFlag )
		    {
		    	errorMSG += "<li>表單填寫有誤</li>";
		    }
		    else{
		    	registerMsgDiv.hide();
		    }
		    
		    
		    if (checkQidFlag && checkEmailFlag && checkPwdFlag) {
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