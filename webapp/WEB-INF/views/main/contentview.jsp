<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>오늘 뭐하지?</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://bootstraptaste.com" />

<!--css -->
<link href="/assets/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/common.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/layout2.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="/assets/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="/assets/css/jcarousel.css" rel="stylesheet" />
<link href="/assets/css/flexslider.css" rel="stylesheet" />
<link href="/assets/css/style.css" rel="stylesheet" />
<link href="/assets/css/common.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/layout2.css" rel="stylesheet" type="text/css" />

<!--javascript -->
<script type="text/javascript" src="/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/js/jquery.leanModal.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/assets/js/jquery.js"></script>
<script src="/assets/js/jquery.easing.1.3.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/jquery.fancybox.pack.js"></script>
<script src="/assets/js/jquery.fancybox-media.js"></script>
<script src="/assets/js/google-code-prettify/prettify.js"></script>
<script src="/assets/js/portfolio/jquery.quicksand.js"></script>
<script src="/assets/js/portfolio/setting.js"></script>
<script src="/assets/js/jquery.flexslider.js"></script>
<script src="/assets/js/animate.js"></script>
<script src="/assets/js/custom.js"></script> 
<script type="text/javascript" src="/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/js/jquery.leanModal.min.js"></script>


<!-- Theme skin -->
<link href="../../assets/css/default.css" rel="stylesheet" />

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->



</head>
<body>
<div id="wrapper">
	<!-- start header -->
		<c:import url="/WEB-INF/views/include/header.jsp"/> 
	<!-- end header -->
	
	<section id="featured">
	<!-- start slider -->
	<div class="container">
		<div class="row">

		</div>
	</div>	
	</section>
	<section id="content">
	<div class="container">
		
		<div>
		<form method="post" action="/commentwrite">
		<table>
			<tr>
				<td><img src="${contentVo.imageUrl }"></td>
				<td>
					<div>Category : ${contentVo.category }</div>
					<div>title : ${contentVo.title }</div>
					<div>address : ${contentVo.address }</div>
					<div>phone : ${contentVo.phone }</div>
					<input type="hidden" name="member_no" value="${authUser.member_no }">
					<input type="hidden" name="content_no" value="${contentVo.content_no }">
				</td>
			</tr>
			<tr>
				<td><div id="staticMap" style="width:1000px;height:350px;"></div> </td>
			</tr>
			<tr>
				<td><input type="text" name="message"></td>
				<td>${authUser.memberName }</td>
				<td><input type="submit" value="덧글등록"></td>
			</tr>
		</table>
		</form>


		<c:forEach var="vo" items="${list2}" varStatus="status">
		<c:if test="${contentVo.content_no eq vo.content_no }">
		<table>
			<tr>
				<td>${vo.message }</td>
				<td>${vo.member_no }</td>
				<td>${vo.regDate }</td>
		<c:choose>
		<c:when test="${authUser.member_no == vo.member_no }">
				<td><a href="/commentdelete?content_no=${contentVo.content_no }">삭제</a></td>
		</c:when>
		<c:otherwise>
		</c:otherwise>
		</c:choose>
			</tr>
		</table>
		</c:if>
		</c:forEach>


			</div>
	</div>
</div>

	</section>
	 <c:import url="/WEB-INF/views/include/footer.jsp"></c:import> 

<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>


<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=bbef91da99f11fe76f4b3b523d3151e9&libraries=services"></script>
<script>
var query = window.location.search.substring(1);
var cnt_no = query.split("=");
var content_no = cnt_no[1];
var lat ;
var lng;
$.ajax({
	type : 'get',
    url:'/getContent',
    data : {
    		content_no : content_no
    },
    dataType:'json',
    success: function(response){
    	lat = response.latitude;
    	lng = response.longitude;
    	
    	 var mapContainer = document.getElementById('staticMap'), 
 		mapOption = {
 			center : new daum.maps.LatLng(lat, lng), 
 			level : 3
 		// 지도의 확대 레벨
 		};
 		var map = new daum.maps.Map(mapContainer, mapOption);
 			var marker = new daum.maps.Marker({
 				position : new daum.maps.LatLng(lat, lng)
 			});
 			marker.setMap(map);
    } 
 })
 

// 이미지 지도를 생성합니다
</script>


<!-- javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/assets/js/jquery.js"></script>
<script src="/assets/js/jquery.easing.1.3.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/jquery.fancybox.pack.js"></script>
<script src="/assets/js/jquery.fancybox-media.js"></script>
<script src="/assets/js/google-code-prettify/prettify.js"></script>
<script src="/assets/js/portfolio/jquery.quicksand.js"></script>
<script src="/assets/js/portfolio/setting.js"></script>
<script src="/assets/js/jquery.flexslider.js"></script>
<script src="/assets/js/animate.js"></script>
<script src="/assets/js/custom.js"></script>
<script type="text/javascript" src="/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/js/jquery.leanModal.min.js"></script>
</body>
</html>