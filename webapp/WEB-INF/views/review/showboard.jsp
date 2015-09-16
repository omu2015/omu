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
 <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
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

<style type="text/css">
.wsTable {
	background : #FFEFEF;
	border : 1px solid #E6D4D4;
}

.wsTable td{
	padding : 5px;
}
</style>

</head>
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
					<table class="wsTable">
						<tr>
							<td colspan="2">
																<div class="map_wrap">
																	<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
							
																	<div id="menu_wrap" class="bg_white">
																		<ul id="placesList"></ul>
																	</div>
																</div>
								</td>
						</tr>
						<tr>
							<td colspan="2">content2</td>
						</tr>
						<tr>
							<td colspan="2">content3</td>
						</tr>
						<tr>
							<td>memberId</td><td>regDate</td>
						</tr>
						<tr>
							<td colspan="2"><img src="" /></td>
						</tr>
						<tr>
							<td colspan="2">textArea</td>
						</tr>
						<tr>
							<td colspan="2">
								Comments Line
							</td>
						</tr>
					</table>
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

var infowindow = new daum.maps.InfoWindow({	zIndex : 1});
var infowindow2 = new daum.maps.InfoWindow({	zIndex : 2});

var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.


 			//console.log(JSON.parse(''));
       displayPlaces(JSON.parse('[{"content_no":2,"theme_no":2,"regDate":"2015-09-16 10:42:38.0","member_no":99999,"phone":"02-561-2627","newAddress":"서울 강남구 테헤란로2길 15","imageUrl":"http://cfile109.uf.daum.net/image/2556F95053B51B7511F680","direction":null,"zipcode":"135934","placeUrl":"http://place.map.daum.net/12557812","id":"12557812","title":"초콜릿호텔","category":"여행 > 숙박 > 여관,모텔","address":"서울 강남구 역삼동 825-29","longitude":"127.02931626635113","latitude":"37.49722015035048","addressBCode":"1168010100","cost":35000,"time":240},{"content_no":1,"theme_no":1,"regDate":"2015-09-16 10:38:43.0","member_no":99999,"phone":"02-3486-3456","newAddress":"서울 서초구 강남대로53길 8","imageUrl":null,"direction":null,"zipcode":"137858","placeUrl":"http://place.map.daum.net/14791165","id":"14791165","title":"비트교육센터","category":"교육,학문 > 학원","address":"서울 서초구 서초동 1327-15 비트아카데미빌딩 3층","longitude":"127.02809846805427","latitude":"37.49455346636902","addressBCode":"1165010800","cost":0,"time":30}]')); ///////////////////////////////////////////////////////////////////
       
// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
    	   console.log(places);

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    for ( var i=0; i<places.length; i++ ) {
		
        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

            
        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, items) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, items);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, items);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
            
          //click
			daum.maps.event.addListener(marker, 'click',
			function(){
				infowindow2.close();
				displayInfowindow2(marker, items);
			});
          
			itemEl.onclick = function(){
				infowindow2.close();
				displayInfowindow2(marker, items);
				
			};
            
			daum.maps.event.addListener(map, 'click',
					function(){
						infowindow.close();
						infowindow2.close();
					});
			
            
            
        })(marker, places[i]);

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
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.title + '</h5>';

    if (places.newAddress) {
        itemStr += '    <span>' + places.newAddress + '</span>' +
                    '   <span class="jibun gray">' +  places.address  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
	
    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}



// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, items) {
var content = '<div style="padding:5px; z-index:1;">'+items.title+'</div>';
    
    infowindow.setContent(content);
    infowindow.open(map, marker);
}

function displayInfowindow2(marker, items) {

    var content = '<div style="z-index:1;"><table onclick="'+items.placeUrl+'"><tr><td colspan="2">'+items.title+'</td></tr><tr>';

    if(items.imageUrl == null){
    	content += '<td colspan="2"><img height="200px" src="/product-images/2015816103038346.jpg"/></td>';
    }else{
    	content += '<td colspan="2"><img height="200px" src="'+items.imageUrl+'"/></td>';
    }
        content += '</tr><tr><td>'+items.cost+'</td><td>'+items.time+'</td></tr></table></div>';
    
    infowindow2.setContent(content);
    infowindow2.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>