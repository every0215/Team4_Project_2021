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
<div align="center">
		<fieldset>
	
	
		<form action="<c:url value='/company/CompanyRegister'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="status" value="true">
	<table style="padding:10px;font-size:18px;">
	<tr>
		<td >
<!-- 			企業編號:<input type="text" name="companyId" /><br/> -->
<!-- 			<!-- 	設流水號 -->
			<div style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
			企業名稱:<input id="cmpname" type="text" name="companyName"  autocomplete="off" required="required" value=""/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
			統一編號:<input id="uni" type="text" name="uniformNumbers" required="required" value=""/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
			行業類別:<select id="cat"class="form-control" name="categories" required="required">
				<option value="-1" selected>請挑選</option>
				<option value="1">一般服務業</option>
				<option value="2">批發/零售</option>
				<option value="3">餐飲服務</option>
				<option value="4">旅遊休閒運動</option>
				<option value="5">大眾傳播</option>
			</select>
			
			</div>
			<!-- 	radio用選的 -->
			<div style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
			&emsp;&emsp;帳號:<input id="acc" type="text" name="account" autocomplete="off" required="required" value=""/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
			&emsp;&emsp;密碼:<input id="pas" type="password" name="password" autocomplete="off" required="required" value=""/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
			&emsp;&emsp;信箱:<input id="e" type="text" name="email" autocomplete="off" required="required" value=""/><br/>
			</div>
			<!-- 	驗證 -->
			<div style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
			公司電話:<input id="pho" type="text" name="phone" required="required" value=""/><br/>
			</div>
			<!-- 	驗證 -->
	
		</td>
		<td style="padding:5px;margin-right:20px;margin-left:10px;margin-bottom:20px;">
	
			品牌圖示:	<input type="file" name="brand" value=""/><br>
			<!-- 	上傳檔案 -->
			營業登記證:<input type="file" name="busR" value=""/><br>
			<!-- 	上傳檔案 -->
			<hr/>

		</td>
	</tr>
</table>
				<hr/>
			<input type="submit" value="送出"/>
			<input type="reset" value="重新輸入"/>
	
			</form>
</fieldset>
<br>
<%-- <a href="<c:url value='/'/> " >回主頁</a> --%>
<button id="insert">一鍵輸入</button>
</div>
</section>

 <c:import url="/layout/footer" />
<script>
$("#insert").click(function(){
	$("#cmpname").val("OK便利商店")
	$("#uni").val("22853565")
	$("#cat").val("1")
	$("#acc").val("OKmarket")
	$("#pas").val("P@ssw0rd")
	$("#e").val("OKmarket@gmail.com")
	$("#pho").val("0266174185")
	
})

</script>

      </body>
</html>