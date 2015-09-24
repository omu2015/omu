<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

h1.plan {
	background-color: #ededed;
	padding: 10px;
}
div.header_seacrh {
	margin-top: -40px;
	margin-left: 220px;
	position: absolute;
	height: 20px;
}

div.header_seacrh div.select1 {
	padding-top: 35px;
	margin-top: -55px;
	margin-left: 250px;
	position: absolute;
	width: 180px;
	height: 32px;
	z-index: 5;
}

div.header_seacrh div.select2 {
	padding-top: 35px;
	margin-top: -55px;
	margin-left: 420px;
	position: absolute;
	width: 180px;
	height: 32px;
	z-index: 5;
}

div.header_seacrh div.select3 {
	padding-top: 35px;
	margin-top: -55px;
	margin-left: 540px;
	position: absolute;
	width: 180px;
	height: 32px;
	z-index: 5;
}

a.choice_select {
	border: 2px solid #FDB7C8;
	background-color: #fff;
	border-radius: 5px;
	padding: 2px 60px 2px 5px;
	color: #717171;
	font-weight: bold;
	width: 100px;
}

div.header_seacrh input[type=text] {
	border: 2px solid #FDB7C8;
	background-color: #fff;
	border-radius: 5px;
	padding: 2px 5px 2px
}

div.header_seacrh img {
	position: fixed;
	margin-top: -23px;
	margin-left: 190px;
}

div.select1 img, div.select2 img, div.select3 img {
	position: fixed;
	margin-top: 1px;
	margin-left: 30px;
}

div a:link {
	text-decoration: none;
}

div a:visited {
	text-decoration: none;
}

div.select1 ul {
	width: 150px;
	margin-top: 10px;
	display: none;
	background-color: rgba(237, 237, 237, 0.6);
	list-style: none;
	height: 320px;
	overflow-y: scroll;
	font-size: 12px;
}

div.select2 ul {
	width: 103px;
	margin-top: 10px;
	display: none;
	background-color: rgba(237, 237, 237, 0.6);
	list-style: none;
	height: 320px;
	overflow-y: scroll;
	font-size: 12px;
}

div.select3 ul {
	width: 103px;
	margin-top: 10px;
	display: none;
	background-color: rgba(237, 237, 237, 0.6);
	list-style: none;
	height: 320px;
	overflow-y: scroll;
	font-size: 12px;
}

div ul li {
	margin-top: 10px;
}

div.select1 ul li:hover,div.select2 ul li:hover,div.select3 ul li:hover {
	background-color: #FDB7C8;
}

div.header_seacrh div.select1 a:hover, div.header_seacrh div.select2 a:hover,
	div.header_seacrh div.select3 a:hover {
	color: #FDB7C8;
}
</style>
<script type="text/javascript">
	$(function() {
		$('.choice_select').click(function() {
			var test = $(this).attr('value');
			$('.' + test).toggle();
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
					placeholder="키워드를 검색해보세요!" value=""> <a
					href="#" id="searchButton"> <span class="p_hide"><img
						src="/assets/img/button/viewPink.jpg"></span>
				</a>
				<div class="select1">
					<a href="#" class="choice_select" id="local_si" value="si">서울특별시<img
						src="/assets/img/button/arrowdown.png"></a>
					<ul class="si" id="nav" style="z-index: 9999">
						<c:forEach var="i" items="${jusoList}">
							<li id="fl"><a href="javascript:;"
								onclick="getAddress(1,'${i.si}');">${i.si}</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="select2">
					<a href="#" class="choice_select" id="local_gun" value="gun">전체<img
						src="/assets/img/button/arrowdown.png"></a>
					<ul class="gun" id="nav" class="p_hide" style="z-index: 9999">
						<li><a href="javascript:;" onclick="">전체</a></li>
						<c:forEach var="i" items="${gunList}">
							<li><a href="javascript:;"
								onclick="getAddress(2,'${i.gun}')">${i.gun}</a></li>
						</c:forEach>

					</ul>
				</div>
				<div class="select3">
					<a href="#" class="choice_select" id="local_dong" value="dong">전체<img
						src="/assets/img/button/arrowdown.png"></a>
					<ul class="dong" id="nav" class="p_hide" style="z-index: 9999">

					</ul>
				</div>
				<div class="select4"></div>
			</div>
			<script>
				$('#searchButton').click(function() {
					$('#keyword').val($.trim($('#keyword').val()));
					if ($('#keyword').val()) {
						location.href = 'javascript:searchPlaces()';
					} else
						alert("검색어가 입력되지 않았습니다.\n\n다시 입력바랍니다.");
				});

				$('#keyword').on("keypress", function(e) {
					if (e.keyCode == 13)
						$('#searchButton').click();
				});
			</script>

			<script>
				var si = '서울특별시';
				function getAddress(localNum, localValue) {
					var localNum = localNum;
					if (localNum == 1) {
						si = localValue;
						$
								.ajax({
									type : 'get',
									url : '/planner/getGun',
									data : {
										localValue : si
									},
									dataType : 'json',
									success : function(response) {
										var data = '<li ><a href="javascript:;"	onclick="">전체</a></li>';
										for (var i = 0; i < response.length; i++) {
											data += '<li><a href="javascript:;" onclick=getAddress(2,"'
													+ response[i].gun.replace(
															/\s/gi, '.')
													+ '")>'
													+ response[i].gun
													+ '</a></li>';
										}
										$('#local_si').html(si);
										$('.gun').html(data);
										$('.si').hide();
									}
								});
					}
					if (localNum == 2) {

						gun = localValue.replace(/\./gi, " ");

						$
								.ajax({
									type : 'get',
									url : '/planner/getDong',
									data : {
										localValue : gun,
										si : si
									},
									dataType : 'json',
									success : function(response) {
										var data = '<li ><a href="javascript:;"	onclick="">전체</a></li>';
										for (var i = 0; i < response.length; i++) {
											data += '<li><a href="javascript:;" onclick=getAddress(3,"'
													+ response[i].dong
													+ '")>'
													+ (response[i].dong)
													+ '</a></li>';
										}
										$('#local_gun').html(gun);
										$('.dong').html(data);
										$('.gun').hide();
									}
								});
					}
					if (localNum == 3) {
						var location = si + gun + localValue;
						dong = localValue;
						$
								.ajax({
									type : 'get',
									url : 'https://apis.daum.net/local/geo/addr2coord?apikey=c12b4d88c8259cf4652b89c1f64db8e8&output=json',
									data : {
										q : location
									},
									dataType : 'jsonp',
									success : function(response) {
										centerLat = response.channel.item[0].lat;
										centerLng = response.channel.item[0].lng;
										console.log(response);
										var moveLatLon = new daum.maps.LatLng(
												centerLat, centerLng);
										map.setCenter(moveLatLon);
										map.setLevel(3);
										var title = localValue;
										setMarker(centerLat, centerLng, title);
									}
								});
						$('#local_dong').html(dong);
						$('.dong').hide();

					}
				}
			</script>
		</div>
	</div>
</div>