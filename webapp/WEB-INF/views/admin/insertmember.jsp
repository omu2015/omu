<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<tr>
		<td>
		<h1> Member 등록</h1>
				<table border="1" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">아이디</td>
						<td bgcolor="#CCCCCC" align="center">이름</td>
						<td bgcolor="#CCCCCC" align="center">패스워드</td>
						<td bgcolor="#CCCCCC" align="center">imageUrl</td>
						<td bgcolor="#CCCCCC" align="center">권한</td>
						<td bgcolor="#CCCCCC" align="center">생일</td>
						<td bgcolor="#CCCCCC" align="center" colspan="3">핸드폰 번호</td>
						<td bgcolor="#CCCCCC" align="center">이메일</td>
						<td bgcolor="#CCCCCC" align="center" colspan="2">주소</td>
						<td bgcolor="#CCCCCC" align="center"><b>등록</b></td>
					</tr>
			<form action="/admin/insertmember" method="post" enctype="multipart/form-data">
					<tr>
						<td><input size="10" type="text" name="memberId"></td>
						<td><input size="10" type="text" name="memberName"></td>
						<td><input size="10" type="password" name="password"></td>
						<td><input size="10" type="file" name="img"></td>
						<td><select name="memberGrade">
							  <option value="Master">Master</option>
							  <option value="Admin">Admin</option>
							  <option value="Guest">Guest</option>
							</select>						
						</td>
						<td><input size="10" type="Date" name="birth"></td>
						<td><input size="3" type="text" name="phoneNum1">-</td>
						<td><input size="4" type="text" name="phoneNum2">-</td>
						<td><input size="4" type="text" name="phoneNum3"></td>
						<td><input size="10" type="text" name="email"></td>
						<td colspan="2"><input size="10" name="zipcode" id="zipcode"/><input size="20" name="address" id="address" class="txt"/><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
						<td><input size="10" type="submit" value="등록"></td>
					</tr>
			</form>
				</table>
				<h1> Member 조회</h1>
					<table id="selectMember" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">No</td>
						<td bgcolor="#CCCCCC" align="center">아이디</td>
						<td bgcolor="#CCCCCC" align="center">이름</td>
						<td bgcolor="#CCCCCC" align="center">패스워드</td>
						<td bgcolor="#CCCCCC" align="center">imageUrl</td>
						<td bgcolor="#CCCCCC" align="center">권한</td>
						<td bgcolor="#CCCCCC" align="center">회원상태</td>
						<td bgcolor="#CCCCCC" align="center">생일</td>
						<td bgcolor="#CCCCCC" align="center">주소</td>
						<td bgcolor="#CCCCCC" align="center">핸드폰 번호</td>
						<td bgcolor="#CCCCCC" align="center">가입날짜</td>
						<td bgcolor="#CCCCCC" align="center">탈퇴날짜</td>
						<td bgcolor="#CCCCCC" align="center">이메일</td>
						<td bgcolor="#CCCCCC" align="center">우편번호</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${memberList}">
					<tr>
						<td>${vo.member_no }</td>
						<td>${vo.memberId }</td>
						<td>${vo.memberName }</td>
						<td>${vo.password }</td>
						<td><c:choose>
								<c:when test="${not empty vo.imageUrl }">
				<img src="${vo.imageUrl }" style="width:150px">
								</c:when>
								<c:otherwise>
								고객의 사진이 없습니다.								
								</c:otherwise>
							</c:choose>
						<td>${vo.memberGrade }</td>
						<td>${vo.memberStatus }</td>
						<td>${vo.birth }</td>
						<td>${vo.address }</td>
						<td>${vo.phoneNum1 }-${vo.phoneNum2 }-${vo.phoneNum3 }</td>
						<td>${vo.joinDate }</td>
						<td>${vo.joinOutDate }</td>
						<td>${vo.email }</td>
						<td>${vo.zipcode }</td>
						<td><a href="/admin/deletemember?member_no=${vo.member_no }">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
		</td>
	</tr>
	
	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullAddr;
            }
        }).open();
    }
</script>
				