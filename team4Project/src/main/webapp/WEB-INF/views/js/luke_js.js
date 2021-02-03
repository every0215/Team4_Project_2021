/**
 * 首頁的Header相關元素動態控制
 */

$(document).ready(function() {
	console.log('loading header info..');
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
		//mouseentered = true;
		console.log('mouse enter: ' + mouseentered);
	});

	$("#UserNotificationBox").mouseleave(function() {
		console.log('mouse out');
		//if (mouseentered)
			//$(this).hide();
	});
	
	

	//會員通知
	getMemberNotifications();
	setInterval(getMemberNotifications,5000); //間隔讀取通知
	function getMemberNotifications() {
		console.log('running getMemberNotifications..');
		let mNotificationDiv = $("#UserNotificationBox");
		$.ajax({
			type: "Get",
			url: "/proj//member/getMemberNotifications",
			//data: { memberId: id },
			success: function(data) {
				$(".ll-notification").remove();
				console.log("success: " + data);
				//可增加動態處理		
				$(".ll-num-count").html(data.length);//增加通知數
				// ....
				let htmlstr = '';
				for (let i = 0; i < data.length; i++) {
					console.log("(notification title: " + data[i].title);
					htmlstr += '<input class="checkbox" type="checkbox" id="mn_' + data[i].id + '" value="small" checked /><label class="ll-notification new" for="mn_' + data[i].id + '"><span class="ll-mn-span" data-url="' + data[i].url + '" data-id="' + data[i].id + '" >';
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
			  let mn_id = $(this).data("id");
			  console.log('.ll-mn-span clicked: ' + url + ', mn_id:' + mn_id);
			  
			  //設定通知為已讀
			  $.ajax({
					type: "POST",
					url: "/proj//member/updateMemberNotificationIsRead",
					data: { mnId: mn_id },
					success: function(data) {
		
						console.log("會員通知已成功更新為已讀 (mnId=" + mn_id + ")");
						window.location.href = url;
					},
					error: function(xhr, status, error) {
						var errorMessage = "[Error(更新會員通知為已讀失敗)-" + xhr.status + "]\r\n" + xhr.statusText + ': ' + xhr.responseText
						console.log(errorMessage);
					}
				});
		
			  
		  });
		  
		  
	//會員AccountMenu-頁面訪問後連結背景呈現
	//var pageURL = $(location).attr("href");
	
    var pageName = document.location.href.match(/[^\/]+$/)[0];
    
    console.log('accountMenu(pageName:'+pageName+')');
    
    $('#menu-content>li').removeClass('active');
    $('#menu-content').find('li[data-target="#'+pageName+'"]').addClass('active');
    console.log('accountMenu...');
    console.log($('#menu-content>li'));
    
//	  force reloading a page when using browser back button
//    window.addEventListener( "pageshow", function ( event ) {
//	  var historyTraversal = event.persisted || 
//	                         ( typeof window.performance != "undefined" && 
//	                              window.performance.navigation.type === 2 );
//	  if ( historyTraversal ) {
//	    // Handle page restore.
//	    window.location.reload();
//	  }
//	});

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



