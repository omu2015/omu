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

</head>
<body>
	<div id="wrapper">
		<!-- start header -->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<c:import url="/WEB-INF/views/include/header_mypage.jsp"></c:import>
		<!-- end header -->

		<section id="content">

		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					

						<div id="join-form">
						<c:import url="/WEB-INF/views/mypage/boardview.jsp"></c:import>
						</div>
					
				</div>
			</div>
		</div>
		</section>
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../../assets/jsjquery.js"></script>
	<script src="../../assets/jsjquery.easing.1.3.js"></script>
	<script src="../../assets/jsbootstrap.min.js"></script>
	<script src="../../assets/jsjquery.fancybox.pack.js"></script>
	<script src="../../assets/jsjquery.fancybox-media.js"></script>
	<script src="../../assets/jsgoogle-code-prettify/prettify.js"></script>
	<script src="../../assets/jsportfolio/jquery.quicksand.js"></script>
	<script src="../../assets/jsportfolio/setting.js"></script>
	<script src="../../assets/jsjquery.flexslider.js"></script>
	<script src="../../assets/jsanimate.js"></script>
	<script src="../../assets/jscustom.js"></script>
	<script src="../../assets/jsvalidate.js"></script>
</body>
</html>