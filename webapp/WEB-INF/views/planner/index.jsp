<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- css -->
<link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="../../assets/css/style.css" rel="stylesheet" />
<link href="../../assets/css/map.css" rel="stylesheet" />

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
<script type="text/javascript"	src="//apis.daum.net/maps/maps3.js?apikey=bbef91da99f11fe76f4b3b523d3151e9&libraries=services"></script>
<script type="text/javascript" src="/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/js/jquery.leanModal.min.js"></script>

</head>

<body>

	<!-- start header -->
	<c:import url="/WEB-INF/views/include/header_juso.jsp"/>
	<!-- end header -->
	
	<div class="plan_container">
		<!-- 맵  	-->
		<div id="currentLocation"><button onclick="geoFindMe();">현 위치 검색</button></div>
		<!-- <div style="margin-top:160px; margin-left:10px; position:fixed;"><input id="addPlanDate" type="Date" value="" /></div>
		<div style="margin-top:200px; margin-left:10px; position:fixed;"><button onclick="addPlan();">+ 일정추가</button></div>
		<div style="margin-top:240px; margin-left:10px; position:fixed;"><button onclick="showPlan();">내 일정보기</button></div>
		<div style="margin-top:300px; position:fixed;">
		<table id ="addPlan" style="display:none">
			<tr>	
				<td style="border:1px solid #000;">일정</td>
			</tr>
			<tr>	
				<td style="border:1px solid #000;"></td>
			</tr>
			<tr>
				<td style="border:1px solid #000;">계획</td>
			</tr>
		</table>
		<table id ="showPlan" style="display:none">
			<tr >	
				<td colspan="2" style="border:1px solid #000;">
				일정
				</td>
			</tr>
			<tr>	
				<td style="border:1px solid #000;">날짜</td>
				<td style="border:1px solid #000;">계획1</td>
			</tr>
		</table>
		</div> -->
		<div id="map"></div>
	</div>
	
 	<script>
 	function addPlan(){
 		$('#showPlan').hide();
 		$('#addPlan').show();
 		var planDate = $('#addPlanDate').val();
 		$('#addPlanDate').val($.trim($('#addPlanDate').val()));
		if ($('#addPlanDate').val()) {
			$.ajax({
				type : 'get',
			    url:'/planner/addPlan',
			    data : {
			    		planDate : planDate
			    },
			    dataType:'json',
			    success: function(response){
			    	$('#addPlan').html('<table id ="addPlan" style="display:none"><tr><td style="border:1px solid #000;">일정</td></tr><tr><td style="border:1px solid #000;">'+response.planDate+'</td></tr><tr><td style="border:1px solid #000;">계획</td></tr></table>');
			    } 
			 })
			
		} else
			alert("날짜를 입력하세요");
 		console.log(planDate);
 }
	</script>
	<script>
 	function showPlan(){
 		$('#addPlan').hide();
 		$('#showPlan').show();
 		$.ajax({
			type : 'get',
		    url:'/planner/showPlan',
		    data : {
		    },
		    dataType:'json',
		    success: function(response){
		    	var data = '<table id ="showPlan" style="display:none"><tr><td colspan="2" style="border:1px solid #000;">일정</td></tr>';
		    	for(var i=0; i<response.length; i++){
		    	data += '<tr><td style="border:1px solid #000;">'+response[i].planDate+'</td><td style="border:1px solid #000;">계획'+i+'</td></tr>'
		    	}
		    	data +='</table>';
		    	$('#showPlan').html(data);
		    } 
		 })
 	}
	</script>
	<!-- 
	<script>
	function test_gogo(){
		var gun = event.srcElement.value;
		var siView = event.srcElement.id;
		
		 $.ajax({
			type : 'get',
		    url:'/planner/test4',
		    data : {
		    		localValue : siView,
		    		localValue_test : gun
		    },
		    dataType:'json',
		    success: function(response){
		    	getDong(response,siView,gun);
				
		    }
		    
		    	

	});
		
	}
	</script>
	<script>
	function getDong(response,siView, gun){
		var dongList = response; 
		var gunView = gun;
		var siView = siView;
		
		var rData = "<h2><a>"+siView+'<a>><a>'+gunView+'<a>>'+"<h2>"; 

		try{ 
		var option=''; 
		var selected = false; 

		for(var i in dongList){	

		rData += '<button onclick="test_goMap()" value="'+dongList[i].dong+'" id="'+siView+gunView+'">'+dongList[i].dong+'</button>'; 

		} 
		   $('#local').html(rData); 

		}catch(e){ 
			alert("error")
		} 
		
	}
	</script>
	
	<script>
	function test_goMap() {
		
		var siViewGunView = event.srcElement.id;
		var dongView = event.srcElement.value;
		var juso = siViewGunView+dongView;
		 $.ajax({
			type : 'get',
		    url:'https://apis.daum.net/local/geo/addr2coord?apikey=bbef91da99f11fe76f4b3b523d3151e9&output=json',
		    data : {
		    		q : juso
		    },
		    dataType:'jsonp',
		    success: function(response){
		    	lat = response.channel.item[0].lat;
		    	lng = response.channel.item[0].lng;
		    } 
		 }).done(function(){
			 console.log(lat);
			 console.log(lng);
			 test_centerMap(lat, lng);
		 })
		close_modal('#local');
		
	}
	</script>
	<script>
	function close_modal(modal_id) {
		$("#lean_overlay").fadeOut(200);
		$(modal_id).css({
			"display" : "none"
		})
	}
	</script>
	

	</script>
	<script>
	function searchKeyword(){
		var keyword = document.getElementById("keyword").value;	// 키워드;
		var location = lat+','+lng;
		$.ajax({
			type : 'get',
		    url:'https://apis.daum.net/local/v1/search/keyword.json?apikey=bbef91da99f11fe76f4b3b523d3151e9&radius=20000',
		    data : {
		    		query : keyword,
		    		location : location 
		    },
		    dataType:'jsonp',
		    success: function(response){
		    	keywordMap(response);
		    }
		 })
	}
	</script>
	<script>
	function keywordMap(response){
		console.log(response);
		var latitude = new Array();
		var longitude = new Array();
		var title = new Array();
		var address = new Array();
		var placeUrl = new Array();
		var phone = new Array();
		var id = new Array();
		
		var response = response;
		for(var i=0; i<response.channel.item.length; i++){
    		latitude[i] = response.channel.item[i].latitude;
    		longitude[i] = response.channel.item[i].longitude;
    		title[i] = response.channel.item[i].title;
    		address[i] =response.channel.item[i].address;
    		placeUrl[i] =response.channel.item[i].placeUrl;
    		phone[i] =response.channel.item[i].phone;
    		id[i] =response.channel.item[i].id;
    		};
		var infowindow;
		
		var mapContainer = document.getElementById('map');// 지도를 표시할 div 
		var mapOption = {
			center : new daum.maps.LatLng(latitude[0], longitude[0]), // 지도의 중심좌표
			level : 3
		// 	지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다
		for(var i=0; i<latitude.length; i++){
			
			var markerPosition = new daum.maps.LatLng(latitude[i], longitude[i]);
			// 마커를 생성합니다
			marker[i] = new daum.maps.Marker({
			position : markerPosition,
			title : title[i]
			});
			// 마커가 지도 위에 표시되도록 설정합니다
			marker[i].setMap(map);
			
		}
		close_modal('#category');
		
	}
	
	</script>
	<script>
		daum.maps.event.addListener(marker, 'click', function() {
			  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
			console.log(this);
	});

	
	</script>
	<script>
	function infowindow_close(){
		infowindow2.close();
	} 
	</script>
	
	</div> -->


</body>
	<!-- 지도 생성	 -->
 	<script>
			
		var mapContainer = document.getElementById('map'), 
		mapOption = {
			center : new daum.maps.LatLng(37.5665350, 126.9779690), 
			level : 3
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption);
		
	</script>
	<!-- 현위치 검색 -->
	<script>
	function geoFindMe() {
	var lat;
    var lng;
	  if (!navigator.geolocation){
	    alert("사용자의 브라우저는 지오로케이션을 지원하지 않습니다.");
	    return;
	  }
	  function success(position) {
	    lat  = position.coords.latitude;
	    lng = position.coords.longitude;
	  	var moveLatLon = new daum.maps.LatLng(lat,lng);
	  	map.setCenter(moveLatLon);
	  	map.setLevel(3);
	  	setMarker(lat,lng);
	  	

	  };
	  function error() {
	   alert("사용자의 위치를 찾을 수 없습니다.");
	  };
	  navigator.geolocation.getCurrentPosition(success, error);
	}
</script>
<!-- marker 생성 -->
<script>
	 function setMarker(lat, lng, title,keyword,id) {
		var markerPosition = new daum.maps.LatLng(lat, lng);
		var title = title;
		var keyword = keyword;
		var id = id;
		var marker = new daum.maps.Marker({
			position : markerPosition,
			title : title,
			clickable: true
			
		});
		marker.setMap(map);
		infoMarker(marker, keyword, id);
	} 
</script>
<!--  click infowindow 실행 -->
<script>
	 function infoMarker(marker, keyword, id) {
		var wb = marker.getPosition().wb;
		var vb = marker.getPosition().vb;
		var iwContent = '<div style="padding:5px;">'+marker.getTitle()+'</div><button onclick=setCart('+wb+','+vb+',"'+keyword+'",'+id+',"${planList.plan_no}")>♥ 찜하기</button>&nbsp&nbsp&nbsp<button onclick="">후기보기</button>';
		
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
function searchKeyword(){
	var lat = [];
	var lng = [];
	var title = [];
	var id = [];
	var location = centerLat+','+centerLng;
	var keyword = document.getElementById("keyword").value;	// 키워드;
	$.ajax({
		type : 'get',
	    url:'https://apis.daum.net/local/v1/search/keyword.json?apikey=bbef91da99f11fe76f4b3b523d3151e9&radius=20000',
	    data : {
	    		query : keyword,
	    		location : location
	    },
	    dataType:'jsonp',
	    success: function(response){
	    	for(var i=0; i<response.channel.item.length; i++){
				lat[i] = response.channel.item[i].latitude;
				lng[i] = response.channel.item[i].longitude;
				title[i] = response.channel.item[i].title;
				id[i] = response.channel.item[i].id;
				
				setMarker(lat[i],lng[i],title[i],keyword,id[i]);
	    	}
	    	var moveLatLon = new daum.maps.LatLng(lat[0],lng[0]);
		  	map.setCenter(moveLatLon);
		  	map.setLevel(3);
	    }
	 })
}

</script>
<script>
function setCart(wb, vb, keyword, id, plan_no){
	console.log(plan_no);
	var places = new daum.maps.services.Places();
	var lat = wb;
	var lng = vb;
	var keyword = keyword;
	var id = id;
	var content ;
	
	var callback = function(status, result) {
	    if (status === daum.maps.services.Status.OK) {
	        for(var i=0; i<result.places.length; i++){
	        		if(id == result.places[i].id){
	        			content = result.places[i];
	        			
	        		}
	    		}
	        	console.log(content);
	        	$.ajax({
	        		type : 'get',
	        	    url:'/planner/addCart',
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
	        	    		latitude :content. latitude,
	        	    		addressBCode : content.addressBCode
	        	    },
	        	    dataType:'json',
	        	    success: function(response){
	        	    	console.log(response);
	        	    	}
	        	 })
				
	        }
	};
	places.keywordSearch(keyword, callback, {location : new daum.maps.LatLng(lat, lng)});
	

}
</script>

</html>