<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
        #rep_advertising {
            float: right;
            margin: 10px 100px 0px 0px;
            border-radius: 10px 10px 0px 0px;
            position: fixed;
   			right: 10px;
    		top: 80px;
     		background-color:  hsl(0deg 0% 100% / 80%); 
    		z-index: 10000;
        }
        
        #rep_adv_title {
            display: block;
            border-radius: 10px 10px 0px 0px;
            background-color: rgb(116, 109, 106);
            color: cornsilk;
            padding: 5px 0px 5px 0px;
            text-align: center;
        }
        
        #rep_adv_div {
            width: 250px;
            overflow: hidden;
        }
        
        #rep_adv_ul li {
            height: 120px;
        }
        
        #rep_adv_ul img {
            width: 110px;
            float: right;
             padding-right:5px;
        }
        
        #rep_adv_1 {
            column-count: 2;
        }
        
        .rep_adv_li_b1 {
            float: left;
            width: 80px;
            padding-left:5px;
            font-size: 15px;
        }
        
        .rep_adv_li_b2 {
            float: left;
            color: darkolivegreen;
            font-size: smaller;
             padding-left:5px;
             font-size: 12px;
        }
        
        .rep_adv_li_b3 {
            color: red;
            float: left;
            font-size: 14px;
             padding-left:5px;
        }
    </style>
</head>
<body>
    <div id="rep_advertising" >
        <!-- title -->
        <div id="rep_adv_title">
            <b style="font-size: 20px;">精選商品</b>

        </div>
        <!-- content -->
        <div id="rep_adv_div">
            <ul id="rep_adv_ul">
            	<div style='float:right;font-size:10px;' onclick='document.getElementById("rep_advertising").remove();'>關閉X </div>
            	<br>
                <li id="rep_adv_1">
                    <b class="rep_adv_li_b1">九福葡萄芝麻沙琪瑪</b>
                    <b class="rep_adv_li_b2">春節必備品,特價優惠中</b>
                    <strong class="rep_adv_li_b3">NT $59</strong>
                    <img src="img/report/63746.jpg">
                </li>

                <li id="rep_adv_1">
                    <b class="rep_adv_li_b1">白蘭 強效潔淨洗衣粉</b>
                    <b class="rep_adv_li_b2">春節大掃除,一箱四入裝</b>
                    <strong class="rep_adv_li_b3">NT $546</strong>
                    <img src="img/report/66300.jpg">
                </li>
                <li id="rep_adv_1">
                    <b class="rep_adv_li_b1">桂格養氣人蔘雞精禮盒</b>
                    <b class="rep_adv_li_b2">春節禮盒68mlx8</b>
                    <strong class="rep_adv_li_b3">NT $385</strong>
                    <img src="img/report/70000.jpg">
                </li>
                <li id="rep_adv_1">
                    <b class="rep_adv_li_b1">得意抽取式花紋衛生紙</b>
                    <b class="rep_adv_li_b2">好神限定版100抽*12包</b>
                    <strong class="rep_adv_li_b3">NT $1125</strong>
                    <img src="img/report/634088.jpg">
                </li>
                <li id="rep_adv_1">
                    <b class="rep_adv_li_b1">滿意寶寶乾爽紙尿褲L</b>
                    <b class="rep_adv_li_b2">讓寶寶也快樂50片x4包</b>
                    <strong class="rep_adv_li_b3">NT $1476</strong>
                    <img src="img/report/2409220.jpg">
                </li>
        </div>

    </div>
</body>
</html>