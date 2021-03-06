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
          color: #ff871c;
          overflow: hidden;
          padding: 1.6em 0;
          /**把高度撐起來**/
        }

        .ticket-content {
          display: flex;
        }

        .inner {
          font-size:28px;
          position: absolute;
          left: 50%;
          transform: translateX(-50%);
          white-space: nowrap;
          line-height: 1px;
          border-left: 9999px solid #ff871c;
          border-right: 9999px solid #ff871c;
          padding: 0 10px;
        }
        .sidehref{
        font-weight:500;
        font-size:16px;
		color:	#337ab7;
        }
        .sidehref:hover{
        font-weight:bold;
        font-size:18px;
		color:#FF5151;
        }
        .sidehref:active{
        font-weight:bold;
        font-size:18px;
		color:#ff871c;
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
            <form action="<c:url value='../TicketSearch'/>" method="get">
              <input type="text" name="search" class="form-control rounded" placeholder="票券搜尋 ex. '冰雪奇緣'"
                aria-label="Search" aria-describedby="search-addon" style="width:200px" />
              <button type="submit" class="btn btn-outline-primary">Search</button>
            </form>
          </div>
        </div>

        <!-- 購買票券主頁面START -->
        <div class="ticket-content" style="margin-bottom:10px">
          <div class="side-bar well" style="height:600px;width:170px">
             <div class="well">
               <p style="color:#ff871c;font-size:20px;font-weight:bold">票券種類</p>
              <p><a class="sidehref" href="<c:url value='/TicketType/1'/>">展覽</a></p>
              <p><a class="sidehref" href="<c:url value='/TicketType/2'/>">樂園與景點</a></p>
              <p><a class="sidehref" href="<c:url value='/TicketType/3'/>">運動賽事</a></p>
            </div>
            <div class="well">
              <p style="color:#ff871c;font-size:20px;font-weight:bold">經銷店面</p>
              <p><a class="sidehref" href="<c:url value='/TicketCompany/1'/>">全家便利店</a></p>
              <p><a class="sidehref" href="<c:url value='/TicketCompany/3'/>">統一超商</a></p>
              <p><a class="sidehref" href="<c:url value='/TicketCompany/2'/>">萊爾富</a></p>
            </div>
          </div>

          <div class="container text-center">
            <div class="ticket-info">
              <div class="panel-body">
                <div style="float:left">

                  <p style="text-align:left;font-size:30px;color:#ff871c;">訂單內容</p>
                  <p id="ticketOrderId" style="text-align:left;font-size:20px;"></p>
                  <p id="eventName" style="text-align:left;font-size:20px;"></p>
                  <p id="totalCost" style="text-align:left;font-size:20px;"></p>
                  <p id="ticketOrderDetailList" style="text-align:left;font-size:20px;">票券明細:</p>


                  <a id="payByMCoin" href="#" class="btn btn-primary btn-lg" role="button">滿幣支付</a><br/><br/>
                  <form action="<c:url value='../ecpay'/>" method="post">
                  		<input type="hidden" id="order" name="order"/>
                  		<input type="hidden" id="orderName" name="orderName"/>
                  		<input type="hidden" id="orderCost" name="orderCost"/>
                  		<input type="hidden" id="tradeDesc" name="tradeDesc"/>
                  	<button id="payByCreditCard" type="submit" class="btn btn-primary btn-lg">信用卡支付</button>
                  </form>
                  
                </div>
              </div>

            </div>
          </div>
        </div>








        <!-- 購買票券主頁面 END -->

        <!-- footer -->
        <c:import url="/layout/footer" />



        <!-- jQuery library -->
<!--         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<!--         Include all compiled plugins (below), or include individual files as needed -->
<%--         <script src="<c:url value='/js/bootstrap.js' />"></script> --%>
<!--         SmartMenus jQuery plugin -->
<%--         <script type="text/javascript" src="<c:url value='/js/jquery.smartmenus.js' />"></script> --%>
<!--         SmartMenus jQuery Bootstrap Addon -->
<%--         <script type="text/javascript" src="<c:url value='/js/jquery.smartmenus.bootstrap.js' />"></script> --%>
<!--         To Slider JS -->
<%--         <script src="<c:url value='/js/sequence.js' />"></script> --%>
<%--         <script src="<c:url value='/js/sequence-theme.modern-slide-in.js' />"></script> --%>
<!--         Product view slider -->
<%--         <script type="text/javascript" src="<c:url value='/js/jquery.simpleGallery.js' />"></script> --%>
<%--         <script type="text/javascript" src="<c:url value='/js/jquery.simpleLens.js' />"></script> --%>
<!--         slick slider -->
<%--         <script type="text/javascript" src="<c:url value='/js/slick.js' />"></script> --%>
<!--         Price picker slider -->
<%--         <script type="text/javascript" src="<c:url value='/js/nouislider.js' />"></script> --%>
<!--         Custom js -->
<%--         <script src="<c:url value='/js/custom.js' />"></script> --%>

<%--         <script src="<c:url value='/js/luke_js.js' />"></script> --%>
<!--         script src="https://code.jquery.com/jquery-3.5.1.min.js"></script -->
<!--         <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> -->

        <script>

          function toDateStr(date) {
            return date.getFullYear()
              + '-' + ('' + (date.getMonth() + 1)).padStart(2, 0)
              + '-' + ('' + date.getDate()).padStart(2, 0)
              + ' ' + ('' + date.getHours()).padStart(2, 0)
              + ':' + ('' + date.getMinutes()).padStart(2, 0);
          }

          $(document).ready(function () {
            let eventJSON = ${ eventJSON };
            let ticketOrderJSON = ${ ticketOrderJSON };
            let ticketOrderDetailsJSON = ${ ticketOrderDetailsJSON };

            let priceListJSON = ${ priceListJSON };  //有name跟cost

            let dPriceJSON;
            if ('${dPriceListJSON}' == '') {
              dPriceJSON = {}; //只有cost
            } else {
              dPriceListJSON = JSON.parse('${dPriceListJSON}');
            }

            let sportSessionJSON;
            if ('${sportSessionJSON}' == '') {
              sportSessionJSON = {};
            } else {
              sportSessionJSON = JSON.parse('${sportSessionJSON}');
            }


            $("#ticketOrderId").html('訂單編號:' + ticketOrderJSON.id);
            $("#eventName").html('票券名稱:' + eventJSON.eventName);
            $("#totalCost").html('總價:$' + ticketOrderJSON.totalCost);
            
            $("#order").val(ticketOrderJSON.id);
            $("#tradeDesc").val(ticketOrderJSON.id);
            $("#orderCost").val(ticketOrderJSON.totalCost);
            $("#orderName").val(eventJSON.eventName);

            let discount = ticketOrderDetailsJSON[0].discount;
            let type = eventJSON.typeId;
            let str = '';
            if (discount == 1) {     
              $("#payByMCoin").attr("disabled", "disabled")

              if (type == 1) {
                //有discount的exhibition
                $.each(priceListJSON, function (index, value) {

                  str = str + '<p style="text-align:left;">名稱: ' + value.name + '/ 價格: ' + dPriceListJSON[index] + '/ 張數: ' + ticketOrderDetailsJSON[index].value + '</p>'
                });

              } else {
                //有discount的sport 還要放session
                ;
                str = str + '<p style="text-align:left;">場次: ' + toDateStr(new Date(sportSessionJSON.kickOfTime)) + '</p>';
                $.each(priceListJSON, function (index, value) {

                  str = str + '<p style="text-align:left;">名稱: ' + value.name + '/ 價格: ' + dPriceListJSON[index] + '/ 張數: ' + ticketOrderDetailsJSON[index].value + '</p>'
                });
              }

            } else {
              if (type != 3) {
                //沒有discount的exhibition or attraction
                $.each(priceListJSON, function (index, value) {

                  str = str + '<p style="text-align:left;">名稱: ' + value.name + '/ 價格: ' + value.cost + '/ 張數: ' + ticketOrderDetailsJSON[index].value + '</p>'
                });
              } else {
                // 					 沒有discount的sport

                str = str + '<p style="text-align:left;">場次: ' + toDateStr(new Date(sportSessionJSON.kickOfTime)) + '</p>';
                $.each(priceListJSON, function (index, value) {

                  str = str + '<p style="text-align:left;">名稱: ' + value.name + '/ 價格: ' + value.cost + '/ 張數: ' + ticketOrderDetailsJSON[index].value + '</p>'
                });
              }

            }
            console.log(str);
            $("#ticketOrderDetailList").after(str);

            $("#payByMCoin").attr("href", "<c:url value='" + "/proj/buyByMCoinSucc/" + ticketOrderJSON.id + "'/>");
            

          });

          $("#payByMCoin").click(function () {
              if ($(this).attr('disabled') == 'disabled') {
   
                  event.preventDefault();
              }
   
          });





        </script>
      </body>


      </html>