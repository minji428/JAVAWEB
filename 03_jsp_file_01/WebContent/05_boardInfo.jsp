<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 내용 확인하기</title>
</head>
<body>
	<div align="center">
		<h2>게시글 내용</h2>
		<form method="post" action="06_boardUpdate.jsp">
			<table border="1">
				<tr>
					<td>번호</td>
					<td></td>
					<td>조회수</td>
					<td></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td></td>
					<td>이메일</td>
					<td></td>
				</tr>
				<tr>
					<td>제목</td>
					<td></td>
					<td>작성일</td>
					<td></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3"><textarea rows="10" cols="20"></textarea></td>
				</tr>
				<tr>
					<td colspan="4">
						<input type="submit" value="수정하기">
						<input type="button" value="삭제하기" onclick="window.location.href='08_boardDelete.jsp'">
						<input type="button" value="목록으로" onclick="window.location.href='04_boardList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>