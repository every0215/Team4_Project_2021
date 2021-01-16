<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Daily Shop | Home</title>

    <!-- Font awesome -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
    <!-- Product view slider -->
    <link rel="stylesheet" type="text/css" href="css/jquery.simpleLens.css">
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="css/slick.css">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="css/nouislider.css">
    <!-- Theme color -->
    <link id="switcher" href="css/theme-color/orange-theme.css" rel="stylesheet">
    <!-- <link id="switcher" href="css/theme-color/bridge-theme.css" rel="stylesheet"> -->
    <!-- Top Slider CSS -->
    <link href="css/sequence-theme.modern-slide-in.css" rel="stylesheet" media="all">

    <!-- Main style sheet -->
    <link href="css/style.css" rel="stylesheet">

    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- 引入的自定義css -->
  	<link href="css/carousel.css" rel="stylesheet">
  	<link href="css/styles1.css" rel="stylesheet" >

  </head>
  <body>
<!--   企業登入連結 -->
<!--   企業登入連結 -->
<!--   企業登入連結 -->
<!--   企業登入連結 -->
  <a href="<c:url value='/CmpLog' />">企業登入 </a><br>
  <p>id=1 企業:全家便利商店 帳號:familymart  密碼:123<p>
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
        <ul class="slides">

            <li><a href="1"><img src="img\slider\1.jpg" alt=""></a></li>
            <li><a href="2"><img src="img\slider\2.jpg" alt=""></a></li>
            <li><a href="3"><img src="img\slider\3.jpg" alt=""></a></li>
            <li><a href="4"><img src="img\slider\4.jpg" alt=""></a></li>
            <li><a href=""><img src="img\slider\5.jpg" alt=""></a></li>
        </ul>
        <ul class="dot">
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
			<img class="indexclassbb" src="img/indexclass/food1.png" alt="img">
			<div class="indexclassspan">
				<span>買一送一</span>
				<h4>
					<a class="indexclassa" href="#">蔬菜水果-1</a>
				</h4>
			</div>

			<img class="indexclassbb" src="img/indexclass/food2.png" alt="img">
			<div class="indexclassspan">
				<span>早鳥促銷</span>
				<h4>
					<a class="indexclassa" href="#">生鮮魚肉-2</a>
				</h4>
			</div>

			<img class="indexclassbb" src="img/indexclass/food3.png" alt="img">
			<div class="indexclassspan">
				<span>全面95折</span>
				<h4>
					<a class="indexclassa" href="#">電器3C-3</a>
				</h4>
			</div>

			<img class="indexclassbb" src="img/indexclass/food4.png" alt="img">
			<div class="indexclassspan">
				<span>20:00後6折</span>
				<h4>
					<a class="indexclassa" href="#">烘培輕食-4</a>
				</h4>
			</div>

			<img class="indexclassbb" src="img/indexclass/food5.png" alt="img">
			<div class="indexclassspan">
<!-- 				<span>Exclusive Item</span> -->
				<h4>
					<a class="indexclassa" href="#">蛋品-5</a>
				</h4>
			</div>

			<img class="indexclassbb" src="img/indexclass/food6.png" alt="img">
			<div class="indexclassspan">
<!-- 				<span>Exclusive Item</span> -->
				<h4>
					<a class="indexclassa" href="#">冷藏飲品-6</a>
				</h4>
			</div>

		</div>

		<div class="indexclassaa2">
			<img class="indexclassbb" src="img/indexclass/food7.png" alt="img">
			<div class="indexclassspan">
				<span>夏日必選</span>
				<h4>
					<a class="indexclassa" href="#">冷凍食品-7</a>
				</h4>
			</div>

			<img class="indexclassbb" src="img/indexclass/food8.png" alt="img">
			<div class="indexclassspan">
<!-- 				<span>Exclusive Item</span> -->
				<h4>
					<a class="indexclassa" href="#">五穀雜糧-8</a>
				</h4>
			</div>

			<img class="indexclassbb" src="img/indexclass/food9.png" alt="img">
			<div class="indexclassspan">
<!-- 				<span>Exclusive Item</span> -->
				<h4>
					<a class="indexclassa" href="#">罐頭調味-9</a>
				</h4>
			</div>

			<img class="indexclassbb" src="img/indexclass/food10.png" alt="img">
			<div class="indexclassspan">
				<span>不容錯過</span>
				<h4>
					<a class="indexclassa" href="#">活動專區-10</a>
				</h4>
			</div>

			<img class="indexclassbb" src="img/indexclass/food11.png" alt="img">
			<div class="indexclassspan">
				<span>優惠促銷</span>
				<h4>
					<a class="indexclassa" href="#">票券專區-11</a>
				</h4>
			</div>

			<img class="indexclassbb" src="img/indexclass/food12.png" alt="img">
			<div class="indexclassspan">
<!-- 				<span>當地特色</span> -->
				<h4>
					<a class="indexclassa" href="#">各地門市-12</a>
				</h4>
			</div>

		</div>
	</div>
	<!-- / Promo section -->
	<a href="<c:url value='/CmpRegi' />">企業註冊</a>

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
                            <a class="aa-product-img" href="#"><img class="imga" src="img/man/polo-shirt-2.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                              <figcaption>
                              <h4 class="aa-product-title"><a href="#">來一客</a></h4>
                              <span class="aa-product-price">$36.00</span><span class="aa-product-price"><del>$39.00</del></span>
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
                            <a class="aa-product-img" href="#"><img class="imga" src="img/man/polo-shirt-1.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                             <figcaption>
                              <h4 class="aa-product-title"><a href="#">味味A</a></h4>
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
                            <a class="aa-product-img" href="#"><img class="imga" src="img/man/polo-shirt-1.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                             <figcaption>
                              <h4 class="aa-product-title"><a href="#">滿漢全席</a></h4>
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
                            <a class="aa-product-img" href="#"><img class="imga" src="img/man/polo-shirt-4.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">一度讚泡麵</a></h4>
                              <span class="aa-product-price">$65.00</span><span class="aa-product-price"><del>$55.00</del></span>
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
                            <a class="aa-product-img" href="#"><img class="imga" src="img/man/polo-shirt-5.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">排骨雞麵</a></h4>
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
                            <a class="aa-product-img" href="#"><img class="imga" src="img/man/polo-shirt-6.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">滿漢全席</a></h4>
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
                            <a class="aa-product-img" href="#"><img class="imga" src="img/man/polo-shirt-2.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">滿漢全席</a></h4>
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
                            <a class="aa-product-img" href="#"><img class="imga" src="img/man/polo-shirt-1.png" alt="polo shirt img"></a>
                            <a class="aa-add-card-btn cc"href="#"><span class="fa fa-shopping-cart cc"></span>加入購物車</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="#">排骨雞麵</a></h4>
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
                        <!-- 小七 -->
                        <!-- 小七 -->
                        <!-- 小七 -->
                        <!-- 小七 -->
                        <!-- 小七 -->
                        <!-- 小七 -->
                        <!-- 小七 -->
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
                    <li><a href="#">商品</a></li>
                    <li><a href="#">活動</a></li>
                    <li><a href="#">論壇</a></li>

                    
                  </ul>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3>Company</h3>
                    <ul class="aa-footer-nav">
                      <li><a href="#">票卷購買</a></li>
                      <li><a href="#">合作企業</a></li>
                      <li><a href="#">廠商登入</a></li>
                      
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3>customer</h3>
                    <ul class="aa-footer-nav">
                      <li><a href="#">我的帳號</a></li>
                      <li><a href="#">通知</a></li>
                      <li><a href="#">購物車</a></li>
                      
                      
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3>About us</h3>
                    <ul class="aa-footer-nav">
                      <li><a href="#">平台資訊</a></li>
                      <li><a href="#">聯絡我們</a></li>
                      <li><a href="#">智慧客服</a></li>
                      
                    </ul>
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
            <p>Designed by Team4</p>
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
  <script src="js/bootstrap.js"></script>
  <!-- SmartMenus jQuery plugin -->
  <script type="text/javascript" src="js/jquery.smartmenus.js"></script>
  <!-- SmartMenus jQuery Bootstrap Addon -->
  <script type="text/javascript" src="js/jquery.smartmenus.bootstrap.js"></script>
  <!-- To Slider JS -->
  <script src="js/sequence.js"></script>
  <script src="js/sequence-theme.modern-slide-in.js"></script>
  <!-- Product view slider -->
  <script type="text/javascript" src="js/jquery.simpleGallery.js"></script>
  <script type="text/javascript" src="js/jquery.simpleLens.js"></script>
  <!-- slick slider -->
  <script type="text/javascript" src="js/slick.js"></script>
  <!-- Price picker slider -->
  <script type="text/javascript" src="js/nouislider.js"></script>
  <!-- Custom js -->
  <script src="js/custom.js"></script>

<!--   自定義js -->
  <script type="text/javascript" src="js/Carousel.js"></script>

  </body>
</html>
