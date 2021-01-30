<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Ranking</title>
<style>
.rep_ranking_div {
	width: 1000px;
	margin-right: 50px;
	text-align: center;
}
#rep_Rank_myTable td{
	padding:5px;
}
#rep_Rank_myTable input{
	height:50px;
}
#rep_Rank_myTable input[type=button]{
	height:320px;
}

</style>
<!-- 外掛dataTables -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>

<script type="text/javascript">

<!-- queryProductRanking 匯入前五名資料 ajax-->
$(function(){
	$("#queryProductRanking").click(function(){
		$.ajax({
		    url: "/proj/queryProductRanking",
		    type: 'GET',
			dataType: "json",
		    success: function(datas) {
		    	console.log('ajax8',datas);
				setDataTable8(datas);
				console.log(datas);
	   	    }
	    });
	});	
});
function setDataTable8(rep){
	let str = `<table><thead>
			<tr>
			<th>排名/順序</th>
			<th>商品名稱</th>
			<th>商品描述</th>
			<th>商品金額</th>
			<th>商品圖片</th>
			<th>變更</th>
		</tr>
		</thead>
		<tbody>
	`;
	let i=1;
	for(const data of rep){
		str+= "<tr productId="+(data[0]||'')+">"+
			"<td class='asc'>"+i+"</td>"+
			"<td><input type='text' class='name' value='"+(data[1]||'')+"'/></td>"+
			"<td><textarea>"+data[2]+"</textarea></td>"+
			"<td><input type='text' class='price' value='"+(data[3]||'')+"'/></td>"+
			"<td>"+(data[0]?"<img style='height:50px' src='./getproductimage/"+data[0]+"'>":"")+"</td>"+
			(i==1?"<td rowspan='5'><input type='button' onclick='update_hot()' value='確認修改'/></td>":"")+
		"</tr>";
		
		i++;
	}
	
	str += "</tbody></table>";
	$("#rep_Rank_myTable").html(str);
	$("#rep_Rank_myTable table").DataTable({
		"dom" : 'rti',
	});
}

function update_hot(){
	let datas = [];
	$("#rep_Rank_myTable tr").each(function(id,ele){
		if ($(ele).attr('productId')){
			datas.push({
				orderAsc: +$(ele).find('.asc').html() || 1,
				productId: $(ele).attr('productId') || 0,
				productName: $(ele).find('input.name').val() || '',
				productDescript: $(ele).find('textarea').val() || '',
				productPrice: $(ele).find('input.price').val() || 0,
			});
		}
	});
	
	$.ajax({
	    url: "/proj/updateHot",
	    type: 'POST',
		dataType: "json",
		data: {
			data: JSON.stringify(datas),
		},
	    success: function(datas){
	    	
	    	loadAdv();
	    	alert("修改成功");
   	    },
   	 	error: function (jqXHR, textStatus, errorThrown) {alert("修改失敗");}
    });
}
</script>


<!-- ajax 資料庫裡的Adv資料-->
<script type="text/javascript">


function loadAdv(){
	if( $("#rep_advertising").length > 0 )  $("#rep_advertising").remove();
	$.ajax({
	    url: "/proj/queryProductAdv",
	    type: 'GET',
		dataType: "json",
	    success: function(datas){
	    	$("html").append(`<div id="rep_advertising" style="float: right; margin: 30px 20px 0px 0px; border-radius: 10px 10px 0px 0px;position: fixed;right: 10px;top: 80px;background-color: rgba(200,200,200,0.6); padding:20px; z-index: 10000;padding-top:5px;" >
	            <div id="rep_adv_title"><b>精選商品</b></div>
	            <div id="rep_adv_div">
	                <ul id="rep_adv_ul" style="">
	                	<div style='float:right' onclick='document.getElementById("rep_advertising").remove();'>X</div><br>
	                	\${
	                		datas.map((data)=>`<li id="rep_adv_1">
	    	                    <b class="rep_adv_li_b1">\${data[3]}</b>
	    	                    <b class="rep_adv_li_b2">\${data[4]}</b>
	    	                    <strong class="rep_adv_li_b3">NT \${data[5]}</strong>
	    	                    <img src='./getproductimage/\${data[2]}'/>
	    	                </li>`).join("")
	                	}
	            </div>
	        </div>`);
   	    }
    });
}


$(function(){
	$.ajax({
	    url: "/proj/queryProductAdv",
	    type: 'GET',
		dataType: "json",
	    success: function(datas){
			setDataTable9(datas);
			console.log('queryProductAdv出現二')
   	    }
    });
});	
function setDataTable9(adv){
	let str = `<table><thead >
			<tr>
			<th>排名/順序</th>
			<th>商品名稱</th>
			<th>商品描述</th>
			<th>商品金額</th>
			<th>商品圖片</th>
			<th>變更</th>
		</tr>
		</thead>
		<tbody>
	`;
	let i=1;
	while (adv.length<5){adv.push([]);}
	for(const data of adv){
		str+="<tr productId="+(data[2]||"")+">"+
			"<td class='asc'>"+i+"</td>"+
			"<td><input type='text' class='name' value='"+(data[3]||'')+"'/></td>"+
			"<td><textarea>"+(data[4]||'')+"</textarea></td>"+
			"<td><input type='text' class='price' value='"+(data[5]||'')+"'/></td>"+
			"<td>"+(data[0]?"<img style='height:50px' src='./getproductimage/"+data[2]+"'>":"")+"</td>"+
			(i==1?"<td rowspan='5'><input type='button' onclick='update_hot()' value='確認修改'/></td>":"")+
		"</tr>";
		i++;
	}
	str += "</tbody></table>";
	$("#rep_Rank_myTable").html(str);
	$("#rep_Rank_myTable table").DataTable({
		"dom" : 'rti',
	});
}
</script>

</head>
<body>

	<div class="rep_ranking_div">
		<form>
			<caption>
				<span style="font-weight: bolder; font-size: 20px; color: red; text-align: left;">廣告精選商品排行榜</span>
				<span style="display: inline; float: right;">
					<input type="button" value="帶入銷售前五名" id="queryProductRanking">
				</span>
			</caption>
			<table id="rep_Rank_myTable">



			</table>
		</form>
	</div>

</body>
</html>