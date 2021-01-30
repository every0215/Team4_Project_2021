<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Start Account Menu section -->
<!-- <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i> -->
<div class="menu-list">

	<ul id="menu-content" class="menu-content">
		<li><a href="#"> <i class="fa fa-dashboard fa-lg"></i>
				<b>Dashboard</b>
		</a></li>
		<li data-toggle="collapse" data-target="#myProfile"
			class="collapsed active"><a href="<c:url value='/member/myProfile' />"><i
				class="fa fa-gift fa-lg"></i><b>個人資料</b></a>
		</li>
		<li data-toggle="collapse" data-target="#myWallet"
			class="collapsed"><a href="<c:url value='/member/myWallet' />"><i
				class="fa fa-gift fa-lg"></i><b>我的錢包</b></a>
		</li>

<!-- 		<ul class="sub-menu collapse" id="products"> -->
<!-- 			<li class="active"><a href="#">CSS3 Animation</a></li> -->
<!-- 			<li><a href="#">General</a></li> -->
<!-- 			<li><a href="#">Buttons</a></li> -->
<!-- 			<li><a href="#">Tabs & Accordions</a></li> -->
<!-- 			<li><a href="#">Typography</a></li> -->
<!-- 			<li><a href="#">FontAwesome</a></li> -->
<!-- 			<li><a href="#">Slider</a></li> -->
<!-- 			<li><a href="#">Panels</a></li> -->
<!-- 			<li><a href="#">Widgets</a></li> -->
<!-- 			<li><a href="#">Bootstrap Model</a></li> -->
<!-- 		</ul> -->
		<li data-toggle="collapse" data-target="#creditCard" class="collapsed">
			<a href="<c:url value='/member/creditCard' />"><i class="fa fa-car fa-lg"></i><b>信用卡管理</b></a>
		</li>
		<li data-toggle="collapse" data-target="#creditCard" class="collapsed">
			<a href="<c:url value='/member/subscription' />"><i class="fa fa-car fa-lg"></i><b>訂閱管理</b></a>
		</li>
		
		<li data-toggle="collapse" data-target="#changePassword" class="collapsed">
			<a href="<c:url value='/member/changePassword' />" ><i class="fa fa-globe fa-lg"></i><b>密碼變更</b></a>
		</li>

		<li><a href="<c:url value='/data/CreateMember' />"> <i class="fa fa-user fa-lg"></i><b>Gen會員資料</b>
		</a></li>

	</ul>
	<a href="<c:url value='/admin/memberManage' />" style="color: #fff; "><b>MemberManage</b>
		</a>
</div>