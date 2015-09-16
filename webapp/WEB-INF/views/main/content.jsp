<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
$(function(){
	for(var i=0; i<100; i++){
  $('#hanitrigger'+i).leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
	}
});
$(function(){
	for(var i=0; i<100; i++){
  $('#hanitrigger2'+i).leanModal2({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
	}
});
$(function(){
	for(var i=0; i<100; i++){
  $('#hanitrigger3'+i).leanModal3({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
	}
});
</script>
<!-- 	<script>
		var places = new daum.maps.services.Places();
		var imgurl = [];
		var contitle = [];
		var callback = function(status, result) {
			if (status === daum.maps.services.Status.OK) {
				console.log(result);
				
				var data ='<img style="width:375px;margin-bottom:30px;border:solid 1px #c7c7c7" src="'+result.places[0].imageUrl+'">';
				for(var i=1; i<10; i++){
				if(result.places[i].imageUrl!=""){
					
				imgurl[i]=result.places[i].imageUrl;

				data +=  '<img style="width:375px;margin-bottom:30px;border:solid 1px #c7c7c7" src="'+imgurl[i]+'">';
				console.log(result.places[i].imageUrl);
				}
				 $('#con2').html(data); 
				}
			}
			};
		places.categorySearch('AD5', callback,{location: new daum.maps.LatLng(37.564968, 126.939909)}); 
	</script>
	-->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=bbef91da99f11fe76f4b3b523d3151e9&libraries=services"></script>
	<script>
		var places = new daum.maps.services.Places();
		var imgurl = [];
		var data = [];
		var datapop = [];
		var callback = function(status, result) {
			if (status === daum.maps.services.Status.OK) {
				for(var i=0; i<10; i++){
				imgurl[i]=result.places[i].imageUrl;
				data[i] =  '<img style="width:375px;border:solid 1px #c7c7c7;margin-bottom:20px" src="'+imgurl[i]+'">';
				$('#fd6'+[i]).html(data[i]);
				datapop[i] =  '<img style="width:600px" src="'+imgurl[i]+'">';
				$('#fd6pop'+[i]).html(datapop[i]);
				}
				}
			};
		places.categorySearch('FD6', callback,{location: new daum.maps.LatLng(37.564968, 126.939909)}); 
	</script>
	
	
	 
		<script>
		var places = new daum.maps.services.Places();
		var callback = function(status, result) {
			if (status === daum.maps.services.Status.OK) {
				console.log(result);
				console.log("result="+result);
				console.log("result.places[0].address="+result.places[0].address);
				fd6address = [];
				for(var i=0;i<10;i++){
					console.log(result.places[i].address)
					fd6address[i] =  result.places[i].address
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
				imgurl[i]=result.places[i].imageUrl;
				data[i] =  '<img style="width:375px;border:solid 1px #c7c7c7;margin-bottom:20px" src="'+imgurl[i]+'">';
				$('#ad5'+[i]).html(data[i]);
				datapop[i] =  '<img style="width:600px" src="'+imgurl[i]+'">';
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
				imgurl[i]=result.places[i].imageUrl;
				data[i] =  '<img style="width:375px;border:solid 1px #c7c7c7;margin-bottom:20px" src="'+imgurl[i]+'">';
				$('#ce7'+[i]).html(data[i]);
				datapop[i] =  '<img style="width:600px" src="'+imgurl[i]+'">';
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
			<div id="fd6pop${fd6 }" ></div>
			<div style="width:600px;background-color:#2f3238;color:#fff;height:60px;text-align:center;font-size:15px">${fd6address1 }</div>
				<div style="width:600px;background-color:#fff;font-color:#c7c7c7;font-size:15px;height:70px;padding:10px">
				<form method="post" action="/commentwrite">
				<input type="text" name="message" id="message" size="70" >
				${authUser.memberName }
				<input type="submit" value="댓글입력" style="height:50px">
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

<!-- <div class="row">
<div class="col-lg-12">
<div class="row">
<section id="projects">
<ul id="thumbs" class="portfolio">
<li class="col-lg-3 design" data-id="id-0" data-type="web">
<div id="con" class="item-thumbs">
</div></li>
</ul>
</section>
</div>
</div>
</div> -->


