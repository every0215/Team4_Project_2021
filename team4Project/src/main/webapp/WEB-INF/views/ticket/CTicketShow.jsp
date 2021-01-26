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
          border:5px #ffffff solid;
          border-radius: 5px;
          padding:3px;
          box-shadow:0px 0px 9px #FF7575;
          
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
        <div class="ticket-content" style="margin-bottom:10px">
          <div class="side-bar well" style="height:600px;width:170px">
            <div class="well">
              <p>票券種類</p>
              <p><a href="<c:url value='/TicketType/1'/>">展覽</a></p>
              <p><a href="<c:url value='/TicketType/2'/>">樂園與景點</a></p>
              <p><a href="<c:url value='/TicketType/3'/>">運動賽事</a></p>
            </div>
            <div class="well">
              <p>經銷店面</p>
              <p><a href="<c:url value='/TicketCompany/1'/>">全家便利店</a></p>
              <p><a href="<c:url value='/TicketCompany/3'/>">統一超商</a></p>
              <p><a href="<c:url value='/TicketCompany/2'/>">萊爾富</a></p>
            </div>
          </div>
  
  
          <div class="container text-center">
           <div class="ticket-info">
           <div class="panel-body">
           <img src="<c:url value='/geteventimage/${event.id}'/>" class="img-responsive"style="width:500px;float:left;border-right:5px #ffffff solid" alt="Image">
           <p style="text-align:left;font-size:20px;">${event.eventName}</p>
           <p style="text-align:left">經銷便利店:${company.companyName}</p>
           <p style="text-align:left">場地/地區:${event.eventLocation}</p>
           
           <c:choose>
             <c:when test="${event.typeId==1}">
             <p style="text-align:left">售票期間:${exhibition.onSaleDate.toString().substring(0, 16)}~${exhibition.offSaleDate.toString().substring(0, 16)}</p>
             <p style="text-align:left">展出期間:${exhibition.commDate}~${exhibition.dueDate}</p>
             <p style="text-align:left">優惠信用卡與折扣數:${creditCard.cardName}/&nbsp;${exhibition.discountRatio*10}折</p>
             </c:when>
             <c:when test="${event.typeId==2}">
             <p style="text-align:left">售票期間:${attraction.onSaleDate.toString().substring(0, 16)}~${attraction.offSaleDate.toString().substring(0, 16)}</p>
             <p style="text-align:left">展出期間:${attraction.commDate}~${attraction.dueDate}</p>
             </c:when>
            <c:otherwise>
            <p style="text-align:left">售票期間:${sport.onSaleDate.toString().substring(0, 16)}~${sport.offSaleDate.toString().substring(0, 16)}</p>
            <p style="text-align:left">優惠信用卡與折扣數:${creditCard.cardName}/&nbsp;${sport.discountRatio*10}折</p>
            </c:otherwise>
            </c:choose>
            
            
            
           </div>
				 <div id="accordion" class="ticket-info-title">
	    <h3>票價</h3>
        <div>
            <c:choose>
             	<c:when test="${event.typeId==1}">
             		<c:forEach var="price" items="${priceList}" varStatus="status">
             			<p>${price.name}:${price.cost}元</p>
             		</c:forEach>
             	</c:when>
             	<c:when test="${event.typeId==2}">
             		<c:forEach var="price" items="${priceList}" varStatus="status">
             			<p>${price.name}:${price.cost}元</p>
             		</c:forEach>
             	</c:when>
            	<c:otherwise>
            <table style="margin: auto;width: 800px;border:3px #cccccc solid;text-align:center; " cellpadding="10" border='1'>
			<thead>
				<tr><th colspan="5">票價表:</th></tr>
				<tr><th rowspan="2"><th colspan="2">內野區</th><th colspan="2">外野區</th></tr>
				<tr><th>A區</th><th>B區</th><th>A區</th><th>B區</th></tr>
			</thead>
			<tbody>
			<tr>
				<td>票價</td>
				<c:forEach var="price" items="${priceList}"><td>${price.cost}</td></c:forEach>
			</tr>
			</tbody>
		</table>
            </c:otherwise>
            </c:choose>
        </div>
        <c:if test="${event.typeId==3}">
         <h3>場次表</h3>
        <div >
            <c:forEach var="session" items="${sessionList}"><td>${session.kickOfTime}</td></c:forEach>
        </div>
        </c:if>
        <h3>票券介紹</h3>
        <div >
            <p>
            <c:choose>
             <c:when test="${event.typeId==1}">
             ${exhibition.description}
             </c:when>
             <c:when test="${event.typeId==2}">
             ${attraction.description}
             </c:when>
            <c:otherwise>
            ${sport.description}
            </c:otherwise>
            </c:choose>
            </p>
        </div>
        <h3>購票須知</h3>
        <div>
            <p>
            請於訂票完成前再次確認您的場次票價是否正確，若於訂票完成後需作更換，須另付手續費用，詳請請參閱退換票方式。訂票完成後，請自行先至會員專區即可查詢消費紀錄確認交易是否成功，以避免重複訂票；透過信用卡交易者，交易成功後銀行會直接自消費者指定之信用卡扣款。
            </p>
            <p>票券因故須郵寄退票，請洽大滿滿平台客服：(02)6631-6666(不補回郵資)，逾七日鑑賞期辦退，需酌收10%作業處理費。</p>
            
        </div>
        <h3>注意事項</h3>
        <div>
        <ul style="list-style-type:circle">
                <li>本票券僅限使用乙次，憑票入場，不得轉售。票券若經毀損或遺失視同無效，逾期作廢，恕不補發；本票券為無記名之有價票券，嚴禁公開販售、轉售，若經發現將依法處理。</li>
                <li> 如遇人潮眾多，將進行入場人流控管，請依工作人員指示排隊進場。</li>
                <li>為維護觀展品質，展場內不可攜帶嬰兒車、長柄雨傘(短柄雨傘請收納至肩背包)、自拍棒、大型行李、寵物(導盲犬除外)入場，如需寄放物品，請至場館提供之置物櫃；主辦單位僅提供停放區，恕不負保管之責。</li>
                <li>禁止抽菸或嚼食口香糖、檳榔，如未遵守規則且經勸導後無意改善，主辦單位有權要求違規者離場，恕不退還或補償門票費用。</li>
                <li>本注意事項若有未盡事宜，概以主辦單位之規定、解釋為準；主辦單位保留修改、增加、取消活動及注意事項之權利，詳情及票券使用相關資訊及規定，請洽主辦單位。</li>
            </ul>
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