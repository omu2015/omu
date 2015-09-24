<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.wsTable {
	 border : 2px solid #E5D1D6;
}
.wsTable table{
	padding : 20px 5px;
}
.wsTable td {
	padding : 5px;
	text-align : center;
}

.wsTable th {
	padding : 5px;
	text-align : center;
}

.wsTable .nct{
	text-align : left;
}

.wsTable .messagebox{
	height : 100px;
	padding: 15px 10px;
	text-align : center;
	width : 100%;
	bgcolor : #FFFFFF;
}
.wshd{
	color: #fff;
 	background: #FDB7C8;
}
.wsButton {
	background-color:#FEE8EE;
	padding:5px 10px; 
	margin:3px; 
	border:2px solid #FDB7C8;
}
</style>



<div class="wsTable">
	<c:forEach var="vo" items="${writeBoardList }">
	      <c:if test="${vo.member_no==authUser.member_no }">
		
			<div id="plan_no_${vo.plan_no }" onclick="showplan(this)"
					onmouseover="changeColor(this)">
				<table>
					<tr class="wshd">
						<td><b>${vo.getMemberId()}</b></td>
						<td><b>좋아요 수-> ${vo.getGoodCnt()}</b></td>
						<td><b>시간 = ${vo.getTotalTime()}분</b></td>
						<td><b>$ = ${vo.getTotalCost()}원</b></td>
						<td><b>$ = ${vo.member_no}원</b></td>
					</tr>
				</table>
				<table>
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
						<c:forEach var="vocate" items="${vo.contentList}">
							<td>${vocate.getNewAddress()}</td>
						</c:forEach>
					</tr>
				</table>
				
			</div>
			</c:if>
	</c:forEach>
</div>
<script>
function createboard(){
	location.href="/review/createboard";
}
</script>
<script type="text/javascript">
function changeColor(Obj) {
    Obj.style.backgroundColor = '#FED4DE';
    Obj.onmouseout = function(){
        Obj.style.backgroundColor = '#FFFFFF';
    }
}

function showplan(Obj) {
	var plan_no=Obj.id.split("_").pop();
	console.log(plan_no);
    location.href="/mypage/myboard?plan_no="+plan_no;
}
</script>