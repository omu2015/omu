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
<!-- Theme skin -->
<link href="../../assets/css/default.css" rel="stylesheet" />

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
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c12b4d88c8259cf4652b89c1f64db8e8&libraries=services"></script>
</head>
    <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:600px;}
#menu_wrap {position:relative;top:0;left:0;bottom:0;width:98%;margin:10px ;padding:0;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px; background: #FEE8EE;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList ul { background: #FFF8FA; border : 1px solid #E6D4D4;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<style>
.PickTheme table{
    background: #FFEBEB;
    border : 1px solid #E6D4D4;
}
</style>
<script>
function showTheme(Obj) {
	var themeName=Obj.id.split("_").pop();
	console.log(themeName);
	console.log(map.getCenter());
    //location.href="/review/showTheme?theme_no="+theme_no;
    
     ps.keywordSearch(themeName , planSearchCB, {
     	location : map.getCenter(),
    	radius : 1000,
    	sort : daum.maps.services.SortBy.DISTANCE
     });
}
function addTheme() {
	//alert("관심사고르기");
	//location.href="#interset";
	
}
</script>
<script>
</script>
<body>
<div id="wrapper">
	<!-- start header -->
		<c:import url="/WEB-INF/views/include/header.jsp"/> 
	<!-- end header -->
<div class="container">
	<div class="row">
			<div class="col-lg-12">
				<h4 class="heading"></h4>
				<div class="row">
					<section id="woosungMain">
												<c:if test="${not empty authUser}">
													<div class="wsTable">
													<table>
															<tr>
															<c:forEach var="vo" items="${memberTheme}">
																<td id="theme_Name_${vo.themeName}" onclick="showTheme(this)"
																onmouseover="changeColor(this)">${vo.themeName}</td>
															</c:forEach>
																<td id="modaltrigger" style="color:#fb6f92" onclick="addTheme()" onmouseover="changeColor(this)">테마 추가하기</td>
															</tr>
													</table>
													</div>
												</c:if>
					
													<div class="map_wrap">
															    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
								 				 	</div><!-- map_wrap -->
								 				 		<div class="wsTable">
													<table>
															<tr>
																<td onclick="placesNear(2)" onmouseover="changeColor(this)"><b>2km</b> 주변 후기</td>
																<td onclick="placesNear(3)" onmouseover="changeColor(this)"><b>3km</b> 주변 후기</td>
																<td onclick="placesNear(5)" onmouseover="changeColor(this)"><b>5km</b> 주변 후기</td>
															</tr>
													</table>
													</div>
						<!-- Item Project and Filter Name -->
												    <div id="menu_wrap" class="bg_white">
												        <div id="pagination"></div>
												        <div class="option">
												                <form style="text-align:right; margin-right:18px;" onsubmit="searchPlaces(); return false;">
												                 <input type="text" value="" id="keyword" size="15">
												                <input type="submit" value="검색"> 
												                </form>
												        </div>
												        <hr>
												        <ul id="placesList"></ul>
													</div>
						<!-- End Item Project -->
					
					</section>
					<c:import url="/WEB-INF/views/review/planTable.jsp"></c:import>
				</div>
		</div>
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
<script>
function placesNear(distance){
	console.log("전방 "+distance+"km");
	//console.log("map.getCenter() == " +map.getCenter().getLat());
	console.log("map.getLevel() == " + map.getLevel());
	var latlng=map.getCenter();
	var lvl=map.getLevel();
	$.ajax({
		  url: "/review/getnear",
		  data: {
			lat : map.getCenter().getLat(),
			lng : map.getCenter().getLng(),
			distance : distance 
		  },
			success : function(response){
					displayPlaces(response.contentList);
					//map.setCenter(latlng);
					if(map.getLevel() < lvl){
						map.setLevel(lvl);
					}
			},
			error: function (xhr, textStatus, errorThrown) { console.log(errorThrown); }
		});
}

</script>
<script>
		var options = {
		  enableHighAccuracy: true,
		  timeout: 5000,
		  maximumAge: 0
		};

		function success(pos) {
		  var crd = pos.coords;
 		  map.setCenter(new daum.maps.LatLng(crd.latitude, crd.longitude));
 		  
		//주변 3km내에 있는 content getcha! 		  
 		placesNear(3);
			
		  console.log('Your current position is:');
		  console.log('Lat : ' + crd.latitude + '  Lng : ' + crd.longitude + ' ( accuracy ' + crd.accuracy + 'm )');
		  
		};

		function error(err) {
		  console.warn('ERROR(' + err.code + '): ' + err.message);
		};



		var markers = [];
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {center : new daum.maps.LatLng(37.566826, 126.9786567),	level : 5};
		var map = new daum.maps.Map(mapContainer, mapOption);
		
		navigator.geolocation.getCurrentPosition(success, error, options);
		
		var ps = new daum.maps.services.Places();
		var infowindow = new daum.maps.InfoWindow({	zIndex : 1});
		var planlistwindow = new daum.maps.InfoWindow({	zIndex : 1});
		
		
		// 키워드 검색을 요청하는 함수입니다
		//searchPlaces();
		function searchPlaces() {
			var keyword = document.getElementById('keyword').value;
				if (!keyword.replace(/^\s+|\s+$/g, '')) {
					alert('키워드를 입력해주세요!');
					return false;
				}
			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
				ps.keywordSearch(keyword, planSearchCB);
				//ps.categorySearch('PO3', planSearchCB, {location: new daum.maps.LatLng(37.564968, 126.939909)});
		}
				
		function planSearchCB(status, response, pagination) {
			if (status === daum.maps.services.Status.OK) {
				
				displayPlaces(response.places);
				displayPagination(pagination);
				
			} else if (status === daum.maps.services.Status.ZERO_RESULT) {alert('검색 결과가 존재하지 않습니다.');return;
			} else if (status === daum.maps.services.Status.ERROR) {	lert('검색 결과 중 오류가 발생했습니다.');	return;
			}
		}

		function displayPlaces(places) {
			console.log(places);
			var listEl = document.getElementById('placesList'),
				menuEl = document.getElementById('menu_wrap'),
				fragment = document.createDocumentFragment(),
				bounds = new daum.maps.LatLngBounds(),
				listStr = '';

			removeAllChildNods(listEl);
			removeMarker();

			for (var i = 0; i < places.length; i++) {
				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new daum.maps.LatLng(places[i].latitude,places[i].longitude),
					marker = addMarker(placePosition, i),
					itemEl = getListItem(i, places[i], marker);

				bounds.extend(placePosition);

				(function(marker, items) {
					
									
									daum.maps.event.addListener(marker, 'mouseover',
											function() {
												displayInfowindow(marker, items);
											});
				
									daum.maps.event.addListener(marker, 'mouseout', function() {
// 											infowindow.close();
									});
									
									
									//mouseover
									itemEl.onmouseover = function() {
										marker.setVisible(true);
									};
				
									itemEl.onmouseout = function() {
										//infowindow.close();
									};

									//click
									daum.maps.event.addListener(marker, 'click',
									function(){
									//displayPlanList(marker,items);
									infowindow.close();
										displayInfowindow(marker, items);
									});
									
									itemEl.onclick = function(){
										map.setCenter(new daum.maps.LatLng(items.latitude, items.longitude));
										
									//displayPlanList(marker,items);	
										displayInfowindow(marker, items);
									
									};
									
									daum.maps.event.addListener(map, 'click',
											function(){
												infowindow.close();
											//	planlistwindow.close();
											});
									
									
									
				})(marker, places[i]);


				fragment.appendChild(itemEl);
			}

			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			map.setBounds(bounds);
		}

		function getListItem(index, places) {

			var el = document.createElement('li'), 
				itemStr = '<span class="markerbg marker_'+ (index + 1)+ '"></span>'
						+ '<div class="info"><h5>' + places.title + '</h5>';

			if (places.newAddress) {
				itemStr += '<span>' + places.newAddress + '</span>'
						+ '<span class="jibun gray">' + places.address
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'col-lg-3 design';

			return el;
		}

		function addMarker(position, idx, title) {
			var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new daum.maps.Point(13, 37)
			
			}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new daum.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), 
				fragment = document.createDocumentFragment(), i;

			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		function displayInfowindow(marker, items) {
			if(items.imageUrl=="") items.imageUrl ="/product-images/201582401441814.jpg";
			var content = '<div class="wsTable"><table><tr><th colspan="2" class="wshd">'+items.title+'</th></tr><tr><td rowspan="4"><img style="height:150px" src="'+items.imageUrl+'"/></td></tr><tr><td>'+items.newAddress+'</td></tr><tr><td>'+items.phone+'</td></tr><tr><td><a href="'+items.placeUrl+'">웹 주소로 이동하기</a></td></tr><tr><th colspan="2" class="wshd">후기 게시판</th></tr>';
			
			$.ajax({
				type: "Post",
				url: "/review/callPlanList",
				data:{
					id : items.id
				},
				success: function(response){
							if(response.planList.length%2==0){
								for ( var i in response.planList) {
											if(i%2==0){
											content += '<tr><td onmouseover="changeColor(this)" id="'+response.planList[i].plan_no+'" onclick="showplan(this)"><b>'+response.planList[i].plan_no+'</b> 번 후기</td>';
											}else{
												content += '<td onmouseover="changeColor(this)" id="'+response.planList[i].plan_no+'" onclick="showplan(this)"><b>'+response.planList[i].plan_no+'</b> 번 후기</td></tr>';
											}
								}
							}else{
								for ( var i in response.planList) {
											if(i%2==0){
											content += '<tr><td onmouseover="changeColor(this)" id="'+response.planList[i].plan_no+'" onclick="showplan(this)"><b>'+response.planList[i].plan_no+'</b> 번 후기</td>';
											}else{
												content += '<td onmouseover="changeColor(this)" id="'+response.planList[i].plan_no+'" onclick="showplan(this)"><b>'+response.planList[i].plan_no+'</b> 번 후기</td></tr>';
											}
								}
									content += '</tr>';
							}
						content+='</table><hr style="border:none;border:1px double pink;"></div>';
			
						infowindow.setContent(content);
						infowindow.open(map, marker);
				},
				error:function(jqXHR, textStatus, errorThrown){
		            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		            self.close();
		        }
			});
			
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
		
		
	function displayPlanList(marker, items) {
		console.log(items.id+"_______"+items.title);
		
	var content = '<div style="padding:5px;z-index:1;"><ul><li>'+items.title+'</li>';
					
		$.ajax({
			type: "Post",
			url: "/review/callPlanList",
			data:{
				id : items.id
			},
			success: function(response){
					for ( var i in response.planList) {
						content += '<li onmouseover="changeColor(this)" id="'+response.planList[i].plan_no+'" onclick="showplan(this)"> --> '+response.planList[i].plan_no+'번 일정으로 이동</li>';
					}
				content+='</ul></div>';
				
				planlistwindow.setContent(content);
				planlistwindow.open(map, marker);
			},
			error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	            self.close();
	        }
		});
	}
	
	function hideAllMarker() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setVisible(false);
		}
	}
	
	function showAllMarker() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setVisible(true);
		}
	}
	
	
	</script>

	