<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String bodyColor = "#FFF0B5";
	String tdColor = "#FFE271";
%>
<body bgcolor="<%=bodyColor%>">
	<div align="center">
		<h2>게시글 작성하기</h2>
		<form method="post" action="03_boardWritePro.jsp">
			<table border="1">
				<tr height="40">
					<td width="150" align="center" bgcolor="<%=tdColor %>">작성자</td>
					<td width="450"><input type="text" name="writer"></td>
				</tr>
				<tr height="40">
					<td width="150" align="center" bgcolor="<%=tdColor %>">제목</td>
					<td width="450"><input type="text" name="subject"></td>
				</tr>
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">이메일</td>
					<td width="450"><input type="email" name="email"></td>
				</tr>
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">비밀번호</td>
					<td width="450"><input type="password" name="pw"></td>
				</tr>
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">글내용</td>
					<td width="450"><textarea rows="10" cols="50" name="content"></textarea></td>
				</tr>
				<tr height="40">
					<td width="150" align="center" colspan="2" bgcolor="<%=tdColor %>">
						<input type="submit" value="글쓰기">&nbsp;&nbsp;
						<input type="reset" value="다시작성">&nbsp;&nbsp;
						<input type="button" value="전체게시글보기" onclick="location.href = '04_boardList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>