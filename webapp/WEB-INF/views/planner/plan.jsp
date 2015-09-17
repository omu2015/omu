<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript"	src="//apis.daum.net/maps/maps3.js?apikey=bbef91da99f11fe76f4b3b523d3151e9&libraries=services"></script>
<script src="../../assets/js/jquery.js"></script>
<style type="text/css">
div#newPlan, div#showPlan {	margin:30px 20px;
							display:none;
}

span.label {color:black;width:30;height:16;text-align:center;margin-top:0;background:#ffF;font:bold 30px Arial};
span.c1 {cursor:hand;color:black;width:30;height:16;text-align:center;margin-top:0;background:#ffF;font:bold 30px Arial};
span.c2 {cursor:hand;color:red;width:30;height:16;text-align:center;margin-top:0;background:#ffF;font:bold 30px Arial};
span.c3 {cursor:hand;color:#b0b0b0;width:30;height:16;text-align:center;margin-top:0;background:#ffF;font:bold 30px Arial};
table{
	margin-top:20px;
}
table tr td{
			padding : 30px;
			border : 1px solid #000;
	}
</style>
<!-- css -->
<link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="../../assets/css/style.css" rel="stylesheet" />
<link href="/assets/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function addNewPlan(){
	$('#showPlan').hide();
	$('#newPlan').show();
}
function showPlan(){
	$('#newPlan').hide();
	$('#showPlan').show();	
}
function addPlan(aa){
	var selDay= $('#sp'+aa).html()
	var selMonth = parseInt(document.getElementsByName('selMonth')[0].value)+1;
	var selYear = document.getElementsByName('selYear')[0].value;
	var planDate = selYear +"-"+ selMonth +"-" + selDay;
	console.log(planDate);
	location.href="/planner/addPlan?planDate="+planDate;
}
</script>
<script>
function viewPlan(plan_no){
	location.href="/planner/viewPlan?plan_no="+plan_no;
}
function deletePlan(plan_no){
	location.href="/planner/deletePlan?plan_no="+plan_no;
}
</script>

<script type="text/javascript">

function maxDays(mm, yyyy){
var mDay;
	if((mm == 3) || (mm == 5) || (mm == 8) || (mm == 10)){
		mDay = 30;
  	}
  	else{
  		mDay = 31
  		if(mm == 1){
   			if (yyyy/4 - parseInt(yyyy/4) != 0){
   				mDay = 28
   			}
		   	else{
   				mDay = 29
  			}
		}
  }
return mDay;
}
function changeBg(id){
	if (eval(id).style.backgroundColor != "yellow"){
		eval(id).style.backgroundColor = "yellow"
	}
	else{
		eval(id).style.backgroundColor = "#ffffff"
	}
}
function writeCalendar(){

var now = new Date;
var dd = now.getDate()
var mm = now.getMonth()
var dow = now.getDay()
var yyyy = now.getFullYear()
var arrM = new Array("January","February","March","April","May","June","July","August","September","October","November","December")
var arrY = new Array()
	for (ii=0;ii<=4;ii++){
		arrY[ii] = yyyy - 2 + ii
	}
var arrD = new Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat")

var text = ""
text = "<form name=calForm>"
text += "<table border=1>"
text += "<tr><td>"
text += "<table width=100%><tr>"
text += "<td align=left>"
text += "<select name=selMonth onChange='changeCal()'>"
	for (ii=0;ii<=11;ii++){
		if (ii==mm){
			text += "<option value= " + ii + " Selected>" + arrM[ii] + "</option>"
		}
		else{
			text += "<option value= " + ii+ ">" + arrM[ii] + "</option>"
		}
	}
text += "</select>"
text += "</td>"
text += "<td align=right>"
text += "<select name=selYear onChange='changeCal()'>"
	for (ii=0;ii<=4;ii++){
		if (ii==2){
			text += "<option value= " + arrY[ii] + " Selected>" + arrY[ii] + "</option>"
		}
		else{
			text += "<option value= " + arrY[ii] + ">" + arrY[ii] + "</option>"
		}
	}
text += "</select>"
text += "</td>"
text += "</tr></table>"
text += "</td></tr>"
text += "<tr><td>"
text += "<table border=1>"
text += "<tr>"
	for (ii=0;ii<=6;ii++){
		text += "<td align=center><span class=label>" + arrD[ii] + "</span></td>"
	}
text += "</tr>"
aa = 0
	for (kk=0;kk<=5;kk++){
		text += "<tr>"
		for (ii=0;ii<=6;ii++){
			text += "<td align=center  onClick='test("+aa+")')><span id=sp" + aa + ">1</span><a style='float:right' href='javascript:addPlan("+aa+")'>+</a></td>"
			aa += 1
		}
		text += "</tr>"
	}
text += "</table>"
text += "</td></tr>"
text += "</table>"
text += "</form>"
document.write(text)
changeCal()
}
function changeCal(){
var now = new Date;
var dd = now.getDate()
var mm = now.getMonth()
var dow = now.getDay()
var yyyy = now.getFullYear()
var currM = parseInt(document.calForm.selMonth.value)
var prevM
	if (currM!=0){
		prevM = currM - 1
	}
	else{
		prevM = 11
	}
var currY = parseInt(document.calForm.selYear.value)
var mmyyyy = new Date()
mmyyyy.setFullYear(currY)
mmyyyy.setMonth(currM)
mmyyyy.setDate(1)
var day1 = mmyyyy.getDay()
	if (day1 == 0){
		day1 = 7
	}
var arrN = new Array(41)
var aa
	for (ii=0;ii<day1;ii++){
		arrN[ii] = maxDays((prevM),currY) - day1 + ii + 1
	}
	aa = 1
	for (ii=day1;ii<=day1+maxDays(currM,currY)-1;ii++){
		arrN[ii] = aa
		aa += 1
	}
	aa = 1
	for (ii=day1+maxDays(currM,currY);ii<=41;ii++){
		arrN[ii] = aa
		aa += 1
	}
	for (ii=0;ii<=41;ii++){
		eval("sp"+ii).style.backgroundColor = "#FFFFFF"
	}
var dCount = 0
	for (ii=0;ii<=41;ii++){
		if (((ii<7)&&(arrN[ii]>20))||((ii>27)&&(arrN[ii]<20))){
			eval("sp"+ii).innerHTML = arrN[ii]
			eval("sp"+ii).className = "c3"
		}
		else{
			eval("sp"+ii).innerHTML = arrN[ii]
			if ((dCount==0)||(dCount==6)){
				eval("sp"+ii).className = "c2"
			}
			else{
				eval("sp"+ii).className = "c1"
			}
			if ((arrN[ii]==dd)&&(mm==currM)&&(yyyy==currY)){
				eval("sp"+ii).style.backgroundColor="#90EE90"
			}
		}
	dCount += 1
		if (dCount>6){
			dCount=0
		}
	}
	for(var z =0; z<42; z++){
	test(z);
	}
}
function test(aa){
	console.log(aa);
	var selDay= $('#sp'+aa).html()
	var selMonth = parseInt(document.getElementsByName('selMonth')[0].value)+1;
	var selYear = document.getElementsByName('selYear')[0].value;
	var planDate = selYear +"-"+ selMonth +"-" + selDay;
	
	var jsonPlan =[];
	jsonPlan = JSON.parse('${planList}');
	var planList = [];
	for(var i in jsonPlan){
		planList[i] = JSON.parse('${planList}')[i];
		var t1 = planList[i].planDate;
		var t2 = t1.substring(0,11);
		var test1 = t2.split("-");
		var testYear = parseInt(test1[0])
		var testMonth = parseInt(test1[1])
		var testDay = parseInt(test1[2])
		var testDate = testYear+"-"+testMonth+"-"+testDay;
		
		if(planDate == testDate){
			console.log(planList[i].planDate);
			$("#sp"+aa).append('<a href="#"> Plan</a>')
				}
			}
		}
	
//  End -->
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- start header -->
	<c:import url="/WEB-INF/views/include/header.jsp"/>
	<!-- end header -->
	<div class="container">
	
	<script type="text/javascript">writeCalendar()</script>
	
<%-- <button onclick="showPlan()">내 일정 관리</button>
<button onclick="addNewPlan()">새 일정 만들기</button>
<button onclick=""> 추천 일정 보기 </button>

<div id="showPlan">
	<table>
		<tr>
			<td>no</td><td>날짜</td><td colspan="3">계획</td> 
		</tr>
		<c:forEach var="i" items="${planList}" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td>${i.planDate}</td>
			<td>회원님의 ${status.count}번째 계획</td>
			<td><button onclick="viewPlan('${i.plan_no}');">일정보기</button></td>
			<td><button onclick="deletePlan('${i.plan_no}')">삭제</button></td>
		</tr>
		</c:forEach>
	</table>
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
</div> --%>
</div>
</body>
</html>