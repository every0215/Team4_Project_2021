<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>有關GOOGLE API大小事</title>
<link rel="stylesheet"
 href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
 <script
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBSAzVL_iu7GLMHmoCb5I8qeXVlFtJlCQQ"></script>

 <div>
  <input type="button" value="Go Somewhere Else"
   onclick="location.href='insertlatLan'" /><br>

  <c:forEach var="mapPB" items='${mapPB }'>

   <c:set var="pla_name" value="${mapPB.value}"></c:set>
   <c:out value="${mapPB.value}" />
   <br>
   <script>
   var pla_no = parseInt('${mapPB.key}')
   var pla_name = '${mapPB.value}'
   console.log('${mapPB.key}'j)
   var geocoder = new google.maps.Geocoder();
   geocoder.geocode( { 'address': '${mapPB.value}'}, function(results, status) {
      if (status == 'OK') {
       var latitude = results[0].geometry.location.lat(); 
       var longitude = results[0].geometry.location.lng();
       console.log('${mapPB.value}'+"的經度為"+latitude)
       console.log('${mapPB.value}'+"的緯度為"+longitude)
       $.ajax({
       type : 'post',
       url : 'insertlatLan',
       data : {
        pla_lan : latitude,
        pla_lnt : longitude,
        pla_no : ${mapPB.key},
        
       }
      });
      } else {
        // 若轉換失敗...
        console.log(status)
      }
    });
    
 
 </script>
 
  </c:forEach>
  </div>

</body>
</html>