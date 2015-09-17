<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="../../assets/css/style.css" rel="stylesheet" />
<link href="/assets/css/common.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/viewPlan.css" rel="stylesheet" type="text/css" />

<script>
function deletePlan(plan_no){
	location.href="/planner/deletePlan?plan_no="+plan_no;
}
function viewContent(){
	alert("view");
}
function deleteContent(plan_no, content_no){
	location.href="/planner/deleteContentBox?plan_no="+plan_no+"&content_no="+content_no;
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- start header -->
	<c:import url="/WEB-INF/views/include/header.jsp"/>
	<!-- end header -->
	<div class="container_plan">
	<div id="delete_button"><a href="javascript:deletePlan('+${planVo.plan_no}+')"><img src="/assets/img/button/x.png"></a></div>
	<table class="viewPlan">
	<tr id="ft">
		<td width="15%">날짜</td>
		<td>이름</td>
		<td width="35%" colspan="2">주소</td>
		<td width="20%">연락처</td>
		<td width="7%"></td>
	</tr>
	<c:forEach var="i" items="${contentList}">
	<tr id="st">
		<td onclick="viewContent(${planVo.plan_no})">${planVo.planDate}</td>
		<td onclick="viewContent(${planVo.plan_no}))">${i.title}</td>
		<td colspan="2" onclick="viewContent(${planVo.plan_no}))">${i.newAddress}</td>
		<td onclick="viewContent(${planVo.plan_no}), ${i.content_no})">${i.phone}</td>
		<td ><a href="javascript:deleteContent(${planVo.plan_no}, ${i.content_no})"><img src="/assets/img/button/x.png"></a></td>
	</tr>
	</c:forEach>
</table>
</div>

</body>
</html>