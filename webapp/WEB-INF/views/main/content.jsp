<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
$(function(){
	for(var i=0; i<100; i++){
  $('#hanitrigger'+i).leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
  $('#hanitrigger2'+i).leanModal2({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
  $('#hanitrigger3'+i).leanModal3({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
	}
});
</script>
<!-- 내주변으로 검색, 카테고리 반복문으로 한개로 합치기, 덧글등록(콘텐츠까지) -->

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=bbef91da99f11fe76f4b3b523d3151e9&libraries=services"></script>
	<script>
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
				phone[i]=result.places[i].phone;
				newAddress[i]=result.places[i].newAddress;
				imageUrl[i]=result.places[i].imageUrl;
				direction[i]=result.places[i].direction;
				zipcode[i]=result.places[i].zipcode;
				placeUrl[i]=result.places[i].placeUrl;
				id[i]=result.places[i].id;
				title[i]=result.places[i].title;
				category[i] =result.places[i].category;
				address[i] =result.places[i].address;
				longitude[i] =result.places[i].longitude;
				latitude[i] =result.places[i].latitude;
				addressBCode[i] =result.places[i].addressBCode;				
				data[i] =  '<img style="width:375px;border:solid 1px #c7c7c7;margin-bottom:20px" src="'+imageUrl[i]+'">';
				$('#fd6'+[i]).html(data[i]);
				datapop[i] =  '<img style="width:600px" src="'+imageUrl[i]+'">'+
				'<div style="color:#fff;font-size:15px">'+
				'<div style="font-weight:bold;margin-top:10px;font-size:17px">'+title[i]+'</div>'+
				'<div style="float:right;margin-top:-15px">'+category[i]+'</div>'+
				'<div style="">'+address[i]+'</div>'+
				'<div style="float:right;margin-top:-15px">'+phone[i]+'</div></div>';
				$('#fd6pop'+[i]).html(datapop[i]);
				hidden[i] = '<input type="hidden" name="phone" value="'+phone[i]+'">'+
				'<input type="hidden" name="newAddress" value="'+newAddress[i]+'">'+	
				'<input type="hidden" name="imageUrl" value="'+imageUrl[i]+'">'+
				'<input type="hidden" name="direction" value="'+direction[i]+'">'+
				'<input type="hidden" name="zipcode" value="'+zipcode[i]+'">'+
				'<input type="hidden" name="placeUrl" value="'+placeUrl[i]+'">'+
				'<input type="hidden" name="id" value="'+id[i]+'">'+
				'<input type="hidden" name="title" value="'+title[i]+'">'+
				'<input type="hidden" name="category" value="'+category[i]+'">'+
				'<input type="hidden" name="address" value="'+address[i]+'">'+
				'<input type="hidden" name="longitude" value="'+longitude[i]+'">'+
				'<input type="hidden" name="latitude" value="'+latitude[i]+'">'+
				'<input type="hidden" name="addressBCode" value="'+addressBCode[i]+'">';
				$('#fd6hidden'+[i]).html(hidden[i]);
				}
				}
			};
		places.categorySearch('FD6', callback,{location: new daum.maps.LatLng(37.564968, 126.939909)}); 
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





<!-- 컨텐츠 리스트 -->
	<div>
		<ul>
			<li style="float:left;margin:10px 10px 0 0">
			<c:forEach var="fd6" begin="0" end="5">
			<a href="#contentfd6${fd6}" id="hanitrigger${fd6}"><div id="fd6${fd6 }"></div></a>
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
	<c:forEach var="fd6" begin="0" end="5">
		<div id="contentfd6${fd6}" style="display:none;">
			<div id="fd6pop${fd6 }" style="background-color:#2f3238;padding:10px"></div>
				<div style="width:620px;background-color:#fff;font-color:#c7c7c7;font-size:15px;height:50px;padding:10px">
				<form method="post" action="/commentwrite">
				<div id="fd6hidden${fd6 }"></div>
				<input type="hidden" name="member_no" value="${authUser.member_no }">
				<input type="text" name="message" id="message" size="70" >
				<input type="submit" value="댓글입력" style="height:30px;float:right">
				<div style="float:right;margin:8px 13px 0 0;font-weight:bold">${authUser.memberName }</div>
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

