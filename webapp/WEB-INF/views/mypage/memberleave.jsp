<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
<link href="../../assets/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="../../assets/css/jcarousel.css" rel="stylesheet" />
<link href="../../assets/css/flexslider.css" rel="stylesheet" />
<link href="../../assets/css/style.css" rel="stylesheet" />
<link href="../../assets/css/table.css" rel="stylesheet" />

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
    <c:import url="/WEB-INF/views/include/header_mypage.jsp">
    <c:param name="pageName" value="memberLeave"/>
    </c:import>
	<section id="content">

	<div class="container" style="height: 700px">
	
			<div class="col-lg-12">
					<div class="row">
					<form  name="memberleave" method="post" action="/mypage/memberleaveok">
					<div id="join-form">
					<table>
					 <tr>
					     <td>${authUser.memberName }님 정말 탈퇴 하실껀가요?</td>
					 </tr>
			        <tr>
						<td class="title">패스워드</td>
						<td><input id=password name="password" type="password" value=""></td>
					</tr>
					<tr>
						<td class="title">패스워드 재확인</td>
						<td><input  id=password1 name="password1" type="password" value=""></td>
						
					</tr>
                      <tr>
                          <td>
                            <input type="hidden" id="realPassword" name="memberStatus" value="${authUser.password }" >
                            <input type="hidden" id="memberStatus" name="memberStatus" value="탈퇴" >
                            <input type="hidden" id="joinOutDate" name="joinOutDate" value="" >
                          </td>
                      </tr>

					</table>
					</div>
				
				   <div style="float: right; margin-right: 40%;">
					<input type="submit" class="back" value="탈퇴완료">
					<a href="/mypage"><input type="button" class="back" value="취소" ></a>
				   </div>
				</form>
				
				</div>
			</div>
		
	</div>
	</section>
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
</div>
<script>
   $(function(){
	   $(".row").submit(function(){
		   var $password = $("#password");
		   var password  = $password.val();
		   if(password==""){
			  alert("password를 입력하세요");
			  $password.focus();
              return false;
		   }
		   var $password1 = $("#password1");
		   var password1 = $password1.val();
		    if(password1==""){
		    	alert("password를 입력하세요");
		    	  $password1.focus();
	              return false;
		   }  
		    var $realPassword = $("#realPassword");
			var realPassword = $realPassword.val();
			   
			   
		    
		  if(password !=password1){
			  alert("비밀번호가 일치하지 않습니다.")
			  return false;
		  }
		  
		  if(realPassword !=password && realPassword!=$password1  ){
			  alert("기존 회원 비밀번호와 같지 않습니다.")
			  return false;
		  }
		  alert("탈퇴 되었습니다.ㅠㅠㅠㅠㅠㅠ")
		  return true;
		  
		  
	   });
   });
</script>
   

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