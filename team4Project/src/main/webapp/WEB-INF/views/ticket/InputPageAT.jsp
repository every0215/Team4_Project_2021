<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>展覽</title>
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

			<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
			<script src="../ticketjs/checkDateTime.js"></script>

			<style>
				.t1 {
					width: 150px;
					float: left;
					text-align: right;
				}

				select option[value="0"] {
					display: none;
				}
				.correctsp{
				font-size: 10px;
				color:green;
				}
				.checksp{
				font-size: 10px;
				color:red;
				font-style:oblique;
				}
			</style>
		</head>

		<body>
			<div class="jumbotron text-center">
				<h1>E-Ticket票券系統</h1>
			</div>
			<script src="https://code.jquery.com/jquery-3.5.1.js"
				integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
			<a href="InputPageEX">展覽</a>
			<a href="InputPageAT">樂園與景點</a>
			<a href="InputPageSP">運動賽事</a>

			<h3>Event Input Page-樂園與景點</h3>
			<form name="myForm" action="<c:url value='/ticket/InputPageAT'/>" method="post"
				enctype="multipart/form-data">
				<hr />
				<input type="hidden" name="typeId" value="2" />
				<label class="t1" for="">景點名稱:</label>
				<input type="text" name="eventName" required="required"><br> <br> <label class="t1" for="">景點地點:</label>
				<input type="text" name="eventLocation" required="required"><br> <br>
				<label class="t1" for="">景點宣傳圖片:</label>
				<input id="image_input" type="file" name="eventImage"><br>
				<br>
				<input type="hidden" name="status" value="1" />
				<%-- 以上為eventBean 以下為attractionBean --%>

					<label class="t1" for="">起始售票時間:</label> <input type="text" id="dateTime1" name="onSaleDate"
						placeholder="ex:2021-01-01 9:00:01" required="required"> <span id="datetimesp1"></span><br>
					<br> <span>時間格式:yyyy-MM-dd HH:mm:ss</span><br>
					<br> <label class="t1" for="">結束售票時間:</label> <input type="text" id="dateTime2" name="offSaleDate"
						placeholder="ex:2021-01-31 21:00:01" required="required"> <span id="datetimesp2"></span><br>
					<br> <span>時間格式:yyyy-MM-dd HH:mm:ss</span><br>
					<br> <label class="t1" for="">票券起始日:</label> <input type="text" id="date1" name="commDate"
						placeholder="ex:2021-01-01" required="required"> <span id="datesp1"></span><br>
					<br> <span>時間格式:yyyy-MM-dd</span> <br>
					<br> <label class="t1" for="">票券終止日:</label> <input type="text" id="date2" name="dueDate"
						placeholder="ex:2021-01-31" required="required"> <span id="datesp2"></span><br>
					<br> <span>時間格式:yyyy-MM-dd</span><br>
					<br> <label class="t1" for="">描述:</label>
					<textarea style="resize: none; width: 600px; height: 200px;" name="description"></textarea>
					<br>
					<br>

					<%-- 以上為attractionBean 以下為priceBean --%>
						<div id="price">
							<div>
								<label class="t1" for="">票券名稱:</label> <input type="text" name="priceName"
									required="required"><br>
								<br> <label class="t1" for="">票券價格:</label> <input type="text" name="priceCost"
									required="required"><br>
								<br>
								<br>
							</div>
						</div>

						<input id="Button1" type="button" value="新增價位與名稱" />
						<input id="submitButton" type="submit" name="sumbmit" />
			</form>
			<a href="<c:url value='/TicketIndex'/>" class="btn btn-info" role="button">回主頁</a>
			
			<script>
			let nowDate = new Date();
						
						function checkDateTime1(x,y){
	                        let theDateObj=document.getElementById(x);
	                        let theDateObjVal=theDateObj.value;
	                        
	                        let onSaleDate = new Date(Date.parse(theDateObjVal.replace('-','/')));
	                        
	                        let span1=document.getElementById(y);
	                        
	                        let isDateFormateLegal = moment(theDateObjVal, 'YYYY-MM-DD HH:mm:ss', true).isValid();
	                        
	                        if (!isDateFormateLegal) {
	                        	span1.className="checksp";
	                        	span1.innerHTML="日期時間格式輸入錯誤";

	                        }else if(Date.parse(onSaleDate) < Date.parse(nowDate)){
	                        	span1.className="checksp";
	                        	span1.innerHTML="開賣時間不可晚於今日";
	                        	
	                        }else{
	                        	span1.className="correctsp";
	                            span1.innerHTML="輸入正確";
	                        }
	                    }
						
						function checkDateTime2(x,y,z){
	                        let theDateObj=document.getElementById(x);
	                        let theDateObjVal=theDateObj.value;
	                        
	                        let theEffectiveObj=document.getElementById(z);
		                    let theEffectiveObjVal=theEffectiveObj.value;
	                        
		                    let onSaleDate = new Date(Date.parse(theEffectiveObjVal.replace('-','/')));
		                    let offSaleDate = new Date(Date.parse(theDateObjVal.replace('-','/')));
		                    
	                        let span1=document.getElementById(y);
	                        
	                        let isDateFormateLegal = moment(theDateObjVal, 'YYYY-MM-DD HH:mm:ss', true).isValid();
	                        
	                        if (!isDateFormateLegal) {
	                        	span1.className="checksp";
	                        	span1.innerHTML="日期時間格式輸入錯誤";

	                        }else if(Date.parse(offSaleDate) < Date.parse(nowDate)){
	                        	span1.className="checksp";
	                        	span1.innerHTML="售票結束時間不可晚於現在";
	                        	
	                        }else if(Date.parse(offSaleDate) < Date.parse(onSaleDate)){
	                        	span1.className="checksp";
	                        	span1.innerHTML="售票結束時間不可晚於開賣時間";
	                        	
	                        }else{
	                        	span1.className="correctsp";
	                            span1.innerHTML="輸入正確";
	                        }
	                    }


	                   function checkDate1(x,y,z){
	                       let theDateObj=document.getElementById(x);
	                       let theDateObjVal=theDateObj.value;
	                       
	                       let theEffectiveObj=document.getElementById(z);
		                   let theEffectiveObjVal=theEffectiveObj.value;
		                   
		                   let onSaleDate = new Date(Date.parse(theEffectiveObjVal.replace('-','/')));
		                   let commDate = new Date(Date.parse(theDateObjVal.replace('-','/')));
	                       
	                       let span1=document.getElementById(y);
	                  
	                        let isDateFormateLegal = moment(theDateObjVal, 'YYYY-MM-DD', true).isValid();
	                        if (!isDateFormateLegal) {
	                        	span1.className="checksp";
	                        	span1.innerHTML="日期時間格式輸入錯誤";
	                            
	                        }else if(Date.parse(commDate) < Date.parse(nowDate)){
	                        	span1.className="checksp";
	                        	span1.innerHTML="票券起始日不可晚於現在";
	                        	
	                        }else if(Date.parse(commDate) < Date.parse(onSaleDate)){
	                        	span1.className="checksp";
	                        	span1.innerHTML="票券起始日不可晚於起始售票時間";
	                        	
	                        }else{
	                        	span1.className="correctsp";
	                            span1.innerHTML="輸入正確";
	                        }
	                   }
	                   
	                   function checkDate2(x,y,z){
	                       let theDateObj=document.getElementById(x);
	                       let theDateObjVal=theDateObj.value;
	                       
	                       let theOffSaleObj=document.getElementById(z);
		                   let theOffSaleObjVal=theOffSaleObj.value;
		                   
		                   let offSaleDate = new Date(Date.parse(theOffSaleObjVal.replace('-','/')));
		                   let dueDate = new Date(Date.parse(theDateObjVal.replace('-','/')));
	                       
	                       let span1=document.getElementById(y);
	                  
	                        let isDateFormateLegal = moment(theDateObjVal, 'YYYY-MM-DD', true).isValid();
	                        if (!isDateFormateLegal) {
	                        	
	                        	span1.className="checksp";
	                        	span1.innerHTML="日期時間格式輸入錯誤";
	                            
	                        }else if(Date.parse(dueDate) < Date.parse(nowDate)){
	                        	span1.className="checksp";
	                        	span1.innerHTML="票券終止日不可晚於現在";
	                        	
	                        }else if(Date.parse(dueDate) < Date.parse(offSaleDate)){
	                        	span1.className="checksp";
	                        	span1.innerHTML="票券終止日不可晚於結束售票時間";
	                        }else{
	                        	span1.className="correctsp";
	                            span1.innerHTML="輸入正確";
	                        }
	                   }

							$("#Button1").click(function addPrice() {
								console.log($("#price").html());

								$("#price").html($("#price").html() + '<div>' +
									'<label class="t1" for="">票券名稱:</label>' +
									'<input type="text" name="priceName" required="required"><br><br>' +
									'<label class="t1" for="">票券價格:</label>' +
									'<input type="text" name="priceCost" required="required">&nbsp;<a href="#" class="btn btn-danger">刪除</a><br><br><br></div>');
								console.log($("#price").html());
							})


							$("#price").on("change", "input", function () {
								$(this).attr("value", $(this).val())
							})

							$("#price").on("click", ".btn-danger", function () {
								$(this).closest("div").remove();
							})
							//當dateTime1 onblur時 他會進行一個箭頭函數 箭頭函數內包含checkDateTime函式
							document.getElementById("dateTime1").onblur = () => { checkDateTime1('dateTime1', 'datetimesp1') }
							document.getElementById("dateTime2").onblur = () => { checkDateTime2('dateTime2', 'datetimesp2','dateTime1') }
							document.getElementById("date1").onblur = () => { checkDate1('date1', 'datesp1','dateTime1') }
							document.getElementById("date2").onblur = () => { checkDate2('date2', 'datesp2','dateTime2') }
							
							
							$("#submitButton").click(function () {
					              if ($("span").hasClass("checksp")) {
					                  event.preventDefault();
					              }
					          });
							
							
						</script>

		</body>

		</html>