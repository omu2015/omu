<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"	src="//apis.daum.net/maps/maps3.js?apikey=bbef91da99f11fe76f4b3b523d3151e9"></script>
<script>
function gogo(){
	var a = new Array();
	var b = new Array();
	var c ; // 주소 위도경도 location
	var d = document.getElementById("category1").value;	// 키워드
	var juso = document.getElementById("sample6_address").value;
	var title = [];
	
	console.log("입력주소      " + juso);
	console.log("입력키워드명      " + d);
	
	$.ajax({
	type : 'get',
    url:'https://apis.daum.net/local/geo/addr2coord?apikey=bbef91da99f11fe76f4b3b523d3151e9&output=json',
    data : { q : juso
    			},
    dataType:'jsonp',
    success:function(response){
    	var longitude = response.channel.item[0].point_x;
    	var latitude = response.channel.item[0].point_y;
		c = latitude+","+longitude ; // 주소 위도경도 location
		
		$.ajax({
		type : 'get',
	    url:'https://apis.daum.net/local/v1/search/keyword.json?apikey=bbef91da99f11fe76f4b3b523d3151e9&radius=20000',
	    data : {  
	    	location : c,
	    	query : d
	    },
	    dataType:'jsonp',
	    success:function(response){
	    	for(var i=0; i<response.channel.item.length; i++){
	    		a[i] = response.channel.item[i].latitude;
	    		b[i] = response.channel.item[i].longitude;
	    		title[i] = response.channel.item[i].title;
	    		}
			}
		// 지도의 확대 레벨 
		}).done(function() {
			var marker = [];
			var infowindow;
			
			var mapContainer = document.getElementById('map');// 지도를 표시할 div 
			var mapOption = {
				center : new daum.maps.LatLng(a[0],b[0]), // 지도의 중심좌표
				level : 3
			// 	지도의 확대 레벨
			};

			var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			// 마커가 표시될 위치입니다
			for(var i=0; i<a.length; i++){
				
				var markerPosition = new daum.maps.LatLng(a[i], b[i]);
			
				// 마커를 생성합니다
				
				marker[i] = new daum.maps.Marker({
				position : markerPosition,
				title : title[i]
				});
				// 마커가 지도 위에 표시되도록 설정합니다
				marker[i].setMap(map);
				
				// 마커에 마우스오버 이벤트를 등록합니다
				daum.maps.event.addListener(marker[i] , 'mouseover', function() {
				  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
				  	infowindow = new daum.maps.InfoWindow({
				    	content : this.getTitle()
				  	});
				    	infowindow.open(map, this)
				});

				// 마커에 마우스아웃 이벤트를 등록합니다
				daum.maps.event.addListener(marker[i], 'mouseout', function() {
				    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
				    infowindow.close();
				});

				}

			// 인포윈도우를 생성합니다
						}) ;
		}
	})
} 

</script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;
            }
        }).open();
    }
</script>
<head>
<meta charset="utf-8" />
<title>Daum 지도 시작하기</title>
</head>
<body>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<!-- 
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.5665350, 126.9779690), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	</script>  -->
	<div>
		<form action="#" method="get">
		<table>
			<tr>
				<td>카테고리</td>
				<td><select name="">
						<option value="놀고" selected>놀고</option>
						<option value="먹고">먹고</option>
						<option value="자고">자고</option>
				</select></td>
			</tr>
			<tr>
				<td>상점이름</td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td rowspan="2" class="title">주소</td>
				<td colspan="2"><input name="zipCode" id="sample6_postcode" class="txt" style="width: 10%; text-align: center;" maxlength="6" value="" readonly="readonly"/>
								<input type="button"  onclick="sample6_execDaumPostcode()" name="searchPost" value="우편번호검색" /></td>
			</tr>
			<tr>
				<td colspan="2"><input name="address" id="sample6_address"
					class="txt" style="width: 100%;" value="" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><select name="phoneNum1">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
						<option value="">없음</option>
				</select> <input type="text" maxlength="4"> <input type="text"
					maxlength="4"></td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="button" name="addPic"
					style="display: block; width: 100px; margin: 0; text-align: center;"
					value="사진등록" /></td>
				<td><input type="button" name="addPic"
					style="display: block; width: 100px; margin: 0; text-align: center;"
					value="사진등록" /></td>
				<td><input type="button" name="addPic"
					style="display: block; width: 100px; margin: 0; text-align: center;"
					value="사진등록" /></td>
				<td><input type="button" name="addPic"
					style="display: block; width: 100px; margin: 0; text-align: center;"
					value="사진등록" /></td>
				<td><input type="button" name="addPic"
					style="display: block; width: 100px; margin: 0; text-align: center;"
					value="사진등록" /></td>
				<td><input type="button" name="addPic"
					style="display: block; width: 100px; margin: 0; text-align: center;"
					value="사진등록" /></td>

			</tr>
			<tr>
				<td>상점 홈페이지 주소</td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td>이용시간</td>
				<td><select>
						<c:forEach var="i" begin="0" end="24">
							<option value="${i}">${i}</option>
						</c:forEach>
				</select> 시</td>
				<td><select>
						<c:forEach var="i" begin="0" end="60">
							<option value="${i}">${i}</option>
						</c:forEach>
				</select> 분 ~</td>
				<td><select>
						<c:forEach var="i" begin="0" end="24">
							<option value="${i}">${i}</option>
						</c:forEach>
				</select> 시</td>
				<td><select>
						<c:forEach var="i" begin="0" end="60">
							<option value="${i}">${i}</option>
						</c:forEach>
				</select> 분 까지</td>

			</tr>
			<tr>
				<td>비용</td>
				<td><textarea></textarea></td>
			</tr>
			<tr>
				<td>
					<input type="text" id="category1">					
				</td>
			</tr>
		</table>
		</form>
		<input type="button" name="addPic" onclick="gogo()"
					style="display: block; width: 100px; margin: 0; text-align: center;"
					value="고고" />
	</div>
</body>
</html>