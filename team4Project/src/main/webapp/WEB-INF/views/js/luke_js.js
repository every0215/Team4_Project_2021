/**
 * 首頁的Header相關元素動態控制
 */

$(document).ready(function() {
	console.log('loading header infos..');
	$("#user-menu").hide();
	$("#UserNotificationBox").hide();

	$("#userbox").click(function() {
		$("#user-menu").toggle();
	});

	$("#UserNotification").click(function() {
		$("#UserNotificationBox").toggle();
	});

	let mouseentered = false;
	$("#UserNotificationBox").mouseenter(function() {
		mouseentered = true;
		console.log('mouse enter: ' + mouseentered);
	});

	$("#UserNotificationBox").mouseleave(function() {
		console.log('mouse out');
		if (mouseentered)
			$(this).hide();
	});

	//會員通知
	getMemberNotifications();
	setInterval(getMemberNotifications,5000); //間隔讀取通知
	function getMemberNotifications() {
		console.log('running getMemberNotifications..');
		let mNotificationDiv = $("#UserNotificationBox");
		
		$(".ll-notification").remove();
		
		$.ajax({
			type: "Get",
			url: "/proj//member/getMemberNotifications",
			//data: { memberId: id },
			success: function(data) {
				
				console.log("success: " + data);
				//可增加動態處理		
				$(".ll-num-count").html(data.length);//增加通知數
				// ....
				let htmlstr = '';
				for (let i = 0; i < data.length; i++) {
					console.log("(notification title: " + data[i].title);
					htmlstr += '<input class="checkbox" type="checkbox" id="size_' + data[i].id + '" value="small" checked /><label class="ll-notification new" for="size_' + data[i].id + '"><span class="ll-mn-span" data-url="' + data[i].url + '" >';
					htmlstr += '<em>' + data[i].title + '</em> <br>' + data[i].description + '</span><i class="material-icons dp48 right">clear</i></label>';
				}
				mNotificationDiv.append(htmlstr);
			},
			error: function(xhr, status, error) {
				var errorMessage = "[Error(取得會員通知清單失敗)-" + xhr.status + "]\r\n" + xhr.statusText + ': ' + xhr.responseText
				console.log(errorMessage);
			}
		});
	}
	
	//會員通知-點擊後顯示通知列表與導頁功能
	 $(document).on("click","#UserNotificationBox",function(e){
			 console.log('#UserNotificationBox clicked');
			  //e.preventDefault();
			  //alert('clicked.');
			  
		  });
			 
		  $(document).on("click",".ll-mn-span",function(e){
			  e.preventDefault();
			  let url = $(this).data("url");
			  console.log('.ll-mn-span clicked: ' + url);
			  window.location.href = url;
		  });
});


function showMsg(s1, s2, classname) {
	var msgDiv = $("#MsgDiv");
	var msgLabel = $("#MsgLabel");
	var msg = $("#Msg");
	msgLabel.html(s1);
	msg.html(s2);
	msgDiv.removeClass().addClass('alert ' + classname).show();
}

//=============================================================================
//================================  FUNCTIONS  ================================
//=============================================================================



