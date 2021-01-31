<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Ranking</title>
<style>
.rep_ranking_div {
	width: 870px;
	margin-right: 50px;
	text-align: center;
}
#rep_Rank_myTable {
	width:100%;
	margin:15px 0;
	border:0;
}

#rep_Rank_myTable thead{
font-size: 16px;
}
#rep_Rank_myTable th {
	background-color:#86A5FF;
	color:#FFFFFF;
}

#rep_Rank_myTable td {
	padding: 5px;
	border: 1px solid #b9cbfe;
	border-width:1px 0 1px 0
}
#rep_Rank_myTable tr {
border: 2px solid #b9cbfe;
}

#rep_Rank_myTable input {
	height: 50px;
}

#rep_Rank_myTable input[type=button] {
	height: 320px;
	background-color: #86A5FF;
    border: 2px solid #86A5FF;
    color: white;
}

input[type=button]:hover {
    background-color: #008CBA;
    color: white;
}


</style>


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
			"<td><input type='text' size='6' class='price' value='"+(data[3]||'')+"'/></td>"+
			"<td>"+(data[0]?"<img style='height:50px' src='./getproductimage/"+data[0]+"'>":"")+"</td>"+
			(i==1?"<td rowspan='5'><input type='button' onclick='update_hot()' value='確認修改'/></td>":"")+
		"</tr>";
		
		i++;
	}
	
	str += "</tbody></table>";
	$("#rep_Rank_myTable").html(str);

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
   	 	error: function (jqXHR, textStatus, errorThrown) {
   	 		alert("修改失敗");
   	 	}
    });
}

// <!-- ajax 資料庫裡的Adv資料→預覽圖	-->
function loadAdv(){
	if( $("#rep_advertising").length > 0 )  $("#rep_advertising").remove();
	$.ajax({
	    url: "/proj/queryProductAdv",
	    type: 'GET',
		dataType: "json",
	    success: function(datas){
	    	$("html").append(`<div id="rep_advertising" style="float: right; margin: 10px 100px 0px 0px; border-radius: 10px 10px 0px 0px;position: fixed;right: 10px;top: 80px;background-color: rgba(200,200,200,0.6); z-index: 10000;" >
	            <div id="rep_adv_title" style="	display: block;border-radius: 10px 10px 0px 0px;background-color: rgb(116, 109, 106);color: cornsilk;padding: 5px 0px 5px 0px;text-align: center;"><b>精選商品</b></div>
	            <div style='float:right;font-size:10px;' onclick='document.getElementById("rep_advertising").remove();'>關閉X</div><br>    
	            <div id="rep_adv_div" style="width: 200px;overflow: hidden;">
	            <ul id="rep_adv_ul">
	                	\${
	                		datas.map((data)=>`<li id="rep_adv_1" style="column-count: 2;">
	    	                    <b class="rep_adv_li_b1" style="float: left;width: 80px;padding-left: 5px;font-size: 15px;">\${data[3]}</b>
	    	                    <b class="rep_adv_li_b2" style="float: left;color: darkolivegreen;font-size: smaller;padding-left: 5px;font-size: 12px;">\${data[4]}</b>
	    	                    <strong class="rep_adv_li_b3" style="color:red;float:left;font-size:larger;padding-left: 5px;font-size: 14px;">NT \${data[5]}</strong>
	    	                    <img style=" width: 110px;height: 100px; float: right; padding-right:5px;" src='./getproductimage/\${data[2]}'/>
	    	                </li>`).join("")
	                	}
	            </div>
	        </div>`);
   	    }
    });
}

<!-- ajax 資料庫裡的Adv資料-->
$(function(){
	console.log("queryProductAdv")
	$.ajax({
	    url: "/proj/queryProductAdv",
	    type: 'GET',
		dataType: "json",
	    success: function(datas){
	    	console.log("queryProductAdv",datas)
			setDataTable9(datas);
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
			"<td><textarea >"+(data[4]||'')+"</textarea></td>"+
			"<td><input type='text' class='price' size='6' value='"+(data[5]||'')+"'/></td>"+
			"<td>"+(data[0]?"<img style='height:50px' src='./getproductimage/"+data[2]+"'>":"")+"</td>"+
			(i==1?"<td rowspan='5'><input type='button' onclick='update_hot()' value='確認修改'/></td>":"")+
		"</tr>";
		i++;
	}
	str += "</tbody></table>";
	$("#rep_Rank_myTable").html(str);

};

//一鍵新增
$(function(){
$("#onenewinput").click(function(){

$("#rep_Rank_myTable tr:nth-child(1)").find("input.name").val('蜂膠草本抗菌皂花果香');
$("#rep_Rank_myTable tr:nth-child(1)").find("textarea").val('防疫神品');
$("#rep_Rank_myTable tr:nth-child(2)").find("input.name").val('依必朗防霉抗菌洗衣精');
$("#rep_Rank_myTable tr:nth-child(2)").find("textarea").val('防霉抗菌');
$("#rep_Rank_myTable tr:nth-child(3)").find("input.name").val('【限量】優雅食點心餅');
$("#rep_Rank_myTable tr:nth-child(3)").find("textarea").val('享受春節日子');
$("#rep_Rank_myTable tr:nth-child(4)").find("input.name").val('好優頂級牛奶優酪');
$("#rep_Rank_myTable tr:nth-child(4)").find("textarea").val('100%鮮乳自然發酵');
$("#rep_Rank_myTable tr:nth-child(5)").find("input.name").val('泰式甜辣醬');
$("#rep_Rank_myTable tr:nth-child(5)").find("textarea").val('適用各式料理喔');
});   
});

</script>

</head>
<body>

	<div class="rep_ranking_div">
		<form>
			<caption>
				<span style="font-weight: bolder; font-size: 20px; color: red;">廣告精選商品排行榜</span>
				<span style="display: inline; float: right;">
					<input type="button" value="帶入銷售前五名" id="queryProductRanking">
					<input type="button" value="一鍵新增" id="onenewinput">
				</span>
			</caption>
			<table id="rep_Rank_myTable">



			</table>
		</form>
	</div>

</body>
</html>