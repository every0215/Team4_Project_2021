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
           <img src="<c:url value='/geteventimage/${event.id}'/>" class="img-responsive"style="width:500px;float:left;border-right:5px #ffffff solid" alt="Image">
           <p style="text-align:left;font-size:20px;color: #ff871c;">${event.eventName}</p>
           <p style="text-align:left;color:	#003D79;">經銷便利店:${company.companyName}</p>
           <p style="text-align:left;color:	#003D79;">場地/地區:${event.eventLocation}</p>
           
           <c:choose>
             <c:when test="${event.typeId==1}">
             <p id="sailingPeriod" style="text-align:left;color:#003D79;">售票期間:${exhibition.onSaleDate.toString().substring(0, 16)}~${exhibition.offSaleDate.toString().substring(0, 16)}</p>
             <p style="text-align:left;color:#003D79;">展出期間:${exhibition.commDate}~${exhibition.dueDate}</p>
             <p style="text-align:left;color:#003D79;">卡友優惠與折扣數:${creditCard.cardName}/&nbsp;${exhibition.discountRatio*10}折</p>
             </c:when>
             <c:when test="${event.typeId==2}">
             <p id="sailingPeriod" style="text-align:left;color:#003D79;">售票期間:${attraction.onSaleDate.toString().substring(0, 16)}~${attraction.offSaleDate.toString().substring(0, 16)}</p>
             <p style="text-align:left;color:#003D79;">票券有效期:${attraction.commDate}~${attraction.dueDate}</p>
             </c:when>
            <c:otherwise>
            <p id="sportPeriod" style="text-align:left;color:#003D79;">售票期間:${sport.onSaleDate.toString().substring(0, 16)}~${sport.offSaleDate.toString().substring(0, 16)}</p>
            <p style="text-align:left;color:#003D79;">卡友優惠與折扣數:${creditCard.cardName}/&nbsp;${sport.discountRatio*10}折</p>
            <p style="text-align:left;font-size:12px;color:#003D79;">*請點選場次表，選擇場次進行購買。</p>
            </c:otherwise>
            </c:choose>
            <c:if test="${event.typeId!=3}">    
            		<form action="<c:url value='/TicketBuy/${eventId}'/>" method="post">
            			<input type="hidden" name="eventId" value="${event.id}" />
            			
            			<button id="buyButton" type="submit" class="btn btn-info" disabled="disabled">線上購買</button>
            		</form>       
        </c:if>
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
				<td>原價</td>
				<c:forEach var="price" items="${priceList}"><td>${price.cost}</td></c:forEach>
			</tr>
			<tr>
				<td>信用卡優惠價</td>
				<c:forEach var="price" items="${priceList}"><td>${price.cost*sport.discountRatio}</td></c:forEach>
			</tr>
			</tbody>
		</table>
            </c:otherwise>
            </c:choose>
        </div>
        <c:if test="${event.typeId==3}">
         <h3>場次表</h3>
        <div >
        <table id="sessionTR" style="width: 400px;border:3px #ffffff solid;text-align:center; " cellpadding="10" border='1'>
            <c:forEach var="session" items="${sessionList}"><tr>
            	<td>${session.kickOfTime.toString().substring(0, 16)}</td>
            	<td>
            		<form action="<c:url value='/TicketBuy/${eventId}'/>" method="post">
            			<input type="hidden" name="eventId" value="${event.id}" />
            			<input type="hidden" name="sessionId" value="${session.id}" />
            			<button type="submit" class="btn btn-info">線上購買</button>
            		</form>
            	</td>
            	</tr></c:forEach>
        </table>
        
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
        <c:import url="/layout/footer" />
        <!-- / footer -->



<!--         jQuery library -->
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
<!--         <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
    	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
     
    <script>
    	let unbindFunction = (checkTime) => {
    		return () => {
    			clearInterval(checkTime);
    		}
    	}
    	
    	
    	let updateExpiredDateInfo = () => {
    		let nowDate = new Date();
            console.log('現在時間'+nowDate);
            nowDate.setTime(nowDate.getTime()+24*60*60*1000);
            console.log('明天時間'+nowDate);
    		
            let sailingPeriod =$('#sailingPeriod').html();
            console.log(sailingPeriod);
            
            let sportPeriod = $('#sportPeriod').html();
            console.log(sportPeriod);
            let onSaleDateSpo="";
            if(sportPeriod!=undefined){
            	onSaleSpo = sportPeriod.substring(5,21);
            	onSaleDateSpo = new Date(Date.parse(onSaleSpo.replace('-','/')));
            }
           
            
            
            if (sailingPeriod == undefined){
            	console.log("這是體育票")
            	
            	$("#sessionTR tr").each(function(){
    			 console.log($(this).find("td:first").html());
    			 let strDate = $(this).find("td:first").html();
    			 let sessionDate = new Date(Date.parse(strDate.replace('-','/')));
    			 console.log('sessionTime'+sessionDate);
    			 
    			 if ( Date.parse(sessionDate) < Date.parse(nowDate)){
    				 
    				 $(this).find("td:first").next().find(':submit').attr('disabled', true)
    				 $(this).find("td:first").next().find(':submit').html('已過期');
    				 
    			 	 console.log("Button變為disable");
    			 
    			 }else if(Date.parse(onSaleDateSpo) > Date.parse(nowDate)){
    				 $(this).find("td:first").next().find(':submit').attr('disabled', true)
    				 $(this).find("td:first").next().find(':submit').html('尚未開始販售');
    				 
    			 }else{
    				 console.log("Session比系統目前時間大");
    			 }
    		})
            }else{
            	
            	let onSaleStr = sailingPeriod.substring(5,21);
            	
            	
                let offSaleStr = sailingPeriod.substring(22,38);
                
                console.log(onSaleStr);
            	console.log(offSaleStr);
            	
                console.log("這不是體育票");
                let onSaleDate = new Date(Date.parse(onSaleStr.replace('-','/')));
                let offSaleDate = new Date(Date.parse(offSaleStr.replace('-','/')));
//                 console.log(( Date.parse(onSaleDate) < Date.parse(nowDate));
                 console.log(Date.parse(onSaleDate));
                 console.log(Date.parse(nowDate));
                 console.log(Date.parse(offSaleDate));
                 let a = (Date.parse(onSaleDate)<Date.parse(nowDate))
                 console.log(a)
                 let b = (Date.parse(nowDate)< Date.parse(offSaleDate));
                 console.log(b)
                 console.log(a&&b)
                 
//                 console.log((Date.parse(nowDate)< Date.parse(offSaleDate));
                
                if ( a && b){
               	 
                    $('#buyButton').attr('disabled', false)
                    
                    
                     console.log("時間為售票期間 故購買button改為able");
                
                }
            } 
    	}
    	
    	
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
            
            
            updateExpiredDateInfo();
    		
    		let checkTime =  window.setInterval(updateExpiredDateInfo, 10000);
    	
    		$(window).bind('beforeunload',unbindFunction(checkTime));
    	
        })
        
        
    </script>
      </body>


      </html>