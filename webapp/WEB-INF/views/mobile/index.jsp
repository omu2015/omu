<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>주우성 mPath</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/> 
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<style>

</style>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>
<!-- <div id="output"></div> -->

<!-- first page -->
<div data-role="page">
	<div data-role="header" data-theme="b">
		<h1>Mobile</h1>
	</div>
	<div data-role="content">
				<!--리스트를 하나의 그룹으로 구분하고 싶을때  data-inset true defaultValue="false"-->
		<ul data-role="listview" data-inset="true">
			<li data-role="list-divider">Divider</li>
			<li>
				<a href="#">
					<img src="/product-image/KakaoTalk_20150910_151033524.jpg"/>
					<h3>List Item 1</h3>
					<p>Lorem ipsum</p>
					<span class="ui-li-count">52</span>
				</a>
				<a href="#second-page" data-icon="search"></a>
		</ul>
	</div>
</div>
<!--second page -->
<div data-role="page" id="second-page">
	<div data-role="header" data-theme="b" data-add-back-btn="true">
		<h1>Mobile2</h1>
	</div>
	<div data-role="content">
		<ul data-role="listview" data-inset="true" data-filter="true">
			<li data-role="list-divider">Divider</li>
			<li><a href="#">방화</a></li>
			<li><a href="#">개화산</a></li>
			<li><a href="#">김포공항</a></li>
			<li><a href="#">송정</a></li>
			<li><a href="#">마곡</a></li>
			<li><a href="#">발산</a></li>
			<li><a href="#">우장산</a></li>
		</ul>
	</div>
</div>
</body>
</html>