<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<style type="text/css">
    ul#nav
    {
     display:none;
    }
</style>
<script type="text/javascript">
$(function(){
	$('.choice_select').click(function(){
			if($('.si').show()){
				$('.si').hide();
			}if($('.gun').show()){
				$('.gun').hide();
			}if($('.dong').show()){
				$('.dong').hide();
			}
			var test =$(this).attr('value');
			$('.'+test).show();
	    })
})
</script>

	<div id="menu_div">
		<div id="navigation">
			<div id="plan_menu">
		<h1 class="plan">
			<a class="navbar-brand" href="/"><span>오늘</span> 뭐하지<span>?</span></a>
		</h1>

		<div class="header_seacrh">
			<input type="text" id="keyword" name="keyword"
				placeholder="키워드를 검색해보세요!" value="">
			<button onclick ="searchKeyword()" type="button" id="searchButton">
				<span class="p_hide">검색</span>
			</button>
			<div class="select1">
				<a href="#" class="choice_select" value="si">서울특별시</a>
				<ul class="si" id="nav" style="z-index: 9999">
					<c:forEach var="i" items="${jusoList}">
						<li id="fl"><a href="javascript:;"	onclick="getAddress(1);" value="${i.si}">${i.si}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="select2">
				<a href="#" class="choice_select" value="gun">전체</a>
				<ul class="gun" id="nav" class="p_hide" style="z-index: 9999">
					<li ><a href="javascript:;"
						onclick="clearCell(1); getList('',0,0); ">전체</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'강남구','37.464632','127.109628');">강남구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'강동구','37.5234918','127.1367295');">강동구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'강북구','37.616099','127.033738');">강북구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'강서구','37.530408','126.841562');">강서구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'관악구','37.461429','126.918842');">관악구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'광진구','37.528825','127.084438');">광진구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'구로구','37.4798417','126.8394389');">구로구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'금천구','37.4403095','126.9057945');">금천구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'노원구','37.619899','127.063');">노원구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'도봉구','37.6381278','127.0429556');">도봉구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'동대문구','37.567417','127.06125');">동대문구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'동작구','37.4809888','126.9716704');">동작구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'마포구','37.537192','126.943975');">마포구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'서대문구','37.5586','126.9342');">서대문구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'서초구','37.4448','127.0641');">서초구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'성동구','37.5395907','127.0540659');">성동구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'성북구','37.5797','127.02205');">성북구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'송파구','37.4785','127.1354');">송파구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'양천구','37.514393','126.8597007');">양천구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'영등포구','37.4927521','126.8982938');">영등포구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'용산구','37.5169','126.984');">용산구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'은평구','37.583267','126.905488');">은평구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'종로구','37.567967','126.9668');">종로구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'중구','37.552479','127.0090022');">중구</a></li>
					<li><a href="javascript:;"
						onclick="getAddress(2,'중랑구','37.5746736','127.0855775');">중랑구</a></li>
				</ul>
			</div>

			<div class="select3">
				<a href="#" class="choice_select" value="dong">전체</a>
				<ul class="dong" id="nav" class="p_hide" style="z-index: 9999">
				<li ><a href="javascript:;"
						onclick="clearCell(1); getList('',0,0); ">전체</a></li>
				</ul>
			</div>
		</div>

		<script>
			$('#searchButton').click(
					function() {
						$('#keyword').val($.trim($('#keyword').val()));
						if ($('#keyword').val()) {
							location.href = 'javascript:searchKeyword()';
						} else
							alert("검색어가 입력되지 않았습니다.\n\n다시 입력바랍니다.");
					});

			$('#keyword').on("keypress", function(e) {
				if (e.keyCode == 13)
					$('#searchButton').click();
			});
		</script>
		<!-- 
		<script>
		function getAddress(localNum){
		var localNum = localNum;
		if(localNum == 1){
			localValue = event.srcElement.value;
		}else if(localNum == 2){
			localValue1 = event.srcElement.value;
		}else if(localNum == 3){
			localValue2 = event.srcElement.value;
			var juso = localValue +localValue1+localValue2;
			getAtitude(juso);
		}
		
		}
		</script>
		<script>
		function getAtitude(juso){
		var lat;
		var lng;
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
			 getCenterMap(lat, lng);
		 })
		}
		</script>
		 -->
	</div>
</div>

</div>