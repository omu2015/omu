<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<tr>
		<td>
		<h1>test</h1>
				<table border="1" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">NO</td>
						<td bgcolor="#CCCCCC" align="center">회원 번호</td>
						<td bgcolor="#CCCCCC" align="center">회원 이름</td>
						<td bgcolor="#CCCCCC" align="center">plan_no</td>
						<td bgcolor="#CCCCCC" align="center">content_no</td>
						<td bgcolor="#CCCCCC" align="center">비용</td>
						<td bgcolor="#CCCCCC" align="center">시간</td>
						<td bgcolor="#CCCCCC" align="center">totalCost</td>
						<td bgcolor="#CCCCCC" align="center">totalTime</td>
					</tr>
					<c:forEach var="vo" items="${viewList }">
					<tr>
						<td>${vo.contentBox_no}</td>
						<td>${vo.member_no}</td>
					
					</tr>
					</c:forEach>
				</table>
		</td>
	</tr>
				