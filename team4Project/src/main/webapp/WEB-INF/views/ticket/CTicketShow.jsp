<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <!DOCTYPE html>
      <html lang="en">
      <c:import url="/layout/head" />
      <link rel="stylesheet" href="https://code.jquery.com/ui/jquery-ui-git.css">
      <style>
     	.ticket-info-title{
     	 text-align:left;
     	}
        .panel-body{
          border:5px #FFAC55 solid;
          padding:3px
          
        }
        .more-link{
          padding-right:15px;
        }
        .search-bar {
          clear: both;
          padding: 10px;
        }

        .input-group {
          margin: 10px;
          display: inline;
        }

        .sub-title {
          position: relative;
          text-align: center;
          font-size: 14px;
          color: #999;
          overflow: hidden;
          padding: 1.2em 0;
          /**把高度撐起來**/
        }

        .ticket-content {
          display: flex;
        }

        .inner {
          position: absolute;
          left: 50%;
          transform: translateX(-50%);
          white-space: nowrap;
          line-height: 1px;
          border-left: 9999px solid #ccc;
          border-right: 9999px solid #ccc;
          padding: 0 10px;
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

        <div class="search-bar">
          <div class="input-group">
            <input type="search" class="form-control rounded" placeholder="票券搜尋" aria-label="Search"
              aria-describedby="search-addon" style="width:200px" />
            <button type="button" class="btn btn-outline-primary">Search</button>
          </div>
        </div>

        <!-- 購買票券主頁面START -->
        <div class="ticket-content">
          <div class="side-bar well" style="height:600px;width:170px">
            <div class="well">
              <p>票券種類</p>
              <p><a href="#">展覽</a></p>
              <p><a href="#">樂園與景點</a></p>
              <p><a href="#">運動賽事</a></p>
            </div>
            <div class="well">
              <p>經銷便利店</p>
              <p><a href="#">全家</a></p>
              <p><a href="#">7-11</a></p>
              <p><a href="#">萊爾富</a></p>
            </div>
          </div>
  
  
          <div class="container text-center">
           <div class="ticket-info">
           <div class="panel-body">
           <img src="<c:url value='/geteventimage/${event.id}'/>" class="img-responsive"style="width:500px;float:left" alt="Image">
           <p style="text-align:left">票券名稱:${event.eventName}</p>
           <p style="text-align:left">經銷便利店:${event.companyId}</p>
           <p style="text-align:left">場地/地區:</p>
           </div>
				 <div id="accordion" class="ticket-info-title">
        <h3>票券介紹</h3>
        <div >
            <p>ATP倫敦年終賽將在10日開打，自2009年以來就一直在倫敦舉行，日前小組籤表也已經出爐，兩組分別以美國退役名將阿格西（Andre Agassi）和瑞典退役名將柏格（Björn Borg）命名。其中備受關注的喬科維奇（Novak Djokovic）和費德勒（Roger Federer）被分在同一組，至於剛完婚的納達爾（Rafael Nadal）則是將力抗3位未滿24歲的年輕小將。</p>
            <p>柏格組包括喬科維奇、費德勒、奧地利好手蒂姆（Dominic Thiem）和首度入圍的義大利好手貝雷蒂尼（Matteo Berrettini）；至於阿格西組則是包括納達爾、俄羅斯好手梅德維夫（Daniil Medvedev）、希臘新星西西帕斯（Stefanos Tsitsipas）和德國金童茲維列夫（Alexander Zverev）。</p>
        </div>
        <h3>購票須知</h3>
        <div>
            <p>納達爾在上周因腹傷退出了巴黎大師賽的4強賽，但仍計畫前往倫敦看是否能夠出賽，納達爾說道：「我預計將會在周四或周五展開訓練，目標就是在年終賽出戰。」然而如果納達爾最終確定退賽，將會由西班牙好手巴提斯塔（Roberto Bautista Agut）遞補。</p>
            <p>納達爾在上周因腹傷退出了巴黎大師賽的4強賽，但仍計畫前往倫敦看是否能夠出賽，納達爾說道：「我預計將會在周四或周五展開訓練，目標就是在年終賽出戰。」然而如果納達爾最終確定退賽，將會由西班牙好手巴提斯塔（Roberto Bautista Agut）遞補。</p>
            <ul>
                <li>清單項目一</li>
                <li>清單項目二</li>
                <li>清單項目三</li>
            </ul>
        </div>
        <h3>注意事項</h3>
        <div>
            <p>費德勒則是睽違17年後，首次無緣年終排名世界前2，目前累積6座年終賽冠軍為史上之最，今年將尋求生涯第7座年終賽冠軍。而費德勒今年出賽13站賽事，戰績51勝8敗，一共進帳4座冠軍，不過並沒有包括大滿貫賽冠軍，目前前生涯累計103座冠軍，距離美國傳奇康諾斯（Jimmy Connors）還差6冠。</p>
            <p>費德勒則是睽違17年後，首次無緣年終排名世界前2，目前累積6座年終賽冠軍為史上之最，今年將尋求生涯第7座年終賽冠軍。而費德勒今年出賽13站賽事，戰績51勝8敗，一共進帳4座冠軍，不過並沒有包括大滿貫賽冠軍，目前前生涯累計103座冠軍，距離美國傳奇康諾斯（Jimmy Connors）還差6冠。</p>
        </div>
    </div>
           </div>
          </div>
        </div>
        







        <!-- 購買票券主頁面 END -->

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
        <!-- script src="https://code.jquery.com/jquery-3.5.1.min.js"></script-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
     
    <script>
        $( function() {
            var icons = {
                header: "ui-icon-caret-1-s",
                activeHeader: "ui-icon-caret-1-n"
            };
            $( "#accordion" ).accordion({
                icons: icons,
                heightStyle:"content",
                event: "click"
            });
        });
    </script>
      </body>


      </html>