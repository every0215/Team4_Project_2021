<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>展覽</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
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
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

	<h3>Event Update Page-運動賽事</h3>
	<form name="myForm" action="<c:url value='/ticket/InputPageSP'/>" method="post" enctype="multipart/form-data">
		<hr />
			<input type="hidden" name="id" value='${event.id}'/>
			<input type="hidden" name="typeId" value="3" />
		<label class="t1" for="">賽事名稱:</label>
			<input type="text" name="eventName" required="required" value='${event.eventName}'><br> <br>
		<label class="t1" for="">賽事地點:</label>
			<input type="text" name="eventLocation" required="required" value='${event.eventLocation}'><br> <br>
			
		<label class="t1" for="">賽事宣傳圖片:</label>
			<input id="image_input" type="file" name="eventImage"><br><br>
		<input type="hidden" name="status" value="1" />
		<%-- 以上為eventBean 以下為SportBean --%>
			<input type="hidden" name="sportId" value='${sport.id}'/>
		<label class="t1" for="">起始售票時間:</label>
			<input type="text" id="dateTime1" name="onSaleDate" placeholder="ex:2021-01-01 9:00:01" required="required" value='${sport.onSaleDate.toString().substring(0, 19)}'>
				<span id="datetimesp1"></span><br><br>
				<span>時間格式:yyyy-MM-dd HH:mm:ss</span><br><br>
		<label class="t1" for="">結束售票時間:</label>
			<input type="text" id="dateTime2" name="offSaleDate" placeholder="ex:2021-01-31 21:00:01" required="required" value='${sport.offSaleDate.toString().substring(0, 19)}'>
				<span id="datetimesp2"></span><br><br>
				<span>時間格式:yyyy-MM-dd HH:mm:ss</span><br><br>
		
		<label class="t1" for="">描述:</label>
			<textarea style="resize: none; width: 600px; height: 200px;" name="description">${sport.description}</textarea><br><br>

		<label class="t1" for="">優惠銀行:</label>
		<select name="bankId" id="bank" onChange="renew(this.selectedIndex)" required>
			<option value="0" selected>請選擇</option>
			<option value="1">中國信託商業銀行</option>
			<option value="2">玉山商業銀行</option>
			<option value="3">台北富邦商業銀行</option>
			<option value="4">國泰世華商業銀行</option>
			<option value="5">花旗（台灣）商業銀行</option>
			<option value="6">台新國際商業銀行</option>
		</select><br> <br>
		<label class="t1" for="">優惠信用卡:</label>
		<select name="cardId" id="card" required></select><br><br>
		<label class="t1" for="">信用卡優惠折扣:</label>
			<input type="text" name="discountRatio" required="required" placeholder="ex 0.8 表8折" value='${sport.discountRatio}'><br> <br>

		<script>
		$(function(){	
			$.ajax({
			    type: 'GET',
			    url: "/proj/combobox",
			    data: {todo:"ajaxexample1"},
			    async: false,
			    success: function(data){
			    	bankInfo = data;
			    	console.log(bankInfo)
			    }
			});
			
			refreshData();
		});
	
		function renew(index){
     		  const selectedBank = bankInfo.find(bank => bank.id == index)
     		  const creditCardInfo = selectedBank.cards

     		  for (let i = 0; i < creditCardInfo.length; i++)
     		   document.myForm.cardId.options[i] = new Option(creditCardInfo[i].cardName, creditCardInfo[i].id) // 設定新選項

     		  document.myForm.cardId.length = creditCardInfo.length // 刪除多餘的選項

     		 }
	</script>

		<%-- 以上為sportBean 以下為priceBean --%>
		<label class="t1" for="">票價與座位表:</label>
		<table style="width: 800px;border:3px #cccccc solid;text-align:center; " cellpadding="10" border='1'>
			<thead>
				<tr><th rowspan="2"><th colspan="2">內野區</th><th colspan="2">外野區</th></tr>
				<tr><th>A區</th><th>B區</th><th>A區</th><th>B區</th></tr>
			</thead>
			<tbody>
			<tr>
				<td>票價</td>
		
				<c:forEach var="price" items="${priceList}"><td><input type="hidden" name="priceName" value='${price.name}' /><input type="text" name="priceCost" required="required" value='${price.cost}'></td></c:forEach>
			</tr>
			<tr>
				<td>座位數</td>
				<c:forEach var="seat" items="${seatList}"><td><input type="text" name="seatNo" required="required" value='${seat.seatNo}'></td></c:forEach>
			</tr>
			</tbody>
		</table>
		<br/><br/>
		<%-- 以上為priceBean 以下為sessionBean --%>
		
		<div id="sportSession">
							<c:forEach var="session" items="${sessionList}" varStatus="status">
								<div>
									<label class="t1" for="">開賽時間:</label>
									<input type="text" name="kickOfTime" required="required" value='${session.kickOfTime.toString().substring(0, 16)}'><br>
									<span>時間格式:yyyy-MM-dd HH:mm</span>


									<c:if test="${status.index!=0}">

										<a href="#" class="btn btn-danger">刪除</a>

									</c:if>
									<br><br>
								</div>
							</c:forEach>
						</div>
		
		
		<input id="Button1" type="button" value="新增場次" />
		<script>
		$("#Button1").click(function addSession(){

			
			ele = $('<div />').html('<div>'+
					'<label class="t1" for="">開賽時間:</label>'+
					'<input type="text" name="kickOfTime" placeholder="ex:2021-01-01 9:00" required="required"><br>'+
					' <span>時間格式:yyyy-MM-dd HH:mm</span>&nbsp;&nbsp;&nbsp;'+
					'<span><a href="#" class="btn btn-danger">刪除</a></span><br><br><br>');
			
			$("#sportSession").append(ele);
			ele.click(function(){

			})

			
		})
		

		$("#sportSession").on("change","input",function(){		
			$(this).attr("value",$(this).val()) 
		})
		
			$("#sportSession").on("click",".btn-danger",function(){
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
            
            //當dateTime1 onblur時 他會進行一個箭頭函數 箭頭函數內包含checkDateTime函式
            document.getElementById("dateTime1").onblur = () => { checkDateTime1('dateTime1', 'datetimesp1') }
			document.getElementById("dateTime2").onblur = () => { checkDateTime2('dateTime2', 'datetimesp2','dateTime1') }
			
        	window.onload = function () {
        		document.getElementById('bank').value='${creditCard.bankId}';
				renew('${creditCard.bankId}');
				document.getElementById('card').value='${sport.cardId}';
				
			}
        	
        	
        	$("#submitButton").click(function () {
	              if ($("span").hasClass("checksp")) {
	                  event.preventDefault();
	              }
	          });
		</script>

		
		<input type="submit" name="sumbmit" id="submitButton"> 
		
	</form>
	<a href="<c:url value='/TicketIndex'/>" class="btn btn-info" role="button">回主頁</a>
</body>
</html>