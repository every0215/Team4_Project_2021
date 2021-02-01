<jsp:include page="../crm/backOffice.jsp" flush="true"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>展覽</title>
<!-- 			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

			<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
			<script src="../ticketjs/checkDateTime.js"></script>

			<style>
	body{
	background-color: #ECF0F5;
	}
				
.main-header .navbar-custom-menu, .main-header .navbar-right {
	height:500px;
	}
.ticket_area{
	background-color: transparent;
	position: absolute;
	width: calc(100vw);
	height: calc(100vh - 80px);
	bottom: 0px;
	right: 0px;
	}
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
			<div class="ticket_area">
		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper" style="min-height:204px">
			<!-- Content Header (Page header) -->
			<script src="https://code.jquery.com/jquery-3.5.1.js"
				integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

			<h3>Event Update Page-樂園與景點</h3>
			<form name="myForm" action="<c:url value='/ticket/InputPageAT'/>" method="post"
				enctype="multipart/form-data">
				<hr />
				<input type="hidden" name="id" value='${event.id}'/>
				<input type="hidden" name="typeId" value="2" />
				<label class="t1" for="">景點名稱:</label>
				<input type="text" name="eventName" required="required" value='${event.eventName}'><br><br>
				<label class="t1" for="">景點地點:</label>
				<input type="text" name="eventLocation" required="required" value='${event.eventLocation}'><br><br>
				
				<label class="t1" for="">景點宣傳圖片:</label>
				<input id="image_input" type="file" name="eventImage"><br>
				<img id="picPreview" style="width:400px;height:200px" src="https://fakeimg.pl/650x300/282828/EAE0D0/?text=preview"/><br>
				<br/>
				<input type="hidden" name="status" value="1" />
				<%-- 以上為eventBean 以下為attractionBean --%>
					<input type="hidden" name="attractionId" value='${attraction.id}'/>
					<label class="t1" for="">起始售票時間:</label>
					<input type="text" id="dateTime1" name="onSaleDate" placeholder="ex:2021-01-01 9:00:01"
						required="required" value='${attraction.onSaleDate.toString().substring(0, 19)}'>
					<span id="datetimesp1"></span><br><br>
					<span style="margin-left:90px">時間格式:yyyy-MM-dd HH:mm:ss</span><br><br>
					<label class="t1" for="">結束售票時間:</label>
					<input type="text" id="dateTime2" name="offSaleDate" placeholder="ex:2021-01-31 21:00:01"
						required="required" value='${attraction.offSaleDate.toString().substring(0, 19)}'>
					<span id="datetimesp2"></span><br><br>
					<span style="margin-left:90px">時間格式:yyyy-MM-dd HH:mm:ss</span><br><br>
					<label class="t1" for="">票券起始日:</label>
					<input type="text" id="date1" name="commDate" placeholder="ex:2021-01-01" required="required"
						value='${attraction.commDate}'>
					<span id="datesp1"></span><br><br>
					<span style="margin-left:90px">時間格式:yyyy-MM-dd</span><br><br>
					<label class="t1" for="">票券終止日:</label>
					<input type="text" id="date2" name="dueDate" placeholder="ex:2021-01-31" required="required"
						value='${attraction.dueDate}'>
					<span id="datesp2"></span><br><br>
					<span style="margin-left:90px">時間格式:yyyy-MM-dd</span><br><br>
					<label class="t1" for="">描述:</label>
					<textarea style="resize: none; width: 600px; height: 200px;"
						name="description">${attraction.description}</textarea><br><br>

					<%-- 以上為attractionBean 以下為priceBean --%>


						<div id="price">
							<c:forEach var="price" items="${priceList}" varStatus="status">
								<div>
									<label class="t1" for="">票券名稱:</label>
									<input type="text" name="priceName" required="required"
										value='${price.name}'><br><br>
									<label class="t1" for="">票券價格:</label>
									<input type="text" name="priceCost" required="required"
										value='${price.cost}'>&nbsp;

									<c:if test="${status.index!=0}">

										<a href="#" class="btn btn-danger">刪除</a>

									</c:if><br><br><br>
								</div>
							</c:forEach>
						</div>



						<input id="Button1" class="btn btn-primary btn-sm" type="button" value="新增價位與名稱" />
						<input type="submit" name="sumbmit" id="submitButton" class="btn btn-warning">
						<a href="<c:url value='/TicketIndex'/>" class="btn btn-info" role="button">回主頁</a>
						<script>
						
						$("#image_input").change(function(){
				            readURL(this); 
				          });
						
						function readURL(input){
				   	  if(input.files && input.files[0]){
				   	    var reader = new FileReader();
				   	    reader.onload = function (e) {
				   	       $("#picPreview").attr('src', e.target.result);
				   	    }
				   	    reader.readAsDataURL(input.files[0]);
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



						
						
			</form>
			
			</div>
			</div>
		</body>

		</html>