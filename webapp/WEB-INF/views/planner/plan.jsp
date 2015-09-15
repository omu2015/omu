<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="../../assets/js/jquery.js"></script>
<style type="text/css">
div#newPlan, div#showPlan {	margin:30px 20px;
							display:none;
}
</style>

<script type="text/javascript">
function addNewPlan(){
	$('#showPlan').hide();
	$('#newPlan').show();
}
function showPlan(){
	$('#newPlan').hide();
	$('#showPlan').show();	
}
function addPlan(){
	var planDate = $('#selectDate').val();
	$('#selectDate').val($.trim($('#selectDate').val()));
	if ($('#selectDate').val()) {
		location.href="/planner/addPlan?planDate="+planDate;
	} else
		alert("날짜를 입력하세요");
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<button onclick="showPlan()">내 일정 관리</button>
<button onclick="addNewPlan()">새 일정 만들기</button>
<button onclick=""> 추천 일정 보기 </button>

<div id="showPlan">
	<form method="post" action="">
	<table>
		<tr>
			<td>no</td><td>날짜</td><td>계획</td>
		</tr>
		<c:forEach var="i" items="${planList}" varStatus="status">
		<tr>
			<td>${status.count}</td><td>${i.planDate}</td><td>회원님의 ${status.count}번째 계획</td><td><button>일정보기</button></td></a>
			
		</tr>
		</c:forEach>
	</table>
	</form>
</div>
<div id="newPlan">
	<form method="post" action="javascript:addPlan();">
	<table>
		<tr>
			<td>날짜를 입력하시오</td>
		</tr>
		<tr>
			<td><input id="selectDate" name="planDate" type="Date"/></td>
			<td><input type="submit" value="일정추가하기"></td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>