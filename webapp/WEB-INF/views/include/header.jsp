<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/assets/css/layout.css" rel="stylesheet" type="text/css" />

<header>
        <div class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/"><span>오늘</span> 뭐하지<span>?</span></a>
                </div>
<c:choose>
	<c:when test="${empty authUser }">
                <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="/">Home</a></li>
                       <!--  <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Features <b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="typography.html">Typography</a></li>
                                <li><a href="components.html">Components</a></li>
								<li><a href="pricingbox.html">Pricing box</a></li>
                            </ul>
                        </li> -->
						<li><a  href="#loginmodal"  id="modaltrigger">Login</a></li>
						<li><a href="/member/joinForm">Join</a></li>
                    </ul>
                </div>
	</c:when>
	<c:otherwise>
				<div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav">
                        <li style="color:#000"><a href="/">Home</a></li>
                        <li><a  href="/mypage" >MyPage</a></li>
						<li><a  href="/member/logout" >Logout</a></li>
                    </ul>
                </div>
				<div style="float:right;margin-top:-30px">${authUser.memberName }  님 안녕하세요 ^^;</div>	
	</c:otherwise>
	</c:choose>
            </div>
        </div>
	</header>

	
	
<!-- 모달팝업 로그인 -->
<c:choose>
	<c:when test="${empty authUser }">		
		<div id="loginmodal" style="display:none;">
				<form name = "loginform" method="post" action="member/login">
				 <h2>LOGIN</h2>
				 <div class="p_c_text" style="margin-top:20px">회원이 되시면 여러가시 혜택을 누리실 수 있습니다.</div>
				 <div class="login_line">
				  <div class="box_in" style="margin-top:15px">
				  <input type="text" name="memberId" id="id" size="23" value="woosungchu">
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
