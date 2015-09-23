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

<hr>
<div style="text-align:right">
<c:if test="${not empty authUser }">
<button class="wsButton" onclick="location.href='/review/createboard'"><strong>후기 올리기</strong></button>
</c:if>
<button class="wsButton" onclick="location.href='/review'"><strong>목록</strong></button>
</div>
<div class="wsTable">
	<c:forEach var="vo" items="${reviewList }">
			<hr style="border:none;border:3px double pink;">
		<table id="plan_no_${vo.plan_no }" onclick="showplan(this)"
			onmouseover="changeColor(this)">
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
			<tr>
				<td>${vo.getMemberId()}</td>
				<td>좋아요 수-> ${vo.getGoodCnt()}</td>
			</tr>
			<tr>
				<td>시간 = ${vo.getTotalTime()}분</td>
				<td>$ = ${vo.getTotalCost()}원</td>
			</tr>
		</table>
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
    location.href="/review/showboard?plan_no="+plan_no;
}
</script>