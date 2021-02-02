<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
      <c:import url="/layout/head" />


<style>
        .more-link{
          padding-right:15px;
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
        .title-bar {
          clear: both;
          padding: 10px;
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
<!--     <section> -->
        <div class="title-bar">
            <div class="title-bar" style="text-align: center;line-height:60px;height:60px;background-color:#FFD382;width:300px;padding:10px;margin:5px auto;border-radius:30px" >
                <h2 style="color: #194866;font-weight:bolder">合作企業</h2>
            </div>

        </div>
<!--     </section> -->
    
<!--     Logo圖 名字 分類 簡介 -->
<!--     <hr style="height:1px;border:none;color:#333;background-color:#333;"> -->
<section class="container" style="margin:10px auto">
<div>
<ul>
<c:forEach var='Cmp' items='${CompanyList}'>
	<li>
	<div style="min-height:150px;position:relative;border-top:1px solid gray">
		<div style="height:200px;position:absolute;left:20px;margin:5px;">
			<img width="150px" src="<c:url value='/company/getCompanyimage/${Cmp.id}'/>" />
		</div>
		<div style="max-width: 1000px;position:absolute;left:200px;">
		<h4  style="color: #194866;font-weight:bolder">${Cmp.companyName}</h4>
		<p>${Cmp.profiles}</p>
		</div>	
	</div>
	</li>
</c:forEach>
</ul>
</div>
</section>


 <c:import url="/layout/footer" />


      
      </body>
</html>