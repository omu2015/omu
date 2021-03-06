<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<tr>
		<td>
		<h1> Content 등록</h1>
				<table border="1" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">관심사타입</td>
						<td bgcolor="#CCCCCC" align="center">사장님(회원)번호</td>
						<td bgcolor="#CCCCCC" align="center">phone</td>
						<td bgcolor="#CCCCCC" align="center">newAddress</td>
						<td bgcolor="#CCCCCC" align="center">imageUrl</td>
						<td bgcolor="#CCCCCC" align="center">나침반</td>
						<td bgcolor="#CCCCCC" align="center">우편번호</td>
						<td bgcolor="#CCCCCC" align="center">웹주소</td>
						<td bgcolor="#CCCCCC" align="center">다음번호</td>
						<td bgcolor="#CCCCCC" align="center">상점이름</td>
						<td bgcolor="#CCCCCC" align="center">카테고리</td>
						<td bgcolor="#CCCCCC" align="center">주소</td>
						<td bgcolor="#CCCCCC" align="center">위도</td>
						<td bgcolor="#CCCCCC" align="center">경도</td>
						<td bgcolor="#CCCCCC" align="center">BCode</td>
						<td bgcolor="#CCCCCC" align="center">비용</td>
						<td bgcolor="#CCCCCC" align="center">시간</td>
						<td bgcolor="#CCCCCC" align="center"><b>등록</b></td>
					</tr>
			<form action="/admin/insertcontent" method="post" enctype="multipart/form-data">
					<tr>
						<td>
							<select name="theme_no">
							 <c:forEach var="vo" items="${themeList}">
							  <option value="${vo.getTheme_no()}">${vo.getThemeName()}</option>
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
						<td><input size="10" type="text" name="phone"></td>
						<td><input size="10" type="text" name="newAddress"></td>
						<td><input size="10" type="text" name="imageUrl"></td>
						<td><input size="10" type="text" name="direction"></td>
						<td><input size="10" type="text" name="zipcode"></td>
						<td><input size="10" type="text" name="placeUrl"></td>
						<td><input size="10" type="text" name="id"></td>
						<td><input size="10" type="text" name="title"></td>
						<td><input size="10" type="text" name="category"></td>
						<td><input size="10" type="text" name="address"></td>
						<td><input size="10" type="text" name="longitude"></td>
						<td><input size="10" type="text" name="latitude"></td>
						<td><input size="10" type="text" name="addressBCode"></td>
						<td><input size="10" type="text" name="cost"></td>
						<td><input size="10" type="text" name="time"></td>
						<td><input size="10" type="submit" value="등록"></td>
					</tr>
			</form>
				</table>
				<h1> Content 조회</h1>
					<table class="selectVo" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">No</td>
						<td bgcolor="#CCCCCC" align="center">관심사타입</td>
						<td bgcolor="#CCCCCC" align="center">등록일자</td>
						<td bgcolor="#CCCCCC" align="center">사장님(회원)번호</td>
						<td bgcolor="#CCCCCC" align="center">phone</td>
						<td bgcolor="#CCCCCC" align="center">newAddress</td>
						<td bgcolor="#CCCCCC" align="center">imageUrl</td>
						<td bgcolor="#CCCCCC" align="center">나침반</td>
						<td bgcolor="#CCCCCC" align="center">우편번호</td>
						<td bgcolor="#CCCCCC" align="center">웹주소</td>
						<td bgcolor="#CCCCCC" align="center">다음번호</td>
						<td bgcolor="#CCCCCC" align="center">상점이름</td>
						<td bgcolor="#CCCCCC" align="center">카테고리</td>
						<td bgcolor="#CCCCCC" align="center">주소</td>
						<td bgcolor="#CCCCCC" align="center">위도</td>
						<td bgcolor="#CCCCCC" align="center">경도</td>
						<td bgcolor="#CCCCCC" align="center">BCode</td>
						<td bgcolor="#CCCCCC" align="center">비용</td>
						<td bgcolor="#CCCCCC" align="center">시간</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${contentList}">
					<tr>
						<td>${vo.content_no }</td>
						<td>${vo.theme_no }</td>
						<td>${vo.regDate }</td>
						<td>${vo.member_no }</td>
						<td>${vo.phone }</td>
						<td>${vo.newAddress }</td>
						<td>${vo.imageUrl }</td>
						<td>${vo.direction }</td>
						<td>${vo.zipcode }</td>
						<td>${vo.placeUrl }</td>
						<td>${vo.id }</td>
						<td>${vo.title }</td>
						<td>${vo.category }</td>
						<td>${vo.address }</td>
						<td>${vo.longitude }</td>
						<td>${vo.latitude }</td>
						<td>${vo.addressBCode }</td>
						<td>${vo.cost }</td>
						<td>${vo.time }</td>
						<td><a href="/admin/deletecontent?content_no=${vo.content_no }">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
		</td>
	</tr>
				