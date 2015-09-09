<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table class="setthema">
	<tr>
		<td>
			<form action="/admin/addbook" method="post" enctype="multipart/form-data">
												<table width="800" border="1" cellspacing="0" cellpadding="3"
													bordercolordark="white" bordercolorlight="black">
													<tr height="23">
														<td width="100" bgcolor="#CCCCCC" align="center">상품분류</td>
														<td width="700" bgcolor="#F2F2F2"><select name="book_type">
																<option value="기본" selected>강의분류를 선택하세요</option>
																<option value="영어">영어</option>
																<option value="수학">수학</option>
																<option value="국어">국어</option>
														</select></td>
													</tr>
													<tr>
														<td width="100" bgcolor="#CCCCCC" align="center">강의 제목</td>
														<td width="700" bgcolor="#F2F2F2"><input type="text"
															name="book_title" value="" size="60" maxlength="60"></td>
													</tr>
													<tr>
														<td width="100" bgcolor="#CCCCCC" align="center">강사명</td>
														<td width="700" bgcolor="#F2F2F2"><input type="text"
															name="teacher_name" value="" size="10" maxlength="30"></td>
													</tr>
													
													
													
													<tr>
														<td width="100" bgcolor="#CCCCCC" align="center">가격</td>
														<td width="700" bgcolor="#F2F2F2"><input type="text"
															name="book_price" value="" size="10" maxlength="12"> 원</td>
													</tr>
													
													
													
													
													<tr>
														<td width="100" bgcolor="#CCCCCC" align="center">설명</td>
														<td width="700" bgcolor="#F2F2F2"><textarea name="book_intro"
																rows="10" cols="80"></textarea></td>
													</tr>
													<tr>
														<td width="100" bgcolor="#CCCCCC" align="center">이미지</td>
														<td width="700" bgcolor="#F2F2F2"><b>동영상</b>:
															<input type="file" name="url" size="30" value="찾아보기"><br> <b>포스터</b>:
															<input type="file" name="poster" size="30" value="찾아보기"><br>
														</td>
													</tr>
													
												</table>
					<table width="800" border="0" cellspacing="0" cellpadding="7">
						<tr>
							<td align="center"><input type="submit" value="등록"></td>
						</tr>
	</table>
	</form>
	</td>
	</tr>
</table>
