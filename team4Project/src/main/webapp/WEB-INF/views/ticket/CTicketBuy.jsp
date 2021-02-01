<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <!DOCTYPE html>
      <html lang="en">
      <c:import url="/layout/head" />
      <link rel="stylesheet" href="https://code.jquery.com/ui/jquery-ui-git.css">
      <style>
        .ticket-info-title {
          text-align: left;
        }

        .panel-body {
          border: 5px #ffffff solid;
          border-radius: 5px;
          padding: 3px;
          box-shadow: 0px 0px 9px #FF7575;

        }

        .more-link {
          padding-right: 15px;
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
          <form action="<c:url value='../TicketSearch'/>"  method="get" >
                  <input type="text" name="search" class="form-control rounded" placeholder="票券搜尋 ex. '冰雪奇緣'" aria-label="Search"
              aria-describedby="search-addon" style="width:200px" />
                  <button type="submit" class="btn btn-outline-primary">Search</button>
                </form>
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
                <div style="float:left">
                  <p style="text-align:left;font-size:20px;">${event.eventName}</p>
                  <p style="text-align:left">經銷便利店:${company.companyName}</p>
                  <p style="text-align:left">場地/地區:${event.eventLocation}</p>

                  <c:choose>
                    <c:when test="${event.typeId==1}">

                      <p style="text-align:left">展出期間:${exhibition.commDate}~${exhibition.dueDate}</p>
                      <p style="text-align:left">卡友優惠與折扣數:${creditCard.cardName}/&nbsp;${exhibition.discountRatio*10}折
                      </p>
                      <p style="text-align:left;font-size:13px">*若購買卡友優惠票，僅能使用指定信用卡結帳</p>
                    </c:when>
                    <c:when test="${event.typeId==2}">

                      <p style="text-align:left">票券有效期:${attraction.commDate}~${attraction.dueDate}</p>
                    </c:when>
                    <c:otherwise>

                      <p style="text-align:left">卡友優惠與折扣數:${creditCard.cardName}/&nbsp;${sport.discountRatio*10}折</p>
                      <p style="text-align:left;font-size:13px">*若購買卡友優惠票，僅能使用指定信用卡結帳</p>
                    </c:otherwise>
                  </c:choose>
                </div>
                <div style="float:right">
                  <c:choose>
                    <c:when test="${event.typeId==1}">

                      <form action="<c:url value='/TicketBuyOnWay/${eventId}'/>" method="post">
                        <input type="hidden" name="eventId" value="${event.id}" />
                        <label for="">優惠選擇:</label>
                        <select name="discount" id="discount" required>
                          <option value="0" selected>無</option>
                          <option value="1">指定信用卡優惠</option>
                        </select>
                        <table style="cellpadding:'10px'; border:3px #ffffff solid">
						
                          <thead>
                            <tr>
                              <td>票券名稱</td>
                              <td>價格</td>
                              <td>數量</td>
                              <td>金額</td>
                            </tr>
                          </thead>
                          <tbody>
                            <c:forEach var="price" items="${priceList}" varStatus="status">
                              <tr>
                                <td>${price.name}</td>
                                <td class="cost" priceId="${price.id}">${price.cost}</td>
                                <td>
                                  
                                <input type=" text" class="spinner" target="subtotal-${price.id}" name="count"
                                    priceSPId="${price.id}" price="${price.cost}" style="width: 20px;height:18px"/>
                                </td>
                                <td name="subtotal-${price.id}" class="subtotal">0</td>
                              </tr>
                            </c:forEach>
                            <tr>
                              <td colspan="3">總價</td>
                              <td id="totalAmount" name="totalAmount">0</td>

                            </tr>
                          </tbody>

                        </table>

                        <button id="buyTicket" type="submit" class="btn btn-info">下一步</button>
                      </form>

                    </c:when>
                    <c:when test="${event.typeId==2}">
                      <form action="<c:url value='/TicketBuyOnWay/${eventId}'/>" method="post">
                        <input type="hidden" name="discount" value="0" />
                        <table style="cellpadding:'10px'; border:3px #ffffff solid">

                          <thead>
                            <tr>
                              <td>票券名稱</td>
                              <td>價格</td>
                              <td>數量</td>
                              <td>金額</td>
                            </tr>
                          </thead>
                          <tbody>
                            <c:forEach var="price" items="${priceList}" varStatus="status">
                              <tr>
                                <td>${price.name}</td>
                                <td class="cost" priceId="${price.id}">${price.cost}</td>
                                <td>
                                  <input type="text" class="spinner" target="subtotal-${price.id}" name="count"
                                    priceSPId="${price.id}" price="${price.cost}" style="width: 20px;height:18px" />
                                </td>
                                <td name="subtotal-${price.id}" class="subtotal">0</td>
                              </tr>
                            </c:forEach>
                            <tr>
                              <td colspan="3">總價</td>
                              <td id="totalAmount" name="totalAmount">0</td>
                            </tr>
                          </tbody>

                        </table>
                        <button id="buyTicket" type="submit" class="btn btn-info">下一步</button>
                      </form>

                    </c:when>

                    <c:otherwise>
                      <form action="<c:url value='/TicketBuyOnWay/${eventId}'/>" method="post">
                       <input type="hidden" name="sessionId" value="${sessionId}"/>
                        <label class="t1" for="">優惠選擇:</label>
                        <select name="discount" id="discount" required>
                          <option value="0" selected>無</option>
                          <option value="1">指定信用卡優惠</option>
                        </select>
                        <table style="cellpadding:'10px'; border:3px #ffffff solid">

                          <thead>
                            <tr>
                              <td>票券名稱</td>
                              <td>價格</td>
                              <td>數量</td>
                              <td>金額</td>
                            </tr>
                          </thead>
                          <tbody>
                            <c:forEach var="price" items="${priceList}" varStatus="status">
                              <tr>
                                <td>${price.name}</td>
                                <td class="cost" priceId="${price.id}">${price.cost}</td>
                                <td>
                                  <input type="text" class="spinner" target="subtotal-${price.id}" name="count"
                                    priceSPId="${price.id}" price="${price.cost}" style="width: 20px;height:18px" />
                                </td>
                                <td name="subtotal-${price.id}" class="subtotal">0</td>
                              </tr>
                            </c:forEach>
                            <tr>
                              <td colspan="3">總價</td>
                              <td id="totalAmount" name="totalAmount">0</td>
                            </tr>
                          </tbody>

                        </table>
                        <button id="buyTicket" type="submit" class="btn btn-info">下一步</button>
                      </form>
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>

            </div>
          </div>
        </div>








        <!-- 購買票券主頁面 END -->

        <!-- footer -->
       <c:import url="/layout/footer" />



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

          let config = {
            min: 0,
            max: 10,
            step: 1
          }

          $('.spinner').spinner(config);


          function getDiscountRatio() {
            let discountRatio = '${exhibition.discountRatio}';
            if (discountRatio != '') {
              return ${exhibition.discountRatio };
            } else {
              return ${sport.discountRatio };
            }

          }

          let discountRatio = getDiscountRatio();

          function updateTotalAmount() {
            $('.spinner').each(function () {
              targetElement = $(this).attr("target");
              let priceId = $(this).attr("priceSPId");
              console.log(priceId);
              $('td[name="' + targetElement + '"]').html(

                $(this).spinner('value') * $('td[priceId="' + priceId + '"]').html()
              )
            })
            let total = 0;
            const elements = document.getElementsByClassName('subtotal');
            $(".subtotal").html()
            for (const key of elements) {
	
              //   			console.log(key.innerHTML);
              total += +key.innerHTML;
              //   			console.log(total);
            }
            $('#totalAmount').html(total);
          }

          function updatePriceByDiscount() {
            // 		console.log($("option:selected").html());
            if ($("option:selected").html() == "指定信用卡優惠") {
              $('.cost').each(function () {
                $(this).html(+$(this).html() * discountRatio)
                let price = $(this).html();
              })

            } else {
              $('.cost').each(function () {
                $(this).html(+$(this).html() / discountRatio)
                let price = $(this).html();
              })
            }
          }

          $('#discount').change(function () {
            updatePriceByDiscount()
            updateTotalAmount()
          });

          $('.spinner').on("spinstop", function () {

            targetElement = $(this).attr("target");
            let priceId = $(this).attr("priceSPId");
            $('td[name="' + targetElement + '"]').html(

              $(this).spinner('value') * $('td[priceId="' + priceId + '"]').html()
            )
            let total = 0;
            const elements = document.getElementsByClassName('subtotal');
            $(".subtotal").html()
            for (const key of elements) {
              //   			console.log(key.innerHTML);
              total += +key.innerHTML;
              //   			console.log(total);
            }
            $('#totalAmount').html(total);
          });
          
          
          $("#buyTicket").click(function () {
              if ($('#totalAmount').html() == '0') {
   
                  event.preventDefault();
              }
   
          });


        </script>
      </body>


      </html>