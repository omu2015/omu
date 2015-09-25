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
<script type="text/javascript" charset="utf-8"
	src="/assets/js/jquery.leanModal.min.js"></script>
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
<script type="text/javascript" charset="utf-8"
	src="/assets/js/jquery.leanModal.min.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=c12b4d88c8259cf4652b89c1f64db8e8&libraries=services"></script>

<style type="text/css">
.back {
   text-align:center;
	-moz-box-shadow:inset 0px 1px 0px 0px #fdb7c8;
	-webkit-box-shadow:inset 0px 1px 0px 0px #fdb7c8;
	box-shadow:inset 0px 1px 0px 0px #fdb7c8;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #fdb7c8), color-stop(1, #fdb7c8) );
	background:-moz-linear-gradient( center top, #fdb7c8 5%, #fdb7c8 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fdb7c8', endColorstr='#fdb7c8');
	background-color:#fdb7c8;
	-webkit-border-top-left-radius:42px;
	-moz-border-radius-topleft:42px;
	border-top-left-radius:42px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:42px;
	-moz-border-radius-bottomright:42px;
	border-bottom-right-radius:42px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0px;
	border:1px solid #fdb7c8;
	display:inline-block;
	color:#fff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:42px;
	line-height:42px;
	width:91px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #fdb7c8;
}
.back:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #fdb7c8), color-stop(1, #fdb7c8) );
	background:-moz-linear-gradient( center top, #fdb7c8 5%, #fdb7c8 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fdb7c8', endColorstr='#fdb7c8');
	background-color:#fdb7c8;
}.back:active {
	position:relative;
	top:1px;
}</style>

<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>
<style>
.dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	bottom: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.dotOverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.number {
	font-weight: bold;
	color: #ee6152;
}

.dotOverlay:after {
	content: '';
	position: absolute;
	margin-left: -6px;
	left: 50%;
	bottom: -8px;
	width: 11px;
	height: 8px;
	background:
		url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
}

.distanceInfo {
	position: relative;
	top: 5px;
	left: 5px;
	list-style: none;
	margin: 0;
}

.distanceInfo .label {
	display: inline-block;
	width: 50px;
	color: #191919;
}

.distanceInfo:after {
	content: none;
}
</style>
<script>
					function modifyBoard(bno,pno){
						alert("구현하기 귀찮지롱 메롱메롱");
						location.href="/review/modify?plan_no="+pno+"&board_no="+bno;
						//history.back();
					}
					function deleteBoard(bno){
								 if(confirm("정말 삭제하시겠습니까?")){
								  location.href="/review/delete?board_no="+bno;
								 }
								 else{
								 //취소
								 }
					}
					function goodButton(bno,pno){
						location.href="/review/good?plan_no="+pno+"&board_no="+bno;
					}
					function capturePlan(bno){
						location.href="/review/capture?board_no="+bno;
					}
					</script>
</head>
<body>
<div id="wrapper">
	<!-- start header -->
			<!-- start header -->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<c:import url="/WEB-INF/views/include/header_mypage.jsp">
		<c:param name="pageName" value="myBoardView"/>
		</c:import>
		<!-- end header -->
		
	<!-- end header -->
<div class="container">
	<div class="row">
			<div class="col-lg-12">
				<h4 class="heading"></h4>
				<div class="row">
					<div class="wsTable">
					<table>
						<c:if test="${not empty boardVo}">
						<tr class="wshd">
							<td>작성자  : ${memberId}</td><td>등록 일자 : ${boardVo.getRegDate()}</td>
						</tr>
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
						<tr class="wshd">
							<td>총비용 : ${planVo.getTotalCost()} 원</td><td>총시간  : ${planVo.getTotalTime()} 분</td>
						</tr>
						<tr>
						<c:forEach var="bibl" items="${boardImgBoxList }">
							<td colspan="2"><img height="350px" src="${bibl.getImageUrl()}" /></td>
						</c:forEach>
						</tr>
						<tr>
							<td class="messagebox" colspan="2">${boardVo.getMessage()}</td>
						</tr>
						
						<tr class="wshd">
						<c:choose>
						<c:when test="${authUser.getMember_no() eq boardVo.getMember_no()}">
						<td onclick="modifyBoard(${boardVo.getBoard_no()},${planVo.getPlan_no()})">수정</td><td onclick="deleteBoard(${boardVo.getBoard_no()})">삭제</td>
						</c:when>
						<c:otherwise>
						<td onclick="goodButton(${boardVo.getBoard_no()},${planVo.getPlan_no()}); return false;">좋아요</td><td onclick="capturePlan(${boardVo.getBoard_no()})">일정 가져오기</td>
						</c:otherwise>
						</c:choose>
						</tr>
						</c:if>
					</table>
					</div>
					<hr>
					<div class="wsTable">
				<table>
								<c:forEach var="bcVo" items="${commentsMap.boardCommentsList}" varStatus="status">
									<tr>
										<td>${commentsMap.memberList.get(status.index).getMemberId()}</td>
										<td colspan="6" class="nct">  :   ${   bcVo.getMessage() }</td>
									</tr>
								</c:forEach>
					</table> 
					</div>
					<div class="wsTable">
					<form action="/mypage/insertcomment" method="post">
					<table>
						<tr>
						<td><span>${authUser.getMemberId()}</span>
							<input type="hidden" name="board_no" value="${boardVo.getBoard_no()}">
							<input type="hidden" name="plan_no" value="${boardVo.getPlan_no()}">
							<input type="hidden" name="member_no" value="${authUser.getMember_no() }"></td>
							<td colspan="6"><textarea id="messagecheck" class="messagebox" name="message"></textarea></td>
							<td><input type="submit" class="back" value="댓글등록"></td>						
						</tr>
						<tr>
						    <td>
						       <a href="/mypage/boardview"><input type="button" class="back" value="되돌아가기" ></a>
						    </td>
						</tr>
					</table>
					</form>
					</div>
					<c:import url="/WEB-INF/views/mypage/boardview.jsp"></c:import>
				</div>
		</div>
</div>	
</div><!-- main -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
</div><!-- wrapper -->
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
  <script>
   $(function(){
	   $(".wsTable").submit(function(){
		   var $message = $("#messagecheck");
		   var message = $message.val();
		   if(message==""){
			   alert("댓글을 먼저 입력해주세요");
			   return false;
		   }
		   return true;
	   });
   });
  
  </script>

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

/////////////////////////////////////////////////////////////////////////////////

var clickLine = new daum.maps.Polyline(
	{
		map : map, // 선을 표시할 지도입니다 
		path : [], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
		strokeWeight : 3, // 선의 두께입니다 
		strokeColor : '#db4040', // 선의 색깔입니다
		strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		strokeStyle : 'solid' // 선의 스타일입니다
	}); // 마우스로 클릭한 좌표로 그려질 선 객체입니다
	
var distance;
var position;

var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
var dots = []; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.


///////////////////////////////////////////
	
var jsonCL = JSON.parse('${jsonCL}');

 			for (var k = 0; k < jsonCL.length; k++) {
			findWay(jsonCL[k]);
		}
 			
displayPlaces(jsonCL); ///////////////////////////////////////////////////////////////////

       
       
       
// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

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
var content = '<div style="padding:5px; z-index:1;"><table><tr><td>'+items.title+'</td></tr><tr><td>'+items.newAddress+'</td></tr></div>';
    
    infowindow.setContent(content);
    infowindow.open(map, marker);
}

function displayInfowindow2(marker, items) {

    var content = '<div style="z-index:1;"><table><tr><td colspan="2">'+items.title+'</td></tr><tr>';

    if(items.imageUrl == null){
    	content += '<td colspan="2"><img height="200px" src="/product-images/2015816103038346.jpg"/></td>';
    }else{
    	content += '<td colspan="2"><img height="200px" src="'+items.imageUrl+'"/></td>';
    }
        content += '</tr><tr><td>'+items.cost+'</td><td>'+items.time+'</td></tr><tr><td colspan="2"><a href="'+items.placeUrl+'">웹 주소로 이동하기</a></td></tr></table></div>';
    
    infowindow2.setContent(content);
    infowindow2.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 
 
 
 
 
 
 
//2015 09 07 2시 19 분 mapp.js 추가


function findWay(items){
	
		position = new daum.maps.LatLng(items.latitude , items.longitude);
		map.setCenter(position);
	
		 var path = clickLine.getPath();
        path.push(position);
        clickLine.setPath(path);

        distance = Math.round(clickLine.getLength());
        
		
		// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
		var circleOverlay1 = new daum.maps.CustomOverlay({
			content : '<span class="dot"></span>',
			position : position,
			zIndex : 1
		});

		// 지도에 표시합니다
		circleOverlay1.setMap(map);

		if (distance > 0) {
			// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
			var distanceOverlay1 = new daum.maps.CustomOverlay({
				content : '<div class="dotOverlay">거리 <span class="number">'
						+ distance + '</span>m</div>',
				position : position,
				yAnchor : 1,
				zIndex : 2
			});

			// 지도에 표시합니다
			distanceOverlay1.setMap(map);
		}

		// 배열에 추가합니다
		dots.push({
			circle : circleOverlay1,
			distance : distanceOverlay1
		});
	

		/////////////////////////////////////////////////////////////////////////////////

		displayCircleDot(position, distance);
		
		// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
		// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
		function displayCircleDot(position, distance) {

			// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
			var circleOverlay = new daum.maps.CustomOverlay({
				content : '<span class="dot"></span>',
				position : position,
				zIndex : 1
			});

			// 지도에 표시합니다
			circleOverlay.setMap(map);

			if (distance > 0) {
				// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
				var distanceOverlay = new daum.maps.CustomOverlay(
						{
							content : '<div class="dotOverlay">거리 <span class="number">'
									+ distance + '</span>m</div>',
							position : position,
							yAnchor : 1,
							zIndex : 2
						});

				// 지도에 표시합니다
				distanceOverlay.setMap(map);
			}

			// 배열에 추가합니다
			dots.push({
				circle : circleOverlay,
				distance : distanceOverlay
			});
		}

		// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
		// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
		// HTML Content를 만들어 리턴하는 함수입니다
		
};




var contenta = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다

//console.log("contenta === " + contenta);
// 그려진 선의 거리정보를 지도에 표시합니다
showDistance(contenta, position);
		
		
		
		
		
// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
function showDistance(content, position) {
	
	if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
		// 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
		distanceOverlay.setPosition(position);
		distanceOverlay.setContent(content);

	} else { // 커스텀 오버레이가 생성되지 않은 상태이면
		// 커스텀 오버레이를 생성하고 지도에 표시합니다
		distanceOverlay = new daum.maps.CustomOverlay({
			map : map, // 커스텀오버레이를 표시할 지도입니다
			content : content, // 커스텀오버레이에 표시할 내용입니다
			position : position, // 커스텀오버레이를 표시할 위치입니다.
			xAnchor : 0,
			yAnchor : 0,
			zIndex : 3
		});
	}
}
		
		
		
function getTimeHTML(distance) {

	// 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
	var walkkTime = distance / 67 | 0;
	var walkHour = '', walkMin = '';

	// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
	if (walkkTime > 60) {
		walkHour = '<span class="number">' + Math.floor(walkkTime / 60)
				+ '</span>시간 '
	}
	walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

	// 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
	var bycicleTime = distance / 227 | 0;
	var bycicleHour = '', bycicleMin = '';

	// 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
	if (bycicleTime > 60) {
		bycicleHour = '<span class="number">'
				+ Math.floor(bycicleTime / 60) + '</span>시간 '
	}
	bycicleMin = '<span class="number">' + bycicleTime % 60
			+ '</span>분'

	// 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
	var content = '<ul class="dotOverlay distanceInfo">';
	content += '    <li>';
	content += '        <span class="label">총거리</span><span class="number">'
			+ distance + '</span>m';
	content += '    </li>';
	content += '    <li>';
	content += '        <span class="label">도보</span>' + walkHour
			+ walkMin;
	content += '    </li>';
	content += '    <li>';
	content += '        <span class="label">자전거</span>' + bycicleHour
			+ bycicleMin;
	content += '    </li>';
	content += '</ul>'

	return content;
}










</script>


