<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<tr>
		<td>
		<h1> Good 등록</h1>
				<table border="1" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">content_no</td>
						<td bgcolor="#CCCCCC" align="center">member_no</td>
						<td bgcolor="#CCCCCC" align="center"><b>등록</b></td>
					</tr>
			<form action="/admin/insertgood" method="post">
					<tr>
						<td>
							<select name="content_no">
							 <c:forEach var="vo" items="${contentList}">
							  <option value="${vo.getContent_no()}">${vo.getContent_no()}</option>
							 </c:forEach>
							</select>
						</td>
						<td>
							<select name="member_no">
							 <c:forEach var="vo" items="${memberList}">
							  <option value="${vo.getMember_no()}">${vo.getMemberName()}</option>
							 </c:forEach>
							</select>
						</td>
						<td><input size="10" type="submit" value="등록"></td>
					</tr>
			</form>
				</table>
				<h1> Good 조회</h1>
					<table class="selectVo" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">No</td>
						<td bgcolor="#CCCCCC" align="center">content_no</td>
						<td bgcolor="#CCCCCC" align="center">member_no</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${goodList}">
					<tr>
						<td>${vo.good_no }</td>
						<td>${vo.content_no }</td>
						<td>${vo.member_no }</td>
						<td><a href="/admin/deletegood?good_no=${vo.good_no }">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
		</td>
	</tr>
				