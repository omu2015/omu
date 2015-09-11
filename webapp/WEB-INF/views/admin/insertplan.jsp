<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<tr>
		<td>
		<h1> Plan 등록</h1>
				<table border="1" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">회원번호</td>
						<td bgcolor="#CCCCCC" align="center">일정</td>
						<td bgcolor="#CCCCCC" align="center">총비용</td>
						<td bgcolor="#CCCCCC" align="center">총시간</td>
						<td bgcolor="#CCCCCC" align="center"><b>등록</b></td>
					</tr>
			<form action="/admin/insertplan" method="post">
					<tr>
						<td><input size="10" type="hidden" name="member_no" value="${authUser.getMember_no()}">   ${authUser.getMember_no()}   </td>
						<td><input size="10" type="Date" name="planDate"></td>
						<td><input size="10" type="text" name="totalCost"></td>
						<td><input size="10" type="text" name="totalTime"></td>
						<td><input size="10" type="submit" value="등록"></td>
					</tr>
			</form>
				</table>
				<h1> Plan 조회</h1>
					<table class="selectVo" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">NO</td>
						<td bgcolor="#CCCCCC" align="center">회원번호</td>
						<td bgcolor="#CCCCCC" align="center">일정</td>
						<td bgcolor="#CCCCCC" align="center">총비용</td>
						<td bgcolor="#CCCCCC" align="center">총시간</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${planList}">
					<tr>
						<td>${vo.plan_no }</td>
						<td>${vo.member_no }</td>
						<td>${vo.planDate }</td>
						<td>${vo.totalCost }</td>
						<td>${vo.totalTime }</td>
						<td><a href="/admin/deleteplan?plan_no=${vo.plan_no }">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
		</td>
	</tr>
				