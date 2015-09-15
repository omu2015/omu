<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<tr>
		<td>
		<h1> board 등록</h1>
				<table border="1" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">plan_no</td>
						<td bgcolor="#CCCCCC" align="center">message</td>
						<td bgcolor="#CCCCCC" align="center"><b>등록</b></td>
					</tr>
			<form action="/admin/insertboard" method="post">
					<tr>
						<td>
							<select name="plan_no">
							 <c:forEach var="vo" items="${planList}">
							  <option value="${vo.getPlan_no()}">${vo.getPlan_no()}</option>
							 </c:forEach>
							</select>
						</td>
						<td><textarea name="message"></textarea></td>
						<td><input size="10" type="submit" value="등록"></td>
					</tr>
			</form>
				</table>
				<h1> board 조회</h1>
					<table class="selectVo" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">No</td>
						<td bgcolor="#CCCCCC" align="center">plan_no</td>
						<td bgcolor="#CCCCCC" align="center">member_no</td>
						<td bgcolor="#CCCCCC" align="center">message</td>
						<td bgcolor="#CCCCCC" align="center">regDate</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${boardList}">
					<tr>
						<td>${vo.board_no }</td>
						<td>${vo.plan_no }</td>
						<td>${vo.member_no }</td>
						<td>${vo.message }</td>
						<td>${vo.regDate }</td>
						<td><a href="/admin/deleteboard?board_no=${vo.board_no }">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
		</td>
	</tr>
				