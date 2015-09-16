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
					<ul>
													<div class="PickTheme">
													<table>
															<tr>
															<c:if test="${not empty authUser}">
															<c:forEach var="vo" items="${memberTheme}">
																<td><a href="/review/sortby?a=${vo.theme_no}">${vo.themeName}</a></td>
															</c:forEach>
															</c:if>
															<td>내 관심사</td>
															</tr>
													</table>
													</div>
					</ul>
					
					<ul id="thumbs" class="portfolio">
													<div class="map_wrap">
															    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
								 				 	</div><!-- map_wrap -->
						<!-- Item Project and Filter Name -->
						
												    <div id="menu_wrap" class="bg_white">
												        <div id="pagination"></div>
												        <div class="option">
												            <p>
												                <form onsubmit="searchPlaces(); return false;">
												                 <input type="text" value="비트교육센터" id="keyword" size="15"> 
												                <button type="submit">검색</button> 
												            </p>
												        </div>
												        <hr>
												        <ul id="placesList"></ul>
													</div>
						<!-- End Item Project -->
					
					</ul>
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
		var markers = [];
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {center : new daum.maps.LatLng(37.566826, 126.9786567),	level : 6};
		var map = new daum.maps.Map(mapContainer, mapOption);
		
		var ps = new daum.maps.services.Places();
		var infowindow = new daum.maps.InfoWindow({	zIndex : 1});
		var planlistwindow = new daum.maps.InfoWindow({	zIndex : 1});

		
		// 키워드 검색을 요청하는 함수입니다
		searchPlaces();
		function searchPlaces() {
			var keyword = document.getElementById('keyword').value;
				if (!keyword.replace(/^\s+|\s+$/g, '')) {
					alert('키워드를 입력해주세요!');
					return false;
				}
			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			//ps.keywordSearch(keyword, placesSearchCB);
				ps.keywordSearch(keyword, planSearchCB);
				//ps.categorySearch('PO3', planSearchCB, {location: new daum.maps.LatLng(37.564968, 126.939909)});
		}
		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(status, data, pagination) {
			if (status === daum.maps.services.Status.OK) {
				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data.places);
				// 페이지 번호를 표출합니다
				displayPagination(pagination);
			} else if (status === daum.maps.services.Status.ZERO_RESULT) {alert('검색 결과가 존재하지 않습니다.');return;
			} else if (status === daum.maps.services.Status.ERROR) {	alert('검색 결과 중 오류가 발생했습니다.');	return;
			}
		}
		
///////////////////////////////		//////////////////////////////////////////////////////////////
function planSearchCB(status, response, pagination) {
	if (status === daum.maps.services.Status.OK) {
		// 정상적으로 검색이 완료됐으면
		// 검색 목록과 마커를 표출합니다
		displayPlaces(response.places);
		// 페이지 번호를 표출합니다
		displayPagination(pagination);
	} else if (status === daum.maps.services.Status.ZERO_RESULT) {alert('검색 결과가 존재하지 않습니다.');return;
	} else if (status === daum.maps.services.Status.ERROR) {	lert('검색 결과 중 오류가 발생했습니다.');	return;
	}
}



/////////////////////////////////////////////////////////////////////////////////////////////
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
	console.log(places);
			var listEl = document.getElementById('placesList'),
				menuEl = document.getElementById('menu_wrap'),
				fragment = document.createDocumentFragment(),
				bounds = new daum.maps.LatLngBounds(),
				listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);
			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {
				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new daum.maps.LatLng(places[i].latitude,places[i].longitude),
					marker = addMarker(placePosition, i),
					itemEl = getListItem(i, places[i], marker);
				// 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				(function(marker, items) {
					
									
									daum.maps.event.addListener(marker, 'mouseover',
											function() {
												displayInfowindow(marker, items.title);
											});
				
									daum.maps.event.addListener(marker, 'mouseout', function() {
										infowindow.close();
									});
									
									
									//mouseover
									itemEl.onmouseover = function() {
										marker.setVisible(true);
									};
				
									itemEl.onmouseout = function() {
										infowindow.close();
									};

									
									//click
									daum.maps.event.addListener(marker, 'click',
									function(){
									displayPlanList(marker,items);
									});
									
									itemEl.onclick = function(){
										map.setLevel(2);
										map.setCenter(new daum.maps.LatLng(items.latitude, items.longitude));
										
									displayPlanList(marker,items);	
									
									};
				})(marker, places[i]);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), 
				itemStr = '<span class="markerbg marker_'+ (index + 1)+ '"></span>'
						+ '<div class="info"><h5>' + places.title + '</h5>';

			if (places.newAddress) {
				itemStr += ' span>' + places.newAddress + '</span>'
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

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new daum.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new daum.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), 
				fragment = document.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
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

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div class="col-lg-3" style="padding:5px;z-index:1;">' + title+ '</div>';
		
			infowindow.setContent(content);
			infowindow.open(map, marker);
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
					
		console.log("items.id == " + items.id);
		$.ajax({
			type: "Post",
			url: "/review/callPlanList",
			data:{
				id : items.id
			},
			success: function(response){
				console.log("came into ajax success line");
					for ( var i in response.planList) {
						content += '<li><a href="/review/showboard?plan_no='+response.planList[i].plan_no+'">'+response.planList[i].plan_no+'</a></li>';
						console.log(response.planList[i].plan_no);
					}
				content+='</ul></div>';
				
				console.log(content);
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
