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
	<!-- end header -->
	<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			</div>
		</div>
	</div>
	</section>
	<section id="content">

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
					<div class="row">
					<form  name="joinForm" method="post" action="/member/join">
					<div id="join-form">
					<table>
					<tr>
						<td id="photo" rowspan="4">사진 
						<input type="button" name="imageUrl" style="display:block; width:100px; margin:0; text-align:center;" value="사진등록" />
						</td>
						<td class="title">이름</td>
						<td><input id="name" name="memberName" type="" value=""></td>
					</tr>
					<tr>
						<td class="title">아이디</td>
						<td><input name="memberId" type="id" value="">
							<input type="button" value="id 중복체크" ></td>
					</tr>
					<tr>
						<td class="title"> 페스워드</td>
						<td><input name="password" type="password" value=""></td>
					</tr>
					<tr>
						<td class="title">페스워드 확인</td>
						<td><input name="password1" type="password" value=""></td>
					</tr>
					<tr>
						<td class="title">이메일</td>
						<td colspan="2"><input id="email" name="email" type="text" value=""></td>
					</tr>
					<tr>
						<td class="title">생년월일</td>
						<td colspan="2">
							<select name="year">
							<c:forEach var="i" begin="1960" end="2015">
								<option value="${i}">${i}</option>
							</c:forEach>
							</select>
							<select name="month">
							<c:forEach var="i" begin="1" end="12">
								<option value="${i}">${i}</option>
							</c:forEach>
							</select>
							<select name="day">
							<c:forEach var="i" begin="1" end="31">
								<option value="${i}">${i}</option>
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td rowspan="2"  class="title">주소</td>
						<td colspan="2"><input  name="zipcode" id="zipcode" class="txt" style="width: 10%; text-align: center;" maxlength="6" value="" /><input type="button" name="searchPost" value="우편번호검색" /></td>
					</tr>
					<tr>
						<td colspan="2"><input name="address" id="address" class="txt" style="width: 100%;"  value="" /></td>
					</tr>
					<tr>
						<td class="title">연락처</td>
						<td colspan="2">
							<select name="phoneNum1">
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="019">019</option>
								<option value="">없음</option>
							</select>
							<input name="phoneNum2" maxlength="4"/>
							<input name="phoneNum3" maxlength="4"/>	
						</td>
						
					</tr>

					</table>
					</div>
					<fieldset>
						<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
						<label>서비스 약관에 동의합니다.</label>
					</fieldset>
					<input type="submit" value="가입하기">
				</form>
				
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