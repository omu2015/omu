<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script type="text/javascript">
$(function(){
	for(var i=0; i<100; i++){
  $('#hanitrigger'+i).leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
	}
});
</script>
		<div class="row">
			<div class="col-lg-12">
				<h4 class="heading">접속자의 관심사</h4>
				<div class="row">
				<c:forEach var="vo" items="${list }" varStatus="status">
					<section id="projects">
					<ul id="thumbs" class="portfolio">					
						<!-- Item Project and Filter Name -->
						<li class="col-lg-3 design" data-id="id-0" data-type="web">
						<div class="item-thumbs">
							<a  href="#contentView${vo.content_no}"  id="hanitrigger${vo.content_no}"  ><img src="${vo.imageUrl }"></a>
						</div>
						</li>
						<!-- End Item Project -->
					</ul>
					</section>
				</c:forEach>
				</div>
		</div>
	</div>	
	
<!-- 모달팝업 Content -->
<c:forEach var="vo" items="${list }" varStatus="status">
		<div>
		<div id="contentView${vo.content_no}" style="display:none;">
			<div style="width:600px"><img src="${vo.imageUrl }"></div>
			<div style="width:600px;background-color:#2f3238;color:#fff;height:60px;text-align:center;font-size:15px">
				<div>${vo.category }</div>
				<div>${vo.address }</div>
				<div>${vo.title }</div>
			</div>
<!-- 모달팝업 댓글 입력 -->
			<div style="width:600px;background-color:#fff;color:#c7c7c7;font-size:15px;height:70px;padding:10px">
				<form method="post" action="/commentwrite">
					<input type="hidden" name="contentNo" value="${vo.content_no }">
					<input type="hidden" name="memberNo" value="${authUser.member_no }">
					<input type="text" name="message" id="message" size="70" >
					${authUser.memberName }
					<input type="submit" value="댓글입력" style="height:50px">
				</form>
			</div>
<!-- 모달팝업 댓글 리스트 -->
			<table style="width:600px;background-color:#fff;color:#c7c7c7;font-size:15px;">
			<c:forEach var="vo2" items="${list2}" varStatus="status">
			<c:if test="${vo.content_no == vo2.content_no}">
				<tr>
					<td style="float:left;margin-left:10px">${vo2.message }</td>
					<td style="float:right;margin-right:10px">${vo2.memberName }</td>
					<td style="float:right;margin-right:10px">${vo2.regDate }</td>
				</tr>
				<tr>
					<td>----------------------------------------------------------------------------------------------------------------------------</td>
				</tr>
				</c:if>
			</c:forEach>
			</table>
		</div>
		</div>
</c:forEach>