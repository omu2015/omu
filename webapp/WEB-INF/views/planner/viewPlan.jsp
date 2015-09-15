<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
table tr td {	padding : 10px;
				border: 1px solid #000;
	}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td>날짜</td>
		<td>이름</td>
		<td>주소</td>
		<td>연락처</td>
	</tr>
	<c:forEach var="i" items="${contentList}">
	<tr>
		<td>${planVo.planDate}</td>
		<td>${i.title}</td>
		<td>${i.newAddress}</td>
		<td>${i.phone}</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>