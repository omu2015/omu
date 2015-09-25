<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- css -->
<link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="../../assets/css/fancybox/jquery.fancybox.css"
	rel="stylesheet">
<link href="../../assets/css/jcarousel.css" rel="stylesheet" />
<link href="../../assets/css/flexslider.css" rel="stylesheet" />
<link href="../../assets/css/style.css" rel="stylesheet" />
<link href="../../assets/css/table.css" rel="stylesheet" />



<!-- Theme skin -->
<link href="../../assets/css/default.css" rel="stylesheet" />

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<style type="text/css">
.back {
   text-align:center;
	-moz-box-shadow:inset 0px 1px 0px 0px #fdb7c8;
	-webkit-box-shadow:inset 0px 1px 0px 0px #fdb7c8;
	box-shadow:inset 0px 1px 0px 0px #fdb7c8;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #fdb7c8), color-stop(1, #fdb7c8) );
	background:-moz-linear-gradient( center top, #fdb7c8 5%, #fdb7c8 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fdb7c8', endColorstr='#fdb7c8');
	background-color:#fdb7c8;
	-webkit-border-top-left-radius:42px;
	-moz-border-radius-topleft:42px;
	border-top-left-radius:42px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:42px;
	-moz-border-radius-bottomright:42px;
	border-bottom-right-radius:42px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0px;
	border:1px solid #fdb7c8;
	display:inline-block;
	color:#fff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:42px;
	line-height:42px;
	width:91px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #fdb7c8;
}
.back:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #fdb7c8), color-stop(1, #fdb7c8) );
	background:-moz-linear-gradient( center top, #fdb7c8 5%, #fdb7c8 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fdb7c8', endColorstr='#fdb7c8');
	background-color:#fdb7c8;
}.back:active {
	position:relative;
	top:1px;
}</style>


</head>
<body>
	<div id="wrapper">
		<!-- start header -->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<c:import url="/WEB-INF/views/include/header_mypage.jsp">
		<c:param name="pageName" value="selectPlanView"/>
		</c:import>
		<!-- end header -->

		<section id="content">
        
		<div class="container" style="height: 700px">
			<div class="row">
				<div class="col-lg-12">
					
   <form action="back">

						<div id="join-form">
						<c:import url="/WEB-INF/views/mypage/selectplanview1.jsp"></c:import>
						</div>
	</form>	
				</div>
					    <a href="/mypage"><input class="back" type="button" value="되돌아가기"  ></a>
			</div>
		</div>
		</section>
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
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
<script type="text/javascript"	src="//apis.daum.net/maps/maps3.js?apikey=c12b4d88c8259cf4652b89c1f64db8e8&libraries=services"></script>
<script type="text/javascript" src="/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/js/jquery.leanModal.min.js"></script>


</body>
</html>