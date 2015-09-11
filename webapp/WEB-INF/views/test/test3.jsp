<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/js/jquery.leanModal.min.js"></script>
<script type="text/javascript"	src="//apis.daum.net/maps/maps3.js?apikey=bbef91da99f11fe76f4b3b523d3151e9"></script>

<link href="/assets/css/common.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/layout2.css" rel="stylesheet" type="text/css" />
<link href="../../assets/css/map.css" rel="stylesheet" />
<script type="text/javascript">
$(function(){
  $('#testModal').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
});
</script>
<script>
		var mapContainer = document.getElementById('map'),
		mapOption = {
			center : new daum.maps.LatLng(37.5665350, 126.9779690),
			level : 3
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); 
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="map"></div>
<a href="#test3" id="testModal">모달클릭</a>

<div id="test3" style="display:none"></div>

</body>
</html>