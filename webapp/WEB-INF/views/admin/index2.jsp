<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- css -->
<link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="../../assets/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="../../assets/css/flexslider.css" rel="stylesheet" />
<link href="../../assets/css/style.css" rel="stylesheet" />
<link href="../../assets/css/table.css" rel="stylesheet" />
<link href="../../assets/css/map.css" rel="stylesheet" />
<link href="/assets/css/common.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/layout2.css" rel="stylesheet" type="text/css" />

<!-- Theme skin -->
<link href="../../assets/css/default.css" rel="stylesheet" />

<script src="../../assets/js/jquery.js"></script>
<script src="../../assets/js/jquery.easing.1.3.js"></script>
<script src="../../assets/js/bootstrap.min.js"></script>
<script src="../../assets/js/jquery.fancybox.pack.js"></script>
<script src="../../assets/js/jquery.fancybox-media.js"></script>
<script src="../../assets/js/google-code-prettify/prettify.js"></script>
<script src="../../assets/js/portfolio/jquery.quicksand.js"></script>
<script src="../../assets/js/portfolio/setting.js"></script>
<script src="../../assets/js/jquery.flexslider.js"></script>
<script src="../../assets/js/animate.js"></script>
<script src="../../assets/js/custom.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/js/jquery.leanModal.min.js"></script>
<meta charset="utf-8" />
<title>Daum 지도 시작하기</title>
</head>
<body>

<div id="wrapper">
	<!-- start header -->
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<!-- end header -->
	<div class="container">
	<c:import url="/WEB-INF/views/include/navigation.jsp"></c:import>
<!-- <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=bbef91da99f11fe76f4b3b523d3151e9&libraries=services"></script>
	<script>
		var places = new daum.maps.services.Places();
		var imggo;
		var callback = function(status, result) {
		    if (status === daum.maps.services.Status.OK) {
		    	console.log(result);
		        console.log(result.places[0].imageUrl);
		        imggo=result.places[0].imageUrl;
		        $('#gogogo').html('<img src="'+imggo+'">');
		    }
		};
		places.keywordSearch('판교 치킨', callback);
	</script> 
<div id="gogogo"></div>-->
	</section>
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
</div>
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
</body>
</html>