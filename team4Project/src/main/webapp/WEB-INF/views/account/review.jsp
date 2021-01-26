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
				  <div class="row">
				    <div class="col-xs-12">
				       <h4>儲值確認</h4>
				       <form id="Form" action="${pageContext.request.contextPath}/member/executePayment" method="post">
						<table>
							<tr>
								<td colspan="2"><b>Transaction Details:</b></td>
								<td>
									<input type="hidden" name="paymentId" value="${param.paymentId}" />
									<input type="hidden" name="PayerID" value="${param.PayerID}" />
								</td>
							</tr>
							<tr>
								<td>Description:</td>
								<td>${transaction.description}</td>
							</tr>
							<tr>
								<td>Subtotal:</td>
								<td>${transaction.amount.details.subtotal} USD</td>
							</tr>
							<tr>
								<td>Shipping:</td>
								<td>${transaction.amount.details.shipping} USD</td>
							</tr>
							<tr>
								<td>Tax:</td>
								<td>${transaction.amount.details.tax} USD</td>
							</tr>
							<tr>
								<td>Total:</td>
								<td>${transaction.amount.total} USD</td>
							</tr>	
							<tr><td><br/></td></tr>
							<tr>
								<td colspan="2"><b>Payer Information:</b></td>
							</tr>
							<tr>
								<td>First Name:</td>
								<td>${payer.firstName}</td>
							</tr>
							<tr>
								<td>Last Name:</td>
								<td>${payer.lastName}</td>
							</tr>
							<tr>
								<td>Email:</td>
								<td>${payer.email}</td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>
								<td colspan="2"><b>Shipping Address:</b></td>
							</tr>
							<tr>
								<td>Recipient Name:</td>
								<td>${shippingAddress.recipientName}</td>
							</tr>
							<tr>
								<td>Line 1:</td>
								<td>${shippingAddress.line1}</td>
							</tr>
							<tr>
								<td>City:</td>
								<td>${shippingAddress.city}</td>
							</tr>
							<tr>
								<td>State:</td>
								<td>${shippingAddress.state}</td>
							</tr>
							<tr>
								<td>Country Code:</td>
								<td>${shippingAddress.countryCode}</td>
							</tr>
							<tr>
								<td>Postal Code:</td>
								<td>${shippingAddress.postalCode}</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input id="FormSubmit" type="submit" value="Pay Now" />
								</td>
							</tr>		
						</table>
						</form>
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
  
  </body>
  

<script src='https://cdn.datatables.net/1.10.5/js/jquery.dataTables.min.js'></script>
<script src='https://cdn.datatables.net/plug-ins/f2c75b7247b/integration/bootstrap/3/dataTables.bootstrap.js'></script>
<script src='https://cdn.datatables.net/responsive/1.0.4/js/dataTables.responsive.js'></script>
      <script id="rendered-js" >
      $(document).ready(function() {
    	  $("#Form").submit();
      });
      
      
    	</script>
</html>