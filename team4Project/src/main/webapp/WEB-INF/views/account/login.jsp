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
                <div class="aa-myaccount-login ">
                <h4>登入</h4>
                <form:form id="LoginForm" method="POST" class="aa-login-form" action="${pageContext.request.contextPath}/account/login" modelAttribute="member" enctype='multipart/form-data'>
<!--                  <form action="" class="aa-login-form"> -->
                 	<div class="form-group">
	                  <label for="">電子郵件<span>*</span></label>
	                   	<input type="text" id="email" name="email" placeholder="電子郵件" value="${member.email}">
	                   	<img id="emailErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
						<small id="emailErrorMsg" class="form-text ll-err-msg CheckStatus"></small>
						<img id="emailCheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
                    </div>
                    <div class="form-group">
	                   	<label for="">密碼<span>*</span></label>
	                   	<input type="password" id="pwd" name="pwd" placeholder="密碼" value="${member.pwd }">
	                   	<img id="passwordErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
						<small id="passwordErrorMsg" class="form-text ll-err-msg CheckStatus"></small>
						<img id="passwordCheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
                    </div>
                    <div class="form-group" >
	                   <div class="g-recaptcha" data-callback="captchaCallback" data-sitekey="6LdV6CYaAAAAAKhDJ6LusYaCpuu6EVvCnNMw2tDV" ></div>
                    </div>
                    <hr style="border-bottom: 1px solid #ccc; height:3px;" />
                    <div class="form-group">
                    	<button type="submit" id="LoginSubmit" class="aa-browse-btn">登入</button><label class="rememberme" for="rememberme"><input type="checkbox" id="rememberme">記住我</label><br><br>
                    </div>
                    <div class="form-group">
	               		<div id="LoginMsgDiv" class="alert alert-danger"><strong>登入失敗</strong><br><span id="LoginMsg">
	               		<c:if test="${(msg != null)}"><c:out value="${msg}" /></c:if></span></div>
					</div>
                    <div class="form-group">
						<hr style="border-bottom: 1px solid #ccc; height:3px;margin-top:50px;" />
						<p><a href="#">會員註冊</a>&nbsp;<a href="<c:url value='/member/forgotPassword' />">忘記密碼</a></p> 
					</div>
                      
<!--                   </form> -->
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
  </body>
  <script>
  	var gReCAPTCHAchecked = false;
	 function captchaCallback(response) {
		 gReCAPTCHAchecked = true;
	 }
	 
  	$().ready(function(){
  		//網頁初始化
  		let loginMsgDiv = $("#LoginMsgDiv");
  		let loginMsg = $("#LoginMsg");
  		<c:if test="${(msg == null)}">
  		loginMsgDiv.hide();
  		</c:if>
  		let cookie_email = getCookie('memeber_email');
  		let cookie_password = getCookie('memeber_password');
  		let cookie_rememberme = getCookie('memeber_rememberme');
  		console.log( "COOKIE(email:" + getCookie('memeber_email') + ", pwd:" + getCookie('memeber_password') +")");
  		
  		//網頁初始化時，取得cookie值並設定input的值
  		if (cookie_email != null){
  			$('#email').val(cookie_email);
  		}
  		if (cookie_password != null){
  			$('#pwd').val(cookie_password);
  		}
  		if (cookie_rememberme != null){
  			$('#rememberme').prop('checked',cookie_rememberme);
  		}
  		
  		checkEmail();
 	    checkPassword();
 	    
 	    $("#email").change(checkEmail);
	    $("#pwd").change(checkPassword);
  		
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
	    
  		
  		
  		$('#rememberme').click(function(){
  			setRememberMe();
  		});
  		
  		$("#LoginSubmit").click(function(e){
		    e.preventDefault();
		    setRememberMe();
		    
		    console.log(" checkEmailFlag:"  + checkEmailFlag + " checkPwdFlag:" + checkPwdFlag  );

		    checkEmail();
		    checkPassword();
		    
		    let errorMSG = "<ul class='ll-err-list-msg' >";
		    
		    if( !checkEmailFlag || !checkPwdFlag )
		    {
		    	errorMSG += "<li>登入資訊填寫有誤</li>";
		    }
		    else{
		    	loginMsgDiv.hide();
		    }
		    
		 	
		    //check Google ReCAPTCHA Code
		    console.log("gReCAPTCHAchecked:" + gReCAPTCHAchecked);

		    if (!gReCAPTCHAchecked){
		    	errorMSG += "<li>Google驗證碼驗證錯誤</li>";
		    	loginMsgDiv.show();
		    }
		    else{
		    	loginMsgDiv.hide();
		    }
		    errorMSG += "</ul>";
		    loginMsg.html(errorMSG);
		    
		    if (checkEmailFlag && checkPwdFlag && gReCAPTCHAchecked) {
		        $("#LoginForm").submit();
		    }
		    else {
		    	loginMsgDiv.show();
		    }
		       
		});
  	});
  	
  	function setRememberMe(){
  		if ($('#rememberme').is(':checked')) {
  	  		let email = $('#email').val();
  	  		let pwd = $('#pwd').val();
  	  		// set cookies to expire in 14 days
  	  		console.log( "email:" + email + ", pwd:" + pwd);
  	  		setCookie('memeber_email', email,14 );
  	  		setCookie('memeber_password', pwd, 14 );
  	  		setCookie('memeber_rememberme', true, 14 );
	  		} 
			else {
  	  		// reset cookies
  	  		setCookie('memeber_email', null, 0);
  	  		setCookie('memeber_password', null, 0);
  	  		setCookie('memeber_rememberme', null, 0);
  	  		
  	  		console.log( "email:" + getCookie('memeber_email') + ", pwd:" + getCookie('memeber_password'));
  			
	  	}
  	}
  	
  	function setCookie(cname, cvalue, exdays) {
  	  var d = new Date();
  	  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  	  var expires = "expires="+ d.toUTCString();
  	  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
  	}
  	
  	function getCookie(cname) {
  	  var name = cname + "=";
  	  var decodedCookie = decodeURIComponent(document.cookie);
  	  var ca = decodedCookie.split(';');
  	  for(var i = 0; i <ca.length; i++) {
  	    var c = ca[i];
  	    while (c.charAt(0) == ' ') {
  	      c = c.substring(1);
  	    }
  	    if (c.indexOf(name) == 0) {
  	      return c.substring(name.length, c.length);
  	    }
  	  }
  	  return "";
  	}
  	
  </script>
</html>