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
<script type="text/javascript" src="/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/js/jquery.leanModal.min.js"></script>
<script type="text/javascript">
$(function(){
	for(var i=0; i<100; i++){
  $('#hanitrigger'+i).leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
	}
});
</script>

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
					<div class="row">

						<div id="join-form">
							<table border="1"
								style="margin: auto; text-align: center; width: 70%;">
								<tr style="background-color: pink;">
									<td>등록일</td>
									<td>상점이름</td>
									<td>주소</td>
									<td>비용</td>
								</tr>
								<c:forEach var="vo" items="${goodViewList }">
									<c:if test="${vo.member_no==authUser.member_no}">
										<tr>
											<td>${vo.regDate}</td>
											<td><a href="#contentView${vo.content_no}" id="hanitrigger${vo.content_no}">${vo.title}</a></td>
											<td>${vo.newAddress}</td>                  
											<td>${vo.cost}</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>

							<!-- 모달팝업 Content -->
							<c:forEach var="vo" items="${goodViewList }" varStatus="status">
								<div>
									<div id="contentView${vo.content_no}" style="display: none;">
										<div style="width: 600px">
											<img src="${vo.imageUrl }">
										</div>
										<div
											style="width: 600px; background-color: #2f3238; color: #fff; height: 60px; text-align: center; font-size: 15px">
											<div>${vo.title }</div>
											<div>${vo.address }</div>
											<div>${vo.cost }원</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
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