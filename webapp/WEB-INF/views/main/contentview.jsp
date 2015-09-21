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
		
		<div style="margin:0">
		<form method="post" action="/commentwrite">
			<img src="${contentVo.imageUrl }" style="width:300px;padding:0px;border:solid 1px #e1e1e1;float:left;margin-bottom:20px">
			<div style="font-size:15px;float:left;width:830px;margin-left:30px;margin-top:20px;">
					<h4>title : ${contentVo.title }</h4>
					<div style="margin-top:10px">Category : ${contentVo.category }</div>
					<div style="margin-top:10px">address : ${contentVo.address }</div>
					<div style="margin-top:10px">phone : ${contentVo.phone }</div>
					<div style="margin-top:10px">cost : ${contentVo.cost }</div>
					<div style="margin-top:10px">time : ${contentVo.time }</div>
					<input type="hidden" name="member_no" value="${authUser.member_no }">
					<input type="hidden" name="content_no" value="${contentVo.content_no }">
					<a href="javascript:likegg(${contentVo.content_no },${authUser.member_no })">♥좋아요${good}</a>
			</div>
				<div id="staticMap" style="width:1170px;height:350px;margin-top:60px"></div> 
				<h4 style="margin-top:40px">댓글</h4>
			<div style="margin-top:10px">
			<table style="margin-left:0">
			<tr>
				<td style="width:85%"><input type="text" name="message" maxlength="135" size="155"  ></td>
				<td style="width:9%"><input type="text" value="${authUser.memberName }" size="10"></td>
				<td style="width:6%"><input type="submit" value="덧글등록"></td>
			</tr>
			</table>
			</div>	
		</form>

<!-- 덧글 리스트 -->

		<table style="margin-top:20px;font-size:15px;border:1px solid #e1e1e1">
		<tr>
			<th style="width:69%">댓글</th>
			<th style="width:8%">이름</th>
			<th style="width:15%">날짜</th>
			<th style="width:8%">삭제</th>
		</tr>
		<c:forEach var="vo" items="${commentsList}" varStatus="status">
		<c:if test="${contentVo.content_no eq vo.content_no }">
			<tr>
				<td>${vo.message }</td>
				<td>${vo.member_no }</td>
				<td>${vo.regDate }</td>
		<c:choose>
		<c:when test="${authUser.member_no == vo.member_no }">
				<td><a href="/commentdelete?content_no=${contentVo.content_no }">삭제</a></td>
		</c:when>
		<c:otherwise>
				<td></td>
		</c:otherwise>
		</c:choose>
			</tr>
					</c:if>
		</c:forEach>
			
		</table>

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
<script>
function likegg( content_no, member_no){
	$.ajax({
		type : 'get',
	    url:'/like',
	    data : {
	    		content_no : content_no,
	    		member_no : member_no
	    },
	    dataType:'json',
	    success: function(){
	    },
})
}
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