<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="../../assets/js/jquery.js"></script>
<!-- css -->
<link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="../../assets/css/style.css" rel="stylesheet" />
<link href="/assets/css/common.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/viewPlan.css" rel="stylesheet" type="text/css" />
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
	var selectedDay = $('#sp17').html();
	var selMonth;
	if(aa<17){
		if(parseInt(selDay)>parseInt(selectedDay)){
			selMonth = parseInt(document.getElementsByName('selMonth')[0].value);
			}
		else{
			selMonth = parseInt(document.getElementsByName('selMonth')[0].value)+1;
			}
		}
	if(aa>=17){
		if(parseInt(selDay)<parseInt(selectedDay)){
			selMonth = parseInt(document.getElementsByName('selMonth')[0].value)+2;
		}
		else{
			selMonth = parseInt(document.getElementsByName('selMonth')[0].value)+1;
		}
	}
	var selYear = document.getElementsByName('selYear')[0].value;
	var planDate = selYear +"-"+ selMonth +"-" + selDay;
	location.href="/planner/map?planDate="+planDate;
	}
</script>
<script>
function viewPlan(plan_no){
	location.href="/planner/viewPlan?plan_no="+plan_no;
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
		eval(id).style.backgroundColor = "#ededed"
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
text += "<table id='ft' width=100%><tr>"
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
text += "<table id='st' border=1>"
text += "<tr>"
	for (ii=0;ii<=6;ii++){
		text += "<td align=center><span class=label>" + arrD[ii] + "</span></td>"
	}
text += "</tr>"
aa = 0
	for (kk=0;kk<=5;kk++){
		text += "<tr>"
		for (ii=0;ii<=6;ii++){
			text += "<td  align=center ><span id=sp" + aa + ">1</span><span id=tp"+aa+"></span><a style='float:right' href='javascript:addPlan("+aa+")'><img src='/assets/img/button/plus.png'></a></td>"
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
		eval("sp"+ii).style.font = "20px bold";
		eval("sp"+ii).style.color = "#bdbdbd";
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
				eval("sp"+ii).style.border = "5px dotted #fb6f92";
				eval("sp"+ii).style.borderRadius ="25px";
				eval("sp"+ii).style.fontSize = "30px";
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
	$('#tp'+aa).html("");
	var selDay= $('#sp'+aa).html()
	var selectedDay = $('#sp17').html();
	var selMonth ;
	if(aa<17){
		if(parseInt(selDay)>parseInt(selectedDay)){
			selMonth = parseInt(document.getElementsByName('selMonth')[0].value);
			}
		else{
			selMonth = parseInt(document.getElementsByName('selMonth')[0].value)+1;
			}
		}
	if(aa>=17){
		if(parseInt(selDay)<parseInt(selectedDay)){
			selMonth = parseInt(document.getElementsByName('selMonth')[0].value)+2;
		}
		else{
			selMonth = parseInt(document.getElementsByName('selMonth')[0].value)+1;
		}
	}
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
		var plan_no = planList[i].plan_no;
		
		if(planDate == testDate){
			$("#tp"+aa).append('<a href="javascript:viewPlan('+plan_no+');"><img src="/assets/img/button/calendar.png"></a>')
				}
			}
		}
	
//  End -->z
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
	
</div>
</body>
</html>