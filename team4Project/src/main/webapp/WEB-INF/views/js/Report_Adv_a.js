//ajax 資料庫裡的Adv資料→預覽圖
function loadAdv(companyid){
	if( $("#rep_advertising").length > 0 )  $("#rep_advertising").remove();
	$.ajax({
	    url: "/proj/queryProductAdv",
	    type: 'GET',
		dataType: "json",
		data:{
			companyid:companyid,
		},
	    success: function(datas){
	    	$("html").append(`<div id="rep_advertising" style="float: right; margin: 90px 10px 0px 0px; border-radius: 10px 10px 0px 0px;position: fixed;right: 10px;top: 70px;background-color: hsl(0deg 0% 100% / 80%); z-index: 10000;" >
	            <div id="rep_adv_title" style="	display: block;border-radius: 10px 10px 0px 0px;background-color: rgb(116, 109, 106);color: cornsilk;padding: 5px 0px 5px 0px;text-align: center;"><b style="font-size: 20px;">精選商品</b></div>
	            <div style='float:right;font-size:10px;' onclick='document.getElementById("rep_advertising").remove();'>關閉X</div><br>    
	            <div id="rep_adv_div" style="width: 250px;overflow: hidden;">
	            <ul id="rep_adv_ul">
	                	${
	                		datas.map((data)=>`<li id="rep_adv_1" style="column-count: 2;">
	    	                    <b class="rep_adv_li_b1" style="float: left;width: 80px;padding-left: 5px;font-size: 15px;">${data[3]}</b>
	    	                    <b class="rep_adv_li_b2" style="float: left; color: darkolivegreen; font-size: smaller;padding-left: 5px;font-size: 12px;">${data[4]}</b>
	    	                    <strong class="rep_adv_li_b3" style="color:red;float:left;font-size:larger;padding-left: 5px;font-size: 14px;">NT ${data[5]}</strong>
	    	                    <img style=" width: 110px;height: 100px; float: right; padding-right:5px;opacity: 0.8;" src='../getproductimage/${data[2]}'/>
	    	                </li>`).join("")
	                	}
	            </div>
	        </div>`);
   	    }
    });
}
