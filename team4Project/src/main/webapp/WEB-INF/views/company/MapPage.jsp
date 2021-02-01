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
	margin:auto;
	bottom:500px;
}
/* 搜尋列 */
.map_left {
	border: solid 2px gray;
	width: 250px;
	height: 530px;
}
/* 顯示地圖 */
.map_show {
	/* border:solid 2px gray; */
	width: 450px;
	height: 390px;
}
/* 點擊地圖標記檢視門市資訊 */
.map_info {
	border: solid 2px gray;
	width: 450px;
	height: 150px;
}
/* 服務顯示依照企業Id */
ul li {
	list-style-type: none;
	margin: 0px;
}

ul {
	padding: 0px;
}
</style>
</head>
 <c:import url="/layout/head" />
<c:import url="/layout/header" />
<body>
	<script src="https://code.jquery.com/jquery-3.3.1.js"
		data-integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		data-crossorigin="anonymous"></script>
	<div class="mapall">
		<table>
			<td>
				<!-- 左測搜尋欄 -->
				<div class="map_left">
					<div>
						企業 <select id="cmpChange">
							<option value="0" selected = "selected">請挑選</option>
							<option value="1">全家</option>
							<option value="2">萊爾富</option>
							<option value="3">統一超商</option>
							<option value="4">全聯福利中心</option>
						</select>
					</div>
					<div>
						店名 <input type="text" id="stoName">
						<button id="stoSearch">搜尋</button>
					</div>
					<div>
						地區 <select id="areaChange">
							<option value="0" selected = "selected">請挑選</option>
							<option value="北區">北區</option>
							<option value="中區">中區</option>
							<option value="南區">南區</option>

						</select>
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
<!-- 								<button id="svSearch">搜尋</button> -->
							</ul>

						</div>

					</div>

				</div>
			</td>
			<!-- 右側地圖部分 -->

			<td>
				<div id="map" class="map_show">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d28918.428460427356!2d121.53965200064644!3d25.040739817517917!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346823c1920a1b7f%3A0x6502863b00922978!2zVGliYU1lIOaZuuaFp0FQUOaVtOWQiOmWi-eZvOmkiuaIkOePrSjlj7DljJcp!5e0!3m2!1szh-TW!2stw!4v1611813135444!5m2!1szh-TW!2stw"
						width="450" height="390" frameborder="0" style="border: 0;"
						allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
				</div>
				<div class="map_info" style="overflow: scroll;">
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
                            <span><img height="20px" width="20px" src="" /></span>
                            <span><img height="20px" width="20px" src="" /></span>
                            <span><img height="20px" width="20px" src="" /></span>(服務)<br>
                            電話:`+data.phone+`<br>
                            地址:`+data.storeAddress+`<br>
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
            console.log(stoName)
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

        //服務搜尋(id查詢)
        $("#svSearch").click(function () {
            alert($("#cmpChange").val());
			console.log("服務搜尋")
            var svId = [];
            $("input[name='checkbox']:checked").each(function (i) {
                svId[i] = $(this).val();
            });

            $.ajax(
                {
                    data: { 'svId': svId },
                    dataType: 'text',
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

                    console.log(data)
                }
            });
        });

		//企業變更搜尋服務and全部store
        $("#cmpChange").on("change", function () {
            alert($("#cmpChange").val());
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
                                <input type="checkbox" name="" id="`+ data[i].id + `" >
                                <span><img height="20px" width="20px" src="<c:url value='/company/getCompanyServiceImage/`+ data[i].id + `' />" /></span>
                                `+ data[i].spService + `
                            	</li>
                            	
                		`)
                    }
                    $(".sevicelist").append(`
                    		<button id="svSearch">搜尋</button>
                    `)
                    console.log(data)
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

                    console.log(data)
                }
            });



        });

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