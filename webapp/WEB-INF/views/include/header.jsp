<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--css -->
<link href="/assets/css/layout.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/assets/css/navi.css" media="screen" /> 

   
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


<!-- <style type="text/css">
#container {width:960px;margin-left: auto;margin-right: auto;padding: 0;}
.clear {clear: both;margin: 0;padding: 0;}
p {margin: 1.6em 0;line-height: 1.6em;}
h2 {font-size: 20px;line-height: 20px;margin: 22px 0 18px 0;}
</style> -->



<header>
        <div class="navbar navbar-default navbar-static-top">
<!--             <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/"><span>오늘</span> 뭐하지<span>?</span></a>
                </div> -->

		<div id="menu_div">
			<div id="navigation">
				<div id="menu">
					<c:choose>
					<c:when test="${empty authUser }">
					<ul id="nav">
						<li><a href="/">HOME</a></li> 
						<li><a href="javascript:planner(1)">일정짜기</a></li>
						<li><a href="/review">게시판</a></li>
						
						<li style="float:right;margin-right:220px"><a style="color:#fb6f92" href="/member/joinForm">Join</a></li>
						<li style="float:right"><a style="color:#fb6f92"  href="#loginmodal"  id="modaltrigger">Login</a></li>
					</ul>
					<div style="float:right;margin-top:-55px"><img style="width:45px;height:45px;border-radius:45px;overflow:hidden" src="/assets/img/no_img.jpg"/></div>
			</c:when>
			<c:otherwise>
					<ul id="nav">
						<li><a href="/">HOME</a></li> 
						<li><a href="javascript:planner(2)">일정짜기</a></li>
						<li><a href="/review">게시판</a></li>
						
						<li style="float:right;margin-right:220px"><a style="color:#fb6f92"  href="/member/logout" >Logout</a></li>
		            	<li style="float:right"><a style="color:#fb6f92"  href="/mypage" >MyPage</a></li>
					</ul>
					<div style="float:right;margin-top:-55px"><img style="width:45px;height:45px;border-radius:45px;overflow:hidden" src="${authUser.imageUrl }"/></div>
			</c:otherwise>
			</c:choose>

		<%-- <div>
		<c:choose>
			<c:when test="${empty authUser }">
		                <div>
		                    <ul>
								<li><a  href="#loginmodal"  id="modaltrigger">Login</a></li>
								<li><a href="/member/joinForm">Join</a></li>
		                    </ul>
		                </div>
			</c:when>
			<c:otherwise>
						<div class="navbar-collapse collapse ">
		                    <ul class="nav navbar-nav">
		                       <!--  <li style="color:#000"><a href="/">Home</a></li> -->
		                        <li><a  href="/mypage" >MyPage</a></li>
								<li><a  href="/member/logout" >Logout</a></li>
		                    </ul>
		                </div>
						<div style="float:right;margin-top:-30px">${authUser.memberName }  님 안녕하세요 ^^;</div>	
			</c:otherwise>
			</c:choose>
		</div> --%>


					
					<!-- Search Form -->
					<form class="searchform" action="#" style="margin-top:13px;margin-right:45px" > 
						<input class="searchfield" type="text" value="Search..." onfocus="if (this.value == 'Search...') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Search...';}" />
					</form>
					<!-- / Search Form -->
				
				</div>
			</div>
		</div>

            </div>
        <!-- </div> -->
	</header>

	
	
<!-- 모달팝업 로그인 -->
<c:choose>
	<c:when test="${empty authUser }">		
		<div id="loginmodal" style="display:none;">
				<form name = "loginform" method="post" action="/member/login">
				 <h2>LOGIN</h2>
				 <div class="p_c_text" style="margin-top:20px">회원이 되시면 여러가시 혜택을 누리실 수 있습니다.</div>
				 <div class="login_line">
				  <div class="box_in" style="margin-top:15px">
				  <input type="text" name="memberId" id="id" size="23" value="hani89">
				  <input type="password" name="password" id="pw" size="23">
				  </div>
				  <input type="submit" value="LOGIN" class="btn_login1"  style="margin-top:12px">
				 </div>
				<div class="find_join"><a href="">아이디 / 비밀번호 찾기</a> | <a href="/member/joinForm">회원가입</a></div>
			</form>
		</div>
	</c:when>
	<c:otherwise>
		<div></div>
	</c:otherwise>
</c:choose>

 <script type="text/javascript">
$(function(){
  $('#loginform').submit(function(e){
	  console.log("success");
	  return false;
  });
  $('#modaltrigger').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
});
</script>
 <script >
function planner(num){
	if(num==1){
		alert("로그인하시오");
	}if(num==2){
		location.href="/planner";
	}
}
</script>
