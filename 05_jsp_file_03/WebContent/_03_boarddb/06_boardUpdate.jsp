<%@page import="_03_board.BoardDAO"%>
<%@page import="_03_board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
	
		BoardDTO board = BoardDAO.getInstance().getOneUpdateBoard(num);
	%>
	<div align="center">
		<h2>게시글 수정</h2>
		<form action="07_boardUpdatePro.jsp" method="post">
			<table border="1">
				<tr height="40">
					<td width="120" align="center">작성자</td>
					<td width="180" align="center"><%=board.getWriter() %></td>
					<td width="120" align="center">작성일</td>
					<td width="180" align="center"><%=board.getRegDate() %></td>
				</tr>
				<tr height="40">
					<td width="120" align="center">제목</td>
					<td widht="480" colspan="3"> &nbsp;
						<input type="text" name="subject" value="<%=board.getSubject() %>">
					</td>
				</tr>
				<tr height="40">
					<td width="120" align="center">패스워드</td>
					<td width="480" colspan="3">&nbsp;
						<input type="password" name="pw">
					</td>
				</tr>
				<tr height="40">
					<td width="120" align="center"> 글내용 </td>
					<td width="480">
						<textarea rows="10" cols="60" name="content"><%= board.getContent() %></textarea>
					</td>
				</tr>
				<tr height="40">
					<td colspan="4" align="center">
						
						<input type="hidden" name="num" value="<%= board.getNum() %>">
						
						<input type="submit" value="글수정"> &nbsp;&nbsp;
						<input type="button" onclick="location.href='04_boardList.jsp'" value="전체글보기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>