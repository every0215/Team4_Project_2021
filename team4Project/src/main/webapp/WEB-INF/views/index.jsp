<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>

<html lang="en" >
<head> <meta charset="UTF-8"></head>
   <c:import url="/layout/head" />
  <body>
<!--   企業登入連結 -->
<!--   企業登入連結 -->
<!--   企業登入連結 -->
<!--   企業登入連結 -->
 
  
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

  <!-- Start slider -->
  <section id="aa-slider">
    <div class="wrapper">
        <ul class="slides" id="campContainer">

        </ul>
        <ul class="dot" id="dotContainer">
            <li id="1"></li>
            <li id="2"></li>
            <li id="3"></li>
            <li id="4"></li>
            <li id="5"></li>
        </ul>
        <div id="prevSlide" class="slide_btn">
            <i class="fa fa-caret-left"></i>
        </div>
        <div  id="nextSlide" class="slide_btn">
            <i class="fa fa-caret-right"></i>
        </div>
    </div>
  </section>
  <!-- / slider -->
  <!-- Start Promo section -->
	<div class="indexclass">
		<div class="indexclassaa1">
		<a href="<c:url value="/productShow/保健"/>">
			<img class="indexclassbb" src="img/indexclass/food13.png" alt="img"></a>
			<div class="indexclassspan">
				<span>買一送一</span>
				<h4>
					<a class="indexclassa" href="<c:url value="/productShow/保健"/>">保健</a>
				</h4>
			</div>
			<a href="<c:url value="/productShow/泡麵"/>">
			<img class="indexclassbb" src="img/indexclass/food9.png" alt="img"></a>
			<div class="indexclassspan">
				<span>早鳥促銷</span>
				<h4>
					<a class="indexclassa" href="<c:url value="/productShow/泡麵"/>">泡麵</a>
				</h4>
			</div>
			<a href="<c:url value="/productShow/清潔"/>">
			<img class="indexclassbb" src="img/indexclass/food12.png" alt="img"></a>
			<div class="indexclassspan">
				<span>全面95折</span>
				<h4>
					<a class="indexclassa" href="<c:url value="/productShow/清潔"/>">清潔</a>
				</h4>
			</div>
			<a href="<c:url value="/productShow/甜點"/>">
			<img class="indexclassbb" src="img/indexclass/food7.png" alt="img"></a>
			<div class="indexclassspan">
				<span>20:00後6折</span>
				<h4>
					<a class="indexclassa" href="<c:url value="/productShow/甜點"/>">甜點</a>
				</h4>
			</div>
			<a href="<c:url value="/productShow/生鮮"/>">
			<img class="indexclassbb" src="img/indexclass/food5.png" alt="img"></a>
			<div class="indexclassspan">
<!-- 				<span>Exclusive Item</span> -->
				<h4>
					<a class="indexclassa" href="<c:url value="/productShow/生鮮"/>">生鮮</a>
				</h4>
			</div>
			<a href="<c:url value="/productShow/調味"/>">
			<img class="indexclassbb" src="img/indexclass/food8.png" alt="img"></a>
			<div class="indexclassspan">
<!-- 				<span>Exclusive Item</span> -->
				<h4>
					<a class="indexclassa" href="<c:url value="/productShow/調味"/>">調味</a>
				</h4>
			</div>

		</div>

		<div class="indexclassaa2">
		<a href="<c:url value="/productShow/零食"/>">
			<img class="indexclassbb" src="img/indexclass/food11.png" alt="img"></a>
			<div class="indexclassspan">
				<span>夏日必選</span>
				<h4>
					<a class="indexclassa" href="<c:url value="/productShow/零食"/>">零食</a>
				</h4>
			</div>
			<a href="<c:url value="/productShow/飲料"/>">
			<img class="indexclassbb" src="img/indexclass/food10.png" alt="img"></a>
			<div class="indexclassspan">
<!-- 				<span>Exclusive Item</span> -->
				<h4>
					<a class="indexclassa" href="<c:url value="/productShow/飲料"/>">飲料</a>
				</h4>
			</div>
			<a href="<c:url value="/productShow/餐廚"/>">
			<img class="indexclassbb" src="img/indexclass/food3.png" alt="img"></a>
			<div class="indexclassspan">
<!-- 				<span>Exclusive Item</span> -->
				<h4>
					<a class="indexclassa" href="<c:url value="/productShow/餐廚"/>">餐廚</a>
				</h4>
			</div>
			
			<a href="<c:url value='/campaign/index'/>">
			<img class="indexclassbb" src="img/indexclass/food14.png" alt="img"></a>
			<div class="indexclassspan">
				<span>不容錯過</span>
				<h4>
					<a class="indexclassa" href="#">活動專區</a>
				</h4>
			</div>
			
			<a href="<c:url value='/CTicketIndex'/>">
			<img class="indexclassbb" src="img/indexclass/UpdatedTicket.png" alt="img"></a>
			<div class="indexclassspan">
				<span>優惠促銷</span>
				<h4>
					<a class="indexclassa" href="<c:url value='/CTicketIndex' />">票券專區</a>
				</h4>
			</div>
			
			<a href="<c:url value='#'/>">
			<img class="indexclassbb" src="<c:url value='/img/indexclass/store1.jpg'/>" alt="img"></a>
			<div class="indexclassspan">
<!-- 				<span>當地特色</span> -->
				<h4>
					<a class="indexclassa" href="#">各地門市</a>
				</h4>
			</div>

		</div>
	</div>
	<!-- / Promo section -->


  <!-- Products section -->
 <section id="aa-product">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="row">
            <div class="aa-product-area">
              <div class="aa-product-inner">
                <!-- start prduct navigation -->
                 <ul class="nav nav-tabs aa-products-tab">
                    <li class="active"><a href="#men" data-toggle="tab">7-11</a></li>
                    <li><a href="#women" data-toggle="tab">全家</a></li>
                    <li><a href="#sports" data-toggle="tab">萊爾富</a></li>
                    <li><a href="#electronics" data-toggle="tab">全聯</a></li>
                  </ul>
                  <!-- Tab panes -->
                  <div class="tab-content">
                    <!-- Start men product category -->
                    <div class="tab-pane fade in active" id="men">
                      <ul class="aa-product-catg">
                        <!-- 小七 -->
                        <!-- 小七 -->
                        <!-- 小七 -->
                        <!-- 小七 -->
                        <!-- 小七 -->
                        <!-- 小七 -->
                        <!-- 小七 -->
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="getproductimage/50" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">必安住水性噴霧殺蟲劑(600ml)</a></h4>
                              <span class="aa-product-price">$200.00</span><span class="aa-product-price"><del>$220.00</del></span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
                          </div>
                          <!-- product badge -->
                          <span class="aa-badge aa-sale" href="#">優惠中!</span>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="getproductimage/41" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">依必朗 防霉抗菌洗衣精補充包 加州橘子 (2000g/瓶)x8包</a></h4>
                              <span class="aa-product-price">$41.00</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                          <!-- product badge -->
                           <span class="aa-badge aa-hot" href="#">熱銷</span>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="getproductimage/42" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">白蘭 新動力配方洗碗精 清新檸檬 (2.8kg/瓶)x4瓶</a></h4>
                              <span class="aa-product-price">$582.00</span><span class="aa-product-price"><del>$650.50</del></span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="getproductimage/43" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">高露潔抗敏感長效防護牙膏-琺瑯質照護120gx2入</a></h4>
                              <span class="aa-product-price">$238.00</span><span class="aa-product-price"><del>$65.50</del></span>
                            </figcaption>
                          </figure>                          
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                          <!-- product badge -->
                          <span class="aa-badge aa-sold-out" href="#">售完</span>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="getproductimage/49" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">毛寶熱水瓶開飲機洗淨劑(25gx3入)x12盒</a></h4>
                              <span class="aa-product-price">$666.00</span>
                            </figcaption>
                          </figure>
                         
                          <div class="aa-product-hvr-content ii">
                           <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="getproductimage/44" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">飛柔薄荷水涼洗髮乳1000ml</a></h4>
                              <span class="aa-product-price">$249.50</span><span class="aa-product-price"><del>$265.50</del></span>
                            </figcaption>
                          </figure>                          
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="getproductimage/45" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">蜂膠草本抗菌皂-清新花果香(100gx4入)</a></h4>
                              <span class="aa-product-price">$333.00</span><span class="aa-product-price"><del>$333.50</del></span>
                            </figcaption>
                          </figure>                          
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                           <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                          <!-- product badge -->
                          <span class="aa-badge aa-sale" href="#">優惠中!</span>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="getproductimage/46" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">落建頭皮洗髮露 (400ml/瓶)x6瓶</a></h4>
                              <span class="aa-product-price">$171.00</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                          <!-- product badge -->
                           <span class="aa-badge aa-sold-out" href="#">售完</span>
                        </li>    
                        
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="getproductimage/47" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">澎澎香浴乳-亮澤滋潤型850g</a></h4>
                              <span class="aa-product-price">$140.0</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                           <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="getproductimage/48" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">黑人深潔倍護牙刷(纖柔+圓磨軟毛)9入</a></h4>
                              <span class="aa-product-price">$351.00</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                           <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>
                      </ul>
                      <a class="aa-browse-btn" href="#">所有商品 <span class="fa fa-long-arrow-right"></span></a>
                    </div>
                     							


                        
                        
                        <!-- start single product item -->
                       
                   
                    <!-- / men product category -->
                    <!-- start women product category -->
                        <!-- 全家 -->
                        <!-- 全家 -->
                        <!-- 全家 -->
                        <!-- 全家 -->
                        <!-- 全家 -->
                        <!-- 全家 -->
                        <!-- 全家 -->
                    <div class="tab-pane fade" id="women">
                      <ul class="aa-product-catg">
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/women/girl-1.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">雙響炮</a></h4>
                              <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
                          </div>
                          <!-- product badge -->
                          <span class="aa-badge aa-sale" href="#">優惠中!</span>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/women/girl-2.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                          <!-- product badge -->
                           <span class="aa-badge aa-hot" href="#">熱銷</span>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/women/girl-3.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/women/girl-4.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                            </figcaption>
                          </figure>                          
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                          <!-- product badge -->
                          <span class="aa-badge aa-sold-out" href="#">售完</span>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/women/girl-5.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span>
                            </figcaption>
                          </figure>
                         
                          <div class="aa-product-hvr-content ii">
                           <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/women/girl-6.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                            </figcaption>
                          </figure>                          
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/women/girl-7.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                            </figcaption>
                          </figure>                          
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                           <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                          <!-- product badge -->
                          <span class="aa-badge aa-sale" href="#">優惠中!</span>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/women/girl-1.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                          <!-- product badge -->
                           <span class="aa-badge aa-sold-out" href="#">售完</span>
                        </li>    
                        
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/electronics/electronic-5.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                           <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/electronics/electronic-5.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                           <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>
                      </ul>
                      <a class="aa-browse-btn" href="#">所有商品 <span class="fa fa-long-arrow-right"></span></a>
                    </div>
                        <!-- 全家 -->
                        <!-- 全家 -->
                        <!-- 全家 -->
                        <!-- 全家 -->
                        <!-- 全家 -->
                        <!-- 全家 -->
                        <!-- 全家 -->
                    <!-- / women product category -->
                    <!-- start sports product category -->
                        <!-- 萊爾富 -->
                        <!-- 萊爾富 -->
                        <!-- 萊爾富 -->
                        <!-- 萊爾富 -->
                        <!-- 萊爾富 -->
                        <!-- 萊爾富 -->
                        <div class="tab-pane fade" style="padding-bottom:35px" id="sports">
                          <ul class="aa-product-catg">
                            <!-- start single product item -->
                            <li>
                              <figure>
                                <a class="aa-product-img" href="#"><img class="imga" src="img/women/girl-1.png" alt="polo shirt img"></a>
                                <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                                <figcaption>
                                  <h4 class="aa-product-title"><a href="#">雙響炮</a></h4>
                                  <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                </figcaption>
                              </figure>                         
                              <div class="aa-product-hvr-content ii">
                                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                
                                <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
                              </div>
                              <!-- product badge -->
                              <span class="aa-badge aa-sale" href="#">優惠中!</span>
                            </li>
                            <!-- start single product item -->
                            <li>
                              <figure>
                                <a class="aa-product-img" href="#"><img class="imga" src="img/women/girl-2.png" alt="polo shirt img"></a>
                                <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                                <figcaption>
                                  <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                                  <span class="aa-product-price">$45.50</span>
                                </figcaption>
                              </figure>                         
                              <div class="aa-product-hvr-content ii">
                                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                
                                <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                              </div>
                              <!-- product badge -->
                               <span class="aa-badge aa-hot" href="#">熱銷</span>
                            </li>
                            <!-- start single product item -->
                            <li>
                              <figure>
                                <a class="aa-product-img" href="#"><img class="imga" src="img/women/girl-3.png" alt="polo shirt img"></a>
                                <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                                <figcaption>
                                  <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                                  <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                </figcaption>
                              </figure>                         
                              <div class="aa-product-hvr-content ii">
                                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                
                                <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                              </div>
                            </li>
                            <!-- start single product item -->
                            <li>
                              <figure>
                                <a class="aa-product-img" href="#"><img class="imga" src="img/women/girl-4.png" alt="polo shirt img"></a>
                                <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                                <figcaption>
                                  <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                                  <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                </figcaption>
                              </figure>                          
                              <div class="aa-product-hvr-content ii">
                                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                
                                <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                              </div>
                              <!-- product badge -->
                              <span class="aa-badge aa-sold-out" href="#">售完</span>
                            </li>
                            <!-- start single product item -->
                            <li>
                              <figure>
                                <a class="aa-product-img" href="#"><img class="imga" src="img/women/girl-5.png" alt="polo shirt img"></a>
                                <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                                <figcaption>
                                  <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                                  <span class="aa-product-price">$45.50</span>
                                </figcaption>
                              </figure>
                             
                              <div class="aa-product-hvr-content ii">
                               <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                
                                <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                              </div>
                            </li>
                            <!-- start single product item -->
                            <li>
                              <figure>
                                <a class="aa-product-img" href="#"><img class="imga" src="img/women/girl-6.png" alt="polo shirt img"></a>
                                <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                                <figcaption>
                                  <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                                  <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                </figcaption>
                              </figure>                          
                              <div class="aa-product-hvr-content ii">
                                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                
                                <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                              </div>
                            </li>
                            <!-- start single product item -->
                            <li>
                              <figure>
                                <a class="aa-product-img" href="#"><img class="imga" src="img/women/girl-7.png" alt="polo shirt img"></a>
                                <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                                <figcaption>
                                  <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                                  <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                </figcaption>
                              </figure>                          
                              <div class="aa-product-hvr-content ii">
                                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                
                               <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                              </div>
                              <!-- product badge -->
                              <span class="aa-badge aa-sale" href="#">優惠中!</span>
                            </li>
                            <!-- start single product item -->
                            <li>
                              <figure>
                                <a class="aa-product-img" href="#"><img class="imga" src="img/women/girl-1.png" alt="polo shirt img"></a>
                                <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                                <figcaption>
                                  <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                                  <span class="aa-product-price">$45.50</span>
                                </figcaption>
                              </figure>                         
                              <div class="aa-product-hvr-content ii">
                                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                
                                <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                              </div>
                              <!-- product badge -->
                               <span class="aa-badge aa-sold-out" href="#">售完</span>
                            </li>    
                            
                            <li>
                              <figure>
                                <a class="aa-product-img" href="#"><img class="imga" src="img/electronics/electronic-5.png" alt="polo shirt img"></a>
                                <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                                <figcaption>
                                  <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                                  <span class="aa-product-price">$45.50</span>
                                </figcaption>
                              </figure>                         
                              <div class="aa-product-hvr-content ii">
                               <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                
                                <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                              </div>
                            </li>
                            <li>
                              <figure>
                                <a class="aa-product-img" href="#"><img class="imga" src="img/electronics/electronic-5.png" alt="polo shirt img"></a>
                                <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                                <figcaption>
                                  <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                                  <span class="aa-product-price">$45.50</span>
                                </figcaption>
                              </figure>                         
                              <div class="aa-product-hvr-content ii">
                               <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                
                                <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                              </div>
                            </li>
                          </ul>
                          <a class="aa-browse-btn" href="#" style="margin-left: 520px;">所有商品 <span class="fa fa-long-arrow-right"></span></a>
                        </div>
                        <!-- 萊爾富 -->
                        <!-- 萊爾富 -->
                        <!-- 萊爾富 -->
                        <!-- 萊爾富 -->
                        <!-- 萊爾富 -->
                        <!-- 萊爾富 -->
                    <!-- / sports product category -->
                    <!-- start electronic product category -->
                    <div class="tab-pane fade" id="electronics">
                       <ul class="aa-product-catg">
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/electronics/electronic-1.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">雙響炮</a></h4>
                              <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
                          </div>
                          <!-- product badge -->
                          <span class="aa-badge aa-sale" href="#">優惠中!</span>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/electronics/electronic-2.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                          <!-- product badge -->
                           <span class="aa-badge aa-sold-out" href="#">售完</span>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/electronics/electronic-3.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                            </figcaption>
                          </figure>                          
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/electronics/electronic-4.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                            </figcaption>
                          </figure>                          
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                          <!-- product badge -->
                          <span class="aa-badge aa-hot" href="#">熱銷</span>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/electronics/electronic-5.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                           <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/electronics/electronic-6.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/electronics/electronic-7.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                            </figcaption>
                          </figure>                          
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                           <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                          <!-- product badge -->
                          <span class="aa-badge aa-sale" href="#">優惠中!</span>
                        </li>
                        <!-- start single product item -->
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/electronics/electronic-8.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span>
                            </figcaption>
                          </figure>                          
                          <div class="aa-product-hvr-content ii">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                          <!-- product badge -->
                           <span class="aa-badge aa-sold-out" href="#">售完</span>
                        </li> 
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/electronics/electronic-5.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                           <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>  
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img class="imga" src="img/electronics/electronic-5.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">台酒花雕雞</a></h4>
                              <span class="aa-product-price">$45.50</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content ii">
                           <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            
                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                          </div>
                        </li>                     
                      </ul>
                      <a class="aa-browse-btn" href="#">所有商品 <span class="fa fa-long-arrow-right"></span></a>
                    </div>
                    <!-- / electronic product category -->
                  </div>
                  <!-- quick view modal -->                  
                  <div class="modal fade" id="quick-view-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">                      
                        <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          <div class="row">
                            <!-- Modal view slider -->
                            <div class="col-md-6 col-sm-6 col-xs-12">                              
                              <div class="aa-product-view-slider">                                
                                <div class="simpleLens-gallery-container" id="demo-1">
                                  <div class="simpleLens-container">
                                      <div class="simpleLens-big-image-container">
                                          <a class="simpleLens-lens-image" data-lens-image="img/view-slider/large/polo-shirt-1.png">
                                              <img class="imga" src="img/view-slider/medium/polo-shirt-1.png" class="simpleLens-big-image">
                                          </a>
                                      </div>
                                  </div>
                                  <!-- 商品詳情小預覽圖 -->
                                  <!-- <div class="simpleLens-thumbnails-container">
                                      <a href="#" class="simpleLens-thumbnail-wrapper"
                                         data-lens-image="img/view-slider/large/polo-shirt-1.png"
                                         data-big-image="img/view-slider/medium/polo-shirt-1.png">
                                          <img src="img/view-slider/thumbnail/polo-shirt-1.png">
                                      </a>                                    
                                      <a href="#" class="simpleLens-thumbnail-wrapper"
                                         data-lens-image="img/view-slider/large/polo-shirt-3.png"
                                         data-big-image="img/view-slider/medium/polo-shirt-3.png">
                                          <img src="img/view-slider/thumbnail/polo-shirt-3.png">
                                      </a>

                                      <a href="#" class="simpleLens-thumbnail-wrapper"
                                         data-lens-image="img/view-slider/large/polo-shirt-4.png"
                                         data-big-image="img/view-slider/medium/polo-shirt-4.png">
                                          <img src="img/view-slider/thumbnail/polo-shirt-4.png">
                                      </a>
                                  </div> -->
                                </div>
                              </div>
                            </div>
                            <!-- Modal view content -->
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <div class="aa-product-view-content">
                                <h3>排骨雞麵</h3>
                                <div class="aa-price-block">
                                  <span class="aa-product-view-price">$34.99</span>
                                  <p class="aa-product-avilability">Avilability: <span>In stock</span></p>
                                </div>
                                <p>湯頭最純、最香濃的經典口味，超過30年長青品牌，歷久彌新，是許多人念念不忘的好滋味！有四大天王中的味味A排骨雞，也有深受年輕消費者喜愛的冬菜鴨肉冬粉…沒吃過味味A的話，那你就別說自己有吃過速食麵！</p>
                                <!-- <h4>Size</h4>
                                <div class="aa-prod-view-size">
                                  <a href="#">S</a>
                                  <a href="#">M</a>
                                  <a href="#">L</a>
                                  <a href="#">XL</a> -->
                                </div>
                                <div class="aa-prod-quantity">
                                  <form action="">
                                    <select name="" id="">
                                      <option value="0" selected="1">1</option>
                                      <option value="1">2</option>
                                      <option value="2">3</option>
                                      <option value="3">4</option>
                                      <option value="4">5</option>
                                      <option value="5">6</option>
                                    </select>
                                  </form>
                                  <p class="aa-prod-category">
                                    Category: <a href="#">泡麵</a>
                                  </p>
                                </div>
                                <div class="aa-prod-view-bottom">
                                  <a href="#" class="aa-add-to-cart-btn"><span class="fa fa-shopping-cart"></span>加入購物車</a>
                                  <a href="#" class="aa-add-to-cart-btn">View Details</a>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>                        
                      </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                  </div><!-- / quick view modal --> 
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Products section -->
  
<!--   以下全部隱藏 -->
<!--   以下全部隱藏 -->
<!--   以下全部隱藏 -->
<!--   以下全部隱藏 -->
<!--   以下全部隱藏 -->
<!--   以下全部隱藏 -->
<!--   以下全部隱藏 -->
<!--   <!-- banner section --> 
<!--   <section id="aa-banner"> -->
<!--     <div class="container"> -->
<!--       <div class="row"> -->
<!--         <div class="col-md-12"> -->
<!--           <div class="row"> -->
<!--             <div class="aa-banner-area"> -->
<!--             <a href="#"><img src="img/fashion-banner.jpg" alt="fashion banner img"></a> -->
<!--           </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </section> -->
<!--   <!-- popular section --> 
<!--   <section id="aa-popular-category"> -->
<!--     <div class="container"> -->
<!--       <div class="row"> -->
<!--         <div class="col-md-12"> -->
<!--           <div class="row"> -->
<!--             <div class="aa-popular-category-area"> -->
<!--               start prduct navigation -->
<!--              <ul class="nav nav-tabs aa-products-tab"> -->
<!--                 <li class="active"><a href="#popular" data-toggle="tab">Popular</a></li> -->
<!--                 <li><a href="#featured" data-toggle="tab">Featured</a></li> -->
<!--                 <li><a href="#latest" data-toggle="tab">Latest</a></li> -->
<!--               </ul> -->
<!--               Tab panes -->
<!--               <div class="tab-content"> -->
<!--                 Start men popular category -->
<!--                 <div class="tab-pane fade in active" id="popular"> -->
<!--                   <ul class="aa-product-catg aa-popular-slider"> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-2.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                          <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                       <span class="aa-badge aa-sale" href="#">SALE!</span> -->
<!--                     </li> -->
<!--                      start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/women/girl-2.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                         <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                        <span class="aa-badge aa-sold-out" href="#">Sold Out!</span> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/man/t-shirt-1.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                       </figure> -->
<!--                       <figcaption> -->
<!--                         <h4 class="aa-product-title"><a href="#">T-Shirt</a></h4> -->
<!--                         <span class="aa-product-price">$45.50</span> -->
<!--                       </figcaption> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                        <span class="aa-badge aa-sold-out" href="#">Sold Out!</span> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/women/girl-3.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                          <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-1.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                         <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/women/girl-4.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                         <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                       <span class="aa-badge aa-hot" href="#">HOT!</span> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-4.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                          <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                       <span class="aa-badge aa-hot" href="#">HOT!</span> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/women/girl-1.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                          <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">This is Title</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                       <span class="aa-badge aa-sale" href="#">SALE!</span> -->
<!--                     </li> -->
<!--                   </ul> -->
<!--                   <a class="aa-browse-btn" href="#">Browse all Product <span class="fa fa-long-arrow-right"></span></a> -->
<!--                 </div> -->
<!--                 / popular product category -->

<!--                 start featured product category -->
<!--                 <div class="tab-pane fade" id="featured"> -->
<!--                  <ul class="aa-product-catg aa-featured-slider"> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-2.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                          <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                       <span class="aa-badge aa-sale" href="#">SALE!</span> -->
<!--                     </li> -->
<!--                      start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/women/girl-2.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                         <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                        <span class="aa-badge aa-sold-out" href="#">Sold Out!</span> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/man/t-shirt-1.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                       </figure> -->
<!--                       <figcaption> -->
<!--                         <h4 class="aa-product-title"><a href="#">T-Shirt</a></h4> -->
<!--                         <span class="aa-product-price">$45.50</span> -->
<!--                       </figcaption> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                        <span class="aa-badge aa-sold-out" href="#">Sold Out!</span> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/women/girl-3.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                          <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-1.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                         <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/women/girl-4.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                         <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                       <span class="aa-badge aa-hot" href="#">HOT!</span> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-4.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                          <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                       <span class="aa-badge aa-hot" href="#">HOT!</span> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/women/girl-1.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                          <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">This is Title</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                       <span class="aa-badge aa-sale" href="#">SALE!</span> -->
<!--                     </li> -->
<!--                   </ul> -->
<!--                   <a class="aa-browse-btn" href="#">Browse all Product <span class="fa fa-long-arrow-right"></span></a> -->
<!--                 </div> -->
<!--                 / featured product category -->

<!--                 start latest product category -->
<!--                 <div class="tab-pane fade" id="latest"> -->
<!--                   <ul class="aa-product-catg aa-latest-slider"> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-2.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                          <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                       <span class="aa-badge aa-sale" href="#">SALE!</span> -->
<!--                     </li> -->
<!--                      start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/women/girl-2.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                         <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                        <span class="aa-badge aa-sold-out" href="#">Sold Out!</span> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/man/t-shirt-1.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                       </figure> -->
<!--                       <figcaption> -->
<!--                         <h4 class="aa-product-title"><a href="#">T-Shirt</a></h4> -->
<!--                         <span class="aa-product-price">$45.50</span> -->
<!--                       </figcaption> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                        <span class="aa-badge aa-sold-out" href="#">Sold Out!</span> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/women/girl-3.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                          <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-1.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                         <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/women/girl-4.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                         <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                       <span class="aa-badge aa-hot" href="#">HOT!</span> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-4.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                          <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                       <span class="aa-badge aa-hot" href="#">HOT!</span> -->
<!--                     </li> -->
<!--                     start single product item -->
<!--                     <li> -->
<!--                       <figure> -->
<!--                         <a class="aa-product-img" href="#"><img src="img/women/girl-1.png" alt="polo shirt img"></a> -->
<!--                         <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> -->
<!--                          <figcaption> -->
<!--                           <h4 class="aa-product-title"><a href="#">This is Title</a></h4> -->
<!--                           <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span> -->
<!--                         </figcaption> -->
<!--                       </figure> -->
<!--                       <div class="aa-product-hvr-content"> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a> -->
<!--                         <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a> -->
<!--                         <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a> -->
<!--                       </div> -->
<!--                       product badge -->
<!--                       <span class="aa-badge aa-sale" href="#">SALE!</span> -->
<!--                     </li> -->
<!--                   </ul> -->
<!--                    <a class="aa-browse-btn" href="#">Browse all Product <span class="fa fa-long-arrow-right"></span></a> -->
<!--                 </div> -->
<!--                 / latest product category -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </section> -->
<!--   <!-- / popular section --> 
<!--   <!-- Support section -->
<!--   <section id="aa-support"> -->
<!--     <div class="container"> -->
<!--       <div class="row"> -->
<!--         <div class="col-md-12"> -->
<!--           <div class="aa-support-area"> -->
<!--             single support -->
<!--             <div class="col-md-4 col-sm-4 col-xs-12"> -->
<!--               <div class="aa-support-single"> -->
<!--                 <span class="fa fa-truck"></span> -->
<!--                 <h4>FREE SHIPPING</h4> -->
<!--                 <P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P> -->
<!--               </div> -->
<!--             </div> -->
<!--             single support -->
<!--             <div class="col-md-4 col-sm-4 col-xs-12"> -->
<!--               <div class="aa-support-single"> -->
<!--                 <span class="fa fa-clock-o"></span> -->
<!--                 <h4>30 DAYS MONEY BACK</h4> -->
<!--                 <P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P> -->
<!--               </div> -->
<!--             </div> -->
<!--             single support -->
<!--             <div class="col-md-4 col-sm-4 col-xs-12"> -->
<!--               <div class="aa-support-single"> -->
<!--                 <span class="fa fa-phone"></span> -->
<!--                 <h4>SUPPORT 24/7</h4> -->
<!--                 <P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </section> -->
<!--   <!-- / Support section --> 
<!--   <!-- Testimonial --> 
<!--   <section id="aa-testimonial"> -->
<!--     <div class="container"> -->
<!--       <div class="row"> -->
<!--         <div class="col-md-12"> -->
<!--           <div class="aa-testimonial-area"> -->
<!--             <ul class="aa-testimonial-slider"> -->
<!--               single slide -->
<!--               <li> -->
<!--                 <div class="aa-testimonial-single"> -->
<!--                 <img class="aa-testimonial-img" src="img/testimonial-img-2.jpg" alt="testimonial img"> -->
<!--                   <span class="fa fa-quote-left aa-testimonial-quote"></span> -->
<!--                   <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt distinctio omnis possimus, facere, quidem qui!consectetur adipisicing elit. Sunt distinctio omnis possimus, facere, quidem qui.</p> -->
<!--                   <div class="aa-testimonial-info"> -->
<!--                     <p>Allison</p> -->
<!--                     <span>Designer</span> -->
<!--                     <a href="#">Dribble.com</a> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </li> -->
<!--               single slide -->
<!--               <li> -->
<!--                 <div class="aa-testimonial-single"> -->
<!--                 <img class="aa-testimonial-img" src="img/testimonial-img-1.jpg" alt="testimonial img"> -->
<!--                   <span class="fa fa-quote-left aa-testimonial-quote"></span> -->
<!--                   <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt distinctio omnis possimus, facere, quidem qui!consectetur adipisicing elit. Sunt distinctio omnis possimus, facere, quidem qui.</p> -->
<!--                   <div class="aa-testimonial-info"> -->
<!--                     <p>KEVIN MEYER</p> -->
<!--                     <span>CEO</span> -->
<!--                     <a href="#">Alphabet</a> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </li> -->
<!--                single slide -->
<!--               <li> -->
<!--                 <div class="aa-testimonial-single"> -->
<!--                 <img class="aa-testimonial-img" src="img/testimonial-img-3.jpg" alt="testimonial img"> -->
<!--                   <span class="fa fa-quote-left aa-testimonial-quote"></span> -->
<!--                   <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt distinctio omnis possimus, facere, quidem qui!consectetur adipisicing elit. Sunt distinctio omnis possimus, facere, quidem qui.</p> -->
<!--                   <div class="aa-testimonial-info"> -->
<!--                     <p>Luner</p> -->
<!--                     <span>COO</span> -->
<!--                     <a href="#">Kinatic Solution</a> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </li> -->
<!--             </ul> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </section> -->
<!--   <!-- / Testimonial -->

<!--   <!-- Latest Blog -->
<!--   <section id="aa-latest-blog"> -->
<!--     <div class="container"> -->
<!--       <div class="row"> -->
<!--         <div class="col-md-12"> -->
<!--           <div class="aa-latest-blog-area"> -->
<!--             <h2>LATEST BLOG</h2> -->
<!--             <div class="row"> -->
<!--               single latest blog -->
<!--               <div class="col-md-4 col-sm-4"> -->
<!--                 <div class="aa-latest-blog-single"> -->
<!--                   <figure class="aa-blog-img"> -->
<!--                     <a href="#"><img src="img/promo-banner-1.jpg" alt="img"></a> -->
<!--                       <figcaption class="aa-blog-img-caption"> -->
<!--                       <span href="#"><i class="fa fa-eye"></i>5K</span> -->
<!--                       <a href="#"><i class="fa fa-thumbs-o-up"></i>426</a> -->
<!--                       <a href="#"><i class="fa fa-comment-o"></i>20</a> -->
<!--                       <span href="#"><i class="fa fa-clock-o"></i>June 26, 2016</span> -->
<!--                     </figcaption> -->
<!--                   </figure> -->
<!--                   <div class="aa-blog-info"> -->
<!--                     <h3 class="aa-blog-title"><a href="#">Lorem ipsum dolor sit amet</a></h3> -->
<!--                     <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda, ad? Autem quos natus nisi aperiam, beatae, fugiat odit vel impedit dicta enim repellendus animi. Expedita quas reprehenderit incidunt, voluptates corporis.</p> -->
<!--                     <a href="#" class="aa-read-mor-btn">Read more <span class="fa fa-long-arrow-right"></span></a> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               single latest blog -->
<!--               <div class="col-md-4 col-sm-4"> -->
<!--                 <div class="aa-latest-blog-single"> -->
<!--                   <figure class="aa-blog-img"> -->
<!--                     <a href="#"><img src="img/promo-banner-3.jpg" alt="img"></a> -->
<!--                       <figcaption class="aa-blog-img-caption"> -->
<!--                       <span href="#"><i class="fa fa-eye"></i>5K</span> -->
<!--                       <a href="#"><i class="fa fa-thumbs-o-up"></i>426</a> -->
<!--                       <a href="#"><i class="fa fa-comment-o"></i>20</a> -->
<!--                       <span href="#"><i class="fa fa-clock-o"></i>June 26, 2016</span> -->
<!--                     </figcaption> -->
<!--                   </figure> -->
<!--                   <div class="aa-blog-info"> -->
<!--                     <h3 class="aa-blog-title"><a href="#">Lorem ipsum dolor sit amet</a></h3> -->
<!--                     <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda, ad? Autem quos natus nisi aperiam, beatae, fugiat odit vel impedit dicta enim repellendus animi. Expedita quas reprehenderit incidunt, voluptates corporis.</p> -->
<!--                      <a href="#" class="aa-read-mor-btn">Read more <span class="fa fa-long-arrow-right"></span></a> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               single latest blog -->
<!--               <div class="col-md-4 col-sm-4"> -->
<!--                 <div class="aa-latest-blog-single"> -->
<!--                   <figure class="aa-blog-img"> -->
<!--                     <a href="#"><img src="img/promo-banner-1.jpg" alt="img"></a> -->
<!--                       <figcaption class="aa-blog-img-caption"> -->
<!--                       <span href="#"><i class="fa fa-eye"></i>5K</span> -->
<!--                       <a href="#"><i class="fa fa-thumbs-o-up"></i>426</a> -->
<!--                       <a href="#"><i class="fa fa-comment-o"></i>20</a> -->
<!--                       <span href="#"><i class="fa fa-clock-o"></i>June 26, 2016</span> -->
<!--                     </figcaption> -->
<!--                   </figure> -->
<!--                   <div class="aa-blog-info"> -->
<!--                     <h3 class="aa-blog-title"><a href="#">Lorem ipsum dolor sit amet</a></h3> -->
<!--                     <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda, ad? Autem quos natus nisi aperiam, beatae, fugiat odit vel impedit dicta enim repellendus animi. Expedita quas reprehenderit incidunt, voluptates corporis.</p> -->
<!--                     <a href="#" class="aa-read-mor-btn">Read more <span class="fa fa-long-arrow-right"></span></a> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </section> -->
<!--   <!-- / Latest Blog --> 

<!--   <!-- Client Brand --> 
<!--   <section id="aa-client-brand"> -->
<!--     <div class="container"> -->
<!--       <div class="row"> -->
<!--         <div class="col-md-12"> -->
<!--           <div class="aa-client-brand-area"> -->
<!--             <ul class="aa-client-brand-slider"> -->
<!--               <li><a href="#"><img src="img/client-brand-java.png" alt="java img"></a></li> -->
<!--               <li><a href="#"><img src="img/client-brand-jquery.png" alt="jquery img"></a></li> -->
<!--               <li><a href="#"><img src="img/client-brand-html5.png" alt="html5 img"></a></li> -->
<!--               <li><a href="#"><img src="img/client-brand-css3.png" alt="css3 img"></a></li> -->
<!--               <li><a href="#"><img src="img/client-brand-wordpress.png" alt="wordPress img"></a></li> -->
<!--               <li><a href="#"><img src="img/client-brand-joomla.png" alt="joomla img"></a></li> -->
<!--               <li><a href="#"><img src="img/client-brand-java.png" alt="java img"></a></li> -->
<!--               <li><a href="#"><img src="img/client-brand-jquery.png" alt="jquery img"></a></li> -->
<!--               <li><a href="#"><img src="img/client-brand-html5.png" alt="html5 img"></a></li> -->
<!--               <li><a href="#"><img src="img/client-brand-css3.png" alt="css3 img"></a></li> -->
<!--               <li><a href="#"><img src="img/client-brand-wordpress.png" alt="wordPress img"></a></li> -->
<!--             </ul> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </section> -->
<!--   <!-- / Client Brand --> 

<!--   <!-- Subscribe section --> 
<!--   <section id="aa-subscribe"> -->
<!--     <div class="container"> -->
<!--       <div class="row"> -->
<!--         <div class="col-md-12"> -->
<!--           <div class="aa-subscribe-area"> -->
<!--             <h3>Subscribe our newsletter </h3> -->
<!--             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex, velit!</p> -->
<!--             <form action="" class="aa-subscribe-form"> -->
<!--               <input type="email" name="" id="" placeholder="Enter your Email"> -->
<!--               <input type="submit" value="Subscribe"> -->
<!--             </form> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </section> -->
<!--   <!-- / Subscribe section -->
<!-- /以下隱藏 -->
<!-- /以下隱藏 -->
<!-- /以下隱藏 -->
<!-- /以下隱藏 -->
<!-- Footer從這裡開始加 -->
<!-- Footer從這裡開始加 -->
<!-- Footer從這裡開始加 -->
<!-- Footer從這裡開始加 -->
<!-- Footer從這裡開始加 -->



<div class="col-md-3 col-sm-6 cu">
  <div class="aa-footer-widget">
    <div class="aa-footer-widget">
      <h1 style="font-weight:bold;">Contact Us</h1>
      <br>
      <br>
        <address>
          <p> 台北市大安區復興南路一段390號2樓</p><br>
          <p><span class="fa fa-phone"></span>02 6631 6666</p><br>
          <p><span class="fa fa-envelope"></span>iii-edu@gmail.com</p><br>
        </address>
      <div class="aa-footer-social">
          <a href="#"><span class="fa fa-facebook"></span></a> &nbsp;
          <a href="#"><span class="fa fa-twitter"></span></a> &nbsp;
          <a href="#"><span class="fa fa-google-plus"></span></a> &nbsp;
          <a href="#"><span class="fa fa-youtube"></span></a>
      </div>
    </div>
  </div>
</div>
<div >
  <div><iframe style="height:350px;width:500px;box-shadow:3px 3px 5px 6px #cccccc;"src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7230.356847957467!2d121.54067662516265!3d25.028018285900462!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abd379a5ec97%3A0xedc006d25a9e35df!2z6LOH562W5pyDIOaVuOS9jeaVmeiCsueglOeptuaJgCDmlbjkvY3kurrmiY3ln7nogrLkuK3lv4M!5e0!3m2!1szh-TW!2stw!4v1610176838595!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe></div>
</div>





<br>
<br>
<br>
<br>
<c:import url="/layout/footer" />





  </body>
</html>
