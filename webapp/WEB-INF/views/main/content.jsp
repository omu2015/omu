<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
$(function(){
	for(var i=0; i<1000; i++){
  $('#guest'+i).leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
  $('#memberOne'+i).leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
  $('#memberTwo'+i).leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
  $('#memberThree'+i).leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
  $('#memberFour'+i).leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
  $('#memberFive'+i).leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
	}
});
</script>
<!-- "opacity:1" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'" -->
	<div>
			<ul>
			<li style="float:left;margin:10px;">
			<c:forEach var="i"  items="${contentList}">
			<a href="#content${i.content_no}" id="guest${i.content_no }"><img style="border:1px solid #e1e1e1;width:360px;margin:10px;opacity:1" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'" src="${i.imageUrl }"></a>
			</c:forEach>
			</li>
		</ul>
	</div>
			
		<div>
			<ul>
			<li style="float:left;margin:10px;">
			<c:forEach var="i"  items="${contentList0}">
			<a href="#content${i.content_no}" id="guest${i.content_no }"><img style="border:1px solid #e1e1e1;width:360px;margin:10px;opacity:1" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'" src="${i.imageUrl }"></a>
			</c:forEach>
			</li>
		</ul>
			<ul>
			<li style="float:left;margin:10px;">
			<c:forEach var="i"  items="${contentList1}">
			<a href="#content${i.content_no}" id="guest${i.content_no }"><img style="border:1px solid #e1e1e1;width:360px;margin:10px;opacity:1" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'" src="${i.imageUrl }"></a>
			</c:forEach>
			</li>
		</ul>
			<ul>
			<li style="float:left;margin:10px;">
			<c:forEach var="i"  items="${contentList2}">
			<a href="#content${i.content_no}" id="guest${i.content_no }"><img style="border:1px solid #e1e1e1;width:360px;margin:10px;opacity:1" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'" src="${i.imageUrl }"></a>
			</c:forEach>
			</li>
		</ul>
			<ul>
			<li style="float:left;margin:10px;">
			<c:forEach var="i"  items="${contentList3}">
			<a href="#content${i.content_no}" id="guest${i.content_no }"><img style="border:1px solid #e1e1e1;width:360px;margin:10px;opacity:1" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'" src="${i.imageUrl }"></a>
			</c:forEach>
			</li>
		</ul>
			<ul>
			<li style="float:left;margin:10px;">
			<c:forEach var="i"  items="${contentList4}">
			<a href="#content${i.content_no}" id="guest${i.content_no }"><img style="border:1px solid #e1e1e1;width:360px;margin:10px;opacity:1" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'" src="${i.imageUrl }"></a>
			</c:forEach>
			</li>
		</ul>
		
	</div>





<!-- 모달 팝업 -->
	<c:forEach var="i" items="${contentList }">
		<div id="content${i.content_no}" style="display:none; " >
				<div style="width:620px;background-color:#fff;font-color:#c7c7c7;font-size:15px;padding:10px">
				<form method="post" action="/commentwrite">
				<input type="hidden" name="member_no" value="${authUser.member_no }">
				<table style="margin:auto">
					<tr>
						<td colspan="2"><img style="width:600px" src="${i.imageUrl }"></td>
					</tr>
					<tr>
						<td>상점명</td><td>${i.title}</td>
					</tr>
					<tr>
						<td>연락처</td><td>${i.phone }</td>
					<tr>
					<tr>
						<td>주소</td><td>${i.address }</td>
					<tr>
					</tr>
				</table>
				<a href="/contentView?content_no=${i.content_no}"><input style="margin:auto;width:250px;height:25px;margin:20px 0 0 170px" type="button" value="상세보기"></a>
				</form>
			</div>
		</div>
	</c:forEach>
	
	
	
	<c:forEach var="i" items="${contentList0 }">
		<div id="content${i.content_no}" style="display:none; " >
				<div style="width:620px;background-color:#fff;font-color:#c7c7c7;font-size:15px;padding:10px">
				<form method="post" action="/commentwrite">
				<input type="hidden" name="member_no" value="${authUser.member_no }">
				<table style="margin:auto">
					<tr>
						<td colspan="2"><img style="width:600px" src="${i.imageUrl }"></td>
					</tr>
					<tr>
						<td>상점명</td><td>${i.title}</td>
					</tr>
					<tr>
						<td>연락처</td><td>${i.phone }</td>
					<tr>
					<tr>
						<td>주소</td><td>${i.address }</td>
					<tr>
					</tr>
				</table>
				<a href="/contentView?content_no=${i.content_no}"><input style="margin:auto;width:250px;height:25px;margin:20px 0 0 170px" type="button" value="상세보기"></a>
				</form>
			</div>
		</div>
	</c:forEach>
	
	
	<c:forEach var="i" items="${contentList1 }">
		<div id="content${i.content_no}" style="display:none; " >
				<div style="width:620px;background-color:#fff;font-color:#c7c7c7;font-size:15px;padding:10px">
				<form method="post" action="/commentwrite">
				<input type="hidden" name="member_no" value="${authUser.member_no }">
				<table style="margin:auto">
					<tr>
						<td colspan="2"><img style="width:600px" src="${i.imageUrl }"></td>
					</tr>
					<tr>
						<td>상점명</td><td>${i.title}</td>
					</tr>
					<tr>
						<td>연락처</td><td>${i.phone }</td>
					<tr>
					<tr>
						<td>주소</td><td>${i.address }</td>
					<tr>
					</tr>
				</table>
				<a href="/contentView?content_no=${i.content_no}"><input style="margin:auto;width:250px;height:25px;margin:20px 0 0 170px" type="button" value="상세보기"></a>
				</form>
			</div>
		</div>
	</c:forEach>
	<c:forEach var="i" items="${contentList2 }">
		<div id="content${i.content_no}" style="display:none; " >
				<div style="width:620px;background-color:#fff;font-color:#c7c7c7;font-size:15px;padding:10px">
				<form method="post" action="/commentwrite">
				<input type="hidden" name="member_no" value="${authUser.member_no }">
				<table style="margin:auto">
					<tr>
						<td colspan="2"><img style="width:600px" src="${i.imageUrl }"></td>
					</tr>
					<tr>
						<td>상점명</td><td>${i.title}</td>
					</tr>
					<tr>
						<td>연락처</td><td>${i.phone }</td>
					<tr>
					<tr>
						<td>주소</td><td>${i.address }</td>
					<tr>
					</tr>
				</table>
				<a href="/contentView?content_no=${i.content_no}"><input style="margin:auto;width:250px;height:25px;margin:20px 0 0 170px" type="button" value="상세보기"></a>
				</form>
			</div>
		</div>
	</c:forEach>
	<c:forEach var="i" items="${contentList3 }">
		<div id="content${i.content_no}" style="display:none; " >
				<div style="width:620px;background-color:#fff;font-color:#c7c7c7;font-size:15px;padding:10px">
				<form method="post" action="/commentwrite">
				<input type="hidden" name="member_no" value="${authUser.member_no }">
				<table style="margin:auto">
					<tr>
						<td colspan="2"><img style="width:600px" src="${i.imageUrl }"></td>
					</tr>
					<tr>
						<td>상점명</td><td>${i.title}</td>
					</tr>
					<tr>
						<td>연락처</td><td>${i.phone }</td>
					<tr>
					<tr>
						<td>주소</td><td>${i.address }</td>
					<tr>
					</tr>
				</table>
				<a href="/contentView?content_no=${i.content_no}"><input style="margin:auto;width:250px;height:25px;margin:20px 0 0 170px" type="button" value="상세보기"></a>
				</form>
			</div>
		</div>
	</c:forEach>
	<c:forEach var="i" items="${contentList4 }">
		<div id="content${i.content_no}" style="display:none; " >
				<div style="width:620px;background-color:#fff;font-color:#c7c7c7;font-size:15px;padding:10px">
				<form method="post" action="/commentwrite">
				<input type="hidden" name="member_no" value="${authUser.member_no }">
				<table style="margin:auto">
					<tr>
						<td colspan="2"><img style="width:600px" src="${i.imageUrl }"></td>
					</tr>
					<tr>
						<td>상점명</td><td>${i.title}</td>
					</tr>
					<tr>
						<td>연락처</td><td>${i.phone }</td>
					<tr>
					<tr>
						<td>주소</td><td>${i.address }</td>
					<tr>
					</tr>
				</table>
				<a href="/contentView?content_no=${i.content_no}"><input style="margin:auto;width:250px;height:25px;margin:20px 0 0 170px" type="button" value="상세보기"></a>
				</form>
			</div>
		</div>
	</c:forEach>
