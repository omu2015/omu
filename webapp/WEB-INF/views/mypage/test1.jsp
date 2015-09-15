<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<tr>
		<td>
		<h1>test good view</h1>
				<table border="1" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">content_no</td>
						<td bgcolor="#CCCCCC" align="center">등록일자</td>
						<td bgcolor="#CCCCCC" align="center">member_no</td>
						<td bgcolor="#CCCCCC" align="center">phone</td>
						<td bgcolor="#CCCCCC" align="center">주소</td>
						<td bgcolor="#CCCCCC" align="center">웹주소</td>
						<td bgcolor="#CCCCCC" align="center">나침반</td>
						<td bgcolor="#CCCCCC" align="center">우편번호</td>
						<td bgcolor="#CCCCCC" align="center">웹주소</td>
						<td bgcolor="#CCCCCC" align="center">다음등록번호</td>
						<td bgcolor="#CCCCCC" align="center">상점이름</td>
						<td bgcolor="#CCCCCC" align="center">카테고리</td>
						<td bgcolor="#CCCCCC" align="center">주소</td>
						<td bgcolor="#CCCCCC" align="center">위도</td>
						<td bgcolor="#CCCCCC" align="center">경도</td>
						<td bgcolor="#CCCCCC" align="center">긴숫자들</td>
						<td bgcolor="#CCCCCC" align="center">비용</td>
						<td bgcolor="#CCCCCC" align="center">시간</td>
						<td bgcolor="#CCCCCC" align="center">good_no</td>
	
					</tr>
					<c:forEach var="vo" items="${goodViewList }">  
			         <c:if test="${vo.member_no==authUser.member_no}">
					<tr>
						<td>${vo.content_no}</td>
						<td>${vo.regDate}</td>
						<td>${vo.member_no}</td>
						<td>${vo.member_no}</td>
						<td>${vo.phone}</td>
						<td>${vo.newAddress}</td>
						<td>${vo.imageUrl}</td>
						<td>${vo.direction}</td>
						<td>${vo.zipcode}</td>
						<td>${vo.placeUrl}</td>
						<td>${vo.id}</td>
						<td>${vo.title}</td>
						<td>${vo.category}</td>
						<td>${vo.address}</td>
						<td>${vo.longitude}</td>
						<td>${vo.latitude}</td>
						<td>${vo.addressBCode}</td>
						<td>${vo.cost}</td>
						<td>${vo.time}</td>
			 	        <td>${vo.good_no }</td>
					</tr>
				</c:if>
				</c:forEach>
				</table>
		</td>
	</tr>