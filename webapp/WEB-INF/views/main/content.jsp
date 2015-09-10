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
	
<!-- 모달팝업 로그인 -->
<c:forEach var="vo" items="${list }" varStatus="status">
		<div>
		<div id="contentView${vo.content_no}" style="display:none;">
			<div style="width:600px"><img src="${vo.imageUrl }"></div>
			<div style="width:600px;background-color:#2f3238;color:#fff;height:60px;text-align:center;font-size:15px">
				<div>${vo.category }</div>
				<div>${vo.address }</div>
				<div>${vo.title }</div>
			</div>
		</div>
		</div>
</c:forEach>