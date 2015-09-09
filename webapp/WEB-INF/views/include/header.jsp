<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<li><a  href="#loginmodal"  class="flatbtn" id="modaltrigger">Login</a></li>
						<li><a href="/member/joinForm">Join</a></li>
                    </ul>
                </div>
	</c:when>
	<c:otherwise>
				<div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="/">Home</a></li>
                        <li><a  href="/mypage" >MyPage</a></li>
						<li><a  href="/member/logout" >Logout</a></li>
                    </ul>
                </div>
				<div style="float:right;margin-top:-30px">${authUser.memberName }님 안녕하세요 ^^;</div>	
	</c:otherwise>
	</c:choose>
            </div>
        </div>
	</header>
