<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
$(function(){
	for(var i=0; i<1000; i++){
  $('#hanitrigger'+i).leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
	}
});
</script>
<!-- 내주변으로 검색, 카테고리 반복문으로 한개로 합치기, 덧글등록(콘텐츠까지) -->
<script>
$(function(){
	var lat;
	var lng;
	  if (!navigator.geolocation){
	    alert("사용자의 브라우저는 지오로케이션을 지원하지 않습니다.");
	    return;
	  }
	  function success(position) {
	    lat  = position.coords.latitude;
	    lng = position.coords.longitude;
	  }
	  function error() {
		   alert("사용자의 위치를 찾을 수 없습니다.");
	  };
	  navigator.geolocation.getCurrentPosition(success, error);
	  insertContent(lat, lng)
}) 
</script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=bbef91da99f11fe76f4b3b523d3151e9&libraries=services"></script>
	<script>
	function insertContent(lat, lng){
		var lat = 37.564968;
		var lng = 126.939909;
		var userLat =lat;
		var userLng =lng;
		var interestKeyword='AD5';
		var places = new daum.maps.services.Places();
		var phone = [];
		var newAddress = [];
		var imageUrl = [];
		var direction = [];
		var zipcode = [];
		var placeUrl = [];
		var id = [];
		var title = [];
		var category = [];
		var address = [];
		var longitude = [];
		var latitude = [];
		var addressBCode = [];		
		var data = [];			//index의 content list
		var datapop = [];	//index의 content list의 모달팝업
		var hidden = [];		//덧글입력시 content table에 들어갈 정보
		var callback = function(status, result) {
			if (status === daum.maps.services.Status.OK) {
				for(var i=0; i<10; i++){
				testOne(result.places[i]);
				console.log(result.places[i].category)
					}
				}
			};
		places.categorySearch(interestKeyword, callback,{location: new daum.maps.LatLng(userLat, userLng)});
	}
	</script>
	<script>
	function testOne(places){
		var address = places.address;
		var addressBCode = places.addressBCode;
		var direction = places.direction;
		var id = places.id;
		var imageUrl = places.imageUrl;
		var latitude = places.latitude;
		var longitude = places.longitude;
		var newAddress = places.newAddress;
		var phone = places.phone;
		var placeUrl = places.placeUrl;
		var title = places.title;
		var zipcode= places.zipcode;
		var category = places.category;
		$.ajax({
			type : 'get',
		    url:'/test123',
		    data : {
		    		address : address,
		    		addressBCode : addressBCode,
		    		direction : direction,
		    		id : id,
		    		imageUrl : imageUrl,
		    		latitude : latitude,
		    		longitude : longitude,
		    		newAddress : newAddress,
		    		phone : phone,
		    		placeUrl : placeUrl,
		    		title : title,
		    		zipcode : zipcode,
		    		category : category
		    },
		    dataType:'json',
		    success: function(response){
		    	console.log(response);
		    } 
		 })
		
	}
	</script>
	
	
<!-- 	<script>
		var places = new daum.maps.services.Places();
		var imgurl = [];
		var data = [];
		var datapop = [];
		var callback = function(status, result) {
			if (status === daum.maps.services.Status.OK) {
				for(var i=0; i<10; i++){
				imageUrl[i]=result.places[i].imageUrl;
				data[i] =  '<img style="width:375px;border:solid 1px #c7c7c7;margin-bottom:20px" src="'+imageUrl[i]+'">';
				$('#ad5'+[i]).html(data[i]);
				datapop[i] =  '<img style="width:600px" src="'+imageUrl[i]+'">';
				$('#ad5pop'+[i]).html(datapop[i]);
				}
				}
			};
		places.categorySearch('AD5', callback,{location: new daum.maps.LatLng(37.564968, 126.939909)}); 
	</script>
	<script>
		var places = new daum.maps.services.Places();
		var imgurl = [];
		var data = [];
		var datapop = [];
		var callback = function(status, result) {
			if (status === daum.maps.services.Status.OK) {
				for(var i=0; i<10; i++){
				imageUrl[i]=result.places[i].imageUrl;
				data[i] =  '<img style="width:375px;border:solid 1px #c7c7c7;margin-bottom:20px" src="'+imageUrl[i]+'">';
				$('#ce7'+[i]).html(data[i]);
				datapop[i] =  '<img style="width:600px" src="'+imageUrl[i]+'">';
				$('#ce7pop'+[i]).html(datapop[i]);
				}
				}
			};
		places.categorySearch('CE7', callback,{location: new daum.maps.LatLng(37.564968, 126.939909)}); 
	</script>
 



 -->
<!-- 컨텐츠 리스트 -->
	<div>
		<ul>
			<li style="float:left;margin:10px 10px 0 0">
			<c:forEach var="i"  items="${contentList}">
			<a href="#contentfd${i.content_no}" id="hanitrigger${i.content_no }"><img src="${i.imageUrl }"></a>
			</c:forEach>
			</li>
		</ul>
		<ul>
			<li style="float:left;margin:10px 10px 0 10px">
			<c:forEach var="ad5" begin="0" end="5">
			<a href="#contentad5${ad5}" id="hanitrigger2${ad5}"><div id="ad5${ad5 }"></div></a>
			</c:forEach>
			</li>
		</ul>
		<ul>
			<li style="float:left;margin:10px 0 0 10px">
			<c:forEach var="ce7" begin="0" end="5">
			<a href="#contentce7${ce7}" id="hanitrigger3${ce7}" ><div id="ce7${ce7 }"></div></a>
			</c:forEach>
			</li>
		</ul>
	</div>





<!-- 모달 팝업 -->
	<c:forEach var="i" items="${contentList }">
		<div id="contentfd${i.content_no}" style="display:none; " >
				<div style="width:620px;background-color:#fff;font-color:#c7c7c7;font-size:15px;height:500px;padding:10px">
				<form method="post" action="/commentwrite">
				<input type="hidden" name="member_no" value="${authUser.member_no }">
				<table>
					<tr>
						<td rowspan="2"><img src="${i.imageUrl }"></td><td>상점명</td><td>${i.title}</td>
					</tr>
						<td></td><td>연락처</td><td>${i.phone }</td>
					<tr>
					</tr>
					
				</table>
				
				<a href="/contentView?content_no=${i.content_no}">상세보기</a>
				</form>
			</div>
		</div>
	</c:forEach>
	
	<c:forEach var="ad5" begin="0" end="5">
		<div id="contentad5${ad5}" style="display:none;">
			<div id="ad5pop${ad5 }" ></div>
			<div style="width:600px;background-color:#2f3238;color:#fff;height:60px;text-align:center;font-size:15px"></div>
				<div style="width:600px;background-color:#fff;font-color:#c7c7c7;font-size:15px;height:70px;padding:10px">
				<form method="post" action="/commentwrite">
				<input type="text" name="message" id="message" size="70" >
				${authUser.memberName }
				<input type="submit" value="댓글입력" style="height:50px">
				</form>
			</div>
		</div>
	</c:forEach>
	
	<c:forEach var="ce7" begin="0" end="5">
		<div id="contentce7${ce7}" style="display:none;">
			<div id="ce7pop${ce7 }" ></div>
			<div style="width:600px;background-color:#2f3238;color:#fff;height:60px;text-align:center;font-size:15px"></div>
				<div style="width:600px;background-color:#fff;font-color:#c7c7c7;font-size:15px;height:70px;padding:10px">
				<form method="post" action="/commentwrite">
				<input type="text" name="message" id="message" size="70" >
				${authUser.memberName }
				<input type="submit" value="댓글입력" style="height:50px">
				</form>
			</div>
		</div>
	</c:forEach>

