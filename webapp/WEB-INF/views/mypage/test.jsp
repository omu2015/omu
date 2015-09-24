<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="wsTable">
	<c:forEach var="vo" items="${writeBoardList }">
	
		<c:if test="${vo.member_no==authUser.member_no }">
		<table id="plan_no_${vo.plan_no }" onclick="clickEvent(this)"
			onmouseover="changeColor(this, '#FFFFFF', '#FEE8EE')">
			<tr>
				<c:forEach var="votitle" items="${vo.contentList}">
					<td>${votitle.getTitle()}</td>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="vocate" items="${vo.contentList}">
					<td>${vocate.getCategory()}</td>
				</c:forEach>
			</tr>
			<tr>
				<td>${vo.getMemberId()}</td>
				<td>$ = ${vo.getTotalCost()}</td>
				<td>시간 = ${vo.getTotalTime()}</td>
				<td>좋아요 버튼 -> ${vo.getGoodCnt()}</td>
				<td>일정으로 가져오기</td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
			
		</c:if>
	</c:forEach>
</div>

<script type="text/javascript">
function changeColor(Obj, oldColor, newColor) {
    Obj.style.backgroundColor = newColor;
    Obj.onmouseout = function(){
        Obj.style.backgroundColor = oldColor;
    }
}

function clickEvent(Obj) {
	var plan_no=Obj.id.split("_").pop();
	console.log(plan_no);
    location.href="/mypaln/myshowboard?plan_no="+plan_no;
}
</script>