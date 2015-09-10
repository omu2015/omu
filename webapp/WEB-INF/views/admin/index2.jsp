<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- css -->
<link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="../../assets/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="../../assets/css/jcarousel.css" rel="stylesheet" />
<link href="../../assets/css/flexslider.css" rel="stylesheet" />
<link href="../../assets/css/style.css" rel="stylesheet" />
<link href="../../assets/css/table.css" rel="stylesheet" />
<link href="../../assets/css/map.css" rel="stylesheet" />
<link href="/assets/css/common.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/layout2.css" rel="stylesheet" type="text/css" />

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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"   src="//apis.daum.net/maps/maps3.js?apikey=bbef91da99f11fe76f4b3b523d3151e9"></script>
<script type="text/javascript" src="/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/js/jquery.leanModal.min.js"></script>

<script type="text/javascript">
$(function(){
  $('#loginform').submit(function(e){
     return false;
  });
  $('#modaltrigger').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
});
</script>
<script>

var marker = [];

function gogo(){
   var a = new Array();
   var b = new Array();
   var c ; // 주소 위도경도 location
   var d = document.getElementById("category1").value;   // 키워드
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
         var infowindow;
         var infowindow2;
         
         var mapContainer = document.getElementById('map');// 지도를 표시할 div 
         var mapOption = {
            center : new daum.maps.LatLng(a[0],b[0]), // 지도의 중심좌표
            level : 3
         //    지도의 확대 레벨
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
            daum.maps.event.addListener(marker[i] , 'click', function() {
                  infowindow.close();
              // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                 infowindow2 = new daum.maps.InfoWindow({
                   content : '<div class="overlaybox">' +
                    '    <div class="boxtitle">금주 영화순위</div>' +
                    '    <div class="first">' +
                    '        <div class="triangle text">1</div>' +
                    '        <div class="movietitle text"><button onclick="infowindow2()">X</button></div>' +
                    '    </div>' +
                    '    <ul>' +
                    '        <li class="up">' +
                    '            <span class="number">2</span>' +
                    '            <span class="title">'+this.getTitle()+'</span>' +
                    '            <span class="arrow up"></span>' +
                    '            <span class="count">2</span>' +
                    '        </li>' +
                    '        <li>' +
                    '            <span class="number">3</span>' +
                    '            <span class="title">해적(바다로 간 산적)</span>' +
                    '            <span class="arrow up"></span>' +
                    '            <span class="count">6</span>' +
                    '        </li>' +
                    '        <li>' +
                    '            <span class="number">4</span>' +
                    '            <span class="title">해무</span>' +
                    '            <span class="arrow up"></span>' +
                    '            <span class="count">3</span>' +
                    '        </li>' +
                    '        <li>' +
                    '            <span class="number">5</span>' +
                    '            <span class="title">안녕, 헤이즐</span>' +
                    '            <span class="arrow down"></span>' +
                    '            <span class="count">1</span>' +
                    '        </li>' +
                    '    </ul>' +
                    '</div>',
                    xAnchor: 0.3,
                    yAnchor: 0.91

                 });
                 infowindow2.open(map, this)
            });
            
            
            daum.maps.event.addListener(marker[i] , 'mouseover', function() {
              // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                 infowindow = new daum.maps.InfoWindow({
                   content : this.getTitle()
                 });
                   infowindow.open(map, this)
            });
            daum.maps.event.addListener(map , 'click', function() {
                 // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                infowindow2.close();

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
<div id="wrapper">
   <!-- start header -->
   <c:import url="/WEB-INF/views/include/header.jsp"></c:import>
   <!-- end header -->
   <div class="container">
   <c:import url="/WEB-INF/views/include/navigation.jsp"></c:import>
      <div id="menu">
         <div class="row">
               <div class="col-lg-3">
                  <div class="box">
                     <div class="box-bottom">
                        <a href="#">
                        <p>
                         추   천
                        </p>
                        </a>
                     </div>
                  </div>
               </div>
         </div>
         <div class="row">
               <div class="col-lg-3">
                  <div class="box">
                     <div class="box-bottom">
                        <a href="#local" class="flatbtn" id="modaltrigger">
                        <p>
                        지   역
                        </p>
                        </a>
                     </div>
                  </div>
               </div>
         </div>
         <div class="row">
               <div class="col-lg-3">
                  <div class="box">
                     <div class="box-bottom">
                        <a href="#">
                        <p>
                         카   테   고   리
                        </p>
                        </a>
                     </div>
                  </div>
               </div>
         </div>
      </div>
      
      <div id="local" style="display:none;">
          <h2>지역선택 </h2>
                <c:forEach var="i" items="${jusoList}">
                   <button onclick="test_go()" value="${i.si}">${i.si}</button>
                </c:forEach>
          </div>
      </div>
            
      <table id="maptable">
         <tr>
            <td><div id="map"></div></td>
         </tr>
      </table>
   
   <script>
         
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new daum.maps.LatLng(37.5665350, 126.9779690), // 지도의 중심좌표
         level : 3
      // 지도의 확대 레벨
      };

      var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

   </script>
   <script>
   function test_go(){
       var si = event.srcElement.value; 
       $.ajax({
         type : 'get',
          url:'/planner/test3',
          data : {
                localValue : si
          },
          dataType:'json',
          success: function(response){
            console.log(si); 
                getGun(response, si)
          }
          
             

   });
   }
   </script>
   <script>
   function getGun(response, si){
      var siView = si;
      alert(si);
      var gunList = response; 
      var rData = "<h2>"+si+"<h2>"; 

      try{ 
      var option=''; 
      var selected = false; 

      for(var i in gunList){   

      rData += '<button onclick="test_gogo()" value="{si:'+si+', gun :'+gunList[i].gun+'}">'+gunList[i].gun+'</button>'; 

      } alert(rData);
         $('#local').html(rData); 

      }catch(e){ 
         alert("error")
      } 

      }
   </script>
   <script>
   function test_gogo(){
      var gunView = document.getElementsByName('testHidden').value
      var gun = event.srcElement.value;
      alert(gun);
      alert(gunView);
      
       $.ajax({
         type : 'get',
          url:'/planner/test4',
          data : {
                localValue : localValue,
                localValue_test : localValue_test
          },
          dataType:'json',
          success: function(response){
             console.log(response);
            console.log(localValue); 
            console.log(localValue_test); 
                getGun(response, localValue)
          }
          
             

   });
      
   }
   </script>
   
   <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
   <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
   </div>

</body>
</html>