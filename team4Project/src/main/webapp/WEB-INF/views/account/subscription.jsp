<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
  <c:import url="/layout/head" />
  

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


<link rel='stylesheet' href='https://cdn.datatables.net/responsive/1.0.4/css/dataTables.responsive.css'>

  <style >
 	
/* General */

/* Intro */

.intro{
  width:100%;
  height:30px;
}
.intro h1{
  font-family:'Oswald', sans-serif;
  letter-spacing:2px;
  font-weight:normal;
  font-size:14px;
  color:#fff;
  text-align:center;
  margin-top:10px;
}
.intro a{
  color:#fff;
  font-weight:bold;
  letter-spacing:0;
}
.intro img{
  width:20px;
  heght:20px;
  margin-left:5px;
  margin-right:5px;
  position:relative;
  top:5px;
}


#container{
  width:80%;
  min-width:1100px;
  min-height:500px;
  margin:3% auto 0 auto;
}
.pricetab{
  width:20%;
  min-width:220px;
  background: linear-gradient(#555, #444);
  float:left;
  margin-top:.2%;
  box-shadow:1px 1px 5px rgba(0, 0, 0, .5);
}
.pricetabmid{
  width:97%;
  min-width:220px;
  background: linear-gradient( #39c7f1, #1426ff);
  float:left;
/*   box-shadow:0 0  15px rgba(0, 0, 0, 1); */
  position:relative;
  color: #fff;
  margin-bottom:30px;
}

.pricemid img{
  margin-top: 15px;
  margin-bottom: 15px;
  margin-left: auto;
  margin-right: auto;
  
  height:150px;
}

.infos{
  margin-top:10%;
}
.pricefooter{
  width:100%;
  height:50px;
  margin-top:10%;
  background:#fe9040; 
}
.pricefootermid{
  width:100%;
  height:50px;
  background:#409efe; 
}

h1{
  font-size:18px;
  color:#fff;
  text-align:center;
  line-height:3;
}
h2{
  text-align:center;
  font-size:42px;
  color:#fff;
}
sub{
  text-transform: uppercase;
  font-size: 14px;
  font-weight: bold;
}
h3{
  font-size:14px;
  font-weight:normal;
  text-align:center;
  color:#fff;
  line-height:1;
}
.button a{
  color:#fff;
  font-size:14px;
  font-weight:bold;
  text-decoration:none;
  line-height:3;
}
.buttonmid a{
  color:#fff;
  font-size:14px;
  font-weight:bold;
  text-decoration:none;
  line-height:3.5;
}
.credit{
  font-family:arial;
  color:#fff;
  font-size:16px;
  font-weight:normal;
  text-align:left;
  text-shadow: 1px 2px 5px rgba(0,0,5,0.2);
  margin-left:5%;
  line-height:1.3;
  -moz-transition: all 0.4s ease-in-out;
  -o-transition: all 0.4s ease-in-out;
  -ms-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
}
/* Buttons */ 
.button{
  width:50%;
  height:50px;
  margin:0 auto 0 auto;
  background:#ff9547;
  text-align:center; 
  cursor:pointer;
  -moz-transition: all 0.4s ease-in-out;
  -o-transition: all 0.4s ease-in-out;
  -ms-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
}
.button:hover{
  width:100%;
}
.buttonmid{
  width:90%;
  height:50px;
  margin:0 auto 0 auto;
  background:#33333330;
  text-align:center; 
  font-size:16px;
  cursor:pointer;
  -moz-transition: all 0.4s ease-in-out;
  -o-transition: all 0.4s ease-in-out;
  -ms-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
}
.buttonmid:hover{
  width:100%;
}

/* .h1, .h2, .h3, h1, h2, h3{ */
/* 	cursor:pointer; */
/* 	margin-top: 40px; */
/* 	margin-bottom: 10px; */
/* } */
 	
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
								<form id="Form" method="POST" class="" action="${pageContext.request.contextPath}/member/updateMemberSubscriptions">
									<div class="row">
										<div id="MemberSubscriptionsDiv">
											<h4>訂閱管理</h4>

										</div>
									</div>
									<hr style="border-bottom: 1px solid #ccc; height: 3px;" />
									<div class="row" style="padding-left: 15px;">
										<button type="submit" id="FormSubmit" class="aa-browse-btn">更新訂閱</button>
										<br /> <br />
									</div>
									<div class="row" style="padding-left: 15px;">
										<div id="MsgDiv" class="alert alert-info">
											<strong id="MsgLabel">XXX:</strong><br> <span id="Msg">xxx</span>
										</div>
									</div>
								</form>

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
  
  </body>
  

<script src='https://cdn.datatables.net/1.10.5/js/jquery.dataTables.min.js'></script>
<script src='https://cdn.datatables.net/plug-ins/f2c75b7247b/integration/bootstrap/3/dataTables.bootstrap.js'></script>
<script src='https://cdn.datatables.net/responsive/1.0.4/js/dataTables.responsive.js'></script>
      <script id="rendered-js" >
      $(document).ready(function() {
    	  var msgDiv = $("#MsgDiv");
    	  var msgLabel = $("#MsgLabel");
    	  var msg = $("#Msg");
    	  msgDiv.hide();
    	  
    	  getMemberSubscriptions();
    	  
    	  //新增成功
    	  <c:if test='${(verified != null)&&(verified== true)}'>
    	  		showMsg('成功訊息:','<c:out value="${msg}" />','alert-info');
		  </c:if>
		  //新增錯誤
		  <c:if test='${(verified != null)&&(verified== false)}'>
		  		showMsg('錯誤訊息:','<c:out value="${msg}" />','alert-danger');
	  	  </c:if>
    	  
// 	  	$("#Form").click(function(e){
// 	  		e.preventDefault();
//             var selectedCompany = [];
//             $.each($("input[name='subscribeCompany']:checked"), function(){
//             	selectedCompany.push($(this).val());
//             });
//             console.log("My subscribed company are: " + selectedCompany.join(", "));
            
            
//         });
	  	
    	  function getMemberSubscriptions(){
        	  let mDiv = $("#MemberSubscriptionsDiv");
        	  $.ajax({
    				type: "Get",
    				url: "<c:url value='/member/getCompanyList' />",
    				//data: { memberId: id },
    				success:function(data){
    					console.log("success: "+data);
    					//可增加動態處理
    					// ....
    					let htmlstr = '';
     					for(let i = 0; i<data.length;i++){
     			        	console.log("Companies: " + data[i].companyName);
     			        	htmlstr += '<div class="col-xs-4"><div class="pricetabmid"><div class="pricemid text-center"><img src="data:image/jpeg;base64,' + data[i].logoBase64 + '" ></div><div class="pricefootermid">';
     			        	htmlstr += '<div class="buttonmid"><div class="form-check"><label class="form-check-label" for="company'+data[i].id+'" style="text-overflow: ellipsis;" >' + data[i].companyName + '</label><br>';
     			        	htmlstr += '<input type="checkbox" class="form-check-input" id="company'+data[i].id+'" name="subscribeCompany" value="'+data[i].id+'" ></div></div></div></div></div>';
    	 			        
     			        }
     					mDiv.append(htmlstr);
     					
     					//check有訂閱的公司
     		        	  $.ajax({
     		  				type: "Get",
     		  				url: "<c:url value='/member/getMemberSubscriptions' />",
     		  				//data: { memberId: id },
     		  				success:function(data2){
     		  					console.log("success(MemberSubscriptions): "+data2);
     		  					console.log(JSON.stringify(data2));
     		  					//可增加動態處理
     		  					// ....
     		   					for(let i = 0; i<data2.length;i++){
	     		  	 			    $('#company'+data2[i]).prop('checked',true);
	     		   					
     		   			        }

     		  				},
     		  				error: function(xhr, status, error){
     		  			    	var errorMessage = "[Error-"+  xhr.status+"]\r\n" + xhr.statusText + ': ' + xhr.responseText
     		  			    	console.log(errorMessage);
     		  			    	msgDiv.html("取得已訂閱公司清單失敗(status:" +  xhr.status + ")");
     		  			    	msgDiv.removeClass().addClass("alert alert-danger").show();
     		  			    }
     		  		  	  });
    				},
    				error: function(xhr, status, error){
    			    	var errorMessage = "[Error-"+  xhr.status+"]\r\n" + xhr.statusText + ': ' + xhr.responseText
    			    	console.log(errorMessage);
    			    	msgDiv.html("取得公司訂閱清單失敗(status:" +  xhr.status + ")");
    			    	msgDiv.removeClass().addClass("alert alert-danger").show();
    			    	
    			    }
    				
    				
    		  });
        	 
          }
      });
      
      
    	</script>
</html>