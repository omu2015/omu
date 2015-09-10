<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<tr>
		<td>
		<h1> ContentBox 등록</h1>
				<table border="1" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">plan_no</td>
						<td bgcolor="#CCCCCC" align="center">content_no</td>
						<td bgcolor="#CCCCCC" align="center"><b>등록</b></td>
					</tr>
			<form action="/admin/insertcontentbox" method="post">
					<tr>
						<td><input size="10" type="text" name="plan_no"></td>
						<td><input size="10" type="text" name="content_no"></td>
						<td><input size="10" type="submit" value="등록"></td>
					</tr>
			</form>
				</table>
				<h1> ContentBox 조회</h1>
					<table class="selectVo" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">NO</td>
						<td bgcolor="#CCCCCC" align="center">plan_no</td>
						<td bgcolor="#CCCCCC" align="center">content_no</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${contentBoxList}">
					<tr>
						<td>${vo.contentBox_no }</td>
						<td>${vo.plan_no }</td>
						<td>${vo.content_no }</td>
						<td><a href="/admin/deletecontentbox?contentBox_no=${vo.contentBox_no }">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
		</td>
	</tr>
				