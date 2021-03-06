<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
  <c:import url="/layout/head" />
  

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


<link rel='stylesheet' href='https://cdn.datatables.net/responsive/1.0.4/css/dataTables.responsive.css'>

  <style class="INLINE_PEN_STYLESHEET_ID">
 
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
             
                <h4>我的帳號</h4>
                <div class="nav-side-menu col-md-2">
			    	<c:import url="/layout/accountMenu" />
				</div>
			<div class="container col-md-10">
				  <div class="row">
				    <div class="col-xs-12">
				      <table summary="This table shows how to create responsive tables using Datatables' extended functionality" class="table table-bordered table-hover dt-responsive">
				        <thead>
				          <tr>
				            <th>Country</th>
				            <th>Languages</th>
				            <th>Population</th>
				            <th>Median Age</th>
				            <th>Area (Km²)</th>
				          </tr>
				        </thead>
				        <tbody>
				          <tr>
				            <td>Argentina</td>
				            <td>Spanish (official), English, Italian, German, French</td>
				            <td>41,803,125</td>
				            <td>31.3</td>
				            <td>2,780,387</td>
				          </tr>
				          <tr>
				            <td>Australia</td>
				            <td>English 79%, native and other languages</td>
				            <td>23,630,169</td>
				            <td>37.3</td>
				            <td>7,739,983</td>
				          </tr>
				          <tr>
				            <td>Greece</td>
				            <td>Greek 99% (official), English, French</td>
				            <td>11,128,404</td>
				            <td>43.2</td>
				            <td>131,956</td>
				          </tr>
				          <tr>
				            <td>Luxembourg</td>
				            <td>Luxermbourgish (national) French, German (both administrative)</td>
				            <td>536,761</td>
				            <td>39.1</td>
				            <td>2,586</td>
				          </tr>
				          <tr>
				            <td>Russia</td>
				            <td>Russian, others</td>
				            <td>142,467,651</td>
				            <td>38.4</td>
				            <td>17,076,310</td>
				          </tr>
				          <tr>
				            <td>Sweden</td>
				            <td>Swedish, small Sami- and Finnish-speaking minorities</td>
				            <td>9,631,261</td>
				            <td>41.1</td>
				            <td>449,954</td>
				          </tr>
				        </tbody>
				        <tfoot>
				          <tr>
				            <td colspan="5" class="text-center">Data retrieved from <a href="http://www.infoplease.com/ipa/A0855611.html" target="_blank">infoplease</a> and <a href="http://www.worldometers.info/world-population/population-by-country/" target="_blank">worldometers</a>.</td>
				          </tr>
				        </tfoot>
				      </table>
				    </div>
				  </div>
				</div>

            
            </div>          
         </div>
       </div>
     </div>
   </div>
 </section>
 
 



 

  
<!--   <script  src="https://cdpn.io/cp/internal/boomboom/pen.js?key=pen.js-70199a3b-d922-2eff-4b6c-1b5626afc909" crossorigin></script> -->
  
   <!-- / Cart view section -->
<c:import url="/layout/footer" />
  </body>
  

<script src='https://cdn.datatables.net/1.10.5/js/jquery.dataTables.min.js'></script>
<script src='https://cdn.datatables.net/plug-ins/f2c75b7247b/integration/bootstrap/3/dataTables.bootstrap.js'></script>
<script src='https://cdn.datatables.net/responsive/1.0.4/js/dataTables.responsive.js'></script>
      <script id="rendered-js" >
		//$('table').DataTable();
		console.log('running..');
// 		$("#UserNotificationBox").click(function(e){
// 		  console.log('#UserNotificationBox clicked');
// 		  //e.preventDefault();
// 		  //alert('clicked.');
// 		});
	  
		
    	</script>
</html>