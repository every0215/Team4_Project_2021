<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
  <c:import url="/layout/head" />
  

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


<link rel='stylesheet' href='https://cdn.datatables.net/responsive/1.0.4/css/dataTables.responsive.css'>

  
  <body> 
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeConsoleRunner-7f4d47902dc785f30dedcac9c996b9f31d4dfcc33567cc48f0431bc918c2bf05.js"></script>
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-bb9a2ba1f03f6147732cb3cd52ac86c6b24524aa87a05ed0b726f11e46d7e277.js"></script>
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRuntimeErrors-4f205f2c14e769b448bcf477de2938c681660d5038bc464e3700256713ebe261.js"></script>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" >
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" ></script>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
  
  
  <style >


  </style>
  
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
  
	<c:import url="/layout/accountHeader" />
	
  <!-- / catg header banner section -->

 <!-- Cart view section -->
 <section id="aa-myaccount">
   <div class="container">
     <div class="row">
       <div class="col-md-12">
        <div class="aa-myaccount-area">         
            <div class="row">
                <div class="nav-side-menu col-md-2">
			    	<c:import url="/layout/accountMenu" />
				</div>
				<div class="container col-md-10">
				  <div class="row">
				    <div class="col-xs-12">
				       <h4>密碼變更</h4>
				      	<!-- Cart view section -->
						 <section id="aa-myaccount">
						   
						     <div class="row">
						       <div class="col-md-12">

						                
						                <form:form id="Form" method="POST" class="aa-login-form" action="${pageContext.request.contextPath}/member/changePassword" modelAttribute="member" enctype='multipart/form-data'>
						<!--                  <form action="" class="aa-login-form"> -->
						                 	<div class="form-group">
							                   	<label for="">舊密碼<span>*</span></label><br>
							                   	<input type="password" id="origpwd" name="origpwd" placeholder="舊密碼" value=""  style="width:500px;" ><br>
							                   	<img id="origpasswordErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
												<small id="origpasswordErrorMsg" class="form-text ll-err-msg CheckStatus"></small>
												<img id="origpasswordCheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
						                    </div>
						                    <div class="form-group">
							                   	<label for="">新密碼<span>*</span></label><br>
							                   	<input type="password" id="password" name="pwd" placeholder="新密碼" value=""  style="width:500px;" ><br>
							                   	<img id="passwordErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
												<small id="passwordErrorMsg" class="form-text ll-err-msg CheckStatus"></small>
												<img id="passwordCheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
						                    </div>
						                    <div class="form-group">
							                   	<label for="">新密碼再次輸入<span>*</span></label><br>
							                   	<input type="password" id="password2" name="pwd2" placeholder="新密碼" value=""  style="width:500px;" ><br>
							                   	<img id="password2ErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
												<small id="password2ErrorMsg" class="form-text ll-err-msg CheckStatus"></small>
												<img id="password2CheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
						                    </div>
						                    <hr style="border-bottom: 1px solid #ccc; height:3px;" />
						                    <div class="form-group">
						                    	<button type="submit" id="FormSubmit" class="aa-browse-btn">變更密碼</button><button type="submit" id="oneclickbutton" class="ll-default-btn">一鍵輸入</button><br><br>
						                    </div>
						                    <div class="form-group">
							               			<div id="MsgDiv" class="alert alert-info"><strong id="MsgLabel">XXX:</strong><br>
						             				<span id="Msg">xxx</span>
						             				</div>
											</div>
										</form:form>

						       </div>
						     </div>
						 </section>

 <!-- / Cart view section -->
				    </div>
				     
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
  <br>
<br>
<br>
<br>
<c:import url="/layout/footer" />
  
  <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
  <script  src="https://cdpn.io/cp/internal/boomboom/pen.js?key=pen.js-70199a3b-d922-2eff-4b6c-1b5626afc909" crossorigin></script>
  
  </body>
  

<script src='https://cdn.datatables.net/1.10.5/js/jquery.dataTables.min.js'></script>
<script src='https://cdn.datatables.net/plug-ins/f2c75b7247b/integration/bootstrap/3/dataTables.bootstrap.js'></script>
<script src='https://cdn.datatables.net/responsive/1.0.4/js/dataTables.responsive.js'></script>
      <script id="rendered-js" >
      $(document).ready(function() {
    	var checkOrigPwdFlag;
  		var checkPwdFlag;
  		var checkPwd2Flag;
  		
  		let msgDiv = $("#MsgDiv");
  		let msgLabel = $("#MsgLabel");
  		let msg = $("#Msg");
  	  	msgDiv.hide();
  	  
  		
  		hideOrigPwdImgMsg();
  		hidePwdImgMsg();

  	    $("#origpwd").change(checkOrigPassword);
  	    $("#password").change(checkPassword);
  	    $("#password2").change(checkPassword);
  	
  	
  		//密碼變更成功
  	  	<c:if test='${(verified != null)&&(verified== true)}'>
  	  		showMsg('成功訊息:','<c:out value="${msg}" />','alert-info');
		</c:if>
		//密碼變更錯誤
		<c:if test='${(verified != null)&&(verified== false)}'>
			showMsg('錯誤訊息:','<c:out value="${msg}" />','alert-danger');
	  	</c:if>
	  	
  	    //=============================================================================
  	    //================================  FUNCTIONS  ================================
  	    //=============================================================================
  	   
  	 	 //1. 檢查密碼
  	 	 function checkOrigPassword() {
  	        let pwdVal = $("#origpwd").val();
  	        let pwdCheckImg = $("#origpasswordCheckImg");
  	        let pwdErrorMsg = $("#origpasswordErrorMsg");
  	        let pwdErrorImg = $("#origpasswordErrorImg");

  	        console.log("origpasswordVal: "+pwdVal);
  	        console.log("origpasswordCheckImg: "+ pwdCheckImg.attr("id"));

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

  	
  	      hideOrigPwdImgMsg();
  	
  	      	//password1的check結果動作
  	        if (!check) {
  	        	pwdErrorMsg.html(msg);
  	        	pwdErrorMsg.show();
  	        	pwdErrorImg.show();
  	        }
  	        else {
  	        	pwdCheckImg.show();
  	        }
  	        checkOrigPwdFlag = check;
  	
  	    }
  	    
  	 	function hideOrigPwdImgMsg() {
 	    	 $("#origpasswordCheckImg").hide();
 	         $("#origpasswordErrorMsg").hide();
 	         $("#origpasswordErrorImg").hide();
 	    }
  	 	
  	    
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
  	      	if (pwdVal2 == "") {
  	            msg2 = "不可為空白"; check2 = false;
  	        }
  	      	else if( pwdVal != pwdVal2 ){
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
  	
  	   

  	    $("#FormSubmit").click(function(e){
  		    e.preventDefault();
  		  	checkOrigPassword();
  		    checkPassword();
  		    
  		    console.log("checkPwdFlag:" + checkPwdFlag + "checkPwd2Flag:" + checkPwd2Flag );
  		    
  		    let errorMSG = "<ul class='ll-err-list-msg' >";
  		    
  		    if(!checkOrigPwdFlag || !checkPwdFlag || !checkPwd2Flag )
  		    {
  		    	errorMSG += "<li>密碼有誤</li>";
  		    }
  		    else{
  		    	msgDiv.hide();
  		    }
  		    
  		    if (checkOrigPwdFlag && checkPwdFlag && checkPwd2Flag ) {
  		        $("#Form").submit();
  		    }
  		    else {
  		    	showMsg('錯誤訊息', errorMSG, 'alert-danger')
  		    }
  		       
  		});
  	    
  	  	$("#oneclickbutton").click(function(e){
			$("input[name='origpwd']").val("Pass~123");
			$("input[name='pwd']").val("Pass~1234");
			$("input[name='pwd2']").val("Pass~1234");

			e.preventDefault();
		});
  	  
  	  	function showMsg(s1, s2, classname){
     	  var msgDiv = $("#MsgDiv");
    	  var msgLabel = $("#MsgLabel");
    	  var msg = $("#Msg");
    	  msgLabel.html(s1);
    	  msg.html(s2);
		  msgDiv.removeClass().addClass('alert '+classname).show();
		}
  	  
      });
      
      
    	</script>
</html>