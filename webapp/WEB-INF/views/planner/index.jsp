<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- css -->
<!-- <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="../../assets/css/style.css" rel="stylesheet" />
<link href="../../assets/css/map.css" rel="stylesheet" />
 -->
<!-- Theme skin -->
<link href="../../assets/css/default.css" rel="stylesheet" />

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
<script src="../../assets/js/bootbox.min.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=c12b4d88c8259cf4652b89c1f64db8e8&libraries=services"></script>
<script type="text/javascript" src="/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/assets/js/jquery.leanModal.min.js"></script>
<style type="text/css">
div.sub-menu {
	margin-top: 10px;
	width: 450px;
	height: 100%;
	position: fixed;
}

div strong {
	margin-left: 300px;
	position: fixed;
}

div.backgroundImage {
	background-color: rgba(237, 237, 237, 0.6);
	width: 450px;
	height: 100%;
	position: fixed;
}

div.sub-menu button {
	float: left;
	width: 30%;
	margin: 35px 5px;
	background: #FDB7C8;
	border-radius: 5px;
	color: #fff;
	font-weight: bold;
	font-size: 16px;
	border: 0 none;
	cursor: pointer;
}

div.sub-menu button img {
	margin-left: 10px;
	margin-top: 4px;
	width: 15px;
}

div#map {
	margin-left: 452px;
	width: 100%;
	height: 100%;
	z-index: 0;
	position: fixed;
}

ul.showPlan,ul.viewPlan {
	background-color:#fff;
	list-style: none;
	margin: 60px auto;
	width:450px;
	padding-top: 20px;
	position: fixed;
	overflow-y: scroll;
	height: 900px;
	
}

ul.showPlan li{
	padding: 20px;
	border-top : 1px solid #FDB7C8;
	border-bottom : 1px solid #FDB7C8;
	font-size: 32px;
	font-family: sans-serif;
	font-weight: bold;
	color:#717171
	
}
ul.viewPlan li {
	padding: 20px;
	border-top : 1px solid #FDB7C8;
	border-bottom : 1px solid #FDB7C8;
	font-size: 16px;
	font-family: sans-serif;
	color:#717171
}
ul.viewPlan li span{
	font-size: 20px;
	font-weight: bold;
}
ul.showPlan li:hover, ul.viewPlan li:hover{
background-color:#FDB7C8;
}
</style>

</head>

<body>
	<!-- start header -->
	<c:import url="/WEB-INF/views/include/header_juso.jsp" />
	<!-- end header -->

	<div class="plan_container">
		<div class="backgroundImage"></div>
		<div class="sub-menu">
			<div>
				<strong>${param.planDate}</strong>
			</div>
			<div id="currentLocation">
				<button onclick="geoFindMe();">
					현 위치<img src="/assets/img/button/placeholder.png">
				</button>
			</div>
			<div>
				<button onclick="addPlan()">
					일정추가<img src="/assets/img/button/plus-plan.png">
				</button>
			</div>
			<div>
				<button onclick="deletePlan()">
					일정삭제<img src="/assets/img/button/trash.png">
				</button>
			</div>
			<div class="addPlanner" style="display: none">
				<div>Plan 이름 입력!</div>
				<input type="text" name="title" id="title" value=""><a
					href="javascript:addPlanner()">작성</a>
			</div>
			<div class="showPlanner">
			</div>
		</div>
		<!-- 맵  	-->
		<div id="map"></div>
	</div>
	<script>
		function viewPlan(plan_no, num) {
			var num = num;
			$.ajax({
				type : 'get',
			    url:'/planner/viewPlan',
			    data : {
			    	 plan_no : plan_no
			    },
			    dataType:'json',
			    success: function(response){
			    	console.log(response);
			    	var data = '<ul class="viewPlan">'+num+'번째 플랜<li><a href="javascript:location.reload()"><img src="/assets/img/button/back.png"></a></li>';
			    	for(var i=0; i<response.length; i++){
			    	data += '<li><a href="javascript:locationView('+response[i].latitude+','+response[i].longitude+')"><span>'+response[i].title+'</span></br>'+response[i].address+'</br>'+response[i].phone+'</li>'
			    	}
			    	data += '</ul>';
			    	$('.showPlanner').html(data);
			    } 
			 })
		}
	</script>
	<script>
	function locationView(lat , lng){
		var moveLatLon = new daum.maps.LatLng(lat, lng);
		map.setCenter(moveLatLon);
		map.setLevel(3);
		setMarker(lat, lng);
	}
	</script>
	<script>
		function addPlan() {
			var planDate = "${param.planDate}"
			$.ajax({
				type : 'get',
			    url:'/planner/addPlan',
			    data : {
			    		planDate : planDate
			    },
			    dataType:'json',
			    success: function(response){
			    	console.log(response);
			    } 
			 })
			 location.reload();
			}
		
	</script>
	<script>
	var planDate = "${param.planDate}";
	console.log(planDate);
	$(function(){
	$.ajax({
		type : 'get',
	    url:'/planner/showPlan',
	    data : {
	    		planDate : planDate
	    },
	    dataType:'json',
	    success: function(response){
	    	var data = '<ul class="showPlan">';
	    	for(var i=0; i<response.length; i++){
	    	data += '<li><a href="javascript:viewPlan('+response[i].plan_no+','+parseInt(i+1)+')">'+parseInt(i+1)+'번째 플랜</li>'
	    	}
	    	data += '</ul>';
	    	$('.showPlanner').html(data);
	    } 
	 })
	})
	</script>
	<script>
		function showPlan() {
			$('#addPlan').hide();
			$('#showPlan').show();
			$
					.ajax({
						type : 'get',
						url : '/planner/showPlan',
						data : {},
						dataType : 'json',
						success : function(response) {
							var data = '<table id ="showPlan" style="display:none"><tr><td colspan="2" style="border:1px solid #000;">일정</td></tr>';
							for (var i = 0; i < response.length; i++) {
								data += '<tr><td style="border:1px solid #000;">'
										+ response[i].planDate
										+ '</td><td style="border:1px solid #000;">계획'
										+ i + '</td></tr>'
							}
							data += '</table>';
							$('#showPlan').html(data);
						}
					})
		}
	</script>

	<script>
		function getDong(response, siView, gun) {
			var dongList = response;
			var gunView = gun;
			var siView = siView;

			var rData = "<h2><a>" + siView + '<a>><a>' + gunView + '<a>>'
					+ "<h2>";

			try {
				var option = '';
				var selected = false;

				for ( var i in dongList) {

					rData += '<button onclick="test_goMap()" value="'
							+ dongList[i].dong + '" id="' + siView + gunView
							+ '">' + dongList[i].dong + '</button>';

				}
				$('#local').html(rData);

			} catch (e) {
				alert("error")
			}

		}
	</script>
	<script>
		function searchKeyword() {
			var keyword = document.getElementById("keyword").value; // 키워드;
			var location = lat + ',' + lng;
			$
					.ajax({
						type : 'get',
						url : 'https://apis.daum.net/local/v1/search/keyword.json?apikey=c12b4d88c8259cf4652b89c1f64db8e8&radius=20000',
						data : {
							query : keyword,
							location : location
						},
						dataType : 'jsonp',
						success : function(response) {
							keywordMap(response);
						}
					})
		}
	</script>
</body>
<!-- 지도 생성-->
<script>
	var mapContainer = document.getElementById('map'), mapOption = {
		center : new daum.maps.LatLng(37.5665350, 126.9779690),
		level : 3
	// 지도의 확대 레벨
	};

	var map = new daum.maps.Map(mapContainer, mapOption);
</script>
<!-- 현위치 검색-->
<script>
	function geoFindMe() {
		var lat;
		var lng;
		if (!navigator.geolocation) {
			alert("사용자의 브라우저는 지오로케이션을 지원하지 않습니다.");
			return;
		}
		function success(position) {
			lat = position.coords.latitude;
			lng = position.coords.longitude;
			var moveLatLon = new daum.maps.LatLng(lat, lng);
			map.setCenter(moveLatLon);
			map.setLevel(3);
			setMarker(lat, lng);
		}
		;
		function error() {
			alert("사용자의 위치를 찾을 수 없습니다.");
		}
		;
		navigator.geolocation.getCurrentPosition(success, error);
	}
</script>
<!--  marker 생성-->
<script>
	function setMarker(lat, lng, title, keyword, id) {
		var markerPosition = new daum.maps.LatLng(lat, lng);
		var title = title;
		var keyword = keyword;
		var id = id;
		var marker = new daum.maps.Marker({
			position : markerPosition,
			title : title,
			clickable : true

		});
		marker.setMap(map);
		infoMarker(marker, keyword, id);
	}
</script>
<!-- click infowindow 실행-->
<script>
	function infoMarker(marker, keyword, id) {
		var wb = marker.getPosition().wb;
		var vb = marker.getPosition().vb;
		var iwContent = '<div style="padding:5px;">'
				+ marker.getTitle()
				+ '</div><button onclick=setCart('
				+ wb
				+ ','
				+ vb
				+ ',"'
				+ keyword
				+ '",'
				+ id
				+ ',"${planVo.plan_no}")>♥ 찜하기</button>&nbsp&nbsp&nbsp<button onclick="">후기보기</button>';

		var iwRemoveable = true;

		var infowindow = new daum.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});
		daum.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, this);
		})

	}
</script>
<!-- 키워드 검색 -->
<script>
	function searchKeyword() {
		var lat = [];
		var lng = [];
		var title = [];
		var id = [];
		var location = centerLat + ',' + centerLng;
		var keyword = document.getElementById("keyword").value; // 키워드;
		$
				.ajax({
					type : 'get',
					url : 'https://apis.daum.net/local/v1/search/keyword.json?apikey=c12b4d88c8259cf4652b89c1f64db8e8&radius=20000',
					data : {
						query : keyword,
						location : location
					},
					dataType : 'jsonp',
					success : function(response) {
						for (var i = 0; i < response.channel.item.length; i++) {
							lat[i] = response.channel.item[i].latitude;
							lng[i] = response.channel.item[i].longitude;
							title[i] = response.channel.item[i].title;
							id[i] = response.channel.item[i].id;

							setMarker(lat[i], lng[i], title[i], keyword, id[i]);
						}
						var moveLatLon = new daum.maps.LatLng(lat[0], lng[0]);
						map.setCenter(moveLatLon);
						map.setLevel(3);
					}
				})
	}
</script>
<script>
	function setCart(wb, vb, keyword, id, plan_no) {
		bootbox.alert("Hello world!", function() {
			  Example.show("Hello world callback");
			});
		/* var places = new daum.maps.services.Places();
		var lat = wb;
		var lng = vb;
		var keyword = keyword;
		var id = id;
		var content;
		var plan_no = plan_no;
		var callback = function(status, result) {
			if (status === daum.maps.services.Status.OK) {
				for (var i = 0; i < result.places.length; i++) {
					if (id == result.places[i].id) {
						content = result.places[i];
					}
				}
				$.ajax({
					type : 'get',
					url : '/planner/addCart',
					data : {
						phone : content.phone,
						newAddress : content.newAddress,
						imageUrl : content.imageUrl,
						direction : content.direction,
						zipcode : content.zipcode,
						placeUrl : content.placeUrl,
						id : content.id,
						title : content.title,
						category : content.category,
						address : content.address,
						longitude : content.longitude,
						latitude : content.latitude,
						addressBCode : content.addressBCode,
						plan_no : plan_no
					},
					dataType : 'json',
					success : function(response) {
						alert("추가되었습니다!")
					}
				})

			}
		};
		places.keywordSearch(keyword, callback, {
			location : new daum.maps.LatLng(lat, lng)
		});
 */
	}
</script>

</html>