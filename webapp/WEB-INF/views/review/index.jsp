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
<style>
#woosungMain li { margin: 15px 10px; display: inline; float: right; border :1px solid #E26483;}
ul { list-style: none outside none; margin:0; padding: 0; text-align: center; }
img {width : 250px }

#woosungMain{ width:100%; height:100%}
#woosungMain ul li table {
	background-color : #FED4DE;
	height :250px;
	width : 300px;
	margin : 10 auto;
}
</style>
<body>
<div id="wrapper">
	<!-- start header -->
		<c:import url="/WEB-INF/views/include/header.jsp"/> 
	<!-- end header -->
<div class="container">
<div id="woosungMain">
<ul id="woosungul">
	<li><table>   <tr><td><h5>제목</h5></td></tr>  <tr><td><h6>부제</h6></td></tr>  <tr><td>이미지</td></tr>  </table></li>

</ul>
	
<!-- 
<ul id="go"></ul>
 -->

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
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=bbef91da99f11fe76f4b3b523d3151e9&libraries=services"></script>
<script>
$(document).ready(function() {
    	$.ajax({
          type:"GET",
          url:"https://apis.daum.net/local/v1/search/category.json?apikey=bbef91da99f11fe76f4b3b523d3151e9&code=CT1&location=37.514322572335935,127.06283102249932&radius=20000",
          dataType:"JSONP", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
          success : function(response) {
                // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                // TODO
    		    	console.log(response);
    		        	for (var i in response.channel.item) {
    		        		if(response.channel.item[i].imageUrl==""){
    		        			response.channel.item[i].imageUrl=="사진이 없습니다";
    		        		}else{
    		        			/* response.channel.item[i].imageUrl=='<img src="'+response.channel.item[i].imageUrl+'"/>' */
    		        		}
    					$('#woosungul').append(
    						'<li><table><tr><td><h5>'+
    						response.channel.item[i].title+'</h5></td></tr><tr><td><h6>'+
    						response.channel.item[i].newAddress+'</h6></td></tr><tr><td><img src="'+
    						response.channel.item[i].imageUrl+'"/></td></tr></table></li>'
    					);
    				}
          },
          complete : function(response) {
                // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
                // TODO
          },
          error : function(xhr, status, error) {
                alert("에러발생");
          }
    });
});
</script>
	<script>
	 console.log('${themeArray.size()}');
	 var MTSize='${themeArray.size()}';
		var places = new daum.maps.services.Places();
		var imggo;
		var callback = function(status, result) {
		    if (status === daum.maps.services.Status.OK) {
		    	//console.log(result);
		        	for (var i in result.places) {
					//console.log(i+"       "+result.places[i].imageUrl);
					if(result.places[i].imageUrl!=""){
					$('#go').append(
						'<li><b>'+result.places[i].title+'</b><img src="'+result.places[i].imageUrl+'"/></li>'
					);
					}
				}
		    }
		};
		
		places.keywordSearch('${themeArray.get(1).getThemeName()}', callback);
	</script>