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
<script>
// var userAgent = navigator.userAgent;
// alert(userAgent);

// var smartPhones = [ 'iphone', 'ipod', 'windows ce', 'android', 'blackberry', 'nokia',
//                     'webos', 'opera mini', 'sonyericsson', 'opera mobi', 'iemobile'];
// for(var i in smartPhones){
// 	if(navigator.userAgent.toLowerCase().match(new RegExp(smartPhones[i]))){
// 		alert('This is Smart Phones..!');
// 		document.location='/mobile';
// 	}
// }

// //회전시 작동
// window.onorientationchange = function(){
// 	alert(window.orientation);
// }



// 	//회전 각도에 따라 조건
// $(window).on('orientationchange', function(){
// 	var output = ' <h1>Orientation</h1>';
	

// 	switch(window.orientation){
// 	case 0:
// 		output += '<h2>Portrait</h2>';
// 		break;
// 	case -90:
// 		output += '<h2>Landscape</h2>';
// 		output += '<h2>right, screen turned clockwise</h2>';
// 		break;
// 	case 90:
// 		output += '<h2>Landscape</h2>';
// 		output += '<h2>left, screen turnedcounterclockwise</h2>';
// 		break;
// 	case 180:
// 		output += '<h2>Portrait</h2>';
// 		output += '<h2>upsie-down portrait</h2>'
// 		break;
// 	}
	
	
// 	//output
// 	$('body').html(output);
	
// });

// $(document).ready(function(){
// 	$(document).on('touchstart', function(e){
// 		$('body').append('<h6>touch Start</h6>');
// 	});
// 	$(document).on('touchmove', function(e){
// 		$('body').append('<h6>touch Move</h6>');
// 	});
// 	$(document).on('touchend', function(e){
// 		$('body').append('<h6>touch End</h6>');
// 	});
// })





// $(document).ready(function(){
// 	$(document).on('touchstart', function(e){
// 		var event =e.originalEvent;
// 		$('#output').html('<h1>'+event.touches[0].screenX+'</h1>');
// 		e.preventDefault();
// 	});
// 	$(document).on('touchmove', function(e){
// 		var event =e.originalEvent;
// 		$('#output').html('<h1>'+event.touches[0].screenX+'</h1>');
// 		e.preventDefault();
// 	});
// 	$(document).on('touchend', function(e){
// 		var event =e.originalEvent;
// 		$('#output').html('<h1>'+event.touches[0].screenX+'</h1>');
// 		e.preventDefault();
// 	});
// })






</script>
</head>
<body>
<!-- <div id="output"></div> -->

<!-- first page -->
<div data-role="page">
	<div data-role="header" data-theme="b">
<!-- data-theme은 css 효과 직접 만들고 싶으면 jquery mobile homepage ThemeRoller가서 직접만들어 -->
		<h1>Mobile</h1>
	</div>
	<div data-role="content">
		<ul data-role="listview">
			<li><a href="#second-page" data-transition="slide">List Item 1</a></li>
			<li><a href="#second-page" data-transition="slideup">List Item 2</a></li>
			<li><a href="#second-page" data-transition="slidedown">List Item 3</a></li>
			<li><a href="#second-page" data-transition="pop">List Item 4</a></li>
			<li><a href="#second-page" data-transition="fade">List Item 5</a></li>
			<li><a href="#second-page" data-transition="flip">List Item 6</a></li>
			<li><a href="#second-page" data-rel="dialog">List Item 7</a></li>
			<li><a href="#second-page" data-rel="dialog" data-transition="pop">List Item 8</a></li>
			<li><a href="#second-page" data-rel="dialog" data-transition="slidedown">List Item 9</a></li>
			<li><a href="#second-page" data-rel="dialog" data-transition="flip">List Item 10</a></li>
		</ul>
	</div>
	<div data-role="footer" data-theme="b">
		<h1>footer</h1>
	</div>
</div>

<!-- second page -->
<div data-role="page" id="second-page">
	<div data-role="header" data-theme="b" data-add-back-btn="true">
		<h1>Other Page</h1>
	</div>
	<div data-role="content">
		<p>Lorem ipsum dolor sit amet.</p>
	</div>
</div>
</body>
</html>