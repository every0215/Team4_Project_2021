/**
 * 首頁的Header相關元素動態控制
 */

$(document).ready(function() {
	$("#user-menu").hide();
	$("#UserNotificationBox").hide();
	
	$("#userbox").click(function() {
		$("#user-menu").toggle();
	});

	$("#UserNotification").click(function() {
		$("#UserNotificationBox").toggle();
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



