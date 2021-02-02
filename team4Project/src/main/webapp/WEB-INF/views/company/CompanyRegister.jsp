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
                <h2 style="color: #194866;font-weight:bolder">企業註冊</h2>
            </div>

        </div>
<!--     </section> -->
    
<!--     Logo圖 名字 分類 簡介 -->
<!--     <hr style="height:1px;border:none;color:#333;background-color:#333;"> -->
<section class="container" style="margin:10px auto">
<div>
		<fieldset>
	<legend >註冊企業資料</legend> 
	
		<form action="<c:url value='/company/CompanyRegister'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="status" value="true">
	<table style="border:1px solid #64A600;border-radius:10px;padding:10px">
	<tr>
		<td >
<!-- 			企業編號:<input type="text" name="companyId" /><br/> -->
<!-- 			<!-- 	設流水號 -->
			<div style="padding:5px">
			企業名稱:<input type="text" name="companyName"  autocomplete="off" required="required" value="歐虧"/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px">
			統一編號:<input type="text" name="uniformNumbers" required="required" value="52211110"/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px">
			行業類別:<select class="form-control" name="categories" required="required">
				<option value="-1" selected>請挑選</option>
				<option value="1">一般服務業</option>
				<option value="2">批發/零售</option>
				<option value="3">餐飲服務</option>
				<option value="4">旅遊休閒運動</option>
				<option value="5">大眾傳播</option>
			</select>
			
			</div>
			<!-- 	radio用選的 -->
			<div style="padding:5px">
			&emsp;&emsp;帳號:<input type="text" name="account" autocomplete="off" required="required" value="aaa"/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px">
			&emsp;&emsp;密碼:<input type="password" name="password" autocomplete="off" required="required" value="aaa"/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px">
			&emsp;&emsp;信箱:<input type="text" name="email" autocomplete="off" required="required" value="aaa@yahoo.com"/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px">
			公司電話:<input type="text" name="phone" required="required" value="0229983849"/><br/>
			</div>
			<!-- 	驗證 -->
	
		</td>
		<td style="border:1px solid #64A600;border-radius:10px;padding:10px">
	
			品牌圖示:	<input type="file" name="brand" value=""/><br>
			<!-- 	上傳檔案 -->
			營業登記證:<input type="file" name="busR" value=""/><br>
			<!-- 	上傳檔案 -->
			<hr/>

		</td>
	</tr>
</table>
				<hr/>
			<input type="submit" value="send"/>
			<input type="reset" value="delete"/>
	
			</form>
</fieldset>
<br>
<a href="<c:url value='/'/> " >回主頁</a>

</div>
</section>

 <c:import url="/layout/footer" />


      </body>
</html>