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
	<!-- Slider -->
        <div id="main-slider" class="flexslider" style="margin-top:-35px">
            <ul class="slides">
              <li>
                <img src="../../assets/img/slides/1.jpg" alt="" />
              </li>
              <li>
                <img src="../../assets/img/slides/2.jpg" alt="" />
              </li>
              <li>
                <img src="../../assets/img/slides/3.jpg" alt="" />
              </li>
            </ul>
        </div>
	<!-- end slider -->
		</div>
	</div>	
	</section>
	<section id="content">
	<div class="container">
		<div style="margin-top:-90px"><img src="/assets/img/omu.jpg"></div>
		
	<!-- start content -->
		<c:import url="/WEB-INF/views/main/content.jsp"/>
	<!-- end content -->		
		


<!-- 메인에 접속하면 로그인창 띄우기-->
<%-- <c:choose>
	<c:when test="${empty authUser }">		
		<div id="loginmodal"  style="margin-top:-400px" >
		<form name = "loginform" method="post" action="member/login">
			<h2>LOGIN</h2>
			<div class="p_c_text">회원이 되시면 여러가지 혜택을 누리실 수 있습니다.</div>
			<div class="login_line" >
				<div class="box_in">
				<input type="text" name="memberId" id="id" size="23" value="woosungchu">
				<input type="password" name="password" id="pw" size="23">
				</div>
				<input type="submit" value="LOGIN" class="btn_login1" >
			</div>
			<div class="find_join"><a href="">아이디 / 비밀번호 찾기</a> | <a href="/member/joinForm">회원가입</a></div>
			</form>
		</div>
	</c:when>
	<c:otherwise>
		<div></div>
	</c:otherwise>
</c:choose> --%>

</div>

	</section>
	 <c:import url="/WEB-INF/views/include/footer.jsp"></c:import> 
</div>
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
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