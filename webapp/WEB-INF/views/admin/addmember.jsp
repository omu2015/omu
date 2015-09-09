<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table>
	<tr>
		<td>
			<form action="/admin/addmember" method="post">
				<table border="1" cellspacing="0" cellpadding="3" bordercolordark="white" bordercolorlight="black">
					<tr>
						<td bgcolor="#CCCCCC" align="center">아이디</td>
						<td bgcolor="#CCCCCC" align="center">이름</td>
						<td bgcolor="#CCCCCC" align="center">패스워드</td>
						<td bgcolor="#CCCCCC" align="center">imageURL</td>
						<td bgcolor="#CCCCCC" align="center">권한</td>
						<td bgcolor="#CCCCCC" align="center">생일</td>
						<td bgcolor="#CCCCCC" align="center">주소</td>
						<td bgcolor="#CCCCCC" align="center" colspan="3">핸드폰 번호</td>
						<td bgcolor="#CCCCCC" align="center">이메일</td>
						<td bgcolor="#CCCCCC" align="center">우편번호</td>
						<td bgcolor="#CCCCCC" align="center"><b>등록</b></td>
					</tr>
					<tr>
						<td><input size="10" type="text" name="memberId"></td>
						<td><input size="10" type="text" name="memberName"></td>
						<td><input size="10" type="password" name="password"></td>
						<td><input size="10" type="text" name="imageURL"></td>
						<td><input size="10" type="text" name="memberGrade"></td>
						<td><input size="10" type="text" name="memberState"></td>
						<td><input size="10" type="text" name="birth"></td>
						<td><input size="3" type="text" name="phonenum1">-</td>
						<td><input size="4" type="text" name="phonenum2">-</td>
						<td><input size="4" type="text" name="phonenum3"></td>
						<td><input size="10" type="text" name="email"></td>
						<td><input size="10" type="text" name="zipcode"></td>
						<td><input size="10" type="submit" value="등록"></td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
</table>
				