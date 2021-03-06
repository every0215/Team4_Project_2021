<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <!DOCTYPE html>
      <html lang="en">
      <c:import url="/layout/head" />
      <style>
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
          <form action="<c:url value='../TicketSearch'/>"  method="get" >
                  <input type="text" name="search" class="form-control rounded" placeholder="票券搜尋 ex. '冰雪奇緣'" aria-label="Search"
              aria-describedby="search-addon" style="width:200px" />
                  <button type="submit" class="btn btn-outline-primary">Search</button>
                </form>
          </div>
        </div>

        <!-- 購買票券主頁面START -->
        
            
            
        <div class="ticket-content">
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
          <!-- 第一行 -->
            <div class="sub-title">
              <span class="inner">
              	搜尋結果
              </span>
            </div>
            <div class="row" style="height:330px">

              <c:forEach var="event" items="${events}" begin="0" end="${totalCount>8?8:totalCount}" varStatus="status">
                  <div class="col-sm-4">
                    <div class="panel panel-primary" onclick="location.href = '<c:url value="/TicketShow/${event.id}" />'" >
                    	<div class="panel-heading">${event.eventName}</div>
                    	<div class="panel-body">
                      		<img src='<c:url value="/geteventimage/${event.id}" />' class="img-responsive" style="width:100%;height:164px" alt="${event.eventName}" />
                    	</div>
                    <div class="panel-footer" style="text-align:left;font-size:13px">
                    <img height="15px" src='<c:url value="/company/getCompanyimage/${event.companyId}" />' />
                    
                      &nbsp;售票期間:
                      <c:choose>
                        <c:when test="${event.typeId==1}">
                          ${event.exhibition.onSaleDate.toString().substring(0,
                          16)}~${event.exhibition.offSaleDate.toString().substring(0, 16)}
                        </c:when>
                        <c:when test="${event.typeId==2}">
                          ${event.attraction.onSaleDate.toString().substring(0,
                          16)}~${event.attraction.offSaleDate.toString().substring(0, 16)}
                        </c:when>
                        <c:otherwise>
                          ${event.sport.onSaleDate.toString().substring(0,
                          16)}~${event.sport.offSaleDate.toString().substring(0, 16)}
                        </c:otherwise>
                      </c:choose>
                    </div>
                  </div>
                </div>
                <c:if test="${(status.count%3==0) && !(status.last)}">
                  </div>
                  <div class="row" style="height:330px">
                </c:if>
              </c:forEach>
              
              
            </div>
            <c:if test="${totalCount>9}">
              
              <div class="more-link">
                <a id="showMoreEvent" class="btn btn-info" role="button" style="float:right">
                	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z" />
                    <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z" />
                  </svg>&nbsp;&nbsp;See More
                </a>
              </div>
              
              </c:if>
            <br>
            <br>
            <br>
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
        <script>
        function toDateStr(date){
        	return date.getFullYear()
        	+ '-' +('' + (date.getMonth()+1)).padStart(2,0)
        	+ '-' +('' + date.getDate()).padStart(2,0)
        	+ ' ' +('' + date.getHours()).padStart(2,0)
        	+ ':' +('' + date.getMinutes()).padStart(2,0);
        }
        function eventToHtmlStr(event){
        	let activity = {};
        	activity = event.sport ? event.sport : activity;
   			activity = event.exhibition ? event.exhibition : activity;
   			activity = event.attraction ? event.attraction : activity;
        	return `<div class="col-sm-4">
		            <div class="panel panel-primary" onclick="location.href = '../TicketShow/\${event.id}'">
		        	<div class="panel-heading">\${event.eventName}</div>
		        	<div class="panel-body">
		          		<img src="../geteventimage/\${event.id}" class="img-responsive" style="width:100%;height:164px" alt="\${event.eventName}">
		        	</div>
		        <div class="panel-footer" style="text-align:left;font-size:13px">
		        <img height="15px" src="../\company/\getCompanyimage/\${event.companyId}">
		          &nbsp;售票期間:
		              \${toDateStr(new Date(activity.onSaleDate))}~\${toDateStr(new Date(activity.offSaleDate))}
		        </div>
		      </div>
		    </div>`;
        }
        let events = ${eventsJSON};
        let cursor = 10;
        
          $("#showMoreEvent").click(function () {
       		str = '';
       		for(let i=cursor; i<cursor+3 && i<events.length; i++){
       			console.log(i,events[i].eventName);
       			
       			str += eventToHtmlStr(events[i])
       			//str += `<div class="col-sm-4">
                //    \${events[i].eventName}
                //    </div>`;
       		}
       		cursor+=3;
       		
       		htmlStr = `<div class="row" style="height:330px">\${str}</div>`;
            $(this).before(htmlStr);
            
            if(cursor>=events.length){
            	$(this).remove();
            }
          });
        </script>
      </body>
      <script>

      </script>

      </html>