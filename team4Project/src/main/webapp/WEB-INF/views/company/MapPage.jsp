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
.mapall {
/* 	border: solid 2px gray; */
/*  	height: 550px;  */
	width: 730px;
/* 	height:calc(50vh); */
	top:500px;
/* 	margin:auto; */
	margin:0px 0px 0px 150px;
	bottom:500px;
}
/* 搜尋列 */
.map_left {
	border: solid 2px white;
	width: 250px;
	height: 500px;
	margin:15px 5px 0px 0px;
	padding-top:20px;
	padding-left:10px;
	padding-right:10px;
	background-color:#FFD382;
	color:#194866;
	border-radius: 20px;
}
/* 顯示地圖 */
.map_show {
	/* border:solid 2px gray; */
	width: 850px;
	height: 350px;
}
/* 點擊地圖標記檢視門市資訊 */
.map_info {
	border: solid 2px #C0C0C0;
	width: 850px;
	height: 145px;
	margin-top:5px;
}
/* 服務顯示依照企業Id */
ul li {
	list-style-type: none;
	margin: 0px;
}

ul {
	padding: 0px;
}
.cmpleft{
	margin-top:15px;
	display:block;
}
.title-bar {
          clear: both;
          padding: 10px;
        }
</style>
</head>
 <c:import url="/layout/head" />
<c:import url="/layout/header" />
<body>
	<script src="https://code.jquery.com/jquery-3.3.1.js"
		data-integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		data-crossorigin="anonymous"></script>
		<div class="title-bar">
            <div class="title-bar" style="text-align: center;line-height:60px;height:60px;background-color:#FFD382;width:300px;padding:10px;margin:5px auto;border-radius:30px" >
                <h2 style="color: #194866;font-weight:bolder">門市查詢</h2>
            </div>

        </div>
	<div class="mapall">
	<div>
		<table>
			<td>
				<!-- 左測搜尋欄 -->
				<div class="map_left" style="margin-bottom: 50px">
					<div style="margin-bottom: 20px">
						企業&nbsp;&nbsp;&nbsp; <select id="cmpChange" style="color:#003D79;width:150px">
							<option value="0" selected = "selected">請挑選</option>
							<option value="1">全家</option>
							<option value="2">萊爾富</option>
							<option value="3">統一超商</option>
							<option value="4">全聯福利中心</option>
						</select>
					</div>
					<div style="margin-bottom: 20px">
						地區&nbsp;&nbsp;&nbsp; <select id="areaChange" style="color:#003D79;width:150px">
							<option value="0" selected = "selected">請挑選</option>
							<option value="北區">北區</option>
							<option value="中區">中區</option>
							<option value="南區">南區</option>

						</select>
					</div>
					
					<div style="margin-bottom: 20px">
						店名 &nbsp;&nbsp;&nbsp;<input type="text" id="stoName" style="color:#003D79;height:30px;width:120px">
						<button id="stoSearch" class="btn btn-primary" style="float:right">搜尋</button>
					</div>
					<div>
						服務
						<div>
							<ul class="sevicelist">
<!-- 								<li><input type="checkbox" name="" id=""> <span><img -->
<!-- 										height="20px" width="20px" src="" /></span> 廁所</li> -->
<!-- 								<li><input type="checkbox" name="" id=""> <span><img -->
<!-- 										height="20px" width="20px" src="" /></span> ATM</li> -->
<!-- 								<li><input type="checkbox" name="" id=""> <span><img -->
<!-- 										height="20px" width="20px" src="" /></span> 停車場</li> -->
<!-- 								<button id="svidSearch">搜尋</button> -->
							</ul>

						</div>

					</div>

				</div>
			</td>
			<!-- 右側地圖部分 -->

			<td class="cmpleft">
				<div id="map" class="map_show" style="margin:10px 0px 10px 30px;border-radius: 5px">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d28918.428460427356!2d121.53965200064644!3d25.040739817517917!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346823c1920a1b7f%3A0x6502863b00922978!2zVGliYU1lIOaZuuaFp0FQUOaVtOWQiOmWi-eZvOmkiuaIkOePrSjlj7DljJcp!5e0!3m2!1szh-TW!2stw!4v1611813135444!5m2!1szh-TW!2stw"
						width="450" height="390" frameborder="0" style="border: 0px;"
						allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
				</div>
				<div class="map_info" style="overflow: scroll;margin:10px 0px 50px 30px;border-radius: 5px">
<!-- 					統一超商 7-11 大安店(顯示門市資訊)<br> <span><img height="20px" -->
<!-- 						width="20px" src="" /></span> <span><img height="20px" -->
<!-- 						width="20px" src="" /></span> <span><img height="20px" -->
<!-- 						width="20px" src="" /></span>(服務)<br> 門店簡介:<br> -->
<!-- 					<div>源自日本的全家便利商店，秉持「顧客滿意，共同成長」的理念經營事業，在地深耕。 -->
<!-- 						自1988年全家在台灣開出第一家店開始，面對台灣零售業競爭激烈，「全家」將敢變的精神融入企業文化，不論是在企業管理流程、服務、商品、或是創新及新科技的運用上，皆勇於創新並重視落地實踐，30年來「全家」持續創造與市場的差異化，引領零售業的革新風潮。 -->
<!-- 					</div> -->
				</div>
			</td>

		</table>
	</div>
	</div>
	<script>
	//=====================================================================================
	//地圖程式碼
	//=====================================================================================
	     markers = [];
	
		function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 25.0248769, lng: 121.5260833 },
                zoom: 8,
                mapTypeControl: false,
                fullscreenControl: false,
                zoomControlOptions: { position: google.maps.ControlPosition.RIGHT_BOTTOM },
                streetViewControl: false,
                scrollwheel: true,
                draggable: true,
            });


        }

        //加地圖標記
        function addMarker(e) {
            setTimeout(function () {
                var marker_inf = new google.maps.Marker({
                    position: {
                        lat: position[e].lat,
                        lng: position[e].lng
                    },
                    map: map,
                    animation: google.maps.Animation.DROP
                })
                console.log("addMarker");
                //設置每個marker_inf的監聽器
                marker_inf.addListener('click', function () {
                    console.log("listen")
                    console.log(JSON.stringify(marker_inf.getPosition()))
                    console.log((marker_inf.getPosition()).toString())
                    $.ajax({
                        type: "GET",
                        url: "<c:url value='/company/mapGetStoreByMarker' />",
                        dataType: "json",
                        data: { "lat": marker_inf.getPosition().lat,"lng": marker_inf.getPosition().lng },
                        success: function (data) {
                            $(".map_info").html("")

                            //顯示marker查出來的企業資訊
                            $(".map_info").append(` ` + data.storeName + `<br>
                            
                            電話:`+data.phone+`<br>`)
                            
                            for (var i = 0; i < data.svid.length; i++) {
                        $(".map_info").append(`
                        		<span><img height="20px" width="20px" src="<c:url value='/company/getCompanyServiceImage/`+data.svid[i]+`' />" /></span>
                            	
                		`)
                    }
                            
                            
                            if(data.businessHour){
                            	$(".map_info").append(`
                                		<br>營業時間:24hr
                                    	
                        		`)
                            }else{
                            	$(".map_info").append(`
                                		<br>營業時間:`+data.openhour+`~`+data.closehour+`
                                    	
                        		`)
                            }
                            
                            
                            
                            
                           
                            
                            $(".map_info").append(`<br>地址:`+data.storeAddress+`<br>
                            門店簡介:<br>
                            <div>
                                `+ data.profiles + `
                            </div>
                		    `)

                            console.log(data)
                        }
                    });

                });
                markers.push(marker_inf);
            }, e * 150);
        }
        
        //寫偵測select onchange 執行go
        function go() {
            clearMarkers();
            for (var i = 0; i < position.length; i++) {
                addMarker(i);
            }
            console.log(position,markers)
        }

        function clearMarkers() {
        	console.log("clear markers",markers.length,markers)
        	
            for (var i = 0; i < markers.length; i++) {
            	console.log("markers[i]",markers[i])
                if (markers[i]) {
                    markers[i].setMap(null);
                }
            }
            markers = [];
        }
	
        //取lat中間值
        function Averagelat(){
            var avglat = 0,totalAmount = 0;
            for (var i = 0; i < position.length; i++) {
            	if (position[i].lng != null){
            		totalAmount++;
            		avglat += position[i].lat
            	}
                
            }
            return fix((avglat/totalAmount), 6);
            //return (avglat/position.length);
        }
        //取lng中間值
        function Averagelng(){
            var avglng = 0,totalAmount = 0;
            for (var i = 0; i < position.length; i++) {
            	if (position[i].lng != null){
            		totalAmount++;
            		avglng += position[i].lng
            	}
                
            }
            return fix((avglng/totalAmount), 6);
            //return (avglng/position.length);
        }
        function fix(num, N) {
        	var base = Math.pow(10, N);
        	return Math.round(num * base) / base;
        	}
        
	//=====================================================================================
	//搜尋欄變更
	//=====================================================================================
        //名字查詢
        $("#stoSearch").click(function () {
            var stoName = $("#stoName").val();
            var cmpid = $("#cmpChange").val();
            console.log(stoName);
            $.ajax({
                type: "GET",
                url: "<c:url value='/company/mapGetStoreByName/" + cmpid + "/" + stoName + "' />",
                dataType: "json",
                success: function (data) {
                    //設置Marker參數
                    position = data;
                    map.setCenter({lat:Averagelat(),lng:Averagelng()});
                    go();
                    

                    console.log(data)
                }
            });
        });

        //按區域搜尋(後端if(cmpid == 0){查全部})
        $("#areaChange").on("change", function () {
            var area = $("#areaChange").val();
            var cmpid = $("#cmpChange").val();
            $.ajax({
                type: "GET",
                url: "<c:url value='/company/mapGetStoreByArea/" + cmpid + "/" + area + "' />",
                dataType: "json",
                success: function (data) {
                    //設置Marker參數
                    position = data;
                    map.setCenter({lat:Averagelat(),lng:Averagelng()});

                    go();

                    console.log(data);
                }
            });
        });

		//企業變更搜尋服務and全部store
        $("#cmpChange").on("change", function () {
            
            var area = $("#areaChange").val();
            var v = $("#cmpChange").val();
            $.ajax({
                type: "GET",
                url: "<c:url value='/company/testAjax' />",
                data: { "test": v },
                success: function (data) {
                    $(".sevicelist").html("")

                    for (var i = 0; i < data.length; i++) {
                        $(".sevicelist").append(`
                				<li>
                                <input type="checkbox" name="service" value="`+ data[i].id + `" >
                                <span><img height="20px" width="20px" src="<c:url value='/company/getCompanyServiceImage/`+ data[i].id + `' />" /></span>
                                `+ data[i].spService + `
                            	</li>
                            	
                		`)
                    }
                    $(".sevicelist").append(`

                    		<button id="svidSearch" class="btn btn-primary" style="float:right;margin-top:5px">搜尋</button>
                    `)
                    console.log(data);
                }
            });

            $.ajax({
                type: "GET",
                url: "<c:url value='/company/mapGetStoreByArea/" + v + "/" + area + "' />",
                dataType: "json",
                success: function (data) {
                    //設置Marker參數
                    position = data;
                    console.log("選企業回傳AJAX")
                    
                    map.setCenter({lat:Averagelat(),lng:Averagelng()})
                    console.log(Averagelat(),Averagelng())
                    go();

                    console.log(data);
                }
            });



        });
      //服務搜尋(id查詢)
        $(".sevicelist").on("click","#svidSearch",function () {
			
           
            var svId = [];
            $("input[name='service']:checked").each(function (i) {
                svId[i] = $(this).val();
            });
			console.log("服務查詢"+svId);
            $.ajax(
                {
                    data: { 'svId': svId },
                    dataType: 'json',
                    success: function (data) {
                        //設置Marker參數
                        position = data;
                        map.setCenter({lat:Averagelat(),lng:Averagelng()});
                        go();
                    },
                    type: 'post',
                    url: "<c:url value='/company/mapGetStoreByService' />",
                    traditional: true
                }
            );


        })
        
        //服務搜尋(id查詢)
//         $(".svidSearch").click(function () {
// 			console.log("服務搜尋")
//            
//             var svId = [];
//             $("input[name='checkbox']:checked").each(function (i) {
//                 svId[i] = $(this).val();
//             });

//             $.ajax(
//                 {
//                     data: { 'svId': svId },
//                     dataType: 'text',
//                     success: function (data) {
//                         //設置Marker參數
//                         position = data;
//                         map.setCenter({lat:Averagelat(),lng:Averagelng()});
//                         go();
//                     },
//                     type: 'post',
//                     url: "<c:url value='/company/mapGetStoreByService' />",
//                     traditional: true
//                 }
//             );


//         });
//不用加了
// 	$(document).ready(function() {

//     });
    </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnY8qwXMnZl1DtF0cYvNfhd2gCcWuWbbo&callback=initMap"
		async defer></script>
<c:import url="/layout/footer" />
</body>
</html>