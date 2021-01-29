<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
</script>
<!-- Start header section -->
  <header id="aa-header">
    <!-- start header top  -->
    <div class="aa-header-top">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="aa-header-top-area">
              <!-- start header top left -->
              <div class="aa-header-top-left">
                <!-- start language -->
                <div class="aa-language">
                  <div class="dropdown">
                    <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                      <img src="<c:url value='/img/flag/english.jpg' />" alt="english flag">ENGLISH
                      <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                      <li><a href="#"><img src="img/flag/french.jpg" alt="">FRENCH</a></li>
                      <li><a href="#"><img src="img/flag/english.jpg" alt="">ENGLISH</a></li>
                    </ul>
                  </div>
                </div>
                <!-- / language -->

                <!-- start currency -->
                <div class="aa-currency">
                  <div class="dropdown">
                    <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                      <i class="fa fa-usd"></i>USD
                      <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                      <li><a href="#"><i class="fa fa-euro"></i>EURO</a></li>
                      <li><a href="#"><i class="fa fa-jpy"></i>YEN</a></li>
                    </ul>
                  </div>
                </div>
                <!-- / currency -->
                <!-- start cellphone -->
                <div class="cellphone hidden-xs">
                  <p><span class="fa fa-phone"></span>00-62-658-658</p>
                </div>
                <!-- / cellphone -->
              </div>
              <!-- / header top left -->
              <div class="aa-header-top-right" style="position: relative;">
                <ul class="aa-head-top-nav-right">
                  <li><a href="<c:url value='/member/myWallet' />">我的帳號</a></li>
                  <c:if test="${ user != null }" >
                 	 <li id="UserNotification" class="hidden-xs"><a href="#">通知</a></li>
                  	 <li><div><span class="ll-num-count">${userNotificationNo}</span></div></li>
                  </c:if>
                  <li class="hidden-xs"><a href="cart.html">購物車</a></li>
                  <c:choose>
                  	<c:when test="${ user == null }" >
                  		<li class="hidden-xs"><a href="<c:url value='/account/register' />">註冊</a></li>
                  		<li class="hidden-xs"><a href="<c:url value='/account/login' />">登入</a></li>
                  		<li><a href="" data-toggle="modal" data-target="#login-modal">企業登入</a></li>
	                </c:when>
	                <c:otherwise>
                  		<li id="userbox" style="width:30px;" ><img alt="img" style="margin-left:10px;margin-right:10px; " width="20" src="data:image/jpeg;base64,${user.profileImage1Base64}"/></li>
					</c:otherwise>
				  </c:choose>
				  <%-- <li><a href="" data-toggle="modal" data-target="#login-modal">登出<c:out value="${sessionScope.currentUser.fullname}"/>${user.fullname}</a></li> --%>

                </ul>
                <ul id="user-menu" class="usermenu_usermenu" >
                  <li><a href="/your-work/">Dashboard</a></li>
                  <li><a href="/lukelin311">個人資訊</a></li>
                  <li class="UserMenuLinks_sepBefore-2dqSV"><a href="/pen/">訂單一覽</a></li>
                  <li><a href="/project/">變更密碼</a></li>
                  <li class="UserMenuLinks_sepAfter-yFrww"><button>New Collection</button></li>
                  <li><a href="/assets/">Asset Manager</a></li>
                  <li class="UserMenuLinks_sepAfter-yFrww"><a href="/embed-theme-builder">Embed Theme Builder</a></li>
                  <li><a href="/accounts/signup">Upgrade to <span class="badge-pro svg BadgePro_svg-3Hmbx badge" data-test-id="pro-badge"><img src="https://cpwebassets.codepen.io/assets/packs/badge-pro-4d863f9a634627f269bdc611cb477b9f.svg" alt="PRO"></span></a></li>
                  <li><a href="https://blog.codepen.io/documentation/">Documentation</a></li><li class="UserMenuLinks_sepAfter-yFrww"><a href="/support/">Support</a></li>
                  <li><a href="/settings/"><svg width="20" height="20" class="icon icon-gear"><use xlink:href="/svgs/compiled/svgs.40016ff2.svg#gear"></use></svg>Settings</a></li>
                  <li><a id="logout" href="<c:url value='/account/logout' />"><svg width="20" height="20" class="icon icon-log-out"><use xlink:href="/svgs/compiled/svgs.40016ff2.svg#log-out"></use></svg>Log Out</a></li>
                </ul>
                <div id="UserNotificationBox" class="ll-notification-container" >
						    <h3>通知訊息
						      <i class="material-icons dp48 right">settings</i>
						    </h3>
						
<!-- 						    <input class="checkbox" type="checkbox" id="size_1" value="small" checked /> -->
<!-- 						    <label class="ll-notification new" for="size_1"><span class="ll-mn-span" data-url="https://www.google.com" ><em>1</em> <br>new <a href="">guest account(s)</a> have been created.</span><i class="material-icons dp48 right">clear</i></label> -->
						
						    
						    
						  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- / header top  -->

    <!-- start header bottom  -->
    <div class="aa-header-bottom">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="aa-header-bottom-area">
              <!-- logo  -->
              <div class="aa-logo" >
                <!-- Text based logo -->
                <a href="<c:url value='/' />" >
                  <img src="<c:url value='/img/luckycat.png' />" width="60" style="vertical-align: middle;  float:left;" />
                  <div style="float:left; vertical-align: middle;"><p><strong>滿滿</strong>大 <span>火速購買!!</span></p></div>
                </a>
                <!-- img based logo -->
                <!-- <a href="index.html"><img src="img/logo.jpg" alt="logo img"></a> -->
              </div>
              <!-- / logo  -->
               <!-- cart box -->
              <div class="aa-cartbox">
                <a class="aa-cart-link" href="#">
                  <span class="fa fa-shopping-basket"></span>
                  <span class="aa-cart-title">我的購物車</span>
                  <span class="aa-cart-notify">2</span>
                </a>
                <div class="aa-cartbox-summary">
                  <ul>
                    <li>
                      <a class="aa-cartbox-img" href="#"><img src="<c:url value='/img/woman-small-2.jpg' />" alt="img"></a>
                      <div class="aa-cartbox-info">
                        <h4><a href="#">Product Name</a></h4>
                        <p>1 x $250</p>
                      </div>
                      <a class="aa-remove-product" href="#"><span class="fa fa-times"></span></a>
                    </li>
                    <li>
                      <a class="aa-cartbox-img" href="#"><img src="<c:url value='/img/woman-small-1.jpg' />" alt="img"></a>
                      <div class="aa-cartbox-info">
                        <h4><a href="#">Product Name</a></h4>
                        <p>1 x $250</p>
                      </div>
                      <a class="aa-remove-product" href="#"><span class="fa fa-times"></span></a>
                    </li>                    
                    <li>
                      <span class="aa-cartbox-total-title">
                        Total
                      </span>
                      <span class="aa-cartbox-total-price">
                        $500
                      </span>
                    </li>
                  </ul>
                  <a class="aa-cartbox-checkout aa-primary-btn" href="checkout.html">Checkout</a>
                </div>
              </div>
              <!-- / cart box -->
              <!-- search box -->
              <div class="aa-search-box">
                <form action="<c:url value='ProductSearch'/>"  method="get" >
                  <input type="text"  name="search"  placeholder="Search here ex. '洗髮乳' ">
                  <button type="submit"><span class="fa fa-search"></span></button>
                </form>
              </div>
              <!-- / search box -->     
              <div class="aa-search-box" style="white-space: nowrap; overflow: hidden;">
<%-- 						<c:if test="${!empty queryproducttop}"> --%>
						<span style="color:red;font-weight: bold;">熱銷特賣</span>
<%-- 						</c:if> --%>
						<span >
						<c:forEach var="queryproducttopa" items="${queryproducttop}">
						  <tr><td>&nbsp;&nbsp;<a href='<c:url value="/ProductBuy/${queryproducttopa[2]}"/>'>${queryproducttopa[0]}</a> </a>&nbsp;&nbsp; <td></tr>
					</c:forEach></span>	
              </div>        
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- / header bottom  -->
  </header>
  <!-- / header section -->
  <!-- menu -->
  <section id="menu">
    <div class="container">
      <div class="menu-area">
        <!-- Navbar -->
        <div class="navbar navbar-default" role="navigation">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>          
          </div>
          <div class="navbar-collapse collapse">
            <!-- Left nav -->
            <ul class="nav navbar-nav">
              <li><a href="index.html">關於我們</a></li>
              <li><a href="#">商品 <span class="caret"></span></a>
                <ul class="dropdown-menu">                
                  <li><a href="<c:url value="/productShow/保健"/>">保健</a></li>
                  <li><a href="<c:url value="/productShow/泡麵"/>">泡麵</a></li>
                  <li><a href="<c:url value="/productShow/清潔"/>">清潔</a></li>
                  <li><a href="<c:url value="/productShow/甜點"/>">甜點</a></li>                                                
                  <li><a href="<c:url value="/productShow/生鮮"/>">生鮮</a></li>
                  <li><a href="<c:url value="/productShow/調味"/>">調味</a></li>
                  <li><a href="<c:url value="/productShow/零食"/>">零食</a></li>
                  <li><a href="<c:url value="/productShow/飲料"/>">飲料</a></li>
                  <li><a href="">其他.. <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                      <li><a href="<c:url value="/productShow/餐廚"/>">餐廚</a></li>
                      
                                                        
                    </ul>
                  </li>
                </ul>
              </li>
              <li><a href="<c:url value='/campaign/index'/>">活動</a>
<!--                 <ul class="dropdown-menu">   -->
<!--                   <li><a href="#">全家</a></li>                                                                 -->
<!--                   <li><a href="#">萊爾富</a></li>               -->
<!--                   <li><a href="#">統一超商</a></li> -->
<!--                   <li><a href="#">Sports</a></li> -->
<!--                   <li><a href="#">Formal</a></li>                 -->
<!--                   <li><a href="#">Sarees</a></li> -->
<!--                   <li><a href="#">Shoes</a></li> -->
<!--                   <li><a href="#">And more.. <span class="caret"></span></a> -->
<!--                     <ul class="dropdown-menu"> -->
<!--                       <li><a href="#">Sleep Wear</a></li> -->
<!--                       <li><a href="#">Sandals</a></li> -->
<!--                       <li><a href="#">Loafers</a></li> -->
<!--                       <li><a href="#">And more.. <span class="caret"></span></a> -->
<!--                         <ul class="dropdown-menu"> -->
<!--                           <li><a href="#">Rings</a></li> -->
<!--                           <li><a href="#">Earrings</a></li> -->
<!--                           <li><a href="#">Jewellery Sets</a></li> -->
<!--                           <li><a href="#">Lockets</a></li> -->
<!--                           <li class="disabled"><a class="disabled" href="#">Disabled item</a></li>                        -->
<!--                           <li><a href="#">Jeans</a></li> -->
<!--                           <li><a href="#">Polo T-Shirts</a></li> -->
<!--                           <li><a href="#">SKirts</a></li> -->
<!--                           <li><a href="#">Jackets</a></li> -->
<!--                           <li><a href="#">Tops</a></li> -->
<!--                           <li><a href="#">Make Up</a></li> -->
<!--                           <li><a href="#">Hair Care</a></li> -->
<!--                           <li><a href="#">Perfumes</a></li> -->
<!--                           <li><a href="#">Skin Care</a></li> -->
<!--                           <li><a href="#">Hand Bags</a></li> -->
<!--                           <li><a href="#">Single Bags</a></li> -->
<!--                           <li><a href="#">Travel Bags</a></li> -->
<!--                           <li><a href="#">Wallets & Belts</a></li>                         -->
<!--                           <li><a href="#">Sunglases</a></li> -->
<!--                           <li><a href="#">Nail</a></li>                        -->
<!--                         </ul> -->
<!--                       </li>                    -->
<!--                     </ul> -->
<!--                   </li> -->
<!--                 </ul> -->
              </li>
              <li><a href="<c:url value='/company/showCompany' />">合作企業</a></li>      
              <li><a href="contact.html">聯絡我們</a></li>
              <li><a href="<c:url value='/CTicketIndex' />">票劵購買 <span class="caret"></span></a>
                <ul class="dropdown-menu">                
                  <li><a href="<c:url value='/TicketType/1'/>">展覽</a></li>
                  <li><a href="<c:url value='/TicketType/2'/>">樂園與景點</a></li>
                  <li><a href="<c:url value='/TicketType/3'/>">運動賽事</a></li>
                 
                  
                </ul>
              </li>
              <li><a href="#">智慧客服</a></li>
             <li><a href="#">Digital <span class="caret"></span></a>
                <ul class="dropdown-menu">                
                  <li><a href="#">Camera</a></li>
                  <li><a href="#">Mobile</a></li>
                  <li><a href="#">Tablet</a></li>
                  <li><a href="#">Laptop</a></li>                                                
                  <li><a href="#">Accesories</a></li>                
                </ul>
              </li>
                    
              
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>       
    </div>
    <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4>企業登入</h4>
          
          <form class="aa-login-form" action="<c:url value='/company/CompanyLogin' />" method="post">
            <label for="">帳號(或Email)<span>*</span></label>
            <input type="text" name="account" placeholder="Username (or email)" value="familymart">
            <label for="">密碼<span>*</span></label>
            <input type="password" name="password" placeholder="Password" value="123">
            <button class="aa-browse-btn" type="submit" name="enter" >登入</button>
            <label for="rememberme" class="rememberme"><input type="checkbox" id="rememberme"> Remember me </label>
            <p class="aa-lost-password"><a href="#">忘記密碼</a></p>
            <div class="aa-register-now">
              
              <a href="<c:url value='/company/CmpRegi' />">企業註冊</a>
            </div>
          </form>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
  </section>
  <script>
 
  </script>
  <!-- / menu -->