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
					
					<h4 style="float:left">title : ${contentVo.title }</h4><img style="width:30px;margin:-2px 0 0 10px" src="/assets/img/like2.jpg"><span style="margin-left:-12px;color:#fff;font-weight:bold">${good }</span>
					<div style="margin-top:10px">Category : ${contentVo.category }</div>
					<div style="margin-top:10px">address : ${contentVo.address }</div>
					<div style="margin-top:10px">phone : ${contentVo.phone }</div>
					<div style="margin-top:10px">cost : ${contentVo.cost }</div>
					<div style="margin-top:10px">time : ${contentVo.time }</div>
					<input type="hidden" name="member_no" value="${authUser.member_no }">
					<input type="hidden" name="content_no" value="${contentVo.content_no }">
<!-- 좋아요 -->
					<a href="javascript:likeCon(${contentVo.content_no },${authUser.member_no })" ><img src="/assets/img/like.jpg" style="width:70px;margin:10px 0 0 -5px"></a>
<!-- 찜하기 -->
					<a href="/jjim" ><img src="/assets/img/jjim.jpg" style="width:70px;margin:10px 0 0 10px"></a>
			</div>
				<div id="staticMap" style="width:1170px;height:350px;margin-top:60px"></div>
<!-- 댓글 -->
			<div style="width:1000px;margin:auto;border:solid 2px #FDB7C8;padding:15px;margin-top:20px;margin-bottom:20px">
				<c:choose>
				<c:when test="${empty authUser }">
				<span style="font-weight:bold">비회원</span>
				</c:when>
				<c:otherwise>
				<span style="font-weight:bold">${authUser.memberName }</span>
				</c:otherwise>
				</c:choose>
				<span style="margin-left:15px"><textarea name="message" cols=132 rows=3></textarea></span>
				<span style="margin-left:20px"><input style="width:60px;height:60px" type="submit" value="덧글등록"></span>
			</div>	
		</form>

<!-- 덧글 리스트 -->
		
		<c:forEach var="vo" items="${commentsList}" varStatus="status">
		<c:if test="${contentVo.content_no eq vo.content_no }">
		<div style="width:1000px;margin:auto;border:solid 1px #FDB7C8;padding:15px;font-size:15px;margin-top:10px">
			<span>${vo.message }</span>
		<c:choose>
		<c:when test="${authUser.member_no == vo.member_no }">
			<span style="float:right;width:30px"><a href="/commentdelete?comments_no=${vo.comments_no }">삭제</a></span>
		</c:when>
		<c:otherwise>
			<span style="float:right;width:30px"></span>
		</c:otherwise>
		</c:choose>
			<span style="float:right;margin-right:15px">${vo.regDate }</span>
			<span style="float:right;margin-right:15px"">${vo.member_no }</span>
		</div>
		</c:if>
		<c:if test="${empty commentsList }"><span style="margin-left:320px">덧글이 없습니다.  처음으로 덧글을 남겨보세요.</span></c:if>
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
 		};
 		var map = new daum.maps.Map(mapContainer, mapOption);
 			var marker = new daum.maps.Marker({
 				position : new daum.maps.LatLng(lat, lng)
 			});
 			marker.setMap(map);
    } 
 })
 
</script>
<script>
function likeCon( content_no, member_no){
	$.ajax({
		type : 'get',
	    url:'/like',
	    data : {
	    		content_no : content_no,
	    		member_no : member_no
	    },
	    dataType:'json',
	    success: function(){
	    	alert("좋아요를 누르셨습니다.");
	    },
})
}
</script>
<script>
function jjimCon( content_no, member_no){
	$.ajax({
		type : 'get',
	    url:'/jjim',
	    data : {
	    		content_no : content_no,
	    		member_no : member_no
	    },
	    dataType:'json',
	    success: function(){
	    	alert("오늘페이지에 저장되었습니다");
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