<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bit2015.omu.vo.ThemeVo"%>
<%@page import="com.bit2015.omu.vo.ThemeBoxVo"%>
<%@page import="java.util.List"%>
<%@page import="com.bit2015.omu.dao.ThemeBoxDao"%>
<%@page import="com.bit2015.omu.dao.ThemeDao"%>
<%@page import="com.bit2015.omu.vo.MemberVo"%>
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
<!-- Theme skin -->
<link href="../../assets/css/default.css" rel="stylesheet" />

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
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c12b4d88c8259cf4652b89c1f64db8e8&libraries=services"></script>

<style type="text/css">
.wsTable {
	background : #FFEFEF;
	border : 1px solid #E6D4D4;
}

.wsTable td{
	padding : 5px;
}
</style>

</head>
<body>



<div id="wrapper">
	<!-- start header -->
		<c:import url="/WEB-INF/views/include/header.jsp"/> 
	<!-- end header -->
<div class="container">
	<div class="row">
			<div class="col-lg-12">
				<h4 class="heading"></h4>
				<div class="row">
					<table class="wsTable">
						<tr>
							<td colspan="2">content1</td>
						</tr>
						<tr>
							<td colspan="2">content2</td>
						</tr>
						<tr>
							<td colspan="2">content3</td>
						</tr>
						<tr>
							<td>memberId</td><td>regDate</td>
						</tr>
						<tr>
							<td colspan="2"><img src="" /></td>
						</tr>
						<tr>
							<td colspan="2">textArea</td>
						</tr>
						<tr>
							<td colspan="2">
								Comments Line
							</td>
						</tr>
					</table>
				</div>
		</div>
</div>	
</div><!-- main -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
</div><!-- wrapper -->
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>








</body>
</html>
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