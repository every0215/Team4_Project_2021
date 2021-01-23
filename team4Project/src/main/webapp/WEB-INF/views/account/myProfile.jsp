<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
  <c:import url="/layout/head" />
  

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


<link rel='stylesheet' href='https://cdn.datatables.net/responsive/1.0.4/css/dataTables.responsive.css'>

<style>

.imagePreview {
	width: 100%;
	height: 180px;
	background-position: center center;
/* 	background: url(http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg); */
	background-color: #fff;
	background-size: contain;
	background-repeat: no-repeat;
	display: inline-block;
	box-shadow: 0px -3px 6px 2px rgba(0, 0, 0, 0.2);
}

.btn-primary {
	display: block;
	border-radius: 0px;
	box-shadow: 0px 4px 6px 2px rgba(0, 0, 0, 0.2);
	margin-top: -5px;
}

.imgUp {
	margin-bottom: 15px;
}

.del {
	position: absolute;
	top: 0px;
	right: 15px;
	width: 30px;
	height: 30px;
	text-align: center;
	line-height: 30px;
	background-color: rgba(255, 255, 255, 0.6);
	cursor: pointer;
}

.aa-browse-btn { 
	cursor: pointer; 
}

</style>

<body> 
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeConsoleRunner-7f4d47902dc785f30dedcac9c996b9f31d4dfcc33567cc48f0431bc918c2bf05.js"></script>
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-bb9a2ba1f03f6147732cb3cd52ac86c6b24524aa87a05ed0b726f11e46d7e277.js"></script>
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRuntimeErrors-4f205f2c14e769b448bcf477de2938c681660d5038bc464e3700256713ebe261.js"></script>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" >
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" ></script>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
  
  
  
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
                <div class="nav-side-menu col-md-2">
			    	<c:import url="/layout/accountMenu" />
				</div>
				<div class="container col-md-10">
				  <h4>個人資料</h4>
				    <div class="col-xs-12">
				       <div class="col-xs-7" style="border-right: solid 2px #d8d8d8;">
				       		<form:form id="Form" method="POST" class="aa-login-form" action="${pageContext.request.contextPath}/member/myProfile" modelAttribute="member" enctype='multipart/form-data'>
			                	<div class="form-group">
									<label for="fullname">姓名:<span>*</span></label> 
									<input type="text" class="form-control" id="fullname" name="fullname" value="${sessionScope.currentUser.fullname}"  placeholder="請輸入全名"  required disabled>
								</div>
								<div class="form-group">
									<label for="nickname">暱稱:<span>*</span></label> 
									<input type="text" class="form-control" id="nickname" name="nickname" value="${sessionScope.currentUser.nickname}"  placeholder="請輸入暱稱" required>
									<img id="nicknameErrorImg" class="CheckStatus" src="<c:url value='/img/Warning_icon.png' />" style="width: 15px;">
									<small id="nicknameErrorMsg" class="form-text ll-err-msg CheckStatus">(5個到30個字)</small>
									<img id="nicknameCheckImg" class="CheckStatus" src="<c:url value='/img/check.png' />" style="width: 25px;">
								</div>
								<div class="form-group">
									<label for="qid">身份證字號:<span>*</span></label> 
									<input type="text" class="form-control" id="qid" name="qid" value="${sessionScope.currentUser.qid}" placeholder="請輸入身份證字號" required disabled>
								</div>
								<div class="form-group">
									<label for="email">電子郵件:<span>*</span></label>
									 <input type="email" class="form-control" id="email" name="email" value="${sessionScope.currentUser.email}"  placeholder="請輸入電子郵件" required disabled>
								</div>
								<hr style="border-bottom: 1px solid #ccc; height:3px;" />
								<div class="form-group">
									<button type="submit" id="FormSubmit" class="aa-browse-btn">更新</button>
									<br/><br/>
			                   	</div>  
			                   	<div class="form-group">
									<div id="MsgDiv" class="alert alert-info"><strong id="MsgLabel">XXX:</strong><br>
									<span id="Msg">xxx</span>
									</div>
								</div>
			                 </form:form>
				       </div>
				      	<div class="col-xs-5">
				       		<form:form id="ProfileImageForm" method="POST" class="aa-login-form text-center" action="${pageContext.request.contextPath}/member/myProfileImageUpdate" modelAttribute="member" enctype='multipart/form-data'>
				       			<img src="data:image/jpeg;base64,${sessionScope.currentUser.profileImage1Base64}" width="250"/>
								<hr style="border-bottom: 1px solid #ccc; height:3px;" />
								<div class="col-sm-12 imgUp text-center">
								    <div class="imagePreview"></div>
									<label class="ll-primary-btn" style="font-size:14px;">
										選擇圖片<input type="file" name="profileImage1Path" class="uploadFile img" value="Upload Photo" style="width: 0px;height: 0px;overflow: hidden;">
									</label><br>
									<label id="SubmitButton" class="aa-browse-btn" style="font-size:14px;">
										更新圖片<input type=file name="profileImage1Path" class="" value="" style="width: 0px;height: 0px;overflow: hidden;" disabled>
									</label><br>


							  	</div>

							</form:form>
				      	
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
  
  <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
  <script  src="https://cdpn.io/cp/internal/boomboom/pen.js?key=pen.js-70199a3b-d922-2eff-4b6c-1b5626afc909" crossorigin></script>
  
  
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js'></script>
  
  <script >
      $(document).ready(function() {
    		
    		let msgDiv = $("#MsgDiv");
    		let msgLabel = $("#MsgLabel");
    		let msg = $("#Msg");
    	  	msgDiv.hide();
    	  
    		
    	  	hideNicknameImgMsg();

    	    $("#nickname").change(checkNickname);
    	
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
    	    //2. 檢查暱稱
			function hideNicknameImgMsg() {
				$("#nicknameCheckImg").hide();
				$("#nicknameErrorMsg").hide();
				$("#nicknameErrorImg").hide();
			}
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
				else if ((nickVal.length < 5) || (nickVal.length > 30)) {
					msg = "5個到30個字"; check = false;
				}
				else {
					let matched1 = nickVal.match(/[,./;\[\]\\\|{}`~!@#$%^&*()\'+=]+/g);
					//if(!hasChinese()){
					if (matched1) {
						msg = "不可有特殊字元";
						check = false;
						console.log("check nickname: " + check);
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
				return check;
			}

    	    $("#FormSubmit").click(function(e){
    		    e.preventDefault();
    		    let checkNicknameFlag = checkNickname();
    		    
    		    console.log("checkNicknameFlag: " + checkNicknameFlag );
    		    
    		    let errorMSG = "<ul class='ll-err-list-msg' >";
    		    
    		    if(!checkNicknameFlag )
    		    {
    		    	errorMSG += "<li>填寫資料有誤</li>";
    		    }
    		    else{
    		    	msgDiv.hide();
    		    }
    		    
    		    if (checkNicknameFlag ) {
    		        $("#Form").submit();
    		    }
    		    else {
    		    	showMsg('錯誤訊息', errorMSG, 'alert-danger')
    		    }
    		       
    		});
    	  
    	
      });
      

      $("#SubmitButton").click(function(){
    	  $("#ProfileImageForm").submit();
      });
      
      $(document).on("click", "i.del", function () {
        $(this).parent().remove();
      });
      $(function () {
    	  $(".imagePreview").hide();
        $(document).on("change", ".uploadFile", function ()
        {
          var uploadFile = $(this);
          var files = !!this.files ? this.files : [];
          if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support

          if (/^image/.test(files[0].type)) {// only image file
            var reader = new FileReader(); // instance of the FileReader
            reader.readAsDataURL(files[0]); // read the local file

            reader.onloadend = function () {// set image data as background of div
              //alert(uploadFile.closest(".upimage").find('.imagePreview').length);
              uploadFile.closest(".imgUp").find('.imagePreview').css("background-image", "url(" + this.result + ")");
              $(".imagePreview").show();
              
              let selectedImageUrl = $(".imagePreview").css('background-image');
              let selectedImage = selectedImageUrl.substring(selectedImageUrl.indexOf("base64,")+7, selectedImageUrl.lastIndexOf('")'));

//         	  console.log(selectedImageUrl);
//            console.log(selectedImage);

            };
          }

        });
      });
      
    	</script>
  </body>

      
</html>