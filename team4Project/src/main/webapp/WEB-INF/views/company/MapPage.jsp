<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>地圖查詢頁面</title>
    <style>
        /* 地圖大框框 */
        .mapall{
            border:solid 2px gray;
            height:550px;
            width:730px;
        }
        /* 搜尋列 */
        .map_left{
            border:solid 2px gray;
            width:250px;
            height:530px;
        }
        /* 顯示地圖 */
        .map_show{
            /* border:solid 2px gray; */
            width:450px;
            height:390px;
            
        }
        /* 點擊地圖標記檢視門市資訊 */
        .map_info{
            border:solid 2px gray;
            width:450px;
            height:150px;
        }
        /* 服務顯示依照企業Id */
        ul li{
            list-style-type:none;
            margin:0px;
        }
        ul{
            padding:0px;
        }
    </style>
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.3.1.js"
        data-integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        data-crossorigin="anonymous"></script>
    <div class="mapall">
        <table>
            <td>
                <!-- 左測搜尋欄 -->
                <div class="map_left">
                    <div>企業
                        <select id="cmpchange">
                            <option value="1">全家</option>
                            <option value="2">萊爾富</option>
                            <option value="3">統一超商</option>
                            <option value="4">全聯福利中心</option>
                        </select>
                    </div>
                    <div>店名
                        <input type="text"><button>搜尋</button>
                    </div>
                    <div>地區
                        <select  onchange="getAreaval(this);">
                            <option value="up">北區</option>
                            <option value="mid">中區</option>
                            <option value="down">南區</option>
                            
                        </select>
                    </div>
                    <div>服務
                        <div >
                        <ul class="sevicelist">
                            <li>
                                <input type="checkbox" name="" id="" >
                                <span><img height="20px" width="20px" src="" /></span>
                                廁所
                            </li>
                            <li>
                                <input type="checkbox" name="" id="" >
                                <span><img height="20px" width="20px" src="" /></span>
                                ATM
                            </li>
                            <li>
                                <input type="checkbox" name="" id="" >
                                <span><img height="20px" width="20px" src="" /></span>
                                停車場
                            </li>
                            <button>搜尋</button>
                        </ul>
                        
                        </div>
                        
                    </div>

                </div>
            </td>
            <!-- 右側地圖部分 -->

            <td>
                <div id="map" class="map_show">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d28918.428460427356!2d121.53965200064644!3d25.040739817517917!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346823c1920a1b7f%3A0x6502863b00922978!2zVGliYU1lIOaZuuaFp0FQUOaVtOWQiOmWi-eZvOmkiuaIkOePrSjlj7DljJcp!5e0!3m2!1szh-TW!2stw!4v1611813135444!5m2!1szh-TW!2stw" width="450" height="390" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                </div>
                <div class="map_info" style="overflow: scroll;">
                    統一超商 7-11 大安店(顯示門市資訊)<br>
                    <span><img height="20px" width="20px" src="" /></span>
                    <span><img height="20px" width="20px" src="" /></span>
                    <span><img height="20px" width="20px" src="" /></span>(服務)<br>
                    門店簡介:<br>
                    <div>
                        源自日本的全家便利商店，秉持「顧客滿意，共同成長」的理念經營事業，在地深耕。
                        自1988年全家在台灣開出第一家店開始，面對台灣零售業競爭激烈，「全家」將敢變的精神融入企業文化，不論是在企業管理流程、服務、商品、或是創新及新科技的運用上，皆勇於創新並重視落地實踐，30年來「全家」持續創造與市場的差異化，引領零售業的革新風潮。
                    </div>
                </div>
            </td>

        </table>
    </div>
    <button id="test">測試</button>
    <div id="result"></div>
   
    <script>

   
        // 寫jQuery跟Ajax
//=============================搜尋列變更================================
// 寫企業變更時取的的value




//取得地區value
function getAreaval(cmp)
{
    alert(cmp.value);
}
//=============================搜尋列變更================================

//測試=================================================================
$("#cmpchange").on("change", function() { 
            alert($("#cmpchange").val());
            var v = $("#cmpchange").val();
            $.ajax({ 
                type: "POST", 
                url: "<c:url value='/company/testAjax' />", 
                data: {"test" : v }, 
                success: function(data){ 
                	$(".sevicelist").html("")
                	
                	for(var i=0;i<data.length;i++){
                		$(".sevicelist").append(`
                				<li>
                                <input type="checkbox" name="" id="`+data[i].id+`" >
                                <span><img height="20px" width="20px" src="" /></span>
                                `+data[i].spService+`
                            	</li>
                		`)
                	}
            
                    console.log(data)
                }
               }); 

        } );
//測試=================================================================


// $("#test").click(function(){
//     $.ajax({ 
//        type: "POST", 
//        url: "<c:url value='/company/testAjax' />", 
//        data: {"test" : "1"}, 
//        success: function(data){ 
//            $("#result").append(data.companyName)
//            console.log(data)
//         // <c:forEach items="${Cards}" var="c"> 
//         //  $(".rightWrapperDisplaySearch").append(${c.color}); 
//         // </c:forEach>  
//        }, 
//        error : function() { 
//         Announce("Error!");  
//        }, 
//       }); 
    
// })


//不用加了
// 	$(document).ready(function() {

//     });
    </script>

</body>
</html>