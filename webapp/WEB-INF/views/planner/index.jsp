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

ul.showPlan,ul.viewPlan, ul.showPlanner{
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
ul.viewPlan li, ul.showPlanner li {
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
ul.showPlan li:hover, ul.viewPlan li:hover, ul.showPlanner li:hover{
background-color:#FDB7C8;
cursor: pointer;
}
a.btn{	padding:0;
		margin-left:300px;
		position: fixed;
}

</style>

</head>

<body>
	<!-- start header -->
	<c:import url="/WEB-INF/views/include/header_juso.jsp" />
	<!-- end header -->

	<div class="plan_container">
		<div class="backgroundImage"></div>
		<div class="sub-menu" id="sub-menu">
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
				<button onclick="dPlan()">
					일정삭제<img src="/assets/img/button/trash.png">
				</button>
			</div>
			<!-- <div class="showPlanner">
			</div> -->
				<ul class="showPlanner" id="showPlanner"></ul>
				<div id="pagination"></div>
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
		function dPlan(){
			$(".btn").show()
		}
		function deletePlan(plan_no, num){
			if (confirm(num+'번째 플랜을 삭제하시겠습니까?')) {
				$.ajax({
					type : 'get',
				    url:'/planner/deletePlan',
				    data : {
				    		plan_no : plan_no
				    },
				    dataType:'json',
				    success: function(response){
			    		alert('삭제되었습니다.');
				    }
				 })
				    location.reload();
			} else {
				alert('삭제취소 되었습니다.');
				location.reload();
			}
			
		}
	</script>
	<script>
	var planDate = "${param.planDate}";
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
	    	data += '<li><a href="javascript:viewPlan('+response[i].plan_no+','+parseInt(i+1)+')">'+parseInt(i+1)+'번째 플랜<a class="btn" href="javascript:deletePlan('+response[i].plan_no+','+parseInt(i+1)+')" style="display:none;"><img src="/assets/img/button/trashBlack.png"/></a></li>'
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
//마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB,{location:map.getCenter()}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data.places);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;
    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('showPlanner'), 
    menuEl = document.getElementById('sub-menu'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
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
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].title);

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

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
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
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
</html>