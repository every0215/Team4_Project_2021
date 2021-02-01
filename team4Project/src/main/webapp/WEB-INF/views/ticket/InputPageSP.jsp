<jsp:include page="../crm/backOffice.jsp" flush="true"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>展覽</title>
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
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
th{
text-align:center;
}
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
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<a href="InputPageEX">展覽</a>
	<a href="InputPageAT">樂園與景點</a>
	<a href="InputPageSP">運動賽事</a>

	<h3>Event Input Page-運動賽事</h3>
	<form name="myForm" action="<c:url value='/ticket/InputPageSP'/>" method="post" enctype="multipart/form-data">
		<hr />
			<input type="hidden" name="typeId" value="3" />
		<label class="t1" for="">賽事名稱:</label>
			<input type="text" name="eventName" required="required"><br> <br>
		<label class="t1" for="">賽事地點:</label>
			<input type="text" name="eventLocation" required="required"><br> <br>
			
		<label class="t1" for="">賽事宣傳圖片:</label>
		<input id="image_input" type="file" name="eventImage"><br>
		<img id="picPreview" style="width:400px;height:200px" src="https://fakeimg.pl/650x300/282828/EAE0D0/?text=preview"/><br>
		<br/>
		<input type="hidden" name="status" value="1" />
		<%-- 以上為eventBean 以下為exhibitionBean --%>

		<label class="t1" for="">起始售票時間:</label>
			<input type="text" id="dateTime1" name="onSaleDate" placeholder="ex:2021-01-01 9:00:01" required="required">
				<span id="datetimesp1"></span><br><br>
				<span style="margin-left:90px">時間格式:yyyy-MM-dd HH:mm:ss</span><br><br>
		<label class="t1" for="">結束售票時間:</label>
			<input type="text" id="dateTime2" name="offSaleDate" placeholder="ex:2021-01-31 21:00:01" required="required">
				<span id="datetimesp2"></span><br><br>
				<span style="margin-left:90px">時間格式:yyyy-MM-dd HH:mm:ss</span><br><br>
		
		<label class="t1" for="">描述:</label>
			<textarea style="resize: none; width: 600px; height: 200px;" name="description"></textarea><br><br>

		<label class="t1" for="">優惠銀行:</label>
		<select name="bankId" id="bank" onChange="renew(this.selectedIndex)" required>
			<option value="0" selected>請選擇</option>
			<option value="1">中國信託商業銀行</option>
			<option value="2">玉山商業銀行</option>
			<option value="3">台北富邦商業銀行</option>
			<option value="4">國泰世華商業銀行</option>
			<option value="5">花旗（台灣）商業銀行</option>
			<option value="6">台新國際商業銀行</option>
		</select><br> <br> <label class="t1" for="">優惠信用卡:</label> <select
			name="cardId" id="card" required>
		</select><br> <br> <label class="t1" for="">信用卡優惠折扣:</label> <input
			type="text" name="discountRatio" required="required" placeholder="ex 0.8 表8折"><br> <br>

		<%-- 以上為exhibitionBean 以下為priceBean --%>
		<label class="t1" for="">票價與座位表:</label>
		<table style="width: 800px;border:3px #cccccc solid;text-align:center;" cellpadding="10" border='1'>
			<thead>
				<tr><th rowspan="2"><th colspan="2">內野區</th><th colspan="2">外野區</th></tr>
				<tr><th>A區</th><th>B區</th><th>A區</th><th>B區</th></tr>
			</thead>
			<tbody>
			<tr>
				<td>票價</td>
				<td><input type="hidden" name="priceName" value="內野A區票" /><input type="text" name="priceCost" required="required"></td>
				<td><input type="hidden" name="priceName" value="內野B區票" /><input type="text" name="priceCost" required="required"></td>
				<td><input type="hidden" name="priceName" value="外野A區票" /><input type="text" name="priceCost" required="required"></td>
				<td><input type="hidden" name="priceName" value="外野B區票" /><input type="text" name="priceCost" required="required"></td>
			</tr>
			<tr>
				<td>座位數</td>
				<td><input type="text" name="seatNo" required="required"></td>
				<td><input type="text" name="seatNo" required="required"></td>
				<td><input type="text" name="seatNo" required="required"></td>
				<td><input type="text" name="seatNo" required="required"></td>
			</tr>
			</tbody>
		</table>
		<br/><br/>
		<%-- 以上為priceBean 以下為sessionBean --%>
		<div id="sportSession">
			<div>
			<label class="t1" for="">開賽時間:</label>
			<input type="text" name="kickOfTime" placeholder="ex:2021-01-01 09:00" required="required"><br>
				<span style="margin-left:90px">時間格式:yyyy-MM-dd HH:mm</span><br><br>
			</div>
		</div>
		
		<input id="Button1" type="button" value="新增場次" class="btn btn-primary btn-sm"/>
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
		
		$(function(){	
			$.ajax({
			    type: 'GET',
			    url: "/proj/combobox",
			    data: {todo:"ajaxexample1"}, 
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
		
		
		$("#Button1").click(function addSession(){
			
			ele = $('<div />').html('<div>'+
					'<label class="t1" for="">開賽時間:</label>'+
					'<input type="text" name="kickOfTime" placeholder="ex:2021-01-01 09:00" required="required"><br>'+
					' <span style="margin-left:90px">時間格式:yyyy-MM-dd HH:mm</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
					'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
					'<span><a href="#" class="btn btn-danger">刪除</a></span><br><br><br>');
			
			$("#sportSession").append(ele);
			$(ele).find('input').blur(function(){
				console.log('hello world');
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