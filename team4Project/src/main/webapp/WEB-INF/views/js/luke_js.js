/**
 * 首頁的Header相關元素動態控制
 */

$(document).ready(function() {
	$("#user-menu").hide();

	$("#userbox").click(function() {
		$("#user-menu").toggle();
	});


});
