<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>商品查詢</title>
<meta charset="UTF-8">
<c:import url="/layout/head" />
<c:import url="/layout/header" />
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<c:url value='/js/bootstrap.js' />"></script>
<!-- SmartMenus jQuery plugin -->
<script type="text/javascript"
	src="<c:url value='/js/jquery.smartmenus.js' />"></script>
<!-- SmartMenus jQuery Bootstrap Addon -->
<script type="text/javascript"
	src="<c:url value='/js/jquery.smartmenus.bootstrap.js' />"></script>
<!-- To Slider JS -->
<script src="<c:url value='/js/sequence.js' />"></script>
<script src="<c:url value='/js/sequence-theme.modern-slide-in.js' />"></script>
<!-- Product view slider -->
<script type="text/javascript"
	src="<c:url value='/js/jquery.simpleGallery.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/js/jquery.simpleLens.js' />"></script>
<!-- slick slider -->
<script type="text/javascript" src="<c:url value='/js/slick.js' />"></script>
<!-- Price picker slider -->
<script type="text/javascript" src="<c:url value='/js/nouislider.js' />"></script>
<!-- Custom js -->
<script src="<c:url value='/js/custom.js' />"></script>

<script src="<c:url value='/js/luke_js.js' />"></script>
<!-- script src="https://code.jquery.com/jquery-3.5.1.min.js"></script-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script>
	
</script>

</head>

<body>
	<div style="text-align: center; background-color: white; width: 100%;">
		<div style="border:5; background-color: white; width: 800px; height: 800px; margin: 0 auto;">
			<div>
				<div style = 'padding-right :530apx'class="panel-body">
					<img src="<c:url value='/getproductimage/${product.productId}'/>"
						class="img-responsive" style=" float:left; width:700px; height: 500px">
				</div>
			</div>
	


	</div>
	</div>



</body>
<c:import url="/layout/footer" />


<!--   自定義js -->
<script type="text/javascript" src="js/Carousel.js"></script>
<script src="<c:url value='/js/luke_js.js' />"></script>

</html>