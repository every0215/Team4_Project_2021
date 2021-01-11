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
</style>
</head>
<body>
	<div class="jumbotron text-center">
		<h1>E-Ticket票券系統</h1>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<a href="eventInputPage1.jsp">展覽</a>
	<a href="eventInputPage2.jsp">樂園與景點</a>
	<a href="eventInputPage3.jsp">運動賽事</a>

	<h3>Event Input Page-展覽</h3>
	<form name="myForm" action="<c:url value='/ticket/InputPage'/>" method="post" enctype="multipart/form-data">
		<hr />
			<input type="hidden" name="typeId" id="typeId" value="1" /> 
		<label class="t1" for="" >展覽名稱:</label>
			<input type="text" name="eventName" id="eventName" required="required"><br> <br>
		<label class="t1" for="">展覽地點:</label>
			<input type="text" name="eventLocation" id="eventLocation" required="required"><br> <br>
			<input type="hidden" name="companyId" id="companyId" value="1" />
		<label class="t1" for="">展覽宣傳圖片:</label>
			<input id="image_input" type="file" name="eventImage" id="eventImage"><br><br>




		<%-- 以上為eventBean 以下為exhibitionBean --%>

		<label class="t1" for="">起始售票時間:</label>
			<input type="text" id="dateTime1" name="onSaleDate" id="onSaleDate" placeholder="ex:2021-01-01 9:00:01" required="required">
			<span id="datetimesp1"></span><br><br>
			<span>時間格式:yyyy-MM-dd HH:mm:ss</span><br> <br>
			
		<label class="t1" for="">結束售票時間:</label>
			<input type="text" id="dateTime2" name="offSaleDate" id="offSaleDate" placeholder="ex:2021-01-31 21:00:01" required="required">
			<span id="datetimesp2"></span><br><br>
			<span>時間格式:yyyy-MM-dd HH:mm:ss</span><br> <br>
			
		<label class="t1" for="">展覽起始日:</label>
			<input type="text" id="date1" name="commDate" id="commDate" placeholder="ex:2021-01-01" required="required">
			<span id="datesp1"></span><br> <br>
			<span>時間格式:yyyy-MM-dd</span><br><br>
			
		<label class="t1" for="">展覽終止日:</label>
			<input type="text" id="date2" name="dueDate" id="dueDate" placeholder="ex:2021-01-31" required="required">
			<span id="datesp2"></span><br> <br>
			<span>時間格式:yyyy-MM-dd</span><br><br>
			
		<label class="t1" for="">描述:</label>
			<textarea style="resize: none; width: 600px; height: 200px;" name="description" id="description"></textarea><br><br>

		<!-- 		<label class="t1" for="" >優惠信用卡:</label>	 -->
		<!-- 			<select name="cardId" required="required"> -->
		<!-- 				<option value="" selected>請選擇</option> -->
		<!-- 				<option value="1">LINE PAY信用卡</option> -->
		<!-- 				<option value="2">中油聯名卡</option> -->
		<!-- 				<option value="3">中信兄弟聯名卡</option> -->
		<!-- 				<option value="4">酷玩卡</option> -->
		<!-- 				<option value="5">統一時代悠遊聯名卡</option> -->
		<!-- 				<option value="6">臺北南山廣場聯名卡</option> -->
		<!-- 				</select><br><br> -->


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
			<select	name="cardId" id="card" required>
			</select><br> <br> 
		<label class="t1" for="">信用卡優惠折扣:</label> 
		<input type="text" name="discountRatio" required="required" placeholder="ex 0.8 表8折"><br> <br>

		<script>
	let bankInfo = [
		  {
		   name: '中國信託商業銀行',
		   id: 1,
		   cardInfo: [
		    {
		     name: 'LINE PAY信用卡',
		     cardId: 1
		    },
		    {
		     name: '中油聯名卡',
		     cardId: 2
		    },
		    {
			 name: '中信兄弟聯名卡',
			 cardId: 3
			 },
		    {
		     name: '酷玩卡',
		     cardId: 4
		    }
		   ]
		  },
		  {
		   name: '玉山商業銀行',
		   id: 2,
		   cardInfo: [
		    {
		     name: '統一時代悠遊聯名卡',
		     cardId: 5
		    },
		    {
		     name: '臺北南山廣場聯名卡',
		     cardId: 6
		    },
		    {
		     name: '玉山 Pi 拍錢包信用卡',
		     cardId: 7
		    }
		   ]
		  },
		  {
			name: '台北富邦商業銀行',
			id: 3,
			cardInfo: [
			{
			 name: '富邦數位生活卡',
			 cardId: 8
			 },
			 {
			 name: 'momo卡',
			 cardId: 9
			 },
			 {
			 name: '中信兄弟聯名卡',
			 cardId: 10
			 },
			 {
			 name: '酷玩卡',
			 cardId: 11
			 }
			 ]
			},
			  {
				name: '國泰世華商業銀行',
				   id: 4,
				   cardInfo: [
				    {
				     name: 'KOKO COMBO icash聯名卡',
				     cardId: 12
				    },
				    {
				     name: '長榮航空聯名卡',
				     cardId: 13
				    },
				    {
				     name: 'Costco聯名卡',
				     cardId: 14
				    }
				   ]
				  },
				  {
						name: '台新國際商業銀行',
						id: 6,
						cardInfo: [
						{
						 name: '@GOGO卡',
						 cardId: 15
						 },
						 {
						 name: 'FlyGo卡',
						 cardId: 16
						 },
						 {
						 name: '玫瑰卡',
						 cardId: 17
						 },
						 {
						 name: '街口聯名卡',
						 cardId: 18
						 }
						 ]
						}
		  
		  
		  
		 ]
// 	bankId=new Array();
// 	bankId[1]=["LINE PAY信用卡","中油聯名卡","中信兄弟聯名卡","酷玩卡"]; //中信
// 	bankId[2]=["統一時代悠遊聯名卡","臺北南山廣場聯名卡","玉山 Pi 拍錢包信用卡"]; //玉山
// 	bankId[3]=["富邦數位生活卡","momo卡","富邦悍將悠遊聯名卡","富邦J卡"]; //富邦
// 	bankId[4]=["KOKO COMBO icash聯名卡","長榮航空聯名卡","Costco聯名卡"]; //國泰
// 	bankId[5]=["花旗的卡1"]
// 	bankId[6]=["@GOGO卡","FlyGo卡","玫瑰卡","街口聯名卡"]; //台新
	
// 	function renew(index){
// 		for(var i=0;i<bankId[index].length;i++)
// 			document.myForm.cardId.options[i]=new Option(bankId[index][i], bankId[index][i]);	// 設定新選項
// 			document.myForm.cardId.length=bankId[index].length;	// 刪除多餘的選項
//	}	
	
	 function renew(index){
		  const selectedBnak = bankInfo.find(bank => bank.id == index)
		  const creditCardInfo = selectedBnak.cardInfo

		  for (let i = 0; i < creditCardInfo.length; i++)
		   document.myForm.cardId.options[i] = new Option(creditCardInfo[i].name, creditCardInfo[i].cardId) // 設定新選項

		  document.myForm.cardId.length = creditCardInfo.length // 刪除多餘的選項

		 }
	</script>

		<%-- 以上為exhibitionBean 以下為priceBean --%>
		<div id="price">
			<div>
				<label class="t1" for="">票券名稱:</label> <input type="text"
					name="priceName" required="required"><br> <br> <label
					class="t1" for="">票券價格:</label> <input type="text" name="priceCost"
					required="required"><br> <br> <br>
			</div>
		</div>

		<input id="Button1" type="button" value="新增價位與名稱" />
		<script>
		$("#Button1").click(function addPrice(){
			console.log($("#price").html());
			
			$("#price").html($("#price").html() +  '<div>'+
					'<label class="t1" for="">票券名稱:</label>'+
					'<input type="text" name="priceName" required="required"><br><br>'+
					'<label class="t1" for="">票券價格:</label>'+
					'<input type="text" name="priceCost" required="required"><a href="#" class="btn btn-danger">刪除</a><br><br><br></div>');
			console.log($("#price").html());
		})
		

		$("#price").on("change","input",function(){		
			$(this).attr("value",$(this).val()) 
		})
		
			$("#price").on("click",".btn-danger",function(){
                $(this).closest("div").remove(); 
            })
            //當dateTime1 onblur時 他會進行一個箭頭函數 箭頭函數內包含checkDateTime函式
            document.getElementById("dateTime1").onblur= () => { checkDateTime('dateTime1', 'datetimesp1') }
        	document.getElementById("dateTime2").onblur= () => { checkDateTime('dateTime2', 'datetimesp2') }
        	document.getElementById("date1").onblur= () => { checkDate('date1', 'datesp1') }
        	document.getElementById("date2").onblur= () => { checkDate('date2', 'datesp2') }
        	window.onload = function () {
				getMethod()
			}
        	
        	$("#s1").click(function(){
        		$.ajax({
        			url:"/ticket/InputPage",
        			type:"POST",
        			data:{
        				typeId : $("#typeId").val(),
        				eventName : $("#eventName").val(),
        				eventLocation : $("#eventLocation").val(),
        				companyId : $("#companyId").val(),
        				eventImage : $("#eventImage").val(),
        				
        			},
        			success: function(response){
        				console.log(response);
        				if(response.success){
        					window.location="/ticket/ShowPage;"
        				} else {
        					alert("失敗");
        				}
        			}
        		});
        	}
		</script>


		
		<a href="../TicketIndex">回主頁</a>
		<input type="submit" name="sumbmit" id="s1"> 
		<a href="serviceShowEventServlet.do" class="btn btn-success"
			role="button">查詢所有票券</a>
	</form>
</body>
</html>